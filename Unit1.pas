(*

          Shutdown Monster
             by ebiSoft


Check http://shutdown.sf.net for more information.

This is the full version of Shutdown Monster.

Shutdown Monster is not and does not contain any spyware, adware or malware.

The source code is c.a. 37 pages long; you can copy and redistribute it under
the terms of the GNU General Public License.

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

Components used in this project:
dclebi        Attached with the source code
Indy 10       Delphi 2006
JVCL          Delphi 2006 companion CD
LMD SE        Delphi 2006 companion CD
SMLPack       SuniSoft; e-mail me if you need it
SUIPack       SuniSoft; you have to buy it
adCpuUsage    Attached with the source code
cmpMidiMixer  Attached with the source code
ThdTimer      Attached with the source code

SUIPack and SMLPack aren't free, you should buy them or use the trial versions.
SMLPack is not available anymore -- if it gets old enough, you might distribute
it freely. E-mail me (david@mosolyorszag.hu) if you need it.
Trials of it are available at http://www.sunisoft.com

Indy 10, LMD SE and JVCL are free, and come with Delphi10.

If you don't have the companion CD, you can get LMD at:
http://www.lmd.de/download/
You need LMD-Tools SE 7.x BDS 2006 Win32.

JVCL is available at:
http://sourceforge.net/projects/jvcl

*)

unit Unit1;

interface

uses
//First three lines added manually by ebertek
  Math, WinInet, IniFiles, Windows, SysUtils, Registry, DateUtils, Dialogs,
  ShellApi, ActnList, Messages, ComObj, mmsystem, clipbrd, ExtActns,
  adCpuUsage, ThdTimer,
  Forms, XPMan, Menus, ExtCtrls, StdCtrls, Controls, Grids, ComCtrls, Buttons,
  Classes, LMDCustomComponent, LMDStarter, LMDControl, LMDBaseControl,
  LMDBaseGraphicControl, LMDGraphicControl, LMDBaseMeter,
  LMDCustomProgressFill, LMDProgressFill, LMDGlobalHotKey, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit,
  LMDCustomBrowseEdit, LMDCustomFileEdit, LMDFileOpenEdit, LMDCustomMaskEdit,
  LMDCustomExtSpinEdit, LMDSpinEdit, ScktComp, IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPClient, IdSNTP, ParamOpener, Mask, Graphics,
  LMDWndProcComponent, SMLLangRes, SMLFormLangRes, SMLMenuLangRes,
  SMLMsgLangRes, AppEvnts, SUIForm, cmpMidiMixer, LMDBaseGraphicButton,
  LMDCustomSpeedButton, LMDDockSpeedButton, LMDTrayIcon, LMDFormA, JvExExtCtrls,
  JvComponent, JvClock, JvDice, JvExControls;

type                                  //MY VERY-FIRST THREAD!! :)
 TUpdateThread = class(TThread)
 Public
  Procedure Execute; override;
 end;

type
 TAtomThread = class(TThread)
 Public
  Procedure Execute; override;
 end;

