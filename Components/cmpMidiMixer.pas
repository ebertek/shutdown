(*--------------------------------------------------------------------------*
 | MIDI Mixer Component                                                     |
 |                                                                          |
 | Copyright (c) Colin Wilson 1997.                                         |
 |                                                                          |
 | Version  Date      By    Description                                     |
 | -------  --------  ----  ------------------------------------------------|
 | 1.0      17/10/97  CPWW  Original                                        |
 | 1.1      21/10/97  CPWW  Treble & Bass controls added.                   |
 *--------------------------------------------------------------------------*)

unit cmpMidiMixer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, mmsystem;

type
  TMixerChannel = (mcLeft, mcRight);
  TChannelValues = array [Low (TMixerChannel)..High (TMixerChannel)] of Integer;

  TMixerControlType = (mtMidiVolume, mtAudioVolume, mtMidiMute, mtAudioMute, mtAudioTreble, mtAudioBass);

                                     // OnControlChange event handler type
  TMixerNotifyEvent = procedure (sender : TObject; control : TMixerControlType) of object;

  //--------------------------------------------------------------------------
  // class TMidiMixer.  Encapsulates Midi Volume, MidiMute, Master  Volume and
  //                    MasterMute for a Multimedia mixer.
  TMidiMixer = class(TComponent)
  private
    fWindowHandle : HWND;               // Window handle for 'callback' messages
    fMixerHandle : HMIXER;              // Handle for the open mixer

    fMixerCaps : TMixerCaps;            // Mixer capabilities structure
    fSynthLine : TMixerLine;            // MIDI mixer line
    fAudioLine : TMixerLine;            // Master mixer line

    //------------------------------------------------------------------------
    // Property support variables

    fActive : boolean;                  // 'Control is active' flag
    fMidiDeviceID : Integer;            // The MIDI device ID

                                        // Array of mixer controls for midi volume,
                                        // midi mute, master volume & master mute
    fControl : array [Low (TMixerControlType)..High (TMixerControlType)] of TMixerControl;

                                        // Array of flags indicating if a control
                                        // is valid for a mixer.
    fControlSupported : array [Low (TMixerControlType)..High (TMixerControlType)] of boolean;


                                        // Current values of each control
    fValue : array [Low (TMixerControlType)..High (TMixerControlType)] of TChannelValues;

                                        // OnControlChange event placeholder
    fOnControlChange : TMixerNotifyEvent;

    //-------------------------------------------------------------------------
    // Private member functions.  See the indvidual function headers for details
    procedure WndProc (var Msg : TMessage);
    procedure MmMixmControlChange (var Msg : TMessage); message MM_MIXM_CONTROL_CHANGE;

    procedure Open;
    procedure Close;

    procedure UpdateControl (control : TMixerControlType; channels : Integer);
    procedure SetControl (control : TMixerControlType; channels : Integer);

    //-------------------------------------------------------------------------
    // Get/Set functions for properties
    procedure SetActive (value : boolean);
    procedure SetMidiDeviceID (value : Integer);
    function GetControlSupported (ctrl : TMixerControlType) : Boolean;
    function GetControlMin (ctrl : TMixerControlType) : Integer;
    function GetControlMax (ctrl : TMixerControlType) : Integer;
    function GetControlValue (ctrl : TMixerControlType; chan : TMixerChannel) : Integer;
    procedure SetControlValue (ctrl : TMixerControlType; chan : TMixerChannel; value : Integer);
    procedure SetControlValues (ctrl : TMixerControlType; const values : TChannelValues);

  protected
    // Loaded opens the mixer if the control is 'Active' if not in design mode.
    procedure Loaded; override;

  public
    constructor Create (AOwner : TComponent); override;
    destructor Destroy; override;

    property ControlSupported [ctl : TMixerControlType] : boolean read GetControlSupported;
    property ControlMin [ctl : TMixerControlType] : integer read GetControlMin;
    property ControlMax [ctl : TMixerControlType] : integer read GetControlMax;
    property ControlValue [ctl : TMixerControlType; chan : TMixerChannel] : integer read GetControlValue write SetControlValue;
    property ControlValues [ctl : TMixerControlType] : TChannelValues write SetControlValues;

  published
    property Active : boolean read fActive write SetActive default True;
    property MidiDeviceID : Integer read fMidiDeviceID write SetMIDIDeviceID default -1;
    property OnControlChange : TMixerNotifyEvent read fOnControlChange write fOnControlChange;
  end;

  //--------------------------------------------------------------------------
  // class EMMError.  Encapsulates multimedia error handling.
  EMMError = class (Exception)
    constructor CreateMMErr (err : Integer; const fn : string);
  end;

