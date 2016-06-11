unit Unit1;

interface

uses
//First two lines added manually by ebertek
  WinInet, IniFiles, Windows, SysUtils, Registry, DateUtils, Dialogs, ShellApi,
  ActnList, Messages, ComObj, mmsystem, clipbrd, ExtActns, PSInterface,
  Forms, XPMan, Menus, CoolTrayIcon, LMDCustomComponent,
  LMDStarter, ExtCtrls, RXDice, StdCtrls, RXClock, LMDControl,
  LMDBaseControl, LMDBaseGraphicControl, LMDGraphicControl, LMDBaseMeter,
  LMDCustomProgressFill, LMDProgressFill, Controls, Grids, Beater,
  LMDGlobalHotKey, ComCtrls, LMDCustomControl, LMDCustomPanel,
  LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDCustomBrowseEdit,
  LMDCustomFileEdit, LMDFileOpenEdit, Buttons, Classes,
  bsPolyglotUn, Placemnt, SUIForm, RxGIF, CDOpener, LMDCustomMaskEdit,
  LMDCustomExtSpinEdit, LMDSpinEdit, IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPClient, IdSNTP, Mask, ToolEdit;

type
  ELoadLibraryFailed = class(Exception);
  ENoPSInterface = class(Exception);
  ENullObject = class(Exception);

  TShutdown = class(TForm, IHost)
    Timer1: TTimer;
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
    OnStart: TTimer;
    jraindts1: TMenuItem;
    Kijelentkezs1: TMenuItem;
    TrayIcon: TCoolTrayIcon;
    Timer3: TTimer;
    PingTimer: TTimer;
    Start: TLMDStarter;
    Lellts1: TMenuItem;
    hibernls1: TMenuItem;
    Munkallomszrolsa1: TMenuItem;
    GHRB: TLMDGlobalHotKey;
    GHH: TLMDGlobalHotKey;
    GHLWS: TLMDGlobalHotKey;
    GHLO: TLMDGlobalHotKey;
    GHSD: TLMDGlobalHotKey;
    GHPO: TLMDGlobalHotKey;
    Beater: TBeater;
    ITimer: TTimer;
    IATimer: TTimer;
    Kpernyvd1: TMenuItem;
    GHSS: TLMDGlobalHotKey;
    bsT: TbsPolyglotTranslator;
    bsM: TbsPolyglotManager;
    GHAA: TLMDGlobalHotKey;
    fp: TFormPlacement;
    Ments1: TMenuItem;
    suiForm1: TsuiForm;
    Valasztas: TPageControl;
    Time: TTabSheet;
    logo: TImage;
    Set1: TBitBtn;
    Canc1: TBitBtn;
    Save1: TBitBtn;
    RxClock2: TRxClock;
    Calendar: TMonthCalendar;
    Idopont: TDateTimePicker;
    CountDown: TTabSheet;
    Most: TLMDProgressFill;
    Set2: TBitBtn;
    Idozito: TLMDSpinEdit;
    Canc2: TBitBtn;
    RxClock1: TRxClock;
    Save2: TBitBtn;
    ITimeP: TPanel;
    logMe: TMemo;
    IPing: TTabSheet;
    infoPing: TLabel;
    infoCheck: TLabel;
    PingTime: TLMDSpinEdit;
    Set3: TBitBtn;
    Save3: TBitBtn;
    Canc3: TBitBtn;
    eleres: TLMDFileOpenEdit;
    AltOptions: TTabSheet;
    auto: TCheckBox;
    parentalcontrol: TCheckBox;
    aftertime: TCheckBox;
    force: TCheckBox;
    spintime: TLMDSpinEdit;
    defcommand: TComboBox;
    ITimeCB: TCheckBox;
    auto2: TCheckBox;
    Save4_2: TBitBtn;
    wavE: TLMDFileOpenEdit;
    wavSE: TLMDSpinEdit;
    langCB: TComboBox;
    logCB: TCheckBox;
    beshutE: TLMDFileOpenEdit;
    beshutCB: TCheckBox;
    minimCB: TCheckBox;
    Veszhelyzet: TTabSheet;
    PowerOff: TBitBtn;
    ReBoot: TBitBtn;
    LogOff: TBitBtn;
    ShutDown: TBitBtn;
    Hibernate: TBitBtn;
    HotKeyPOff: THotKey;
    HotKeySD: THotKey;
    HotKeyReB: THotKey;
    HotKeyLO: THotKey;
    HotKeyHib: THotKey;
    Save4: TBitBtn;
    LockWS: TBitBtn;
    HotKeyLWS: THotKey;
    SDMenu: TBitBtn;
    SSOn: TBitBtn;
    HotKeySS: THotKey;
    BitBtn1: TBitBtn;
    UserSpecific: TTabSheet;
    UserCB: TCheckBox;
    FromTime: TDateTimePicker;
    ToTime: TDateTimePicker;
    HotKeyAA: THotKey;
    SpeedButton1: TSpeedButton;
    cdo: TCDOpener;
    eject: TBitBtn;
    close: TBitBtn;
    recbin: TBitBtn;
    clipb: TBitBtn;
    LMDGlobalHotKey1: TLMDGlobalHotKey;
    LMDGlobalHotKey2: TLMDGlobalHotKey;
    LMDGlobalHotKey3: TLMDGlobalHotKey;
    LMDGlobalHotKey4: TLMDGlobalHotKey;
    HotKey1: THotKey;
    HotKey2: THotKey;
    HotKey3: THotKey;
    HotKey4: THotKey;
    mon0: TBitBtn;
    mon1: TBitBtn;
    mon0hk: TLMDGlobalHotKey;
    mon1hk: TLMDGlobalHotKey;
    hkmon0: THotKey;
    hkmon1: THotKey;
    BitBtn2: TBitBtn;
    RxDice1: TRxDice;
    hkctif: THotKey;
    ctifhk: TLMDGlobalHotKey;
    TabSheet1: TTabSheet;
    ListBox1: TListBox;
    TabSheet2: TTabSheet;
    atom_servers: TListBox;
    IdSNTP1: TIdSNTP;
    atom_do: TBitBtn;
    atom_label: TLabel;
    atom_add: TComboEdit;
    atom_menu: TPopupMenu;
    Delet1: TMenuItem;
    Button1: TButton;
    function TurnScreenSaverOn: boolean;
    function GetUserFromWindows: string;
    procedure DoDownload;
    procedure DoSD;
    procedure DoExec;
    procedure Atomic_Clock;
    procedure AutoToReg;
    procedure DeMin;
    procedure EnMax;
    procedure Set1Auto;
    procedure Set2Auto;
    procedure Set3Auto;
    procedure ITSave;
    procedure ITOpen;
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
    procedure ForceCheck;
    procedure DurvaCheck;
    procedure Piszka;
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
    procedure OnStartTimer(Sender: TObject);
    procedure autoClick(Sender: TObject);
    procedure parentalcontrolClick(Sender: TObject);
    procedure aftertimeClick(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure forceClick(Sender: TObject);
    procedure Set3Click(Sender: TObject);
    procedure Save3Click(Sender: TObject);
    procedure PingTimerTimer(Sender: TObject);
    procedure logoClick(Sender: TObject);
    procedure TrayIconMinimizeToTray(Sender: TObject);
    procedure PowerOffClick(Sender: TObject);
    procedure ReBootClick(Sender: TObject);
    procedure LogOffClick(Sender: TObject);
    procedure ShutDownClick(Sender: TObject);
    procedure HibernateClick(Sender: TObject);
    procedure HotKeyPOffChange(Sender: TObject);
    procedure HotKeySDChange(Sender: TObject);
    procedure HotKeyReBChange(Sender: TObject);
    procedure HotKeyLOChange(Sender: TObject);
    procedure HotKeyHibChange(Sender: TObject);
    procedure Save4Click(Sender: TObject);
    procedure LockWSClick(Sender: TObject);
    procedure HotKeyLWSChange(Sender: TObject);
    procedure SDMenuClick(Sender: TObject);
    procedure ITimerTimer(Sender: TObject);
    procedure IATimerTimer(Sender: TObject);
    procedure ITimeCBClick(Sender: TObject);
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
    procedure bsMCurrentLangChanging(Sender: TObject; OldLanguage,
      NewLanguage: String; var Cancel: Boolean);
    procedure langCBChange(Sender: TObject);
    procedure auto2Click(Sender: TObject);
    procedure beshutCBClick(Sender: TObject);
    procedure HotKeyAAChange(Sender: TObject);
    procedure GHAAKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Ments1Click(Sender: TObject);
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
    procedure FormDestroy(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure atom_doClick(Sender: TObject);
    procedure atom_addButtonClick(Sender: TObject);
    procedure Delet1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    INI, lini: TINIFile;
    FPlugins: TList;
  public
    procedure LoadPlugins;
    procedure FlushPlugins;
    function GetApplication: TApplication;
    procedure RegisterAction(AAction: TAction);
    procedure UnregisterAction(AAction: TAction);
    function GetInterface(IID: TGUID; out Obj): Boolean;
  end;

  TPlugin = class
    LibHandle: Cardinal;
    LibFileName: string;
    PluginInterface: IPlugin;
    PluginLoad: TPluginLoadProc;
    PluginUnload: TPluginUnloadProc;
    procedure LoadPlugin(FileName: string);
    procedure UnloadPlugin;
  end;

var
  Shutdown: TShutdown;
  T3i: Extended;  //interval, ebbol kivonunk, kell a systray-hez
  itime, itime2, itime3: Integer;  //jelenlegi it, megadott it, it amibol kivonunk

function SHEmptyRecycleBin
   (Wnd:HWnd; LPCTSTR:PChar;
   DWORD:Word):Integer; stdcall;

  const
  SHERB_NOCONFIRMATION = $00000001;
  SHERB_NOPROGRESSUI = $00000002;
  SHERB_NOSOUND = $00000004;

implementation

uses Unit2;

{$R *.dfm}

//plugin
procedure TPlugin.LoadPlugin(FileName: string);
begin
  // el�sz�r is kell a dll handle
  LibFileName := FileName;
  LibHandle := LoadLibrary(PChar(FileName));
  if LibHandle < 32 then // nem siker�lt bet�lteni a dll-t
    raise ELoadLibraryFailed.CreateFmt('Could not load %s', [ExtractFileName(FileName)]);
  PluginLoad := GetProcAddress(LibHandle, PLUGINLOAD_ENTRY_POINT);
  if not Assigned(PluginLoad) then // nem export�lta a k�telez� f�ggv�nyt
    raise ENoPSInterface.CreateFmt('%s does not export %s', [ExtractFileName(FileName), PLUGINLOAD_ENTRY_POINT]);
  PluginUnload := GetProcAddress(LibHandle, PLUGINUNLOAD_ENTRY_POINT);
  PluginInterface := PluginLoad; // plugin objektum l�trehoz�sa, hibakezel�s
  if not Assigned(PluginInterface) then
    raise ENullObject.CreateFmt('No interface returned from %s', [ExtractFileName(FileName)]);
end;

procedure TPlugin.UnloadPlugin;
begin
  // referenciasz�ml�l�s van!
  PluginInterface := nil;
  // opcion�lis takar�t� elj�r�s
  if Assigned(PluginUnload) then PluginUnload;
  try
    FreeLibrary(LibHandle);
  except
    raise Exception.CreateFmt('Could not unload %s. Handle: %s', [ExtractFileName(LibFileName), IntToHex(LibHandle, 8)]);
  end;
end;

function TShutdown.GetApplication: TApplication;
begin
  Result := Application;
end;

{
  GetInterface met�dus: megpr�b�l keresni egy, a megadott interface-t t�mogat�
  plugin objektumot.
}

function TShutdown.GetInterface(IID: TGUID; out Obj): Boolean;
var
  I: Integer;
  Plugin: IPlugin;
begin
  Result := True;
  for I := 0 to FPlugins.Count - 1 do
  begin
    Plugin := TPlugin(FPlugins[I]).PluginInterface;
    if Supports(Plugin, IID, Obj) then
      Exit;
  end;
  Result := False;
end;

procedure TShutdown.RegisterAction(AAction: TAction);
begin
  ListBox1.Items.AddObject(AAction.Caption, AAction);
end;

procedure TShutdown.UnregisterAction(AAction: TAction);
begin
  if ListBox1.Items.IndexOfObject(AAction) > -1 then
    ListBox1.Items.Delete(ListBox1.Items.IndexOfObject(AAction));
end;

procedure TShutdown.LoadPlugins;
var
  Plugin: TPlugin;
  I: Integer;
  SR: TSearchRec;
begin
  I := FindFirst(ExtractFilePath(Application.ExeName)+'*.dll', faAnyFile, SR);
  while I = 0 do
  begin
    Plugin := TPlugin.Create;
    try
      Plugin.LoadPlugin(SR.Name);
      Plugin.PluginInterface.InitPlugin(Self);
      FPlugins.Add(Plugin);
    except
      on E: ELoadLibraryFailed do
      begin
        Plugin.Free;
      end;
      on E: ENoPSInterface do
      begin
        Plugin.Free;
      end;
      on E: ENullObject do
      begin
        Plugin.Free;
        raise;
      end;
    end;
    I := FindNext(SR);
  end;
  FindClose(SR);
end;

procedure TShutdown.FlushPlugins;
var
  I: Integer;
  Plugin: TPlugin;
begin
  ListBox1.Clear;
  for I := 0 to FPlugins.Count - 1 do
  begin
    Plugin := FPlugins[I];
    Plugin.UnloadPlugin;
    Plugin.Free;
    FPlugins[I] := nil;
  end;
  FPlugins.Clear;
end;

//plugin vege

function MyExitWindows(RebootParam: Longword): Boolean;  //ez a kikapcsolos cucc
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

function TShutdown.TurnScreenSaverOn: boolean;  //wlock-bol raktam be, ss-t indit
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
     Result := lini.ReadString(bsM.CurrentLang, 'Unknown', 'Unknown');
End;

function SHEmptyRecycleBin; external
  'SHELL32.DLL' name 'SHEmptyRecycleBinA';

procedure TShutdown.DoDownload;
var
s1, s2: TStringList;
begin
  with TDownloadURL.Create(self) do
    try
      URL:='http://www.mosolyorszag.hu/david/prog/shutdown/update.txt';
      FileName := ExtractFilePath(Application.EXEName) + 'update.txt';
      ExecuteTarget(nil) ;
    finally
      Free;
  end;
  s1 := TStringList.Create;
  s2 := TStringList.Create;
  s1.LoadFromFile(ExtractFilePath(Application.EXEName)+'current.txt');
  s2.LoadFromFile(ExtractFilePath(Application.EXEName)+'update.txt');
  if s1.Text < s2.Text then
    ShowMessage(lini.ReadString(bsM.CurrentLang, 'Update1', 'Version 3.0.1.')+s2.Text+' '+lini.ReadString(bsM.CurrentLang, 'Update2', 'is available!')+#13#10+lini.ReadString(bsM.CurrentLang, 'Update3', 'Get it from http://www.mosolyorszag.hu/david/prog/'));
  s1.Free;
  s2.Free;        
end;

procedure TShutdown.DoSD; //kikapcsolja a gepet
begin
  case defcommand.ItemIndex of
     0: PowerOff.Click;
     1: ShutDown.Click;
     2: ReBoot.Click;
     3: LogOff.Click;
     4: Hibernate.Click;
     5: LockWS.Click;
     6: SSOn.Click;
     7: BitBtn1.Click;
     8: eject.Click;
     9: close.Click;
    10: recbin.Click;
    11: clipb.Click;
    12: mon0.Click;
    13: mon1.Click;
    14: BitBtn2.Click;
  end;
  EnMax;
end;

procedure TShutdown.DoExec;
var
  f: TextFile;
  fi: String;
begin
//Logging begin
  if logCB.Checked=True then begin
    AssignFile(f, ExtractFilePath(Application.EXEName) + 'Shutdown.log');
    fi:=ExtractFilePath(Application.EXEName) + 'Shutdown.log';
    if not FileExists(fi) then begin
      ReWrite(f);
      CloseFile(f);
    end;
    logMe.Lines.LoadFromFile(ExtractFilePath(Application.EXEName) + 'Shutdown.log');
    logMe.Lines.Add(DateTimeToStr(Now) + ': ' + defcommand.Text + ' ' + lini.ReadString(bsM.CurrentLang, 'By_User', 'by') + ' ' + GetUserFromWindows);
    logMe.Lines.SaveToFile(ExtractFilePath(Application.EXEName) + 'Shutdown.log');
  end;
//Logging end
//Before-Shutdown settings begin
  if beshutCB.Checked=True then begin
    Start.Wait:=True;
    Start.Command:=beshutE.Filename;
    Start.StartOption:=soSW_SHOWNORMAL;
  end else begin
    Start.Wait:=False;
    Start.Command:='.';
    Start.StartOption:=soSW_HIDE;
  end;
//Before-Shutdown settings end
  DoSD;
end;

procedure TShutdown.Atomic_Clock;
var i: integer;
begin
  try
    for i:=0 to atom_servers.Items.Count-1 do begin
      IdSNTP1.Host:=atom_servers.Items.Strings[i];
      if IdSNTP1.SyncTime then begin
        atom_label.Caption:=lini.ReadString(bsM.CurrentLang, 'Synced', 'Time synchronized');
        break;
      end else
        atom_label.Caption:=lini.ReadString(bsM.CurrentLang, 'Sync_fail', 'Error: synchronization failed!');
      end;
  except
    atom_label.Caption:=lini.ReadString(bsM.CurrentLang, 'Sync_fail', 'Error: synchronization failed!');
  end;
end;

procedure TShutdown.AutoToReg;  //beirja a regbe
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_CURRENT_USER;
    if Reg.OpenKey('\Software\Microsoft\Windows\CurrentVersion\RunOnce', True) then
    begin
      Reg.WriteString('Shutdown Monster', Application.ExeName);
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TShutdown.DeMin;  //deaktival
begin
(*  Idozito.Enabled:=False;
  Calendar.Enabled:=False;
  Idopont.Enabled:=False;
  Set1.Enabled:=False;
  Set2.Enabled:=False;
  Set3.Enabled:=False;
  Save1.Enabled:=False;
  Save2.Enabled:=False;
  Save3.Enabled:=False;
  AltOptions.Enabled:=False;
  Veszhelyzet.Enabled:=False;
  eleres.Enabled:=False;
  PingTime.Enabled:=False;*)
  Valasztas.Enabled:=False;
  Application.Minimize;
  TrayIcon.HideMainForm;
  Hide;
  N15percmlva1.Enabled:=False;
  N30percmlva1.Enabled:=False;
  N60percmlva1.Enabled:=False;
  N120percmlva1.Enabled:=False;
  Mgsem1.Enabled:=True;
end;

procedure TShutdown.EnMax;  //aktival
begin
(*  Idozito.Enabled:=True;
  Calendar.Enabled:=True;
  Idopont.Enabled:=True;
  Set1.Enabled:=True;
  Set2.Enabled:=True;
  Set3.Enabled:=True;
  Save1.Enabled:=True;
  Save2.Enabled:=True;
  Save3.Enabled:=True;
  AltOptions.Enabled:=True;
  Veszhelyzet.Enabled:=True;
  eleres.Enabled:=True;
  PingTime.Enabled:=True;*)
  Valasztas.Enabled:=True;
  N15percmlva1.Enabled:=True;
  N30percmlva1.Enabled:=True;
  N60percmlva1.Enabled:=True;
  N120percmlva1.Enabled:=True;
  Mgsem1.Enabled:=False;
  TrayIcon.ShowMainForm;
  Show;
end;

(*
Itt vannak a mentesek
Set(x)Auto -> a beallitas
ITSave, ITOpen -> elmenti/ellenorzi, hogy IT be van-e kapcsolva
ComSave, ComOpen -> alapertelmezett parancsot es nyelvet menti/betolti
UserSave, UserOpen -> felhasznalo-specifikus cuccokat menti/betolti
HotKeySave, HotKeyOpen -> gyorsbilleket menti/betolti
WaveSave, WaveOpen -> hangbeallitasokat menti/betolti
ForceCheck -> ellenorzi, hogy be van-e kapcsolva a kenyszerites
DurvaCheck -> ellenorzi, hogy a hatterben kell-e futnia
Piszka -> ellenorzi, hogy nincs-e tul sok autoshutdown bekapcsolva
NapCheck -> minden inditaskor, betolti az adatokat
Set(x)Save -> a mentes
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
  DeMin;
end;

procedure TShutdown.Set2Auto;
begin
  if Beater.Tag=1 then
  begin
    itime:=StrToInt(Beater.GetNumb);
    itime2:=Idozito.Value;
    itime3:=itime2;
    IATimer.Interval:=Idozito.Value*86400;
    IATimer.Enabled:=True;
  end else if Beater.Tag=0 then begin
    Timer1.Interval:=Idozito.Value*60000;
    Timer1.Enabled:=True;
  end;
  Most.MaxValue:=Idozito.Value*60;
  Timer2.Enabled:=True;
  DeMin;
end;

procedure TShutdown.Set3Auto;
begin
  PingTimer.Interval:=PingTime.Value*60000;
  PingTimer.Enabled:=True;
  DeMin;
end;

procedure TShutdown.ITSave;
begin
  if Beater.Tag=1 then
    INI.WriteBool('AutoShutdown', 'Internet Time', True)
end;

procedure TShutdown.ITOpen;
begin
  if INI.ReadBool('AutoShutdown', 'Internet Time', False) = True then
  begin
    ITimeP.Visible:=True;
    ITimer.Enabled:=True;
    ITimeCB.Checked:=True;
    Idozito.Suffix:=' .beats';
    Beater.Tag:=1;
  end else
    Idozito.Suffix:=' '+lini.ReadString(bsM.CurrentLang, 'Minutes', 'minute(s)');
end;

procedure TShutdown.ComSave;
begin
  INI.WriteInteger('Command', 'Default', defcommand.ItemIndex);
  lini.WriteString('Settings', 'Language', bsM.CurrentLang);
  INI.WriteBool('AutoShutdown', 'Logging', logCB.Checked);
  INI.WriteBool('BeforeShutdown', 'Enabled', beshutCB.Checked);
  INI.WriteString('BeforeShutdown', 'Path', beshutE.Filename);
  INI.WriteBool('AutoShutdown', 'Minimize', minimCB.Checked);
  fp.SaveFormPlacement;
end;

procedure TShutdown.ComOpen;
var
  i: integer;
begin
  for i:=0 to bsM.LangCount-1 do
    langCB.Items.Add(bsM.Langs[i]);
  bsM.CurrentLang:=lini.ReadString('Settings', 'Language', 'English');
  beshutCB.Checked:=INI.ReadBool('BeforeShutdown', 'Enabled', False);
  beshutE.Filename:=INI.ReadString('BeforeShutdown', 'Path', '');
  minimCB.Checked:=INI.ReadBool('AutoShutdown', 'Minimize', False);
  fp.RestoreFormPlacement;
  PingTime.Value:=INI.ReadInteger('AutoPingShutdown', 'Minute', 10);
  defcommand.ItemIndex:=INI.ReadInteger('Command', 'Default', 0);
end;

procedure TShutdown.UserSave;
begin
  INI.WriteBool('UserSpecific', 'Enabled', UserCB.Checked);
  INI.WriteString('UserSpecific', 'User', GetUserFromWindows);
  FromTime.Date:=Date;
  ToTime.Date:=Date;
  INI.WriteDateTime('UserSpecific', 'From', FromTime.DateTime);
  INI.WriteDateTime('UserSpecific', 'To', ToTime.DateTime);
end;

procedure TShutdown.UserOpen;
begin
  UserCB.Checked:=INI.ReadBool('UserSpecific', 'Enabled', False);
  FromTime.DateTime:=INI.ReadDateTime('UserSpecific', 'From', 0);
  ToTime.DateTime:=INI.ReadDateTime('UserSpecific', 'To', 0);
  FromTime.Date:=Date;
  ToTime.Date:=Date;
end;

procedure TShutdown.HotKeySave;
begin
  INI.WriteInteger('Hotkeys', 'POff', HotKeyPOff.HotKey);
  INI.WriteInteger('Hotkeys', 'SD', HotKeySD.HotKey);
  INI.WriteInteger('Hotkeys', 'ReB', HotKeyReB.HotKey);
  INI.WriteInteger('Hotkeys', 'LO', HotKeyLO.HotKey);
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
end;

procedure TShutdown.HotKeyOpen;
begin
//THotKey-ekbe
  HotKeyPOff.HotKey:=INI.ReadInteger('Hotkeys', 'POff', 0);
  HotKeySD.HotKey:=INI.ReadInteger('Hotkeys', 'SD', 0);
  HotKeyReB.HotKey:=INI.ReadInteger('Hotkeys', 'ReB', 0);
  HotKeyLO.HotKey:=INI.ReadInteger('Hotkeys', 'LO', 0);
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
//TLMDGlobalHotKey-ekbe
  GHPO.HotKey:=HotKeyPOff.HotKey;
  GHSD.HotKey:=HotKeySD.HotKey;
  GHRB.HotKey:=HotKeyReB.HotKey;
  GHLO.HotKey:=HotKeyLO.HotKey;
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
end;

procedure TShutdown.WaveSave;
begin
  INI.WriteString('AutoAlarm', 'Path', wavE.Text);
  INI.WriteInteger('AutoAlarm', 'Loop', wavSE.Value);
end;

procedure TShutdown.WaveOpen;
begin
  wavE.Text:=INI.ReadString('AutoAlarm', 'Path', '');
  wavSE.Value:=INI.ReadInteger('AutoAlarm', 'Loop', 1);
end;

procedure TShutdown.Set1Save;
begin
  if auto2.Checked=True then begin
    AutoToReg;
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  if auto.Checked=True then begin
    AutoToReg;
    INI.WriteBool('AutoCountShutdown', 'Enabled', False);
    INI.WriteBool('AutoShutdown', 'Enabled', True);
    INI.WriteBool('AutoPingShutdown', 'Enabled', False);
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  Idopont.Date:=Calendar.Date;
  INI.WriteDateTime('AutoShutdown', 'Time', Idopont.DateTime);
  if force.Checked=True then
    INI.WriteBool('AutoShutdown', 'Force', True);
  if parentalcontrol.Checked=True then
      INI.WriteBool('ParentalControl', 'Enabled', True);
    if INI.ReadBool('ParentalControl', 'Enabled', False) = True then begin
      parentalcontrol.Visible:=True;
      parentalcontrol.Checked:=True;
      TrayIcon.Enabled:=False;
    end;
    if aftertime.Checked=True then begin
      INI.WriteBool('ParentalControl', 'Hard', True);
      DurvaCheck;
      if aftertime.Checked=True then
        INI.WriteInteger('ParentalControl', 'HardTime', spintime.Value);
    end;
  HotKeySave;
  ComSave;
  UserSave;
  WaveSave;
end;

procedure TShutdown.Set2Save;
begin
  if auto2.Checked=True then begin
    AutoToReg;
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  if auto.Checked=True then begin
    AutoToReg;
    INI.WriteBool('AutoShutdown', 'Enabled', False);
    INI.WriteBool('AutoCountShutdown', 'Enabled', True);
    INI.WriteBool('AutoPingShutdown', 'Enabled', False);
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  INI.WriteInteger('AutoCountShutdown', 'Minute', Idozito.Value);
  if force.Checked=True then
    INI.WriteBool('AutoShutdown', 'Force', True);
    if parentalcontrol.Checked=True then
      INI.WriteBool('ParentalControl', 'Enabled', True);
    if INI.ReadBool('ParentalControl', 'Enabled', False) = True then begin
      parentalcontrol.Visible:=True;
      parentalcontrol.Checked:=True;
      TrayIcon.Enabled:=False;
    end;
  HotKeySave;
  ComSave;
  UserSave;
  WaveSave;
  ITSave;
end;

procedure TShutdown.Set3Save;
begin
  if auto2.Checked=True then begin
    AutoToReg;
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  if auto.Checked=True then begin
    AutoToReg;
    INI.WriteBool('AutoShutdown', 'Enabled', False);
    INI.WriteBool('AutoCountShutdown', 'Enabled', False);
    INI.WriteBool('AutoPingShutdown', 'Enabled', True);
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  INI.WriteInteger('AutoPingShutdown', 'Minute', PingTime.Value);
  INI.WriteString('AutoPingShutdown', 'Path', eleres.Text);
  if force.Checked=True then
    INI.WriteBool('AutoShutdown', 'Force', True);
    if parentalcontrol.Checked=True then
      INI.WriteBool('ParentalControl', 'Enabled', True);
    if INI.ReadBool('ParentalControl', 'Enabled', False) = True then begin
      parentalcontrol.Visible:=True;
      parentalcontrol.Checked:=True;
      TrayIcon.Enabled:=False;
    end;
  HotKeySave;
  ComSave;
  UserSave;
  WaveSave;
end;

procedure TShutdown.ForceCheck;
begin
  if INI.ReadBool('AutoShutdown', 'Force', True) = False then begin
    force.Checked:=False;
    Start.Parameters:='-s -t 00';
  end;
end;

procedure TShutdown.DurvaCheck;
var
  HourDC, MinDC, SecDC, MSecDC: Word;
begin
  if INI.ReadBool('ParentalControl', 'Hard', False) = True then begin
    aftertime.Visible:=True;
    aftertime.Checked:=True;
    spintime.Value:=INI.ReadInteger('ParentalControl', 'HardTime', 10);
    DecodeTime(Idopont.Time, HourDC, MinDC, SecDC, MSecDC);
    if HourDC < HourOfTheDay(Now) then begin
      Sleep(spintime.Value*1000);
      PowerOff.Click;
    end else begin
      if HourDC = HourOfTheDay(Now) then begin
        if MinDC < MinuteOfTheHour(Now) then begin
          Sleep(spintime.Value*1000);
          PowerOff.Click;
        end;
      end;
    end;
  end;
end;

procedure TShutdown.Piszka;
begin
  INI.WriteBool('AutoShutdown', 'Enabled', False);
  INI.WriteBool('AutoCountShutdown', 'Enabled', False);
  INI.WriteBool('AutoPingShutdown', 'Enabled', False);
end;

procedure TShutdown.NapCheck;
begin
  ForceCheck;
  ComOpen;
  HotKeyOpen;
  UserOpen;
  WaveOpen;
  ITOpen;
  if INI.ReadBool('AutoShutdown', 'Enabled', False) = True then
    if INI.ReadBool('AutoCountShutdown', 'Enabled', False) = True then
      Piszka;
  if INI.ReadBool('AutoShutdown', 'Enabled', False) = True then
    if INI.ReadBool('AutoPingShutdown', 'Enabled', False) = True then
      Piszka;
  if INI.ReadBool('AutoPingShutdown', 'Enabled', False) = True then
    if INI.ReadBool('AutoCountShutdown', 'Enabled', False) = True then
      Piszka;

  if INI.ReadBool('AutoStart', 'Enabled', False) = True then begin
    auto2.Checked:=True;
    AutoToReg;
  end;

  if INI.ReadBool('AutoShutdown', 'Minimize', False) = True then begin
    Application.Minimize;
    TrayIcon.HideMainForm;
    Hide;
  end;

//User-specific thing begin
  if auto2.Checked=True then begin
    if UserCB.Checked=True then begin
      if GetUserFromWindows = INI.ReadString('UserSpecific', 'User', '') then begin
        if FromTime.DateTime<ToTime.DateTime then begin
          if ToTime.DateTime>=Now then begin
//            DoExec;
            Start.Execute;
          end;
        end;
      end;
    end;
  end;
//User-specific thing end

  Idopont.DateTime:=INI.ReadDateTime('AutoShutdown', 'Time', 0);
  Calendar.Date:=INI.ReadDateTime('AutoShutdown', 'Time', 0);
  Idozito.Value:=INI.ReadInteger('AutoCountShutdown', 'Minute', 30);
  eleres.Text:=INI.ReadString('AutoPingShutdown', 'Path', '');
  if INI.ReadBool('AutoShutdown', 'Logging', False) = True then
    logCB.Checked:=True;
  if INI.ReadBool('AutoShutdown', 'Enabled', False) = True then begin
    auto.Checked:=True;
    Set1Auto;
    AutoToReg;
    if INI.ReadBool('ParentalControl', 'Enabled', False) = True then begin
      parentalcontrol.Visible:=True;
      parentalcontrol.Checked:=True;
      TrayIcon.Enabled:=False;
      DurvaCheck;
    end;
  end;
  if INI.ReadBool('AutoCountShutdown', 'Enabled', False) = True then begin
    auto.Checked:=True;
    Set2Auto;
    AutoToReg;
    if INI.ReadBool('ParentalControl', 'Enabled', False) = True then begin
      parentalcontrol.Visible:=True;
      parentalcontrol.Checked:=True;
      TrayIcon.Enabled:=False;
    end;
  end;
  if INI.ReadBool('AutoPingShutdown', 'Enabled', False) = True then begin
    auto.Checked:=True;
    Set3Auto;
    AutoToReg;
    if INI.ReadBool('ParentalControl', 'Enabled', False) = True then begin
      parentalcontrol.Visible:=True;
      parentalcontrol.Checked:=True;
      TrayIcon.Enabled:=False;
    end;
  end;
//  DoDownload;
  atom_servers.Items.LoadFromFile(ExtractFilePath(Application.EXEName) + 'atom.txt');
end;

procedure TShutdown.Set2Click(Sender: TObject);
begin
  Set2Auto;
  Set2Save;
  if Beater.Tag=0 then begin
    T3i:=Timer1.Interval;
    Timer3.Enabled:=True;
    TrayIcon.Hint:=FloatToStr(T3i/60000)+' '+lini.ReadString(bsm.CurrentLang, 'Minrem', 'minutes left');
  end else if Beater.Tag=1 then begin
    T3i:=IATimer.Interval;
    Timer3.Enabled:=True;
    TrayIcon.Hint:=FloatToStr(T3i/86400)+' '+lini.ReadString(bsm.CurrentLang, 'Bearem', '.beats left');
  end;
end;

procedure TShutdown.Timer1Timer(Sender: TObject);
begin
//  DoExec;
  Start.Execute;
end;

procedure TShutdown.Set1Click(Sender: TObject);
begin
  if Calendar.Date<Date then
    ShowMessage(lini.ReadString(bsM.CurrentLang, 'BDate', 'The given date/time is before today, please correct it!'))
  else
  if Calendar.Date=Date then begin
    if TimeToStr(Idopont.Time)<TimeToStr(Now) then
      ShowMessage(lini.ReadString(bsM.CurrentLang, 'BDate', 'The given date/time is before today, please correct it!'));
  end;
  Set1Auto;
  Set1Save;
end;

procedure TShutdown.Timer2Timer(Sender: TObject);
begin
  Most.UserValue:=Most.UserValue+1;
end;

procedure TShutdown.RxDice1Click(Sender: TObject);
begin
  if RxDice1.Rotate=False then
    RxDice1.Rotate:=True
  else
    RxDice1.Rotate:=False;
end;

procedure TShutdown.TrayIconDblClick(Sender: TObject);
begin
  Application.Restore;
  TrayIcon.ShowMainForm;
  Show;
end;

procedure TShutdown.N15percmlva1Click(Sender: TObject);
begin
  Idozito.Value:=15;
  Set2Auto;
end;

procedure TShutdown.N30percmlva1Click(Sender: TObject);
begin
  Idozito.Value:=30;
  Set2Auto;
end;

procedure TShutdown.N60percmlva1Click(Sender: TObject);
begin
  Idozito.Value:=60;
  Set2Auto;
end;

procedure TShutdown.N120percmlva1Click(Sender: TObject);
begin
  Idozito.Value:=120;
  Set2Auto;
end;

procedure TShutdown.Mgsem1Click(Sender: TObject);
begin
  EnMax;
  Start.AutoStart:=False;
  Timer1.Enabled:=False;
  Timer2.Enabled:=False;
  Most.UserValue:=0;
end;

procedure TShutdown.OnStartTimer(Sender: TObject);
begin
  OnStart.Enabled:=False;
  bsM.LangsDir:=ExtractFilePath(Application.EXEName) + '\Languages';
  fp.IniFileName:=ExtractFilePath(Application.EXEName) + 'Shutdown.ini';
  NapCheck;
  ITimerTimer(Self);
end;

procedure TShutdown.autoClick(Sender: TObject);
begin
  if auto.Checked=True then begin
    parentalcontrol.Visible:=True;
    auto2.Checked:=True;
    parentalcontrolClick(Self);
  end else begin
    parentalcontrol.Visible:=False;
    parentalcontrolClick(Self);
//    auto2.Checked:=False;
  end;
end;

procedure TShutdown.parentalcontrolClick(Sender: TObject);
begin
  if parentalcontrol.Visible=True then begin
    if parentalcontrol.Checked=True then
      aftertime.Visible:=True else
        aftertime.Visible:=False;
  end else
    aftertime.Visible:=False;
  aftertimeClick(Self);
end;

procedure TShutdown.aftertimeClick(Sender: TObject);
begin
  if aftertime.Visible=True then begin
    if aftertime.Checked=True then
      spintime.Visible:=True else
        spintime.Visible:=False;
  end else
    spintime.Visible:=False;
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
begin
  T3i:=T3i-1;
  if Beater.Tag=0 then
    TrayIcon.Hint:=IntToStr(Round(T3i/60000))+' '+lini.ReadString(bsm.CurrentLang, 'Minrem', 'minute(s) left')
  else if Beater.Tag=1 then
    TrayIcon.Hint:=IntToStr(Round(T3i/86400))+' '+lini.ReadString(bsm.CurrentLang, 'Bearem', '.beat(s) left');
end;

procedure TShutdown.forceClick(Sender: TObject);
begin
  ForceCheck;
end;

procedure TShutdown.Set3Click(Sender: TObject);
begin
  PingTimerTimer(Self);
  Set3Auto;
  Set3Save;
end;

procedure TShutdown.Save3Click(Sender: TObject);
begin
  Set3Save;
end;

procedure TShutdown.PingTimerTimer(Sender: TObject);
begin
  if FileExists(eleres.Text) = False then
//    DoExec;
    Start.Execute;
end;

procedure TShutdown.logoClick(Sender: TObject);
begin
  about.ShowModal;
end;

procedure TShutdown.TrayIconMinimizeToTray(Sender: TObject);
begin
  Application.Minimize;
  TrayIcon.HideMainForm;
end;

procedure TShutdown.PowerOffClick(Sender: TObject);
begin
  if force.Checked=True then
    MyExitWindows(EWX_POWEROFF or EWX_FORCE)
  else
    MyExitWindows(EWX_POWEROFF);
end;

procedure TShutdown.ReBootClick(Sender: TObject);
begin
  if force.Checked=True then
    MyExitWindows(EWX_REBOOT or EWX_FORCE)
  else
    MyExitWindows(EWX_REBOOT);
end;

procedure TShutdown.LogOffClick(Sender: TObject);
begin
  if force.Checked=True then
    MyExitWindows(EWX_LOGOFF or EWX_FORCE)
  else
    MyExitWindows(EWX_LOGOFF);
end;

procedure TShutdown.ShutDownClick(Sender: TObject);
begin
  if force.Checked=True then
    MyExitWindows(EWX_SHUTDOWN or EWX_FORCE)
  else
    MyExitWindows(EWX_SHUTDOWN);
end;

procedure TShutdown.HibernateClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'rundll32.exe', PChar ('Powrprof.dll,SetSuspendState'), nil, SW_SHOWNORMAL);
end;

procedure TShutdown.HotKeyPOffChange(Sender: TObject);
begin
  Most1.ShortCut:=HotKeyPOff.HotKey;
  GHPO.HotKey:=HotKeyPOff.HotKey;
end;

procedure TShutdown.HotKeySDChange(Sender: TObject);
begin
  Lellts1.ShortCut:=HotKeySD.HotKey;
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
  hibernls1.ShortCut:=HotKeyHib.HotKey;
  GHH.HotKey:=HotKeyHib.HotKey;
end;

procedure TShutdown.Save4Click(Sender: TObject);
begin
  if auto2.Checked=True then begin
    AutoToReg;
    INI.WriteBool('AutoStart', 'Enabled', True);
  end;
  HotKeySave;
  ComSave;
  UserSave;
  WaveSave;
end;

procedure TShutdown.LockWSClick(Sender: TObject);
begin
  WinExec('rundll32.exe user32.dll,LockWorkStation', SW_SHOWNORMAL);
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
  shell := CreateOleObject('Shell.Application');
  shell.ShutdownWindows;
end;

procedure TShutdown.ITimerTimer(Sender: TObject);
begin
  ITimeP.Caption:='@'+Beater.GetNumb;
end;

procedure TShutdown.IATimerTimer(Sender: TObject);
begin
  itime3:=itime3-1;
  if itime3=0 then
//    DoExec;
    Start.Execute;
end;

procedure TShutdown.ITimeCBClick(Sender: TObject);
begin
  if ITimeCB.Checked=True then
  begin
    ITimeP.Visible:=True;
    ITimer.Enabled:=True;
    Idozito.Suffix:=' .beats';
    Beater.Tag:=1;
  end else
  begin
    ITimeP.Visible:=False;
    ITimer.Enabled:=False;
    Idozito.Suffix:=' '+lini.ReadString(bsm.CurrentLang, 'Minutes', 'minute(s)');
    Beater.Tag:=0;
  end;
end;

procedure TShutdown.FormCreate(Sender: TObject);
begin
  INI := TINIFile.Create(ExtractFilePath(Application.EXEName) + 'Shutdown.ini');
  lini:= TINIFile.Create(ExtractFilePath(Application.ExeName) + bsM.LangsDir + 'Settings.ini');
  FPlugins := TList.Create;
  LoadPlugins;
end;

procedure TShutdown.SSOnClick(Sender: TObject);
begin
  TurnScreenSaverOn;
end;

procedure TShutdown.HotKeySSChange(Sender: TObject);
begin
  Kpernyvd1.ShortCut:=HotKeySS.HotKey;
  GHSS.HotKey:=HotKeySS.HotKey;
end;

procedure TShutdown.GHSSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Kpernyvd1.Click;
end;

procedure TShutdown.GHPOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Most1.Click;
end;

procedure TShutdown.GHSDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  Lellts1.Click;
end;

procedure TShutdown.GHRBKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  jraindts1.Click;
end;

procedure TShutdown.GHLWSKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  munkallomszrolsa1.Click;
end;

procedure TShutdown.GHHKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  hibernls1.Click;
end;

procedure TShutdown.GHLOKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  kijelentkezs1.Click;
end;

procedure TShutdown.StartAfterStart(Sender: TObject);
begin
  DoExec;
//  Start.Execute;
end;

procedure TShutdown.BitBtn1Click(Sender: TObject);
var I: integer;
begin
  for I := 1 to wavSE.Value do
    PlaySound(PChar(wavE.Text), 0, SND_SYNC);
end;

procedure TShutdown.bsMCurrentLangChanging(Sender: TObject; OldLanguage,
  NewLanguage: String; var Cancel: Boolean);
begin
  PingTime.Suffix:=' '+lini.ReadString(NewLanguage, 'Mins', 'minutes');
  spintime.Suffix:=' '+lini.ReadString(NewLanguage, 'Secs', 'seconds');

  if ITimeCB.Checked=True then
  begin
    ITimeP.Visible:=True;
    ITimer.Enabled:=True;
    Idozito.Suffix:=' .beats';
    Beater.Tag:=1;
  end else
  begin
    ITimeP.Visible:=False;
    ITimer.Enabled:=False;
    Idozito.Suffix:=' '+lini.ReadString(NewLanguage, 'Minutes', 'minute(s)');
    Beater.Tag:=0;
  end;

  langCB.Text:=NewLanguage;
end;

procedure TShutdown.langCBChange(Sender: TObject);
begin
  bsM.CurrentLang:=langCB.Text;
end;

procedure TShutdown.auto2Click(Sender: TObject);
begin
  if auto2.Checked=False then begin
    auto.Checked:=False;
    UserSpecific.Enabled:=False;
  end else
    UserSpecific.Enabled:=True;
end;

procedure TShutdown.beshutCBClick(Sender: TObject);
begin
  beshutE.Visible:=beshutCB.Checked;
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

procedure TShutdown.Ments1Click(Sender: TObject);
begin
  Set1Save;
  Set2Save;
  Set3Save;
end;

procedure TShutdown.SpeedButton1Click(Sender: TObject);
begin
//  DoExec;
  Start.Execute;
end;

procedure TShutdown.ejectClick(Sender: TObject);
begin
  cdo.OpenCd(True);
end;

procedure TShutdown.closeClick(Sender: TObject);
begin
  cdo.OpenCd(False);
end;

procedure TShutdown.recbinClick(Sender: TObject);
begin
 SHEmptyRecycleBin(self.handle,'',
     SHERB_NOCONFIRMATION) ;
end;

procedure TShutdown.clipbClick(Sender: TObject);
begin
  Clipboard.Clear;
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
  SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
end;

procedure TShutdown.mon1Click(Sender: TObject);
begin
  SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, - 1);
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

procedure TShutdown.Button1Click(Sender: TObject);
begin
  DoDownload;
end;

procedure TShutdown.FormDestroy(Sender: TObject);
begin
  FlushPlugins;
  FPlugins.Free;
end;

procedure TShutdown.ListBox1DblClick(Sender: TObject);
begin
  TAction(ListBox1.Items.Objects[ListBox1.ItemIndex]).Execute;
end;

procedure TShutdown.FormShow(Sender: TObject);
begin
//Ez nem jo semmire, OnStart Timer -ben vannak a cuccok!
end;

procedure TShutdown.atom_doClick(Sender: TObject);
begin
  Atomic_Clock;
end;

procedure TShutdown.atom_addButtonClick(Sender: TObject);
begin
  atom_servers.AddItem(atom_add.Text, nil);
  atom_servers.Items.SaveToFile(ExtractFilePath(Application.EXEName) + 'atom.txt');
end;

procedure TShutdown.Delet1Click(Sender: TObject);
begin
  atom_servers.DeleteSelected;
  atom_servers.Items.SaveToFile(ExtractFilePath(Application.EXEName) + 'atom.txt');
end;

procedure TShutdown.BitBtn2Click(Sender: TObject);
var
  lpEntryInfo: PInternetCacheEntryInfo;
  hCacheDir: LongWord;
  dwEntrySize: LongWord;
begin
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
      FindNextUrlCacheEntry(hCacheDir, TInternetCacheEntryInfo(nil^), dwEntrySize);
      GetMem(lpEntryInfo, dwEntrySize);
      if dwEntrySize > 0 then lpEntryInfo^.dwStructSize := dwEntrySize;
    until not FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize);
  end;
  FreeMem(lpEntryInfo, dwEntrySize);
  FindCloseUrlCache(hCacheDir);
end;

end.