type
  TShutdown = class(TForm)
    Timer2: TTimer;
    SysTrayMenu: TPopupMenu;
    Kikapcsols1: TMenuItem;
    Kilps1: TMenuItem;
    N15percmlva1: TMenuItem;
    N30percmlva1: TMenuItem;
    N60percmlva1: TMenuItem;
    N120percmlva1: TMenuItem;
    Most1: TMenuItem;
    Mgsem1: TMenuItem;
    jraindts1: TMenuItem;
    Kijelentkezs1: TMenuItem;
    Timer3: TThreadedTimer;
    Start: TLMDStarter;
    Munkallomszrolsa1: TMenuItem;
    GHRB: TLMDGlobalHotKey;
    GHH: TLMDGlobalHotKey;
    GHLWS: TLMDGlobalHotKey;
    GHLO: TLMDGlobalHotKey;
    GHSD: TLMDGlobalHotKey;
    GHPO: TLMDGlobalHotKey;
    Kpernyvd1: TMenuItem;
    GHSS: TLMDGlobalHotKey;
    GHAA: TLMDGlobalHotKey;
    LMDGlobalHotKey1: TLMDGlobalHotKey;
    LMDGlobalHotKey2: TLMDGlobalHotKey;
    LMDGlobalHotKey3: TLMDGlobalHotKey;
    LMDGlobalHotKey4: TLMDGlobalHotKey;
    mon0hk: TLMDGlobalHotKey;
    mon1hk: TLMDGlobalHotKey;
    ctifhk: TLMDGlobalHotKey;
    atom_menu: TPopupMenu;
    Delet1: TMenuItem;
    ParamOpener1: TParamOpener;
    ServerSocket1: TServerSocket;
    GHSus: TLMDGlobalHotKey;
    sml: TsmlFormLangRes;
    IdSNTP1: TIdSNTP;
    sml2: TsmlMenuLangRes;
    sml3: TsmlMenuLangRes;
    ApplicationEvents1: TApplicationEvents;
    HookTimer: TTimer;
    suiForm1: TsuiForm;
    Valasztas: TPageControl;
    Time: TTabSheet;
    logo: TImage;
    Set1: TBitBtn;
    Canc1: TBitBtn;
    Save1: TBitBtn;
    Calendar: TMonthCalendar;
    Idopont: TDateTimePicker;
    RxClock1: TJvClock;
    CountDown: TTabSheet;
    Most: TLMDProgressFill;
    Set2: TBitBtn;
    Canc2: TBitBtn;
    Save2: TBitBtn;
    logMe: TMemo;
    CD1: TLMDSpinEdit;
    CD2: TLMDSpinEdit;
    CD3: TLMDSpinEdit;
    RxClock2: TJvClock;
    IPing: TTabSheet;
    infoPing: TLabel;
    infoCheck: TLabel;
    PingTime: TLMDSpinEdit;
    Set3: TBitBtn;
    Save3: TBitBtn;
    Canc3: TBitBtn;
    eleres: TLMDFileOpenEdit;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    CPU_L: TLabel;
    If_below: TLabel;
    If_stays: TLabel;
    If_then: TLabel;
    CPU_SE: TLMDSpinEdit;
    CPUMin_SE: TLMDSpinEdit;
    Save4: TBitBtn;
    Canc4: TBitBtn;
    Set4: TBitBtn;
    Hook_CB: TCheckBox;
    AltOptions: TTabSheet;
    GB_Design: TGroupBox;
    auto: TCheckBox;
    auto2: TCheckBox;
    minimCB: TCheckBox;
    ontopCB: TCheckBox;
    GB_Shutdown: TGroupBox;
    force: TCheckBox;
    defcommand: TComboBox;
    wake_CB: TCheckBox;
    GB_Alarm: TGroupBox;
    wavE: TLMDFileOpenEdit;
    wavSE: TLMDSpinEdit;
    GB_Before: TGroupBox;
    beshutCB: TCheckBox;
    beshutE: TLMDFileOpenEdit;
    logCB: TCheckBox;
    annCB: TCheckBox;
    ann_CB: TComboBox;
    GB_Other: TGroupBox;
    langCB: TComboBox;
    Save4_2: TBitBtn;
    server_CB: TCheckBox;
    Button1: TBitBtn;
    RxDice1: TJvDice;
    Memo1: TMemo;
    Memo2: TMemo;
    Veszhelyzet: TTabSheet;
    SpeedButton1: TSpeedButton;
    PowerOff: TBitBtn;
    ReBoot: TBitBtn;
    LogOff: TBitBtn;
    ShutDown_B: TBitBtn;
    Hibernate: TBitBtn;
    HotKeyPOff: THotKey;
    HotKeySD: THotKey;
    HotKeyReB: THotKey;
    HotKeyLO: THotKey;
    HotKeyHib: THotKey;
    SaveHK: TBitBtn;
    LockWS: TBitBtn;
    HotKeyLWS: THotKey;
    SDMenu: TBitBtn;
    SSOn: TBitBtn;
    HotKeySS: THotKey;
    BitBtn1: TBitBtn;
    HotKeyAA: THotKey;
    eject: TBitBtn;
    close: TBitBtn;
    recbin: TBitBtn;
    clipb: TBitBtn;
    HotKey1: THotKey;
    HotKey2: THotKey;
    HotKey3: THotKey;
    HotKey4: THotKey;
    mon0: TBitBtn;
    mon1: TBitBtn;
    hkmon0: THotKey;
    hkmon1: THotKey;
    BitBtn2: TBitBtn;
    hkctif: THotKey;
    Suspend: TBitBtn;
    HotKeySus: THotKey;
    UserSpecific: TTabSheet;
    UserCB: TCheckBox;
    FromTime: TDateTimePicker;
    ToTime: TDateTimePicker;
    TabSheet2: TTabSheet;
    atom_label: TLabel;
    atom_servers: TListBox;
    atom_do: TBitBtn;
    atom_CB: TCheckBox;
    atom_add: TEdit;
    volfade_CB: TCheckBox;
    volfade_E: TLMDSpinEdit;
    volfade_T: TTimer;
    Timer1: TThreadedTimer;
    PingTimer: TThreadedTimer;
    SureTimer: TThreadedTimer;
    CPU: TThreadedTimer;
    CPUOff: TThreadedTimer;
    CPUCheck: TThreadedTimer;
    Update_L: TLabel;
    updateCB: TCheckBox;
    TrayIcon: TLMDTrayIcon;
    clearCB: TCheckBox;
    confCB: TComboBox;
    MidiMixer1: TMidiMixer;
    hideCB: TCheckBox;
    atom_addButton: TLMDDockSpeedButton;
    procedure TrayIconClick(Sender: TObject);
    procedure langCBSelect(Sender: TObject);
    procedure confCBKeyPress(Sender: TObject; var Key: Char);
    procedure confCBSelect(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Update_LClick(Sender: TObject);
    procedure volfade_TTimer(Sender: TObject);
    procedure HookTimerTimer(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG; var Handled: Boolean);
    procedure Save4Click(Sender: TObject);
    procedure Set4Click(Sender: TObject);
    procedure CPUOffTimer(Sender: TObject);
    procedure CPUCheckTimer(Sender: TObject);
    procedure CPUTimer(Sender: TObject);
    procedure SureTimerTimer(Sender: TObject);
    function TurnScreenSaverOn: boolean;
    function GetUserFromWindows: string;
    procedure CheckVol;
    function HexToInt(HexStr: String): Integer;
    procedure DoOpen;
    procedure DoDownload;
    procedure DoSD;
    procedure VLog(vl: string);
    procedure DoLog(Sender: string);
    procedure ClearCommonD;
    procedure ClearRun;
    procedure DoClear;
    procedure DoExec;
    procedure DoStart;
    procedure DoHook;
    procedure KillHook;
    procedure Atomic_Clock;
    procedure AutoToReg;
    procedure DelReg;
    procedure DeMin;
    procedure EnMax;
    procedure FullHide;
    procedure Set1Auto;
    procedure Set2Auto;
    procedure Set3Auto;
    procedure Set4Auto;
    procedure ComSave;
    procedure ComOpen;
    procedure UserSave;
    procedure UserOpen;
    procedure HotKeySave;
    procedure HotKeyOpen;
    procedure WaveSave;
    procedure WaveOpen;
    procedure Set1Save;
    procedure Set2Save;
    procedure Set3Save;
    procedure Set4Save;
    procedure Piszka;
    procedure NapOpen;
    procedure NapCheck;
    procedure Set2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Set1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure RxDice1Click(Sender: TObject);
    procedure TrayIconDblClick(Sender: TObject);
    procedure N15percmlva1Click(Sender: TObject);
    procedure N30percmlva1Click(Sender: TObject);
    procedure N60percmlva1Click(Sender: TObject);
    procedure N120percmlva1Click(Sender: TObject);
    procedure Mgsem1Click(Sender: TObject);
    procedure autoClick(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Set3Click(Sender: TObject);
    procedure Save3Click(Sender: TObject);
    procedure PingTimerTimer(Sender: TObject);
    procedure logoClick(Sender: TObject);
    procedure PowerOffClick(Sender: TObject);
    procedure ReBootClick(Sender: TObject);
    procedure LogOffClick(Sender: TObject);
    procedure ShutDown_BClick(Sender: TObject);
    procedure HibernateClick(Sender: TObject);
    procedure HotKeyPOffChange(Sender: TObject);
    procedure HotKeySDChange(Sender: TObject);
    procedure HotKeyReBChange(Sender: TObject);
    procedure HotKeyLOChange(Sender: TObject);
    procedure HotKeyHibChange(Sender: TObject);
    procedure SaveHKClick(Sender: TObject);
    procedure LockWSClick(Sender: TObject);
    procedure HotKeyLWSChange(Sender: TObject);
    procedure SDMenuClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SSOnClick(Sender: TObject);
    procedure HotKeySSChange(Sender: TObject);
    procedure GHSSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GHPOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GHSDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GHRBKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GHLWSKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GHHKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure GHLOKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure StartAfterStart(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure auto2Click(Sender: TObject);
    procedure HotKeyAAChange(Sender: TObject);
    procedure GHAAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ejectClick(Sender: TObject);
    procedure closeClick(Sender: TObject);
    procedure recbinClick(Sender: TObject);
    procedure clipbClick(Sender: TObject);
    procedure LMDGlobalHotKey1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LMDGlobalHotKey2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LMDGlobalHotKey4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LMDGlobalHotKey3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HotKey1Change(Sender: TObject);
    procedure HotKey2Change(Sender: TObject);
    procedure HotKey3Change(Sender: TObject);
    procedure HotKey4Change(Sender: TObject);
    procedure Kilps1Click(Sender: TObject);
    procedure mon0Click(Sender: TObject);
    procedure mon1Click(Sender: TObject);
    procedure mon1hkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mon0hkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure hkmon0Change(Sender: TObject);
    procedure hkmon1Change(Sender: TObject);
    procedure hkctifChange(Sender: TObject);
    procedure ctifhkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button1Click(Sender: TObject);
    procedure atom_doClick(Sender: TObject);
    procedure atom_addButtonClick(Sender: TObject);
    procedure Delet1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure ParamOpener1ParamOpen(Sender: TObject);
    procedure ontopCBClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure server_CBClick(Sender: TObject);
    procedure SuspendClick(Sender: TObject);
    procedure GHSusKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HotKeySusChange(Sender: TObject);
    procedure annCBClick(Sender: TObject);
  private
    lini, cini, INI: TINIFile;
    FHookStarted : Boolean;
  public
    UpThread: TUpdateThread;
    AtomThread: TAtomThread;
    Procedure WMSysCommand(Var Msg : TMessage); Message WM_SYSCOMMAND;
    procedure WMEndSession(var Msg : TWMEndSession); message WM_ENDSESSION;
  end;

var
  Vol: DWord; //for vol fading
  rvol,lvol: word; //for vol fading
  dwStart: cardinal; //for T3i (countdown)
  Shutdown: TShutdown;
  shutted, notready, done, verbose: boolean; //for s4s, vol fading and logging
  HookNow: boolean; //for the hook (CPUUsage)
  usage: Integer; //needed for CPUUsage
  T3i: Integer;  //needed for systray
  cmd, recv: string; //for Client-Server stuff
  Active1, Active2, Active3: boolean; //for CS
  _SetSuspendState: function
  (Hibernate, ForceCritical, DisableWakeEvent: BOOL): BOOL
  stdcall = nil;

    function LinkAPI(const module, functionname: string): Pointer; forward;
function SHEmptyRecycleBin
   (Wnd:HWnd; LPCTSTR:PChar;
   DWORD:Word):Integer; stdcall;
  const
  SHERB_NOCONFIRMATION = $00000001;
  SHERB_NOPROGRESSUI = $00000002;
  SHERB_NOSOUND = $00000004;

implementation

uses Unit2, Unit3, Unit5;

{$R *.dfm}
var JHook: THandle;

function MyExitWindows(RebootParam: Longword): Boolean;
var
  TTokenHd: THandle;
  TTokenPvg: TTokenPrivileges;
  cbtpPrevious: DWORD;
  rTTokenPvg: TTokenPrivileges;
  pcbtpPreviousRequired: DWORD;
  tpResult: Boolean;
const
  SE_SHUTDOWN_NAME = 'SeShutdownPrivilege';
begin
  if Win32Platform = VER_PLATFORM_WIN32_NT then
  begin
    tpResult := OpenProcessToken(GetCurrentProcess(),
      TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY,
      TTokenHd);
    if tpResult then
    begin
      tpResult := LookupPrivilegeValue(nil,
                                       SE_SHUTDOWN_NAME,
                                       TTokenPvg.Privileges[0].Luid);
      TTokenPvg.PrivilegeCount := 1;
      TTokenPvg.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
      cbtpPrevious := SizeOf(rTTokenPvg);
      pcbtpPreviousRequired := 0;
      if tpResult then
        Windows.AdjustTokenPrivileges(TTokenHd,
                                      False,
                                      TTokenPvg,
                                      cbtpPrevious,
                                      rTTokenPvg,
                                      pcbtpPreviousRequired);
    end;
  end;
  Result := ExitWindowsEx(RebootParam, 0);
end;

function SetSuspendState(Hibernate, ForceCritical,
  DisableWakeEvent: Boolean): Boolean;
begin
  if not Assigned(_SetSuspendState) then
    @_SetSuspendState := LinkAPI('POWRPROF.dll', 'SetSuspendState');
  if Assigned(_SetSuspendState) then
    Result := _SetSuspendState(Hibernate, ForceCritical,
      DisableWakeEvent)
  else
    Result := False;
end;

function LinkAPI(const module, functionname: string): Pointer;
var
  hLib: HMODULE;
begin
  hLib := GetModulehandle(PChar(module));
  if hLib = 0 then
    hLib := LoadLibrary(PChar(module));
  if hLib <> 0 then
    Result := getProcAddress(hLib, PChar(functionname))
  else
    Result := nil;
end;

procedure MinimizeToTray;
var  hwndTray:      HWND;
     rcWindow:      TRect;
     rcTray:        TRect;
begin
  // Check passed window handle
  if IsWindow(Application.Handle) then
  begin
     // Get tray Application.Handle
     hwndTray:=
       FindWindowEx(FindWindow('Shell_TrayWnd', nil), 0, 'TrayNotifyWnd', nil);
     // Check tray Application.Handle
     if (hwndTray = 0) then
        // Failure
     else
     begin
        // Get window rect and tray rect
        GetWindowRect(Application.Handle, rcWindow);
        GetWindowRect(hwndTray, rcTray);
        // Perform the animation
        DrawAnimatedRects(Application.Handle, IDANI_CAPTION, rcWindow, rcTray);
        // Hide the window
        ShowWindow(Application.Handle, SW_HIDE);
        Shutdown.Visible:=False;
        if verbose then Shutdown.VLog('Tray icon: Minimized to system tray');
     end;
  end
  else
    if verbose then
      Shutdown.VLog('Tray icon: Minimizing to system tray failed');

end;

procedure RestoreFromTray;
var  hwndTray:      HWND;
     rcWindow:      TRect;
     rcTray:        TRect;
begin

  // Check passed window handle
  if IsWindow(Application.Handle) then
  begin
    // Get tray Application.Handle
    hwndTray:=
      FindWindowEx(FindWindow('Shell_TrayWnd', nil), 0, 'TrayNotifyWnd', nil);
    // Check tray Application.Handle
    if (hwndTray = 0) then
      // Failure
    else
    begin
       // Get window rect and tray rect
       GetWindowRect(Application.Handle, rcWindow);
       GetWindowRect(hwndTray, rcTray);
       // Perform the animation
       DrawAnimatedRects(Application.Handle, IDANI_CAPTION, rcTray, rcWindow);
       // Show the window
       ShowWindow(Application.Handle, SW_SHOW);
       Shutdown.Visible:=True;
       if verbose then Shutdown.VLog('Tray icon: Restored from system tray');
    end;
  end
  else
    if verbose then
      Shutdown.VLog('Tray icon: Restoring from system tray failed');

end;

Procedure TShutdown.WMSysCommand(Var Msg : TMessage);
begin
  Inherited;
  Case Msg.WParam Of
    SC_MINIMIZE : MinimizeToTray;
    SC_MAXIMIZE : RestoreFromTray;
    SC_RESTORE  : RestoreFromTray;
  end;
end;

function TShutdown.TurnScreenSaverOn: boolean;
//copied it from wlock, with author's permission
var b : bool;
begin
  result := false;
  if SystemParametersInfo(SPI_GETSCREENSAVEACTIVE, 0, @b, 0) <> true then
    exit;
  if not b then
    exit;
  PostMessage(GetDesktopWindow, WM_SYSCOMMAND, SC_SCREENSAVE, 0);
  result := true;
end;

function TShutdown.GetUserFromWindows: string;  //get current user from Windows
var
   UserName: string;
   UserNameLen: dword;
begin
   UserNameLen := 255;
   SetLength(UserName, UserNameLen);
   if GetUserName(PChar(UserName), UserNameLen) then
     Result := Copy(UserName,1,UserNameLen - 1)
   else
     Result := lini.ReadString(langCB.Text, 'Unknown', 'Unknown');
End;

function SHEmptyRecycleBin; external
  'SHELL32.DLL' name 'SHEmptyRecycleBinA';

function JournalProc(Code, wParam: Integer; var EventStrut: TEventMsg): Integer;
//hook stuff for CPU usage
stdcall;
begin
  {this is the JournalRecordProc}
  Result := CallNextHookEx(JHook, Code, wParam, Longint(@EventStrut));
  {the CallNextHookEX is not really needed for journal hook since it it not
  really in a hook chain, but it's standard for a Hook}
  if Code < 0 then Exit;

  {you should cancel operation if you get HC_SYSMODALON}
  if Code = HC_SYSMODALON then Exit;
  if Code = HC_ACTION then
  begin
    {
    The lParam parameter contains a pointer to a TEventMsg
    structure containing information on
    the message removed from the system message queue.
    }
    HookNow:=False;
    if verbose then Shutdown.VLog('CPU usage: JournalProc started');
    if not (Shutdown.HookTimer.Enabled) then Shutdown.HookTimer.Enabled:=True;
  end;
end;

procedure TShutdown.WMEndSession(var Msg : TWMEndSession);
begin
  if Msg.EndSession then begin
//    shutted:=false;
//    done:=false;
    shutted:=True; done:=True;
    if verbose then VLog('Shutdown: Got shutdown command from Windows');
  end;
end;

procedure TShutdown.CheckVol;  //gets current volume
begin
  if not MidiMixer1.Active then MidiMixer1.Active:=True;
  with MidiMixer1 do begin
    lvol := ControlValue [mtAudioVolume, mcLeft];
    rvol := ControlValue [mtAudioVolume, mcRight];
  end;
  if verbose then VLog('Volume fading: Got current volume');
end;

function TShutdown.HexToInt(HexStr: String): Integer;
begin
  result := StrToInt('$' + HexStr);
end;

procedure TShutdown.DoOpen;  //this loads everything
begin
  INI.Free;
  INI := TINIFile.Create(ExtractFilePath(Application.EXEName)
    + confCB.Text+'.ini');
  NapOpen;
  UserOpen;
  WaveOpen;
  ComOpen;
  HotKeyOpen;
  NapCheck;
  if verbose then VLog('Load: Everything');
end;

procedure TShutdown.DoDownload;  //checks for updates
var
s1, s2: TStringList;
ss1, ss2: string;
begin
  if verbose then VLog('C4U: Looking for updates');
  ss1:='';
  ss2:='';
  with TDownloadURL.Create(self) do
    try
      URL:='http://shutdown.sourceforge.net/update.txt';
      FileName := ExtractFilePath(Application.EXEName) + 'update.txt';
      ExecuteTarget(nil) ;
    finally
      Free;
  end;
  s1 := TStringList.Create;
  s2 := TStringList.Create;
  s1.LoadFromFile(ExtractFilePath(Application.EXEName)+'current.txt');
  s2.LoadFromFile(ExtractFilePath(Application.EXEName)+'update.txt');
  ss1:=Copy(s1.Text,1,7);
  ss2:=Copy(s2.Text,1,7);
  if StrToInt(ss2) > StrToInt(ss1) then begin
    Update_L.Caption:=(lini.ReadString
(langCB.Text, 'Update2', 'A new version is available!')+#13#10+
lini.ReadString(langCB.Text, 'Update3', 'Get it from http://shutdown.sf.net/'));
  end else begin
    Update_L.Caption:=lini.ReadString
      (langCB.Text, 'NoUpdate', 'There are no new updates available!');
  end;
  s1.Clear; s2.Clear;
  s1.Free; s2.Free;
  UpThread.Free;
  if verbose then VLog('C4U: Looking for updates done');
end;

procedure TShutdown.DoSD;  //turns off the PC
begin
  if verbose then VLog('Trying to shut down');
  if (not notready) and (not shutted) and (not done) then begin
    case defcommand.ItemIndex of
      -1: begin PowerOff.Click; shutted:=True; end;
       0: begin PowerOff.Click; shutted:=True; end;
       1: begin ShutDown_B.Click; shutted:=True; end;
       2: begin ReBoot.Click; shutted:=True; end;
       3: begin LogOff.Click; done:=True; end;
       4: begin Suspend.Click; shutted:=True; end;
       5: begin Hibernate.Click; shutted:=True; end;
       6: begin LockWS.Click; done:=True; end;
       7: begin SSOn.Click; done:=True; end;
       8: begin BitBtn1.Click; done:=True; end;
       9: begin eject.Click; done:=True; end;
      10: begin close.Click; done:=True; end;
      11: begin recbin.Click; done:=True; end;
      12: begin clipb.Click; done:=True; end;
      13: begin mon0.Click; done:=True; end;
      14: begin mon1.Click; done:=True; end;
      15: begin BitBtn2.Click; done:=True; end;
(*    16: begin ShowMessage(s); end;  //show a message
      17: begin end;  //do nothing *)
    end;
    if shutted then done:=True;
  end;
  if shutted then SureTimer.Enabled:=True;
  EnMax;
end;

function WhatAmI(Sender: TObject): string;
begin
  try Result:=(Sender as TButton).Caption; except end;
end;

procedure TShutdown.VLog(vl: string);
var
  f: TextFile;
  fi: String;
begin
  AssignFile(f, ExtractFilePath(Application.EXEName) + 'Shutdown.log');
  fi:=ExtractFilePath(Application.EXEName) + 'Shutdown.log';
  if not FileExists(fi) then begin
    ReWrite(f);
    CloseFile(f);
  end;
  logMe.Clear;
  logMe.Lines.LoadFromFile(ExtractFilePath(Application.EXEName) +
    'Shutdown.log');
  logMe.Lines.Add(DateTimeToStr(now)+' -- '+vl);
  logMe.Lines.SaveToFile(ExtractFilePath(Application.EXEName) +
    'Shutdown.log');
end;

procedure TShutdown.DoLog(Sender: string);
var
  f: TextFile;
  fi, command: String;
begin
  if (logCB.Checked) and (verbose=False) then begin
    AssignFile(f, ExtractFilePath(Application.EXEName) + 'Shutdown.log');
    fi:=ExtractFilePath(Application.EXEName) + 'Shutdown.log';
    if not FileExists(fi) then begin
      ReWrite(f);
      CloseFile(f);
    end;
    logMe.Clear;
    logMe.Lines.LoadFromFile(ExtractFilePath(Application.EXEName) +
      'Shutdown.log');
    if Sender <> '\DoExec/' then command:=Sender else command:=defcommand.Text;
    Delete(command,pos('&',command),1);
    logMe.Lines.Add(DateTimeToStr(Now) + ': ' + command + ' ' +
      lini.ReadString(langCB.Text, 'By_User', 'by') + ' ' + GetUserFromWindows);
    logMe.Lines.SaveToFile(ExtractFilePath(Application.EXEName) +
      'Shutdown.log');
  end;
end;

procedure TShutdown.ClearCommonD;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey
('\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedMRU'
  ,false) then begin
        Reg.DeleteKey
('\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedMRU');

    if Reg.OpenKey
('\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU'
  ,false) then
        Reg.DeleteKey
('\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU');
    end;
  finally
    Reg.Free;
  end;
end;

procedure TShutdown.ClearRun;
var
  Reg: TRegistry;
  i: integer;
  sl: TStringList;
  slb: boolean;
label failure;
begin
  Reg := TRegistry.Create;
  try sl := TStringList.Create; finally slb:=True; end;
  if slb then begin
    try
      Reg.RootKey := HKEY_CURRENT_USER;
      if Reg.OpenKey
('\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU'
  ,false) then begin
        Reg.GetValueNames(sl);
        for i:=0 to sl.Count-1 do
          Reg.DeleteValue(sl.Strings[I]);
        Reg.DeleteKey('MRUList');
      end;
    finally
      Reg.Free;
    end;
  end;
  try sl.Free except end;
end;

procedure TShutdown.DoClear;
begin
  if clearCB.Checked then begin

//Clear the recycle bin
if verbose then VLog('Shutdown: Trying to clear recycle bin');
recbin.Click;

//Clear the temporary file folder of Windows


//Clear the temporary files of Internet Explorer
if verbose then VLog('Shutdown: Trying to clear temporary internet files');
BitBtn2.Click;

//Clear the cookies of Internet Explorer


//Clear the history of Internet Explorer


//Clear the AutoComplete entries


//Clear recent document list


//Clear common dialogs' MRU-entries
if verbose then VLog('Shutdown: Trying to clear common dialogs'' MRU list');
ClearCommonD;

//Clear run dialog's MRU-entries
if verbose then VLog('Shutdown: Trying to clear run MRU list');
ClearRun;

  end;
end;

procedure TShutdown.DoExec;
begin
//Before-shutdown settings begin

  DoLog('\DoExec/');

  if volfade_CB.Checked then begin
    if verbose then VLog('Volume fading: Start');
    notready:=True;
    CheckVol;
    rvol:=HexToInt(copy(IntToHex(Vol,8),1,4));  //high-order part of dword
    lvol:=HexToInt(copy(IntToHex(Vol,8),5,8));  //low-order part of dword
    if auto2.Checked then begin
      INI.WriteInteger('Volume', 'Right', rvol);
      INI.WriteInteger('Volume', 'Left', lvol);
      INI.WriteBool('Volume', 'WasFaded', True);
    end;
    volfade_T.Enabled:=True;
    if verbose then VLog('Volume fading: Done');
  end;

  DoClear;

//Before-Shutdown settings end

  DoSD;

end;

procedure TShutdown.DoStart;
begin
  if verbose then VLog('STARTING UP...');
  langCB.Text:=StringReplace(SML.LangFileName, '.sml', '', [rfReplaceAll]);
  langCB.Text:=cini.ReadString('Settings', 'Language', 'English');
  langCBSelect(self);

  SplashForm.Label1.Caption:=lini.ReadString
    (langCB.Text, 'SF_Pos', 'Restoring position');
  SplashForm.Update;
  Shutdown.Left:=INI.ReadInteger('Placement', 'Left', Round(Screen.Width/5));
  Shutdown.Top:=INI.ReadInteger('Placement', 'Top', Round(Screen.Height/5));

  SplashForm.Label1.Caption:=lini.ReadString
    (langCB.Text, 'SF_Data', 'Loading data');
  SplashForm.Update;
  NapOpen;
  UserOpen;
  WaveOpen;

  SplashForm.Label1.Caption:=lini.ReadString
    (langCB.Text, 'SF_Com', 'Loading shared data');
  SplashForm.Update;
  ComOpen;

  SplashForm.Label1.Caption:=lini.ReadString
    (langCB.Text, 'SF_HK', 'Loading hotkeys');
  SplashForm.Update;
  HotKeyOpen;

  SplashForm.Label1.Caption:=lini.ReadString
    (langCB.Text, 'SF_Re', 'Rechecking settings');
  SplashForm.Update;
  NapCheck;

  SplashForm.Label1.Caption:=lini.ReadString
    (langCB.Text, 'SF_Param', 'Checking parameters');
  SplashForm.Update;
  ParamOpener1.ParamOpen;

end;

procedure TShutdown.DoHook;
begin
  if FHookStarted then
    Exit;
  JHook := SetWindowsHookEx(WH_JOURNALRECORD, @JournalProc, hInstance, 0);
  {SetWindowsHookEx starts the Hook}
  if JHook > 0 then
    FHookStarted := True;
  if verbose then VLog('CPU usage: Hook started');
end;

procedure TShutdown.KillHook;
begin
  FHookStarted := False;
  UnhookWindowsHookEx(JHook);
  JHook := 0;
  if verbose then VLog('CPU usage: Hook stopped');
end;

procedure TShutdown.Atomic_Clock;
var i, tick: integer;
begin
  if verbose then VLog('Atomic clock: Syncing system time');
  tick:=GetTickCount;
  try
    for i:=0 to atom_servers.Items.Count-1 do begin
      if abs(GetTickCount)-tick>=7000 then break;
      IdSNTP1.Active:=False;
      IdSNTP1.Host:=atom_servers.Items.Strings[i];
      IdSNTP1.Active:=True;
      if IdSNTP1.SyncTime then begin
        atom_label.Caption:=lini.ReadString
          (langCB.Text, 'Synced', 'Time synchronized');
        break;
        IdSNTP1.Active:=False;
      end else
        atom_label.Caption:=lini.ReadString
          (langCB.Text, 'Sync_fail', 'Error: synchronization failed!');
      end;
  except
    atom_label.Caption:=lini.ReadString
      (langCB.Text, 'Sync_fail', 'Error: synchronization failed!');
  end;
  AtomThread.Free;
  if verbose then VLog('Atomic clock: Syncing system time done');
end;

procedure TShutdown.AutoToReg;  //adds to reg
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\RunOnce', True)
    then
    begin
      Reg.WriteString('Shutdown Monster', Application.ExeName);
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
  if verbose then VLog('Startup: Added startup entry to the registy');
end;

procedure TShutdown.DelReg;  //removes from reg
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\RunOnce', True)
    then
    begin
      Reg.DeleteValue('Shutdown Monster');
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
  if verbose then VLog('Startup: Removed startup entry from the registry');
end;

procedure TShutdown.DeMin;  //deactivate
begin
  Set1.Enabled:=False;
  Set2.Enabled:=False;
  Set3.Enabled:=False;
  Set4.Enabled:=False;
  N15percmlva1.Enabled:=False;
  N30percmlva1.Enabled:=False;
  N60percmlva1.Enabled:=False;
  N120percmlva1.Enabled:=False;
  Mgsem1.Enabled:=True;
  MinimizeToTray;
  if verbose then VLog('Shutdown: Minimized');
end;

procedure TShutdown.EnMax;  //activate
begin
  Set1.Enabled:=True;
  Set2.Enabled:=True;
  Set3.Enabled:=True;
  Set4.Enabled:=True;
  N15percmlva1.Enabled:=True;
  N30percmlva1.Enabled:=True;
  N60percmlva1.Enabled:=True;
  N120percmlva1.Enabled:=True;
  Mgsem1.Enabled:=False;
  Timer1.Enabled:=False;
  Timer2.Enabled:=False;
  Timer3.Enabled:=False;
  Start.AutoStart:=False;
  if FHookStarted then KillHook;
  Most.UserValue:=0;
  RestoreFromTray;
  if verbose then VLog('Shutdown: Maximized');
end;

procedure TShutdown.FullHide;
begin
  TrayIcon.Active:=False;
  Shutdown.Left:=99999;
  Shutdown.Top:=99999;
  Shutdown.Visible:=False;
  Shutdown.Height:=0;
  Shutdown.Width:=0;
  try
    ShowWindow(Application.Handle, SW_HIDE);
    SetWindowLong(Application.Handle, GWL_EXSTYLE,
    GetWindowLong(Application.Handle, GWL_EXSTYLE) or
    WS_EX_TOOLWINDOW and not WS_EX_APPWINDOW);
  except end;
  if verbose then VLog('Shutdown: Fully hidden');
end;

(*
---Saving and opening---
Set(x)Auto -> set the shutdown
ComSave, ComOpen -> load/save defcommand, lang, etc.
UserSave, UserOpen -> load/save 'user-specific' options
HotKeySave, HotKeyOpen -> load/save hotkeys
WaveSave, WaveOpen -> load/save sound options
ForceCheck -> check if forcing and wake events are on
DurvaCheck -> check if it should hide
Piszka -> check if someone screwed up the settings (more autoshutdown at once)
NapOpen -> load data
NapCheck -> do checkbox-stuff
Set(x)Save -> save
*)

procedure TShutdown.Set1Auto;
var
  HourA, MinA, SecA, MSecA: Word;
begin
  Start.StartTime.DateTimeValue:=Calendar.Date;
  DecodeTime(Idopont.Time, HourA, MinA, SecA, MSecA);
  Start.StartTime.Hour:=HourA;
  Start.StartTime.Minute:=MinA;
  Start.StartTime.Second:=SecA;
  Start.AutoStart:=True;
  if beshutCB.Checked then begin
    Start.Wait:=True;
    Start.Command:=beshutE.Filename;
    Start.StartOption:=soSW_SHOWNORMAL;
  end else begin
    Start.Wait:=False;
    Start.Command:='.';
    Start.StartOption:=soSW_HIDE;
  end;
  DeMin;
  if verbose then VLog('Set: Exact time');
end;

procedure TShutdown.Set2Auto;
begin
  Timer1.Interval:=CD1.Value*3600000+CD2.Value*60000+CD3.Value*1000;
  Timer1.Enabled:=True;
  Most.MaxValue:=CD1.Value*3600+CD2.Value*60+CD3.Value;
  Timer2.Enabled:=True;
  if beshutCB.Checked then begin
    Start.Wait:=True;
    Start.Command:=beshutE.Filename;
    Start.StartOption:=soSW_SHOWNORMAL;
  end else begin
    Start.Wait:=False;
    Start.Command:='.';
    Start.StartOption:=soSW_HIDE;
  end;
  dwStart:=GetTickCount;
  Timer3.Enabled:=True;
  DeMin;
  if verbose then VLog('Set: Countdown');
end;

procedure TShutdown.Set3Auto;
begin
  PingTimer.Interval:=PingTime.Value*60000;
  PingTimer.Enabled:=True;
  if beshutCB.Checked then begin
    Start.Wait:=True;
    Start.Command:=beshutE.Filename;
    Start.StartOption:=soSW_SHOWNORMAL;
  end else begin
    Start.Wait:=False;
    Start.Command:='.';
    Start.StartOption:=soSW_HIDE;
  end;
  DeMin;
  if verbose then VLog('Set: File');
end;

procedure TShutdown.Set4Auto;
begin
  CPUCheck.Enabled:=True;
  HookNow:=True;
  if Hook_CB.Checked then DoHook;
  if beshutCB.Checked then begin
    Start.Wait:=True;
    Start.Command:=beshutE.Filename;
    Start.StartOption:=soSW_SHOWNORMAL;
  end else begin
    Start.Wait:=False;
    Start.Command:='.';
    Start.StartOption:=soSW_HIDE;
  end;
  DeMin;
  if verbose then VLog('Set: CPU usage');
end;

procedure TShutdown.ComSave;
begin
  INI.WriteBool('Settings', 'Force', force.Checked);
  INI.WriteBool('Settings', 'NoWakeEvents', wake_CB.Checked);
  cini.WriteString('Settings', 'INI', confCB.Text+'.ini');
  if defcommand.ItemIndex<>-1 then
    INI.WriteInteger('Command', 'Default', defcommand.ItemIndex) else begin
    defcommand.ItemIndex:=0;
    INI.WriteInteger('Command', 'Default', defcommand.ItemIndex)
    end;
  INI.WriteBool('Settings', 'Logging', logCB.Checked);
  INI.WriteBool('Settings', 'Clear', clearCB.Checked);
  INI.WriteBool('Settings', 'Sync', atom_CB.Checked);
  INI.WriteBool('BeforeShutdown', 'Enabled', beshutCB.Checked);
  INI.WriteString('BeforeShutdown', 'Path', beshutE.Filename);
  INI.WriteBool('Settings', 'Minimize', minimCB.Checked);
  INI.WriteBool('Settings', 'Hide', hideCB.Checked);
  INI.WriteBool('Settings', 'StayOnTop', ontopCB.Checked);
  INI.WriteBool('Settings', 'Server', server_CB.Checked);
  INI.WriteBool('Settings', 'C4U', updateCB.Checked);
  INI.WriteBool('Volume', 'Fade', volfade_CB.Checked);
  INI.WriteInteger('Volume', 'FadeDur', volfade_E.Value);
  if verbose then VLog('Save: Common');
end;

procedure TShutdown.ComOpen;
var values: TChannelValues;
begin
  confCB.Text:=cini.ReadString('Settings', 'INI', 'Settings.ini');
  confCB.Text:=StringReplace(confCB.Text, '.ini', '', [rfReplaceAll]);
  force.Checked:=INI.ReadBool('Settings', 'Force', False);
  wake_CB.Checked:=INI.ReadBool('Settings', 'NoWakeEvents', False);
  beshutCB.Checked:=INI.ReadBool('BeforeShutdown', 'Enabled', False);
  beshutE.Filename:=INI.ReadString('BeforeShutdown', 'Path', '');
  minimCB.Checked:=INI.ReadBool('Settings', 'Minimize', False);
  hideCB.Checked:=INI.ReadBool('Settings', 'Hide', False);
  PingTime.Value:=INI.ReadInteger('AutoPingShutdown', 'Minute', 10);
  CPU_SE.Value:=INI.ReadInteger('AutoCPUShutdown', 'Usage', 5);
  CPUMin_SE.Value:=INI.ReadInteger('AutoCPUShutdown', 'Minute', 30);
  Hook_CB.Checked:=INI.ReadBool('AutoCPUShutdown', 'Input', False);
  ontopCB.Checked:=INI.ReadBool('Settings', 'StayOnTop', False);
  defcommand.ItemIndex:=INI.ReadInteger('Command', 'Default', 0);
  if defcommand.ItemIndex=-1 then defcommand.ItemIndex:=0;
  Server_CB.Checked:=INI.ReadBool('Settings', 'Server', False);
  updateCB.Checked:=INI.ReadBool('Settings', 'C4U', False);
  logCB.Checked:=INI.ReadBool('Settings', 'Logging', False);
  clearCB.Checked:=INI.ReadBool('Settings', 'Clear', False);
  atom_CB.Checked:=INI.ReadBool('Settings', 'Sync', False);
  volfade_CB.Checked:=INI.ReadBool('Volume', 'Fade', False);
  volfade_E.Value:=INI.ReadInteger('Volume', 'FadeDur', 256);
  rvol:=INI.ReadInteger('Volume', 'Right', 65535);
  lvol:=INI.ReadInteger('Volume', 'Left', 65535);
  if (INI.ReadBool('Volume', 'WasFaded', False)) and (auto2.Checked)
    and (volfade_CB.Checked) then begin
    if not MidiMixer1.Active then MidiMixer1.Active:=True;
    with MidiMixer1 do begin
      values [mcLeft] := lvol;
      values [mcRight] := rvol;
      ControlValues [mtAudioVolume] := values;
    end;
    INI.WriteBool('Volume', 'WasFaded', False);
  end;
  if verbose then VLog('Load: Common');
end;

procedure TShutdown.UserSave;
begin
  INI.WriteBool('UserSpecific', 'Enabled', UserCB.Checked);
  INI.WriteString('UserSpecific', 'User', GetUserFromWindows);
  FromTime.Date:=Date;
  ToTime.Date:=Date;
  INI.WriteDateTime('UserSpecific', 'From', FromTime.DateTime);
  INI.WriteDateTime('UserSpecific', 'To', ToTime.DateTime);
  if verbose then VLog('Save: User specific');
end;

procedure TShutdown.UserOpen;
begin
  UserCB.Checked:=INI.ReadBool('UserSpecific', 'Enabled', False);
  FromTime.DateTime:=INI.ReadDateTime('UserSpecific', 'From', 0);
  ToTime.DateTime:=INI.ReadDateTime('UserSpecific', 'To', 0);
  FromTime.Date:=Date;
  ToTime.Date:=Date;
  if verbose then VLog('Load: User specific');
end;

procedure TShutdown.HotKeySave;
begin
  INI.WriteInteger('Hotkeys', 'POff', HotKeyPOff.HotKey);
  INI.WriteInteger('Hotkeys', 'SD', HotKeySD.HotKey);
  INI.WriteInteger('Hotkeys', 'ReB', HotKeyReB.HotKey);
  INI.WriteInteger('Hotkeys', 'LO', HotKeyLO.HotKey);
  INI.WriteInteger('Hotkeys', 'Sus', HotKeySus.HotKey);
  INI.WriteInteger('Hotkeys', 'Hib', HotKeyHib.HotKey);
  INI.WriteInteger('Hotkeys', 'LWS', HotKeyLWS.HotKey);
  INI.WriteInteger('Hotkeys', 'SS', HotKeySS.HotKey);
  INI.WriteInteger('Hotkeys', 'AA', HotKeyAA.HotKey);
  INI.WriteInteger('Hotkeys', 'CDE', HotKey1.HotKey);
  INI.WriteInteger('Hotkeys', 'CDC', HotKey2.HotKey);
  INI.WriteInteger('Hotkeys', 'CRB', HotKey3.HotKey);
  INI.WriteInteger('Hotkeys', 'CCB', HotKey4.HotKey);
  INI.WriteInteger('Hotkeys', 'mon0', hkmon0.HotKey);
  INI.WriteInteger('Hotkeys', 'mon1', hkmon1.HotKey);
  INI.WriteInteger('Hotkeys', 'ctif', hkctif.HotKey);
  if verbose then VLog('Save: HotKeys');
end;

procedure TShutdown.HotKeyOpen;
begin
//to THotKey
  HotKeyPOff.HotKey:=INI.ReadInteger('Hotkeys', 'POff', 0);
  HotKeySD.HotKey:=INI.ReadInteger('Hotkeys', 'SD', 0);
  HotKeyReB.HotKey:=INI.ReadInteger('Hotkeys', 'ReB', 0);
  HotKeyLO.HotKey:=INI.ReadInteger('Hotkeys', 'LO', 0);
  HotKeySus.HotKey:=INI.ReadInteger('Hotkeys', 'Sus', 0);
  HotKeyHib.HotKey:=INI.ReadInteger('Hotkeys', 'Hib', 0);
  HotKeyLWS.HotKey:=INI.ReadInteger('Hotkeys', 'LWS', 0);
  HotKeySS.HotKey:=INI.ReadInteger('Hotkeys', 'SS', 0);
  HotKeyAA.HotKey:=INI.ReadInteger('Hotkeys', 'AA', 0);
  HotKey1.HotKey:=INI.ReadInteger('Hotkeys', 'CDE', 0);
  HotKey2.HotKey:=INI.ReadInteger('Hotkeys', 'CDC', 0);
  HotKey3.HotKey:=INI.ReadInteger('Hotkeys', 'CRB', 0);
  HotKey4.HotKey:=INI.ReadInteger('Hotkeys', 'CCB', 0);
  hkmon0.HotKey:=INI.ReadInteger('Hotkeys', 'mon0', 0);
  hkmon1.HotKey:=INI.ReadInteger('Hotkeys', 'mon1', 0);
  hkctif.HotKey:=INI.ReadInteger('Hotkeys', 'ctif', 0);
//to TLMDGlobalHotKey
  GHPO.HotKey:=HotKeyPOff.HotKey;
  GHSD.HotKey:=HotKeySD.HotKey;
  GHRB.HotKey:=HotKeyReB.HotKey;
  GHLO.HotKey:=HotKeyLO.HotKey;
  GHSus.HotKey:=HotKeySus.HotKey;
  GHH.HotKey:=HotKeyHib.HotKey;
  GHLWS.HotKey:=HotKeyLWS.HotKey;
  GHSS.HotKey:=HotKeySS.HotKey;
  GHAA.HotKey:=HotKeyAA.HotKey;
  LMDGlobalHotKey1.HotKey:=HotKey1.HotKey;
  LMDGlobalHotKey2.HotKey:=HotKey2.HotKey;
  LMDGlobalHotKey3.HotKey:=HotKey3.HotKey;
  LMDGlobalHotKey4.HotKey:=HotKey4.HotKey;
  mon0hk.HotKey:=hkmon0.HotKey;
  mon1hk.HotKey:=hkmon1.HotKey;
  ctifhk.HotKey:=hkctif.HotKey;
  if verbose then VLog('Load: HotKeys');
end;

procedure TShutdown.WaveSave;
begin
  INI.WriteString('AutoAlarm', 'Path', wavE.Text);
  INI.WriteInteger('AutoAlarm', 'Loop', wavSE.Value);
  INI.WriteBool('AutoAlarm', 'Voice', annCB.Checked);
  INI.WriteInteger('AutoAlarm', 'VoicePack', ann_CB.ItemIndex);
  if verbose then VLog('Save: Wave');
end;

procedure TShutdown.WaveOpen;
var sr: TSearchRec;
begin
  wavE.Text:=INI.ReadString('AutoAlarm', 'Path', '');
  wavSE.Value:=INI.ReadInteger('AutoAlarm', 'Loop', 1);
  annCB.Checked:=INI.ReadBool('AutoAlarm', 'Voice', False);
  if (FindFirst(ExtractFilePath(Application.ExeName)+
    'Sounds\*.*', faDirectory, sr) = 0) then begin
    repeat
      if (sr.Name <> '.') and (sr.Name <> '..') then
        ann_CB.Items.Add(sr.Name);
    until (FindNext(sr)<>0);
    FindClose(sr);
  end;
  ann_CB.ItemIndex:=INI.ReadInteger('AutoAlarm', 'VoicePack', 0);
  if verbose then VLog('Load: Wave');
end;

procedure TShutdown.Set1Save;
begin
  if auto2.Checked then begin
    AutoToReg;
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  if auto.Checked then begin
    AutoToReg;
    INI.WriteBool('AutoCountShutdown', 'Enabled', False);
    INI.WriteBool('AutoShutdown', 'Enabled', True);
    INI.WriteBool('AutoPingShutdown', 'Enabled', False);
    INI.WriteBool('AutoCPUShutdown', 'Enabled', False);
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  Idopont.Date:=Calendar.Date;
  INI.WriteDateTime('AutoShutdown', 'Time', Idopont.DateTime);
  HotKeySave;
  ComSave;
  UserSave;
  WaveSave;
  if verbose then VLog('Save: Exact time');
end;

procedure TShutdown.Set2Save;
begin
  if auto2.Checked then begin
    AutoToReg;
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  if auto.Checked then begin
    AutoToReg;
    INI.WriteBool('AutoShutdown', 'Enabled', False);
    INI.WriteBool('AutoCountShutdown', 'Enabled', True);
    INI.WriteBool('AutoPingShutdown', 'Enabled', False);
    INI.WriteBool('AutoCPUShutdown', 'Enabled', False);
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  INI.WriteInteger('AutoCountShutdown', 'Hour', CD1.Value);
  INI.WriteInteger('AutoCountShutdown', 'Minute', CD2.Value);
  INI.WriteInteger('AutoCountShutdown', 'Second', CD3.Value);
  HotKeySave;
  ComSave;
  UserSave;
  WaveSave;
  if verbose then VLog('Save: Countdown');
end;

procedure TShutdown.Set3Save;
begin
  if auto2.Checked then begin
    AutoToReg;
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  if auto.Checked then begin
    AutoToReg;
    INI.WriteBool('AutoShutdown', 'Enabled', False);
    INI.WriteBool('AutoCountShutdown', 'Enabled', False);
    INI.WriteBool('AutoPingShutdown', 'Enabled', True);
    INI.WriteBool('AutoCPUShutdown', 'Enabled', False);
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  INI.WriteInteger('AutoPingShutdown', 'Minute', PingTime.Value);
  INI.WriteString('AutoPingShutdown', 'Path', eleres.Text);
  HotKeySave;
  ComSave;
  UserSave;
  WaveSave;
  if verbose then VLog('Save: File');
end;

procedure TShutdown.Set4Save;
begin
  if auto2.Checked then begin
    AutoToReg;
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  if auto.Checked then begin
    AutoToReg;
    INI.WriteBool('AutoShutdown', 'Enabled', False);
    INI.WriteBool('AutoCountShutdown', 'Enabled', False);
    INI.WriteBool('AutoPingShutdown', 'Enabled', False);
    INI.WriteBool('AutoCPUShutdown', 'Enabled', True);
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;

  INI.WriteInteger('AutoCPUShutdown', 'Usage', CPU_SE.Value);
  INI.WriteInteger('AutoCPUShutdown', 'Minute', CPUMin_SE.Value);
  INI.WriteBool('AutoCPUShutdown', 'Input', Hook_CB.Checked);

  HotKeySave;
  ComSave;
  UserSave;
  WaveSave;

  if verbose then VLog('Save: CPU usage');
end;

procedure TShutdown.Piszka;
begin
  INI.WriteBool('AutoShutdown', 'Enabled', False);
  INI.WriteBool('AutoCountShutdown', 'Enabled', False);
  INI.WriteBool('AutoPingShutdown', 'Enabled', False);
  INI.WriteBool('AutoCPUShutdown', 'Enabled', False);
  if verbose then VLog('Someone screwed up the settings INI file');
end;

procedure TShutdown.NapOpen;
var aus,aucs,aups,aucpus: boolean;
    f: TextFile;
    fi: String;
label ready;
begin
  aus:=INI.ReadBool('AutoShutdown', 'Enabled', False);
  aucs:=INI.ReadBool('AutoCountShutdown', 'Enabled', False);
  aups:=INI.ReadBool('AutoPingShutdown', 'Enabled', False);
  aucpus:=INI.ReadBool('AutoCPUShutdown', 'Enabled', False);
  if aus xor aucs xor aups xor aucpus then else Piszka;

  if INI.ReadBool('AutoStart', 'Enabled', False) then begin
    auto2.Checked:=True;
    auto2Click(self);
    AutoToReg;
  end;

//User-specific thing begin
  if auto2.Checked then begin
    if UserCB.Checked then begin
      if GetUserFromWindows = INI.ReadString('UserSpecific', 'User', '') then
      begin
        if FromTime.DateTime<ToTime.DateTime then begin
          if ToTime.DateTime>=Now then begin
            Start.Execute;
          end;
        end;
      end;
    end;
  end;
//User-specific thing end

  Idopont.DateTime:=INI.ReadDateTime('AutoShutdown', 'Time', GetTime);
  Calendar.Date:=INI.ReadDateTime('AutoShutdown', 'Time', Date);
  CD1.Value:=INI.ReadInteger('AutoCountShutdown', 'Hour', 0);
  CD2.Value:=INI.ReadInteger('AutoCountShutdown', 'Minute', 30);
  CD3.Value:=INI.ReadInteger('AutoCountShutdown', 'Second', 0);
  eleres.Text:=INI.ReadString('AutoPingShutdown', 'Path', '');
  if INI.ReadBool('AutoShutdown', 'Enabled', False) then begin
    auto.Checked:=True;
    if Calendar.Date<Date then Calendar.Date:=Date;
    Set1Auto;
    AutoToReg;
    goto ready;
  end;
  if INI.ReadBool('AutoCountShutdown', 'Enabled', False) then begin
    auto.Checked:=True;
    if Calendar.Date<Date then Calendar.Date:=Date;
    Set2Auto;
    AutoToReg;
    goto ready;
  end;
  if INI.ReadBool('AutoPingShutdown', 'Enabled', False) then begin
    auto.Checked:=True;
    if Calendar.Date<Date then Calendar.Date:=Date;
    Set3Auto;
    AutoToReg;
    goto ready;
  end;
  if INI.ReadBool('AutoCPUShutdown', 'Enabled', False) then begin
    auto.Checked:=True;
    if Calendar.Date<Date then Calendar.Date:=Date;
    Set4Auto;
    AutoToReg;
    goto ready;
  end;
  Ready:

  AssignFile(f, ExtractFilePath(Application.EXEName) + 'atom.txt');
  fi:=ExtractFilePath(Application.EXEName) + 'atom.txt';
  if not FileExists(fi) then begin
    ReWrite(f);
    CloseFile(f);
  end;
//f.Free;
//fi.Free;
  atom_servers.Items.LoadFromFile(ExtractFilePath(Application.EXEName) +
    'atom.txt');
  if atom_servers.Count=0 then
    atom_servers.Items.Add('time.nist.gov');
end;

procedure TShutdown.NapCheck;
begin
  if atom_CB.Checked then
    atom_do.Click;
  if ontopCB.Checked then
    ontopCBClick(self);
  if minimCB.Checked then
    MinimizeToTray;
  if hideCB.Checked then
    FullHide;
  if not (minimCB.Checked) and not (hideCB.Checked) then begin
    try
      Shutdown.Visible:=True;
    except end;
  end;
  if server_CB.Checked then
    ServerSocket1.Active := True;
  if updateCB.Checked then
    Button1.Click;
end;

procedure TShutdown.Set2Click(Sender: TObject);
begin
  done:=False;
  shutted:=False;
  Set2Auto;
  Set2Save;
  if verbose then VLog('Click: Countdown');
end;

procedure TShutdown.Timer1Timer(Sender: TObject);
begin
  Start.Execute;
  if verbose then VLog('Countdown is over');
end;

procedure TShutdown.Set1Click(Sender: TObject);
begin
  done:=False;
  shutted:=False;
  if Calendar.Date<Date then begin
    ShowMessage(lini.ReadString(langCB.Text,
      'BDate', 'The given date/time is before today, please correct it!'))
  end else
  if (Int(Calendar.Date)=Int(Date)) and (Frac(Idopont.Time)>GetTime) then begin
      Set1Auto;
      Set1Save; //does Idopont.Date:=Calendar.Date;
      TrayIcon.Hint:=defcommand.Text+' '
        +lini.ReadString(langCB.Text, 'SysTray1_1', 'at')+' '
        +DateTimeToStr(Idopont.DateTime)
        +lini.ReadString(langCB.Text, 'SysTray1_2', '');
  end else
  if Int(Calendar.Date)>Int(Date) then begin
    Set1Auto;
    Set1Save; //does Idopont.Date:=Calendar.Date;
      TrayIcon.Hint:=defcommand.Text+' '
        +lini.ReadString(langCB.Text, 'SysTray1_1', 'at')+' '
        +DateTimeToStr(Idopont.DateTime)
        +lini.ReadString(langCB.Text, 'SysTray1_2', '');
  end else begin
    ShowMessage(lini.ReadString(langCB.Text,
      'BDate', 'The given date/time is before today, please correct it!'))
  end;
  if verbose then VLog('Click: Exact time');
end;

procedure TShutdown.Timer2Timer(Sender: TObject);
begin
  countd := Tcountd.Create(Application);
  Most.UserValue:=Most.UserValue+1;
  if annCB.Checked then begin
    case Most.MaxValue-Most.UserValue of
      10: begin
            countd.ShowModal;
            countd.countd_label.Caption:='10';
  //          PlaySound(PChar(ExtractFilePath(Application.ExeName)+
    //          'Sounds\'+ann_CB.Text+'\Ten.wav'), 0, SND_PURGE);
          end;
      9: begin
           countd.countd_label.Caption:='9';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+
             'Sounds\'+ann_CB.Text+'\Nine.wav'), 0, SND_PURGE);
         end;
      8: begin
           countd.countd_label.Caption:='8';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+
             'Sounds\'+ann_CB.Text+'\Eight.wav'), 0, SND_PURGE);
         end;
      7: begin
           countd.countd_label.Caption:='7';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+
             'Sounds\'+ann_CB.Text+'\Seven.wav'), 0, SND_PURGE);
         end;
      6: begin
           countd.countd_label.Caption:='6';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+
             'Sounds\'+ann_CB.Text+'\Six.wav'), 0, SND_PURGE);
         end;
      5: begin
           countd.countd_label.Caption:='5';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+
             'Sounds\'+ann_CB.Text+'\Five.wav'), 0, SND_PURGE);
         end;
      4: begin
           countd.countd_label.Caption:='4';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+
             'Sounds\'+ann_CB.Text+'\Four.wav'), 0, SND_PURGE);
         end;
      3: begin
           countd.countd_label.Caption:='3';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+
             'Sounds\'+ann_CB.Text+'\Three.wav'), 0, SND_PURGE);
         end;
      2: begin
           countd.countd_label.Caption:='2';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+
             'Sounds\'+ann_CB.Text+'\Two.wav'), 0, SND_PURGE);
         end;
      1: begin
           countd.countd_label.Caption:='1';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+
             'Sounds\'+ann_CB.Text+'\One.wav'), 0, SND_PURGE);
           countd.Release;
           countd.countd_label.Caption:='10';
         end;
    end;
  end;
end;

procedure TShutdown.RxDice1Click(Sender: TObject);
begin
  RxDice1.Rotate:=not RxDice1.Rotate;
  if verbose then VLog('Dice: Switched rotation');
end;

procedure TShutdown.TrayIconClick(Sender: TObject);
begin
  Application.BringToFront;
  if verbose then VLog('Tray icon: Click');
end;

procedure TShutdown.TrayIconDblClick(Sender: TObject);
begin
  Shutdown.Perform(wm_SysCommand,SC_RESTORE,0);
  if verbose then VLog('Tray icon: Double click');
end;

procedure TShutdown.N15percmlva1Click(Sender: TObject);
begin
  CD1.Value:=0;
  CD2.Value:=15;
  CD3.Value:=0;
  Set2Auto;
  if verbose then VLog('Countdown: 15 minutes');
end;

procedure TShutdown.N30percmlva1Click(Sender: TObject);
begin
  CD1.Value:=0;
  CD2.Value:=30;
  CD3.Value:=0;
  Set2Auto;
  if verbose then VLog('Countdown: 30 minutes');
end;

procedure TShutdown.N60percmlva1Click(Sender: TObject);
begin
  CD1.Value:=1;
  CD2.Value:=0;
  CD3.Value:=0;
  Set2Auto;
  if verbose then VLog('Countdown: 60 minutes');
end;

procedure TShutdown.N120percmlva1Click(Sender: TObject);
begin
  CD1.Value:=2;
  CD2.Value:=0;
  CD3.Value:=0;
  Set2Auto;
  if verbose then VLog('Countdown: 120 minutes');
end;

procedure TShutdown.Mgsem1Click(Sender: TObject);
begin
  EnMax;
  Start.AutoStart:=False;
  Timer1.Enabled:=False;
  Timer2.Enabled:=False;
  Most.UserValue:=0;
  TrayIcon.Hint:='Shutdown Monster';
  if verbose then VLog('Shutdown: Cancelled');
end;

procedure TShutdown.autoClick(Sender: TObject);
begin
  auto2.Checked:=auto.Checked;
end;

procedure TShutdown.Save1Click(Sender: TObject);
begin
  Set1Save;
end;

procedure TShutdown.Save2Click(Sender: TObject);
begin
  Set2Save;
end;

procedure TShutdown.Timer3Timer(Sender: TObject);
label t3r;
begin
// T3i --> seconds
// T3i:=time remaining until next Timer1Timer
  T3i:=Round((Timer1.Interval-(GetTickCount-dwStart))/1000);
  if T3i > 3600 then begin
    TrayIcon.Hint:=IntToStr(Round(T3i/3600))+' '+
    lini.ReadString(langCB.Text, 'Hrem', 'hours left');
    goto t3r;
  end;

  if T3i = 3600 then begin
    TrayIcon.Hint:=lini.ReadString(langCB.Text, '1Hrem', '1 hour left');
    goto t3r;
  end;

  if T3i > 60 then begin
    TrayIcon.Hint:=IntToStr(Round(T3i/60))+' '+
    lini.ReadString(langCB.Text, 'Mrem', 'minutes left');
    goto t3r;
  end;

  if T3i = 60 then begin
    TrayIcon.Hint:=lini.ReadString(langCB.Text, '1Mrem', '1 minute left');
    goto t3r;
  end;

  if T3i = 1 then begin
    TrayIcon.Hint:=lini.ReadString(langCB.Text, '1Srem', '1 second left');
    goto t3r;
  end;

  if T3i < 60 then begin
    TrayIcon.Hint:=IntToStr(Round(T3i))+' '+
    lini.ReadString(langCB.Text, 'Srem', 'seconds left');
    goto t3r;
  end;

  t3r:

end;

procedure TShutdown.Set3Click(Sender: TObject);
begin
  done:=False;
  shutted:=False;
  PingTimerTimer(Self);
  Set3Auto;
  Set3Save;
  TrayIcon.Hint:=defcommand.Text+', '
    +lini.ReadString(langCB.Text, 'SysTray3_1', 'if the file')
    +' "'+eleres.Text+'" '
    +lini.ReadString(langCB.Text, 'SysTray3_2', 'disappears');
  if verbose then VLog('Click: File');
end;

procedure TShutdown.Save3Click(Sender: TObject);
begin
  Set3Save;
end;

procedure TShutdown.PingTimerTimer(Sender: TObject);
begin
  if verbose then VLog('File: Checking...');
  if FileExists(eleres.Text) = False then begin
    DoExec;
    if verbose then VLog('File: File not found');
  end;
  if verbose then VLog('File: File found');
end;

procedure TShutdown.logoClick(Sender: TObject);
begin
  about := Tabout.Create(Application);
  about.ShowModal;
  about.Release;
end;

procedure TShutdown.PowerOffClick(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
  if force.Checked then
    MyExitWindows(EWX_POWEROFF or EWX_FORCE)
  else
    MyExitWindows(EWX_POWEROFF);
  if verbose then VLog('Shutdown: Power off');
end;

procedure TShutdown.ReBootClick(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
  if force.Checked then
    MyExitWindows(EWX_REBOOT or EWX_FORCE)
  else
    MyExitWindows(EWX_REBOOT);
  if verbose then VLog('Shutdown: Reboot');
end;

procedure TShutdown.LogOffClick(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
  if force.Checked then
    MyExitWindows(EWX_LOGOFF or EWX_FORCE)
  else
    MyExitWindows(EWX_LOGOFF);
  if verbose then VLog('Shutdown: Log off');
end;

procedure TShutdown.ShutDown_BClick(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
  if force.Checked then
    MyExitWindows(EWX_SHUTDOWN or EWX_FORCE)
  else
    MyExitWindows(EWX_SHUTDOWN);
  if verbose then VLog('Shutdown: Shut down');
end;

procedure TShutdown.HibernateClick(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
  SetSuspendState(True,force.Checked,wake_CB.Checked);
  if verbose then VLog('Shutdown: Hibernate');
end;

procedure TShutdown.HotKeyPOffChange(Sender: TObject);
begin
  Most1.ShortCut:=HotKeyPOff.HotKey;
  GHPO.HotKey:=HotKeyPOff.HotKey;
end;

procedure TShutdown.HotKeySDChange(Sender: TObject);
begin
  GHSD.HotKey:=HotKeySD.HotKey;
end;

procedure TShutdown.HotKeyReBChange(Sender: TObject);
begin
  jraindts1.ShortCut:=HotKeyReB.HotKey;
  GHRB.HotKey:=HotKeyReB.HotKey;
end;

procedure TShutdown.HotKeyLOChange(Sender: TObject);
begin
  kijelentkezs1.ShortCut:=HotKeyLO.HotKey;
  GHLO.HotKey:=HotKeyLO.HotKey;
end;

procedure TShutdown.HotKeyHibChange(Sender: TObject);
begin
  GHH.HotKey:=HotKeyHib.HotKey;
end;

procedure TShutdown.SaveHKClick(Sender: TObject);  //this saves all the things
begin
  if auto2.Checked then begin
    AutoToReg;
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  ComSave;
  UserSave;
  HotKeySave;
  WaveSave;
  Set4Save;
  Set3Save;
  Set2Save;
  Set1Save;
  if verbose then VLog('Save: Everything');
end;

procedure TShutdown.LockWSClick(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
  WinExec('rundll32.exe user32.dll,LockWorkStation', SW_SHOWNORMAL);
  if verbose then VLog('Shutdown: Lock workstation');
end;

procedure TShutdown.HotKeyLWSChange(Sender: TObject);
begin
  Munkallomszrolsa1.ShortCut:=HotKeyLWS.HotKey;
  GHLWS.HotKey:=HotKeyLWS.HotKey;
end;

procedure TShutdown.SDMenuClick(Sender: TObject);
var
  shell: Variant;
begin
  if not done then DoLog(WhatAmI(Sender));
  shell := CreateOleObject('Shell.Application');
  shell.ShutdownWindows;
  if verbose then VLog('Shutdown: Shutdown menu');
end;

procedure TShutdown.FormCreate(Sender: TObject);
var sr: TSearchRec;
begin
  lini := TINIFile.Create(ExtractFilePath(Application.EXEName)+'Languages.ini');
  cini := TINIFile.Create(ExtractFilePath(Application.EXEName)+'Shutd.ini');
  INI := TINIFile.Create(ExtractFilePath(Application.EXEName)
    + cini.ReadString('Settings', 'INI', 'Settings.ini'));

  if (FindFirst(ExtractFilePath(Application.EXEName)+'*.sml', faAnyFile, sr)=0)
  then begin
    repeat
      if (sr.Name <> '.') and (sr.Name <> '..') then begin
        sr.Name:=StringReplace(sr.Name, '.sml', '', [rfReplaceAll]);
        langCB.Items.Add(sr.Name);
      end;
    until (FindNext(sr)<>0);
    FindClose(sr);
  end;

  if (FindFirst(ExtractFilePath(Application.EXEName)+'*.ini', faAnyFile, sr)=0)
  then begin
    repeat
      if (sr.Name <> '.') and (sr.Name <> '..')
        and (sr.Name <> 'Languages.ini') and (sr.Name <> 'Shutd.ini') then begin
        sr.Name:=StringReplace(sr.Name, '.ini', '', [rfReplaceAll]);
        confCB.Items.Add(sr.Name);
      end;
    until (FindNext(sr)<>0);
    FindClose(sr);
  end;

end;

procedure TShutdown.SSOnClick(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
  TurnScreenSaverOn;
  if verbose then VLog('Shutdown: Start screensaver');
end;

procedure TShutdown.HotKeySSChange(Sender: TObject);
begin
  Kpernyvd1.ShortCut:=HotKeySS.HotKey;
  GHSS.HotKey:=HotKeySS.HotKey;
end;

procedure TShutdown.GHSSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  SSOn.Click;
end;

procedure TShutdown.GHPOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Most1.Click;
end;

procedure TShutdown.GHSDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ShutDown_B.Click;
end;

procedure TShutdown.GHRBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  ReBoot.Click;
end;

procedure TShutdown.GHLWSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  LockWS.Click;
end;

procedure TShutdown.GHHKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Hibernate.Click;
end;

procedure TShutdown.GHLOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  LogOff.Click;
end;

procedure TShutdown.StartAfterStart(Sender: TObject);
begin
  DoExec;
end;

procedure TShutdown.BitBtn1Click(Sender: TObject);
var I: integer;
begin
  if not done then DoLog(WhatAmI(Sender));
  for I := 1 to wavSE.Value do
    PlaySound(PChar(wavE.Text), 0, SND_NODEFAULT);
  if verbose then VLog('Shutdown: Alarm');
end;

procedure TShutdown.auto2Click(Sender: TObject);
begin
  if auto2.Checked=False then begin
    auto.Checked:=False;
    UserSpecific.Enabled:=False;
    DelReg;
  end else begin
    AutoToReg;
    UserSpecific.Enabled:=True;
  end;
end;

procedure TShutdown.HotKeyAAChange(Sender: TObject);
begin
  GHAA.HotKey:=HotKeyAA.HotKey;
end;

procedure TShutdown.GHAAKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  BitBtn1.Click;
end;

procedure TShutdown.SpeedButton1Click(Sender: TObject);
begin
  if not force.Checked then force.Checked:=shutted;
  DoExec;
  if verbose then VLog('Shutdown: Emergency shutdown');
end;

procedure TShutdown.ejectClick(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
  mcisendstring('Set cdaudio door open wait',nil,0,handle);
  if verbose then VLog('Shutdown: Eject disc');
end;

procedure TShutdown.closeClick(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
  mcisendstring('Set cdaudio door closed wait',nil,0,handle);
  if verbose then VLog('Shutdown: Close tray');
end;

procedure TShutdown.recbinClick(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
 SHEmptyRecycleBin(self.handle,'',
     SHERB_NOCONFIRMATION) ;
  if verbose then VLog('Shutdown: Clear recycle bin');
end;

procedure TShutdown.clipbClick(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
  Clipboard.Clear;
  if verbose then VLog('Shutdown: Clear clipboard');
end;

procedure TShutdown.LMDGlobalHotKey1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  eject.Click;
end;

procedure TShutdown.LMDGlobalHotKey2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  close.Click;
end;

procedure TShutdown.LMDGlobalHotKey4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  recbin.Click;
end;

procedure TShutdown.LMDGlobalHotKey3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  clipb.Click;
end;

procedure TShutdown.HotKey1Change(Sender: TObject);
begin
  LMDGlobalHotKey1.HotKey:=HotKey1.HotKey;
end;

procedure TShutdown.HotKey2Change(Sender: TObject);
begin
  LMDGlobalHotKey2.HotKey:=HotKey2.HotKey;
end;

procedure TShutdown.HotKey3Change(Sender: TObject);
begin
  LMDGlobalHotKey3.HotKey:=HotKey3.HotKey;
end;

procedure TShutdown.HotKey4Change(Sender: TObject);
begin
  LMDGlobalHotKey4.HotKey:=HotKey4.HotKey;
end;

procedure TShutdown.Kilps1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TShutdown.mon0Click(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
  SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
  if verbose then VLog('Shutdown: Turn monitor off');
end;

procedure TShutdown.mon1Click(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
  SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, - 1);
  if verbose then VLog('Shutdown: Turn monitor on');
end;

procedure TShutdown.mon1hkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  mon1.Click;
end;

procedure TShutdown.mon0hkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  mon0.Click;
end;

procedure TShutdown.hkmon0Change(Sender: TObject);
begin
  mon0hk.HotKey:=hkmon0.HotKey;
end;

procedure TShutdown.hkmon1Change(Sender: TObject);
begin
  mon1hk.HotKey:=hkmon1.HotKey;
end;

procedure TShutdown.hkctifChange(Sender: TObject);
begin
  ctifhk.Hotkey:=hkctif.HotKey;
end;

procedure TShutdown.ctifhkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  BitBtn2.Click;
end;

procedure TUpdateThread.Execute;
begin
  Shutdown.DoDownload;
end;

procedure TShutdown.Button1Click(Sender: TObject);
begin
  UpThread:=TUpdateThread.Create(True);
  UpThread.Priority:=tpLower;
  UpThread.Resume;
end;

procedure TAtomThread.Execute;
begin
  Shutdown.Atomic_Clock;
end;

procedure TShutdown.atom_doClick(Sender: TObject);
begin
  AtomThread:=TAtomThread.Create(True);
  AtomThread.Priority:=tpLower;
  AtomThread.Resume;
end;

procedure TShutdown.atom_addButtonClick(Sender: TObject);
begin
  atom_servers.AddItem(atom_add.Text, nil);
  atom_servers.Items.SaveToFile(ExtractFilePath(Application.EXEName) +
    'atom.txt');
  if verbose then VLog('Atomic clock: Added new server');
end;

procedure TShutdown.Delet1Click(Sender: TObject);
begin
  atom_servers.DeleteSelected;
  atom_servers.Items.SaveToFile(ExtractFilePath(Application.EXEName) +
    'atom.txt');
  if verbose then VLog('Atomic clock: Server removed');
end;

procedure TShutdown.BitBtn2Click(Sender: TObject);
var
  lpEntryInfo: PInternetCacheEntryInfo;
  hCacheDir: LongWord;
  dwEntrySize: LongWord;
begin
  if not done then DoLog(WhatAmI(Sender));
  dwEntrySize := 0;
  FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), dwEntrySize);
  GetMem(lpEntryInfo, dwEntrySize);
  if dwEntrySize > 0 then lpEntryInfo^.dwStructSize := dwEntrySize;
  hCacheDir := FindFirstUrlCacheEntry(nil, lpEntryInfo^, dwEntrySize);
  if hCacheDir <> 0 then
  begin
    repeat
      DeleteUrlCacheEntry(lpEntryInfo^.lpszSourceUrlName);
      FreeMem(lpEntryInfo, dwEntrySize);
      dwEntrySize := 0;
      FindNextUrlCacheEntry(hCacheDir,
        TInternetCacheEntryInfo(nil^), dwEntrySize);
      GetMem(lpEntryInfo, dwEntrySize);
      if dwEntrySize > 0 then lpEntryInfo^.dwStructSize := dwEntrySize;
    until not FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize);
  end;
  FreeMem(lpEntryInfo, dwEntrySize);
  FindCloseUrlCache(hCacheDir);
  if verbose then VLog('Shutdown: Clear temporary internet files');
end;

procedure TShutdown.ParamOpener1ParamOpen(Sender: TObject);
label canexit;
begin

  if (Copy(FinalParam,0,1)='-') or
     (Copy(FinalParam,0,1)='/')
     then begin
    FinalParam:=Copy(FinalParam,2,Length(FinalParam));
  end;
  if (Copy(FinalParam,0,2)='--')
     then begin
    FinalParam:=Copy(FinalParam,3,Length(FinalParam));
  end;

  if FinalParam='def' then begin Start.Execute; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='p' then begin PowerOff.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='s' then begin ShutDown_B.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='r' then begin ReBoot.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='l' then begin LogOff.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='standby' then begin Suspend.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='h' then begin Hibernate.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='lock' then begin LockWS.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='scr' then begin SSOn.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='alarm' then begin BitBtn1.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='menu' then begin SDMenu.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='cd0' then begin eject.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='cd1' then begin close.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='recbin' then begin recbin.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='clipb' then begin clipb.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='mon0' then begin mon0.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='mon1' then begin mon1.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='temp' then begin BitBtn2.Click; Application.Terminate;
  goto CanExit;   end else
  if FinalParam='v' then begin verbose:=True; VLog('Parameter: '+FinalParam);
  goto CanExit;   end else
   CanExit:

end;

procedure TShutdown.ontopCBClick(Sender: TObject);
begin
  if ontopCB.Checked then begin
    FormStyle := fsStayOnTop;
  end else begin
    FormStyle := fsNormal;
  end
end;

procedure TShutdown.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Save4_2.Click;  //saves everything
  INI.WriteInteger('Placement', 'Left', Shutdown.Left);
  INI.WriteInteger('Placement', 'Top', Shutdown.Top);
 if FHookStarted then
    UnhookWindowsHookEx(JHook);
  if ServerSocket1.Active then ServerSocket1.Close;
  if verbose then VLog('CLOSING...');
end;

procedure TShutdown.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  parancs: integer;
  recv, cmd: string;
  ParancsDo: TObject;
begin
  recv:=socket.ReceiveText;
  cmd:=StringReplace(Trim(recv), ' ', #13#10, [rfReplaceAll]);
  cmd:=StringReplace(cmd, '\RS/', ' ', [rfReplaceAll]);
  parancs := StrToIntDef(cmd, 99);
  Memo1.Lines.Add(cmd);
  if verbose then VLog('Client/Server: '+cmd+' ('+IntToStr(parancs)+')');
//BUTTONPRESS BEGIN
  if parancs <> 99 then begin
    ParancsDo:=Save4_2;
    case parancs of
       0: ParancsDo:=PowerOff;
       1: ParancsDo:=ShutDown;
       2: ParancsDo:=ReBoot;
       3: ParancsDo:=LogOff;
       4: ParancsDo:=Suspend;
       5: ParancsDo:=Hibernate;
       6: ParancsDo:=LockWS;
       7: ParancsDo:=SSOn;
       8: ParancsDo:=BitBtn1;
       9: ParancsDo:=eject;
      10: ParancsDo:=close;
      11: ParancsDo:=recbin;
      12: ParancsDo:=clipb;
      13: ParancsDo:=mon0;
      14: ParancsDo:=mon1;
      15: ParancsDo:=BitBtn2;
      16: ParancsDo:=SDMenu;
      17: ParancsDo:=SpeedButton1;
    end;
    try (ParancsDo as TButton).Click; except end;
    socket.SendText(WhatAmI(ParancsDo) + ' ' + lini.ReadString(langCB.Text,
      'Done', 'done'));
    Memo1.Clear;
  end;
//BUTTONPRESS END
  if pos('START_1',Memo1.Lines.Text)>0 then Active1:=True;
  if pos('START_2',Memo1.Lines.Text)>0 then Active2:=True;
  if pos('START_3',Memo1.Lines.Text)>0 then Active3:=True;
  if Active1 or Active2 or Active3 then Memo2.Lines.Add(cmd);
  if pos('STOP_1',Memo2.Lines.Text)>0 then begin
    Calendar.Date:=StrToDate(Memo2.Lines[1]);
    Idopont.Time:=StrToTime(Memo2.Lines[2]);
    Set1.Click;
    Memo1.Clear;
    Memo2.Clear;
    Active1:=False;
    socket.SendText(lini.ReadString(langCB.Text, 'Set_Done', 'Settings done'));
  end else
  if pos('STOP_2',Memo2.Lines.Text)>0 then begin
    CD1.Value:=StrToInt(Memo2.Lines[1]);
    CD2.Value:=StrToInt(Memo2.Lines[2]);
    CD3.Value:=StrToInt(Memo2.Lines[3]);
    Set2.Click;
    Memo1.Clear;
    Memo2.Clear;
    Active2:=False;
    socket.SendText(lini.ReadString(langCB.Text, 'Set_Done', 'Settings done'));
  end else
  if pos('STOP_3',Memo2.Lines.Text)>0 then begin
    eleres.Text:=Memo2.Lines[1];
    PingTime.Value:=StrToInt(Memo2.Lines[2]);
    Set3.Click;
    Memo1.Clear;
    Memo2.Clear;
    Active3:=False;
    socket.SendText(lini.ReadString(langCB.Text, 'Set_Done', 'Settings done'));
  end;
  if pos('CANCEL',Memo1.Lines.Text)>0 then begin
    Mgsem1.Click;
    socket.SendText(lini.ReadString(langCB.Text, 'Set_Canc', 'Cancelled'));
  end;
end;

procedure TShutdown.server_CBClick(Sender: TObject);
begin
  ServerSocket1.Active:=server_CB.Checked;
end;

procedure TShutdown.SuspendClick(Sender: TObject);
begin
  if not done then DoLog(WhatAmI(Sender));
  SetSuspendState(False,force.Checked,wake_CB.Checked);
  if verbose then VLog('Shutdown: Suspend');
end;

procedure TShutdown.GHSusKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Suspend.Click;
end;

procedure TShutdown.HotKeySusChange(Sender: TObject);
begin
  GHSus.HotKey:=HotKeySus.HotKey;
end;

procedure TShutdown.annCBClick(Sender: TObject);
begin
  if (ann_CB.Text <> '') or (ann_CB.ItemIndex <> -1) then
    WaveSave;
end;

procedure TShutdown.SureTimerTimer(Sender: TObject);
begin
  if shutted then SpeedButton1.Click;
  shutted:=False;
  done:=False;
  if verbose then VLog('Shutdown: S4S');
end;

procedure TShutdown.CPUTimer(Sender: TObject);
var i: integer;
begin
  usage:=0;
  CollectCPUData;
  for i:=0 to GetCPUCount-1 do
    usage:=usage+Round(GetCPUUsage(i)*100);
  usage:=Round(usage/GetCPUCount);
  CPU_L.Caption:=IntToStr(usage)+'%';
end;

procedure TShutdown.CPUCheckTimer(Sender: TObject);
begin
  if usage<CPU_SE.Value then begin
    if verbose then VLog('CPU usage: Usage is less than the given value');
    if Hook_CB.Checked then begin
      HookTimer.Enabled:=True;
    end;
    CPUOff.Enabled:=True
  end else begin
    HookTimer.Enabled:=False;
    CPUOff.Enabled:=False;
  end;
end;

procedure TShutdown.CPUOffTimer(Sender: TObject);
begin
  if (Hook_CB.Checked) and (HookNow) then begin
    if verbose then VLog('CPU usage: Executing default command');
    DoExec;
  end else
  if not (Hook_CB.Checked) then begin
    if verbose then VLog('CPU usage: Executing default command');
    DoExec;
  end;
  CPUOff.Enabled:=False;
end;

procedure TShutdown.Set4Click(Sender: TObject);
begin
  done:=False;
  shutted:=False;
  CPUOff.Interval:=CPUMin_SE.Value*60000;
  HookTimer.Interval:=CPUOff.Interval;
  Set4Auto;
  Set4Save;
  TrayIcon.Hint:=defcommand.Text+', '
    +lini.ReadString(langCB.Text, 'SysTray4_1', 'if CPU usage stays below')
    +' '+IntToStr(CPU_SE.Value)+'%'
    +lini.ReadString(langCB.Text, 'SysTray4_2', '');
  if verbose then VLog('Click: CPU usage');
end;

procedure TShutdown.Save4Click(Sender: TObject);
begin
  Set4Save;
  if verbose then VLog('Save: CPU usage');
end;

procedure TShutdown.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
begin
Handled := False;
  if (Msg.message = WM_CANCELJOURNAL) and FHookStarted then
    JHook := SetWindowsHookEx(WH_JOURNALRECORD, @JournalProc, 0, 0);
end;

procedure TShutdown.HookTimerTimer(Sender: TObject);
begin
  HookNow:=True;
  HookTimer.Enabled:=False;
end;

procedure TShutdown.volfade_TTimer(Sender: TObject);
var
  values : TChannelValues;
label next;
begin
  CheckVol;
  if (rvol>volfade_E.Value) and (lvol>volfade_E.Value) then begin
    rvol:=rvol-volfade_E.Value;  //high-order: right chan
    lvol:=lvol-volfade_E.Value;  //low-order: left chan
  end else begin
    if rvol>volfade_E.Value then begin
      rvol:=rvol-volfade_E.Value;
      goto Next;
    end else rvol:=0;
    if lvol>volfade_E.Value then begin
      lvol:=lvol-volfade_E.Value;
      goto Next;
    end else lvol:=0;
    notready:=False;
    MidiMixer1.Active:=False;
    DoSD;
    Timer1.Enabled:=False;
    Next:
  end;
  if not MidiMixer1.Active then MidiMixer1.Active:=True;
  with MidiMixer1 do
  begin
    values [mcLeft] := lvol;
    values [mcRight] := rvol;
    ControlValues [mtAudioVolume] := values;
  end;
end;

procedure TShutdown.Update_LClick(Sender: TObject);
begin
  ShellExecute(handle,'open','http://shutdown.sf.net/',nil,nil,SW_SHOWNORMAL);
  if verbose then VLog('Click: Homepage');
end;

procedure TShutdown.FormDestroy(Sender: TObject);
begin
  try
    lini.Free;
    cini.Free;
    INI.Free;
  except end;
end;

procedure TShutdown.confCBSelect(Sender: TObject);
var
  f: TextFile;
  fi: string;
begin
  AssignFile(f, ExtractFilePath(Application.EXEName) + confCB.Text+'.ini');
  fi:=ExtractFilePath(Application.EXEName) + confCB.Text+'.ini';
  if not FileExists(fi) then begin
    ReWrite(f);
    CloseFile(f);
  end;
  cini.WriteString('Settings', 'INI', confCB.Text+'.ini');
  DoOpen;
end;

procedure TShutdown.confCBKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then begin
    confCBSelect(self);
  end;
end;

procedure TShutdown.langCBSelect(Sender: TObject);
var i: integer;
begin
  i:=defcommand.ItemIndex;  //to make it not forget the default command
  sml.LangFileName := langCB.Text+'.sml';  //Captions, Hints
  sml2.LangFileName := langCB.Text+'.sml'; //SysTray menu
  sml3.LangFileName := langCB.Text+'.sml'; //Atomic clock menu
  defcommand.ItemIndex:=i; //same as first one

  PingTime.Suffix:=' '+lini.ReadString(langCB.Text, 'Mins', 'minutes');

  cini.WriteString('Settings', 'Language', langCB.Text);
end;

end.