procedure Register;

implementation

(*--------------------------------------------------------------------------*
 | function MMErrorString () : string                                       |
 |                                                                          |
 | Returns a descriptive string for a multimedia error code.  Supports all  |
 | MM system and mixer errors, but not MIDI, WAVE, AUX, etc. onces.         |
 |                                                                          |
 | Parameters:                                                              |
 |   err : Integer       The multimed error code                            |
 |                                                                          |
 | The function returns a descriptive string for the MM error code.         |
 *--------------------------------------------------------------------------*)
function MMErrorString (err : Integer) : string;
begin
  case err of
    MMSYSERR_ERROR        : result := 'Unspecified error';
    MMSYSERR_BADDEVICEID  : result := 'Device ID out of range';
    MMSYSERR_NOTENABLED   : result := 'Driver failed enable';
    MMSYSERR_ALLOCATED    : result := 'Device already allocated';
    MMSYSERR_INVALHANDLE  : result := 'Device handle is invalid';
    MMSYSERR_NODRIVER     : result := 'No device driver present';
    MMSYSERR_NOMEM        : result := 'Memory allocation error';
    MMSYSERR_NOTSUPPORTED : result := 'Function isn''t supported';
    MMSYSERR_BADERRNUM    : result := 'Error value out of range';
    MMSYSERR_INVALFLAG    : result := 'Invalid flag passed';
    MMSYSERR_INVALPARAM   : result := 'Invalid parameter passed';
    MMSYSERR_HANDLEBUSY   : result := 'Handle being used simultaneously on another thread (eg callback)';
    MMSYSERR_INVALIDALIAS : result := 'Specified alias not found';
    MMSYSERR_BADDB        : result := 'Bad registry database';
    MMSYSERR_KEYNOTFOUND  : result := 'Registry key not found';
    MMSYSERR_READERROR    : result := 'Registry read error';
    MMSYSERR_WRITEERROR   : result := 'Registry write error';
    MMSYSERR_DELETEERROR  : result := 'Registry delete error';
    MMSYSERR_VALNOTFOUND  : result := 'Registry value not found';
    MMSYSERR_NODRIVERCB   : result := 'Driver does not call DriverCallback';
    MIXERR_INVALLINE      : result := 'Invalid Mixer Line';
    MIXERR_INVALCONTROL   : result := 'Invalid Mixer Control';
    MIXERR_INVALVALUE     : result := 'Invalid Mixer Value';
    else result := 'Unknown error';
  end
end;

(*--------------------------------------------------------------------------*
 | constructor EMMError.CreateMMErr ()                                      |
 |                                                                          |
 | Constructor for EMMError, which handles Multimedia exceptions.           |
 |                                                                          |
 | Parameters:                                                              |
 |   err : Integer            The multimedia error code.                    |
 |   const fn : string        The name of the multimedia funcion that       |
 |                            failed.                                       |
 *--------------------------------------------------------------------------*)
constructor EMMError.CreateMMErr (err : Integer; const fn : string);
var
  errType : string;
begin
  if err in [MMSYSERR_ERROR..MMSYSERR_LASTERROR] then
    errType := 'System'           // Multimedia system error
  else
    if (err >= MIXERR_BASE) and (err <= MIXERR_LASTERROR) then
      errType := 'Mixer'          // Multimedia mixer error
    else
      errType := 'Unknown';       // Other multimedia error

                                  // Format the exception string.
  inherited CreateFmt ('Multimedia %s Error %d - %s in %s', [errType, err, MMErrorString (err), fn]);
end;

(*--------------------------------------------------------------------------*
 | constructor TMidiMixer.Create ();                                        |
 |                                                                          |
 | Initialise the mixer control                                             |
 |                                                                          |
 | Parameters:                                                              |
 |   AOwner : TComponent            The owning component (ie. the form)     |
 *--------------------------------------------------------------------------*)
constructor TMidiMixer.Create (AOwner : TComponent);
begin
  inherited Create (AOwner);
                                      // Create window handle to receive
                                      // callback messages.
  fWindowHandle := AllocateHWnd (WndProc);

  fActive := True;                    // Make the control active by default
  fMidiDeviceID := -1;                // Get mixer for MIDI mapper.
end;

(*--------------------------------------------------------------------------*
 | destructor TMidiMixer.Destroy                                            |
 |                                                                          |
 | Closes and destroys a mixer control                                      |
 *--------------------------------------------------------------------------*)
destructor TMidiMixer.Destroy;
begin
  Close;                              // Close the mixer if it's open.
  DeallocateHWnd (fWindowHandle);     // Free the callback window handle
  inherited
end;

(*--------------------------------------------------------------------------*
 | procedure TMidiMixer.Loaded                                              |
 |                                                                          |
 | Set the real value of the Active property if not in design mode.         |
 *--------------------------------------------------------------------------*)
procedure TMidiMixer.Loaded;
begin
  inherited;
  if Active then                       // Is the control meant to be active?
  begin
    fActive := False;
    Active := True                     // Make the control *really* active
  end
end;

(*--------------------------------------------------------------------------*
 | procedure TMidiMixer.WndProc                                             |
 |                                                                          |
 | Handle callback messages by dispatching them to the control              |
 |                                                                          |
 | Parameters:                                                              |
 |   var Msg : TMessage           The message to dispatch.                  |
 *--------------------------------------------------------------------------*)
procedure TMidiMixer.WndProc (var Msg : TMessage);
begin
  try
    Dispatch (Msg);
  except
    Application.HandleException (self)
  end
end;


(*--------------------------------------------------------------------------*
 | procedure TMidiMixer.MmMixmControlChange ()                              |
 |                                                                          |
 | Handle MM_MIXM_CONTROLCHANGE message sent to the callback window handle  |
 | by the MM subsystem.                                                     |
 |                                                                          |
 | Parameters:                                                              |
 |   var Msg : TMessage          The message received.                      |
 *--------------------------------------------------------------------------*)
procedure TMidiMixer.MmMixmControlChange (var Msg : TMessage);
var
  ctrl : TMixerControlType;
  cChannels : Integer;
begin
  for ctrl := Low (TMixerControlType) to High (TMixerControlType) do

                               // Find the control that caused the message
    if Msg.lParam = fControl [ctrl].dwControlID then
    begin
      if ctrl in [mtAudioVolume, mtAudioMute, mtAudioTreble, mtAudioBass] then
        cChannels := fAudioLine.cChannels
      else
        cChannels := fSynthLine.cChannels;

                               // Get current channel values from the MM subsystem
                               // into the fValue member variable

      UpdateControl (ctrl, cChannels);


      if (Assigned (fOnControlChange)) and not (csDestroying in ComponentState) then
        OnControlChange (self, ctrl);

      break
    end
end;

(*--------------------------------------------------------------------------*
 | procedure TMidiMixer.Open                                                |
 |                                                                          |
 | Open the mixer, and get the Midi Volume, Midi Mute, Master Volume and    |
 | Master Mute controls from the driver.                                    |
 *--------------------------------------------------------------------------*)
procedure TMidiMixer.Open;
var
  i, err : Integer;
  synthID, audioID : Integer;

  //---------------------------------------------------------------------------
  // Helper function gets a line control for a given type (defined in MMSYSTEM.PAS)
  // eg. MIXERCONTROL_CONTROLTYPE_VOLUME; MIXERCONTROL_CONTROLTYPE_MUTE.
  // Return 'true' if a control for the specified type was found.
  function GetMixerControlByType (const line : TMixerLine; tp : Integer; var control : TMixerControl) : boolean;
  var
    mixerLineControls : TMixerLineControls;
    err : Integer;
  begin
    mixerLineControls.cbStruct := sizeof (mixerLineControls);
    mixerLineControls.dwLineID := line.dwLineID;
    mixerLineControls.dwControlType := tp;
    mixerLineControls.cControls := line.cControls;
    mixerLineControls.cbmxctrl := sizeof (control);
    mixerLineControls.pamxctrl := @control;
    err := mixerGetLineControls (fMixerHandle, @mixerLineControls, MIXER_GETLINECONTROLSF_ONEBYTYPE);

    if (err <> MIXERR_INVALCONTROL) and (err <> MMSYSERR_NOERROR) and (err <> MIXERR_INVALLINE) then
      raise EMMError.CreateMMErr (err, 'mixerGetLineControls');

    result := err = MMSYSERR_NOERROR;
  end;

begin  { TMidiMixer.Open }
  if fMIDIDeviceID = -2 then
                             // Open mixer 0
    err := mixerOpen (@fMixerHandle, 0, fWindowHandle, Integer (self), MIXER_OBJECTF_MIXER or CALLBACK_WINDOW)
  else                       // ... or open the mixer for MIDI device id
    err := mixerOpen (@fMixerHandle, fMIDIDeviceID, fWindowHandle, Integer (self), MIXER_OBJECTF_MIDIOUT or CALLBACK_WINDOW);

  if err <> MMSYSERR_NOERROR then
    raise EMMError.CreateMMErr (err, 'mixerOpen');

                             // Get the devcaps for the mixer.
  mixerGetDevCaps (fMixerHandle, @fMixerCaps, sizeof (fMixerCaps));

  // There will probably be two 'destinations' - Master Playback, and Master Record
  // Find the 'Master Playback' one.

  audioID := -1;
  for i := 0 to fMixerCaps.cDestinations - 1 do
  begin
    fAudioLine.cbStruct := sizeof (fAudioLine);
    fAudioLine.dwDestination := i;
    fAudioLine.dwSource := 0;
    mixerGetLineInfo (fMixerHandle, @fAudioLine, MIXER_GETLINEINFOF_DESTINATION);
    if fAudioLine.dwComponentType = MIXERLINE_COMPONENTTYPE_DST_SPEAKERS then
    begin
      audioID := i;               // Got the Master Playback destination
      break
    end
  end;

  if audioID = -1 then
    raise Exception.Create ('Can''t find audio output mixer line for ' + fMixerCaps.szPName);

                                  // Get the 'Master Volume' and 'Master Mute'
                                  // controls
  fControlSupported [mtAudioVolume] := GetMixerControlByType (fAudioLine, MIXERCONTROL_CONTROLTYPE_VOLUME, fControl [mtAudioVolume]);
  fControlSupported [mtAudioMute] := GetMixerControlByType (fAudioLine, MIXERCONTROL_CONTROLTYPE_MUTE, fControl [mtAudioMute]);
  fControlSupported [mtAudioTreble] := GetMixerControlByType (fAudioLine, MIXERCONTROL_CONTROLTYPE_TREBLE, fControl [mtAudioTreble]);
  fControlSupported [mtAudioBass] := GetMixerControlByType (fAudioLine, MIXERCONTROL_CONTROLTYPE_BASS, fControl [mtAudioBass]);

                                  // Get the 'Master Volume' and 'Master Mute'
                                  // 'Master Treble' and 'Master Bass' control values.
  UpdateControl (mtAudioVolume, fAudioLine.cChannels);
  UpdateControl (mtAudioMute, fAudioLine.cChannels);
  UpdateControl (mtAudioTreble, fAudioLine.cChannels);
  UpdateControl (mtAudioBass, fAudioLine.cChannels);

                                  // Go through the 'sources' routed through the
                                  // Master Playback destination, and find the
                                  // MIDI source.
  synthID := -1;
  for i := 0 to fAudioLine.cConnections - 1 do
  begin
    fSynthLine.cbStruct := sizeof (fSynthLine);
    fSynthLine.dwDestination := audioID;
    fSynthLine.dwSource := i;
    mixerGetLineInfo (fMixerHandle, @fSynthLine, MIXER_GETLINEINFOF_SOURCE);
    if fSynthLine.dwComponentType = MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER then
    begin
                                  // Got the MIDI source!
      synthID := fSynthLine.dwLineID;
      break;
    end
  end;

  if synthID = -1 then
    raise Exception.Create ('Can''t find MIDI output source line for ' + fMixerCaps.szPName);

                                  // Get the MIDI volume and MIDI mute controls
  fControlSupported [mtMidiVolume] := GetMixerControlByType (fSynthLine, MIXERCONTROL_CONTROLTYPE_VOLUME, fControl [mtMidiVolume]);
  fControlSupported [mtMidiMute] := GetMixerControlByType (fSynthLine, MIXERCONTROL_CONTROLTYPE_MUTE, fControl [mtMidiMute]);

                                  // Get the MIDI volume and MIDI mute control
                                  // values.
  UpdateControl (mtMidiVolume, fSynthLine.cChannels);
  UpdateControl (mtMidiMute, fSynthLine.cChannels);

  fActive := True;
end;

(*--------------------------------------------------------------------------*
 | procedure TMidiMixer.Close;                                              |
 |                                                                          |
 | Close the mixer.                                                         |
 *--------------------------------------------------------------------------*)
procedure TMidiMixer.Close;
begin
  if fActive then
    mixerClose (fMixerHandle);
  fActive := False;
end;

(*--------------------------------------------------------------------------*
 | procedure TMidiMixer.UpdateControl ()                                    |
 |                                                                          |
 | Update a TMidiMixer value by querying the MM control.                    |
 |                                                                          |
 | Parameters:                                                              |
 |   control : TMixerControlType    The value to update eg. mtMidiVolume    |
 |   channels : Number of channels supported by the mixer line (usually 2!) |
 |                                                                          |
 | The procedure updates the fValue member array.                           |
 *--------------------------------------------------------------------------*)
procedure TMidiMixer.UpdateControl (control : TMixerControlType; channels : Integer);
var
  details : TMixerControlDetails;
  data : array [0..15] of Integer;
  err : Integer;
begin
  if ControlSupported [control] then
  begin
    if (fControl [control].dwControlType and MIXERCONTROL_CONTROLTYPE_CUSTOM) > 0 then
      channels := 0                   // Not used by TMidiMixer
    else
      if (fControl [control].fdwControl and MIXERCONTROL_CONTROLF_UNIFORM) > 0 then
        channels := 1;                // nb, Mute is often a 'uniform' control -
                                      // there's only one value, which affects
                                      // all channels.

    details.cbStruct := sizeof (details);
    details.dwControlID := fControl [control].dwControlID;
    details.cChannels := channels;
    details.cMultipleItems := fControl [control].cMultipleItems;
    details.cbDetails := sizeof (integer);
    details.paDetails := @data;

                                      // Get the control details
    err := mixerGetControlDetails (fMixerHandle, @details, MIXER_GETCONTROLDETAILSF_VALUE);

    if err = MMSYSERR_NOERROR then
    begin
                                      // Copy the data into the fValue memberarray
      fValue [control, mcLeft] := data [0];
      if channels = 1 then
        fValue [control, mcRight] := data [0]
      else
        fValue [control, mcRight] := data [1]
    end
    else raise EMMError.CreateMMErr (err, 'mixerGetControlDetails')
  end
  else
  begin
    fValue [control, mcLeft] := 0;
    fValue [control, mcRight] := 0
  end
end;

(*--------------------------------------------------------------------------*
 | procedure TMidiMixer.SetControl                                          |
 |                                                                          |
 | Set an MM control from the values held in the fValue  member array.      |
 |                                                                          |
 | Parameters:                                                              |
 |   control : TMixerControlType     The control to set                     |
 |   channels : Integer              Number of channels to set.  Usually 2. |
 *--------------------------------------------------------------------------*)
procedure TMidiMixer.SetControl (control : TMixerControlType; channels : Integer);
var
  details : TMixerControlDetails;
  data : array [0..1024] of Integer;
  err : Integer;
begin
  if (fControl [control].dwControlType and MIXERCONTROL_CONTROLTYPE_CUSTOM) > 0 then
    channels := 0                   // Not used by TMidiMixer
  else
    if (fControl [control].fdwControl and MIXERCONTROL_CONTROLF_UNIFORM) > 0 then
      channels := 1;                // nb, Mute is often a 'uniform' control -
                                    // there's only one value, which affects
                                    // all channels.


  FillChar (data, SizeOf (data), 0);
  data [0] := fValue [control, mcLeft];
  data [1] := fValue [control, mcRight];

  details.cbStruct := sizeof (details);
  details.dwControlID := fControl [control].dwControlID;
  details.cChannels := channels;
  details.cMultipleItems := fControl [control].cMultipleItems;
  details.cbDetails := sizeof (integer);
  details.paDetails := @data;

                                     // Set the control's details.
  err := mixerSetControlDetails (fMixerHandle, @details, MIXER_GETCONTROLDETAILSF_VALUE);

  if err <> 0 then
    raise EMMError.CreateMMErr (err, 'mixerSetControlDetails');
end;

(*--------------------------------------------------------------------------*
 | procedure TMidiMixer.SetActive (value : boolean);                        |
 |                                                                          |
 | 'Set' procedure for Active property.  Open the mixer if we're not in     |
 | design mode.  Also see the 'Loaded' procedure, above                     |
 |                                                                          |
 | Parameters:                                                              |
 |   value : boolean          The value to set                              |
 *--------------------------------------------------------------------------*)
procedure TMidiMixer.SetActive (value : boolean);
begin
  if value <> fActive then
    if (csDesigning in ComponentState) or (csLoading in ComponentState) then
      fActive := value
    else
      if value then Open else Close
end;

(*--------------------------------------------------------------------------*
 | procedure TMidiMixer.SetMidiDeviceID (value : Integer);                  |
 |                                                                          |
 | 'Set' procedure for MidiDeviceID property                                |
 |                                                                          |
 | Parameters:                                                              |
 |   value : Integer          The value to set.                             |
 *--------------------------------------------------------------------------*)
procedure TMidiMixer.SetMidiDeviceID (value : Integer);
var
  oldActive : boolean;
begin
  if value <> fMidiDeviceID then
  begin
    oldActive := Active;
    Close;                      // Close and re-open if the control's active
    fMidiDeviceID := value;
    Active := oldActive
  end
end;

(*--------------------------------------------------------------------------*
 | procedure TMidiMixer.SetControlValue ();                                 |
 |                                                                          |
 | 'Set' procedure for ControlValue property.  Sets the MM device to the    |
 | specifued volume or mute value.                                          |
 |                                                                          |
 | Parameters:                                                              |
 |   ctrl : TMixerControlType     The control to set                        |
 |   chan : TMixerChannel         The channel to use (mcLeft or mcRight)    |
 |   value : Integer              The new value.                            |
 *--------------------------------------------------------------------------*)
procedure TMidiMixer.SetControlValue (ctrl : TMixerControlType; chan : TMixerChannel; value : Integer);
var
  cChannels : Integer;
begin
  if fValue [ctrl, chan] <> value then
  begin
    if ctrl in [mtAudioVolume, mtAudioMute, mtAudioTreble, mtAudioBass] then
      cChannels := fAudioLine.cChannels
    else
      cChannels := fSynthLine.cChannels;
    fValue [ctrl, chan] := value;
    SetControl (ctrl, cChannels)
  end
end;

(*--------------------------------------------------------------------------*
 | procedure TMidiMixer.SetControlValues ();                                |
 |                                                                          |
 | 'Set' procedure for ControlValues property.  Sets the MM device to the   |
 | specified volume or mute value for all channels.                         |
 |                                                                          |
 | Parameters:                                                              |
 |   ctrl : TMixerControlType     The control to set                        |
 |   chan : TMixerChannel         The channel to use (mcLeft or mcRight)    |
 |   value : Integer              The new value.                            |
 *--------------------------------------------------------------------------*)
procedure TMidiMixer.SetControlValues (ctrl : TMixerControlType; const values : TChannelValues);
var
  cChannels : Integer;
begin
  if ctrl in [mtAudioVolume, mtAudioMute, mtAudioTreble, mtAudioBass] then
    cChannels := fAudioLine.cChannels
  else
    cChannels := fSynthLine.cChannels;
  fValue [ctrl] := values;
  SetControl (ctrl, cChannels)
end;


(*--------------------------------------------------------------------------*
 | function TMidiMixer.GetControlValue () : Integer                         |
 |                                                                          |
 | 'Get' function for ControlValue property.  Gets the current value for a  |
 | control/channel                                                          |
 |                                                                          |
 | Parameters:                                                              |
 |   ctrl : TMixerControlType     The control to set                        |
 |   chan : TMixerChannel         The channel to use (mcLeft or mcRight)    |
 |                                                                          |
 | The function returns the current value for the control/channel           |
 *--------------------------------------------------------------------------*)
function TMidiMixer.GetControlValue (ctrl : TMixerControlType; chan : TMixerChannel) : Integer;
begin
  result := fValue [ctrl, chan];
end;

(*--------------------------------------------------------------------------*
 | function TMidiMixer.GetControlSupported () : Boolean                     |
 |                                                                          |
 | 'Get' function for ControlSupported property.  Returns true if the       |
 | specified control is supported.                                          |
 |                                                                          |
 | Parameters:                                                              |
 |   ctrl : TMixerControlType     The control to inspect.                   |
 |                                                                          |
 | The function returns true if the MM subsystem supports the control.      |
 *--------------------------------------------------------------------------*)
function TMidiMixer.GetControlSupported (ctrl : TMixerControlType) : Boolean;
begin
  result := fControlSupported [ctrl]
end;

(*--------------------------------------------------------------------------*
 | function TMidiMixer.GetControlMin() : Integer                            |
 |                                                                          |
 | 'Get' function for ControlMin property.  Returns the minimum value for   |
 | the control.                                                             |
 |                                                                          |
 | Parameters:                                                              |
 |   ctrl : TMixerControlType     The control to inspect.                   |
 |                                                                          |
 | The function returns the minimum value for the control.                  |
 *--------------------------------------------------------------------------*)
function TMidiMixer.GetControlMin (ctrl : TMixerControlType) : Integer;
begin
  result := fControl [ctrl].Bounds.lMinimum
end;

(*--------------------------------------------------------------------------*
 | function TMidiMixer.GetControlMax() : Integer                            |
 |                                                                          |
 | 'Get' function for ControlMax property.  Returns the maximum value for   |
 | the control.                                                             |
 |                                                                          |
 | Parameters:                                                              |
 |   ctrl : TMixerControlType     The control to inspect.                   |
 |                                                                          |
 | The function returns the maximum value for the control.                  |
 *--------------------------------------------------------------------------*)
function TMidiMixer.GetControlMax (ctrl : TMixerControlType) : Integer;
begin
  result := fControl [ctrl].Bounds.lMaximum
end;

(*--------------------------------------------------------------------------*
 | procedure Register                                                       |
 |                                                                          |
 | Register the TMidiMixer control with Delphi.                             |
 *--------------------------------------------------------------------------*)
procedure Register;
begin
  RegisterComponents('MIDI', [TMidiMixer]);
end;

end.
