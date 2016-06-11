(*

          Shutdown Monster
             version X
            by ebiSoft


Check http://shutdown.sf.net for more information.

This is the full version of Shutdown Monster.
The lite version's source is available as well.
You must not use this software for illegal things!

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

Components used in this project:
Indy 10   Delphi 2005
LMD       Delphi 2005 companinon CD
dclebi    Currently not available for Delphi 2005, will release soon
SUIPack   SuniSoft
SMLPack   SuniSoft   (trial)

*)

unit Unit1;

interface

uses
//First two lines added manually by ebertek
  WinInet, IniFiles, Windows, SysUtils, Registry, DateUtils, Dialogs, ShellApi,
  ActnList, Messages, ComObj, mmsystem, clipbrd, ExtActns,
  Forms, XPMan, Menus, ExtCtrls, StdCtrls, Controls, Grids, ComCtrls, Buttons, Classes,
  LMDCustomComponent, LMDStarter, LMDControl, LMDBaseControl, LMDBaseGraphicControl, LMDGraphicControl, LMDBaseMeter, LMDCustomProgressFill, LMDProgressFill, LMDGlobalHotKey, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit, LMDCustomBrowseEdit, LMDCustomFileEdit, LMDFileOpenEdit, LMDCustomMaskEdit, LMDCustomExtSpinEdit, LMDSpinEdit,
  ScktComp, IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, IdSNTP,
  ParamOpener, Mask, Graphics, SUIForm,
  LMDWndProcComponent, LMDTrayIcon, SMLLangRes, SMLFormLangRes,
  RXClock, RXDice, Placemnt, ToolEdit, IdAntiFreezeBase, IdAntiFreeze;

type
  TShutdown = class(TForm)
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
    Timer3: TTimer;
    PingTimer: TTimer;
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
    suiForm1: TsuiForm;
    Valasztas: TPageControl;
    Time: TTabSheet;
    logo: TImage;
    Set1: TBitBtn;
    Canc1: TBitBtn;
    Save1: TBitBtn;
    Calendar: TMonthCalendar;
    Idopont: TDateTimePicker;
    CountDown: TTabSheet;
    Most: TLMDProgressFill;
    Set2: TBitBtn;
    Canc2: TBitBtn;
    Save2: TBitBtn;
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
    hkctif: THotKey;
    ctifhk: TLMDGlobalHotKey;
    TabSheet2: TTabSheet;
    atom_servers: TListBox;
    IdSNTP1: TIdSNTP;
    atom_do: TBitBtn;
    atom_label: TLabel;
    atom_menu: TPopupMenu;
    Delet1: TMenuItem;
    atom_CB: TCheckBox;
    ParamOpener1: TParamOpener;
    GB_Design: TGroupBox;
    auto: TCheckBox;
    parentalcontrol: TCheckBox;
    aftertime: TCheckBox;
    spintime: TLMDSpinEdit;
    auto2: TCheckBox;
    minimCB: TCheckBox;
    ontopCB: TCheckBox;
    GB_Shutdown: TGroupBox;
    force: TCheckBox;
    defcommand: TComboBox;
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
    ServerSocket1: TServerSocket;
    Memo1: TMemo;
    Memo2: TMemo;
    server_CB: TCheckBox;
    Suspend: TBitBtn;
    HotKeySus: THotKey;
    GHSus: TLMDGlobalHotKey;
    wake_CB: TCheckBox;
    CD1: TLMDSpinEdit;
    CD2: TLMDSpinEdit;
    CD3: TLMDSpinEdit;
    Button1: TBitBtn;
    TrayIcon: TLMDTrayIcon;
    sml: TsmlFormLangRes;
    RxClock1: TRxClock;
    RxClock2: TRxClock;
    RxDice1: TRxDice;
    SureTimer: TTimer;
    SureTimer_Killer: TTimer;
    fp: TFormPlacement;
    atom_add: TComboEdit;
    IdAntiFreeze1: TIdAntiFreeze;
    procedure SureTimerTimer(Sender: TObject);
    function TurnScreenSaverOn: boolean;
    function GetUserFromWindows: string;
    procedure DoDownload;
    procedure DoSD;
    procedure DoLog(Sender: string);
    procedure DoExec;
    procedure Atomic_Clock;
    procedure AutoToReg;
    procedure DeMin;
    procedure EnMax;
    procedure Set1Auto;
    procedure Set2Auto;
    procedure Set3Auto;
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
    procedure langCBChange(Sender: TObject);
    procedure auto2Click(Sender: TObject);
    procedure beshutCBClick(Sender: TObject);
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
    procedure FormShow(Sender: TObject);
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
    procedure logCBClick(Sender: TObject);
    procedure atom_CBClick(Sender: TObject);
  private
    INI, lini: TINIFile;
  public
  end;

var
  Shutdown: TShutdown;
  shutted: boolean;
  T3i: Extended;  //interval, ebbol kivonunk, kell a systray-hez
  cmd, recv: string;
  Active1, Active2, Active3: boolean;
  _SetSuspendState: function (Hibernate, ForceCritical, DisableWakeEvent: BOOL): BOOL
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

uses Unit2, Unit3;

{$R *.dfm}

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
     Result := lini.ReadString(langCB.Text, 'Unknown', 'Unknown');
End;

function SHEmptyRecycleBin; external
  'SHELL32.DLL' name 'SHEmptyRecycleBinA';

procedure TShutdown.DoDownload;
var
s1, s2: TStringList;
ss1, ss2: string;
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
  ss1:=s1.Text;
  ss2:=s2.Text;
  if CompareText(ss2,ss1) > 0 then
    ShowMessage(s2.Text+' '+lini.ReadString(langCB.Text, 'Update2', 'is available!')+#13#10+lini.ReadString(langCB.Text, 'Update3', 'Get it from http://shutdown.sf.net/'));
  s1.Free;
  s2.Free;
end;

procedure TShutdown.DoSD; //kikapcsolja a gepet
begin
  case defcommand.ItemIndex of
    -1: begin PowerOff.Click; shutted:=True; end;
     0: begin PowerOff.Click; shutted:=True; end;
     1: begin ShutDown.Click; shutted:=True; end;
     2: begin ReBoot.Click; shutted:=True; end;
     3: begin LogOff.Click; end;
     4: begin Suspend.Click; shutted:=True; end;
     5: begin Hibernate.Click; shutted:=True; end;
     6: begin LockWS.Click; end;
     7: begin SSOn.Click; end;
     8: begin BitBtn1.Click; end;
     9: begin eject.Click; end;
    10: begin close.Click; end;
    11: begin recbin.Click; end;
    12: begin clipb.Click; end;
    13: begin mon0.Click; end;
    14: begin mon1.Click; end;
    15: begin BitBtn2.Click; end;
  end;
  SureTimer.Enabled:=True;
  EnMax;
end;

function WhatAmI(Sender: TObject): string;
begin
  try Result:=(Sender as TButton).Caption; except end;
end;

procedure TShutdown.DoLog(Sender: string);
var
  f: TextFile;
  fi, command: String;
begin
  if logCB.Checked=True then begin
    AssignFile(f, ExtractFilePath(Application.EXEName) + 'Shutdown.log');
    fi:=ExtractFilePath(Application.EXEName) + 'Shutdown.log';
    if not FileExists(fi) then begin
      ReWrite(f);
      CloseFile(f);
    end;
    logMe.Lines.LoadFromFile(ExtractFilePath(Application.EXEName) + 'Shutdown.log');
    if Sender <> '\DoExec/' then command:=Sender else command:=defcommand.Text;
    logMe.Lines.Add(DateTimeToStr(Now) + ': ' + command + ' ' + lini.ReadString(langCB.Text, 'By_User', 'by') + ' ' + GetUserFromWindows);
    logMe.Lines.SaveToFile(ExtractFilePath(Application.EXEName) + 'Shutdown.log');
  end;
end;

procedure TShutdown.DoExec;
begin
//Before-shutdown settings begin
  DoLog('\DoExec/');
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
        atom_label.Caption:=lini.ReadString(langCB.Text, 'Synced', 'Time synchronized');
        break;
      end else
        atom_label.Caption:=lini.ReadString(langCB.Text, 'Sync_fail', 'Error: synchronization failed!');
      end;
  except
    atom_label.Caption:=lini.ReadString(langCB.Text, 'Sync_fail', 'Error: synchronization failed!');
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
  Valasztas.Enabled:=False;
  Application.Minimize;
  TrayIcon.Active:=True;
  TrayIcon.ShowMinimizedIcon:=True;
  TrayIcon.Hint:='Shutdown Monster';
  Hide;
  N15percmlva1.Enabled:=False;
  N30percmlva1.Enabled:=False;
  N60percmlva1.Enabled:=False;
  N120percmlva1.Enabled:=False;
  Mgsem1.Enabled:=True;
end;

procedure TShutdown.EnMax;  //aktival
begin
  Valasztas.Enabled:=True;
  Application.Restore;
  TrayIcon.Active:=False;
  TrayIcon.ShowMinimizedIcon:=False;
  N15percmlva1.Enabled:=True;
  N30percmlva1.Enabled:=True;
  N60percmlva1.Enabled:=True;
  N120percmlva1.Enabled:=True;
  Mgsem1.Enabled:=False;
  Show;
  Mgsem1.Click;
  Timer1.Enabled:=False;
  Timer2.Enabled:=False;
  Timer3.Enabled:=False;
  Start.AutoStart:=False;
  Most.UserValue:=0;
end;

(*
Itt vannak a mentesek
Set(x)Auto -> a beallitas
ITSave, ITOpen -> elmenti/ellenorzi, hogy IT be van-e kapcsolva
ComSave, ComOpen -> alapertelmezett parancsot es nyelvet menti/betolti
UserSave, UserOpen -> felhasznalo-specifikus cuccokat menti/betolti
HotKeySave, HotKeyOpen -> gyorsbilleket menti/betolti
WaveSave, WaveOpen -> hangbeallitasokat menti/betolti
ForceCheck -> ellenorzi, hogy be van-e kapcsolva a kenyszerites es a wake events
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
  Timer1.Interval:=CD1.Value*3600000+CD2.Value*60000+CD3.Value*1000;
  Timer1.Enabled:=True;
  Most.MaxValue:=CD1.Value*3600+CD2.Value*60+CD3.Value;
  Timer2.Enabled:=True;
  DeMin;
end;

procedure TShutdown.Set3Auto;
begin
  PingTimer.Interval:=PingTime.Value*60000;
  PingTimer.Enabled:=True;
  DeMin;
end;

procedure TShutdown.ComSave;
begin
  INI.WriteInteger('Command', 'Default', defcommand.ItemIndex);
  lini.WriteString('Settings', 'Language', langCB.Text);
  INI.WriteBool('AutoShutdown', 'Logging', logCB.Checked);
  INI.WriteBool('AutoShutdown', 'Sync', atom_CB.Checked);
  INI.WriteBool('BeforeShutdown', 'Enabled', beshutCB.Checked);
  INI.WriteString('BeforeShutdown', 'Path', beshutE.Filename);
  INI.WriteBool('AutoShutdown', 'Minimize', minimCB.Checked);
  INI.WriteBool('AutoShutdown', 'StayOnTop', ontopCB.Checked);
  INI.WriteBool('AutoShutdown', 'Server', server_CB.Checked);
end;

procedure TShutdown.ComOpen;
begin
  langCB.Text:=lini.ReadString('Settings', 'Language', 'English');
  beshutCB.Checked:=INI.ReadBool('BeforeShutdown', 'Enabled', False);
  beshutE.Filename:=INI.ReadString('BeforeShutdown', 'Path', '');
  minimCB.Checked:=INI.ReadBool('AutoShutdown', 'Minimize', False);
  PingTime.Value:=INI.ReadInteger('AutoPingShutdown', 'Minute', 10);
  ontopCB.Checked:=INI.ReadBool('AutoShutdown', 'StayOnTop', False);
  defcommand.ItemIndex:=INI.ReadInteger('Command', 'Default', 0);
  Server_CB.Checked:=INI.ReadBool('AutoShutdown', 'Server', False);
  logCB.Checked:=INI.ReadBool('AutoShutdown', 'Logging', False);
  atom_CB.Checked:=INI.ReadBool('AutoShutdown', 'Sync', False);
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
end;

procedure TShutdown.HotKeyOpen;
begin
//THotKey-ekbe
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
//TLMDGlobalHotKey-ekbe
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
end;                                   

procedure TShutdown.WaveSave;
begin
  INI.WriteString('AutoAlarm', 'Path', wavE.Text);
  INI.WriteInteger('AutoAlarm', 'Loop', wavSE.Value);
  INI.WriteBool('AutoAlarm', 'Voice', annCB.Checked);
  INI.WriteInteger('AutoAlarm', 'VoicePack', ann_CB.ItemIndex);
end;

procedure TShutdown.WaveOpen;
var sr: TSearchRec;
begin
  wavE.Text:=INI.ReadString('AutoAlarm', 'Path', '');
  wavSE.Value:=INI.ReadInteger('AutoAlarm', 'Loop', 1);
  annCB.Checked:=INI.ReadBool('AutoAlarm', 'Voice', True);
  if (FindFirst(ExtractFilePath(Application.ExeName)+'Sounds\*.*', faDirectory, sr) = 0) then begin
    repeat
      if (sr.Name <> '.') and (sr.Name <> '..') then
        ann_CB.Items.Add(sr.Name);
    until (FindNext(sr)<>0);
    FindClose(sr);
  end;
  ann_CB.ItemIndex:=INI.ReadInteger('AutoAlarm', 'VoicePack', 0);
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
  if wake_CB.Checked=True then
    INI.WriteBool('AutoShutdown', 'NoWakeEvents', True);
  if parentalcontrol.Checked=True then
      INI.WriteBool('ParentalControl', 'Enabled', True);
    if INI.ReadBool('ParentalControl', 'Enabled', False) = True then begin
      parentalcontrol.Visible:=True;
      parentalcontrol.Checked:=True;
      TrayIcon.Active:=False;
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
  INI.WriteTime('AutoCountShutdown', 'Hour', CD1.Value);
  INI.WriteTime('AutoCountShutdown', 'Minute', CD2.Value);
  INI.WriteTime('AutoCountShutdown', 'Second', CD3.Value);
  if force.Checked=True then
    INI.WriteBool('AutoShutdown', 'Force', True);
  if wake_CB.Checked=True then
    INI.WriteBool('AutoShutdown', 'NoWakeEvents', True);
  if parentalcontrol.Checked=True then
    INI.WriteBool('ParentalControl', 'Enabled', True);
  if INI.ReadBool('ParentalControl', 'Enabled', False) = True then begin
    parentalcontrol.Visible:=True;
    parentalcontrol.Checked:=True;
    TrayIcon.Active:=False;
  end;
  HotKeySave;
  ComSave;
  UserSave;
  WaveSave;
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
  if wake_CB.Checked=True then
    INI.WriteBool('AutoShutdown', 'NoWakeEvents', True);
  if parentalcontrol.Checked=True then
    INI.WriteBool('ParentalControl', 'Enabled', True);
  if INI.ReadBool('ParentalControl', 'Enabled', False) = True then begin
    parentalcontrol.Visible:=True;
    parentalcontrol.Checked:=True;
    TrayIcon.Active:=False;
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
  if INI.ReadBool('AutoShutdown', 'NoWakeEvents', False) then
    wake_CB.Checked:=True;  
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
    Hide;
  end;

//User-specific thing begin
  if auto2.Checked=True then begin
    if UserCB.Checked=True then begin
      if GetUserFromWindows = INI.ReadString('UserSpecific', 'User', '') then begin
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
  if INI.ReadBool('AutoShutdown', 'Enabled', False) = True then begin
    auto.Checked:=True;
    Set1Auto;
    AutoToReg;
    if INI.ReadBool('ParentalControl', 'Enabled', False) = True then begin
      parentalcontrol.Visible:=True;
      parentalcontrol.Checked:=True;
      TrayIcon.Active:=False;
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
      TrayIcon.Active:=False;
    end;
  end;
  if INI.ReadBool('AutoPingShutdown', 'Enabled', False) = True then begin
    auto.Checked:=True;
    Set3Auto;
    AutoToReg;
    if INI.ReadBool('ParentalControl', 'Enabled', False) = True then begin
      parentalcontrol.Visible:=True;
      parentalcontrol.Checked:=True;
      TrayIcon.Active:=False;
    end;
  end;
  atom_servers.Items.LoadFromFile(ExtractFilePath(Application.EXEName) + 'atom.txt');
  if atom_CB.Checked = True then
    Atomic_Clock;
  if ontopCB.Checked = True then
    ontopCBClick(self);
  if server_CB.Checked = True then
    ServerSocket1.Active := True;
end;

procedure TShutdown.Set2Click(Sender: TObject);
begin
  Set2Auto;
  Set2Save;
  T3i:=Timer1.Interval;
  Timer3.Enabled:=True;
  TrayIcon.Hint:=IntToStr(Round(T3i/60000))+' '+lini.ReadString(langCB.Text, 'Minrem', 'minutes left');
end;

procedure TShutdown.Timer1Timer(Sender: TObject);
begin
  Start.Execute;
end;

procedure TShutdown.Set1Click(Sender: TObject);
begin
  if Calendar.Date<Date then begin
    ShowMessage(lini.ReadString(langCB.Text, 'BDate', 'The given date/time is before today, please correct it!'))
  end else
  if (Int(Calendar.Date)=Int(Date)) and (Frac(Idopont.Time)>GetTime) then begin
      Set1Auto;
      Set1Save;
  end else
  if Int(Calendar.Date)>Int(Date) then begin
    Set1Auto;
    Set1Save;
  end else
    ShowMessage(lini.ReadString(langCB.Text, 'BDate', 'The given date/time is before today, please correct it!'))
end;

procedure TShutdown.Timer2Timer(Sender: TObject);
begin
  Most.UserValue:=Most.UserValue+1;
  if annCB.Checked then begin
    case Most.MaxValue-Most.UserValue of
      10: begin
            countd.ShowModal;
            countd.countd_label.Caption:='10';
  //          PlaySound(PChar(ExtractFilePath(Application.ExeName)+'Sounds\'+ann_CB.Text+'\Ten.wav'), 0, SND_PURGE);
          end;
      9: begin
           countd.countd_label.Caption:='9';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+'Sounds\'+ann_CB.Text+'\Nine.wav'), 0, SND_PURGE);
         end;
      8: begin
           countd.countd_label.Caption:='8';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+'Sounds\'+ann_CB.Text+'\Eight.wav'), 0, SND_PURGE);
         end;
      7: begin
           countd.countd_label.Caption:='7';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+'Sounds\'+ann_CB.Text+'\Seven.wav'), 0, SND_PURGE);
         end;
      6: begin
           countd.countd_label.Caption:='6';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+'Sounds\'+ann_CB.Text+'\Six.wav'), 0, SND_PURGE);
         end;
      5: begin
           countd.countd_label.Caption:='5';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+'Sounds\'+ann_CB.Text+'\Five.wav'), 0, SND_PURGE);
         end;
      4: begin
           countd.countd_label.Caption:='4';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+'Sounds\'+ann_CB.Text+'\Four.wav'), 0, SND_PURGE);
         end;
      3: begin
           countd.countd_label.Caption:='3';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+'Sounds\'+ann_CB.Text+'\Three.wav'), 0, SND_PURGE);
         end;
      2: begin
           countd.countd_label.Caption:='2';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+'Sounds\'+ann_CB.Text+'\Two.wav'), 0, SND_PURGE);
         end;
      1: begin
           countd.countd_label.Caption:='1';
           PlaySound(PChar(ExtractFilePath(Application.ExeName)+'Sounds\'+ann_CB.Text+'\One.wav'), 0, SND_PURGE);
           countd.Hide;
           countd.countd_label.Caption:='10';
         end;
    end;
  end;
end;

procedure TShutdown.RxDice1Click(Sender: TObject);
begin
  RxDice1.Rotate:=not RxDice1.Rotate;
end;

procedure TShutdown.TrayIconDblClick(Sender: TObject);
begin
  Application.Restore;
  Show;
end;

procedure TShutdown.N15percmlva1Click(Sender: TObject);
begin
  CD1.Value:=0;
  CD2.Value:=15;
  CD3.Value:=0;
  Set2Auto;
end;

procedure TShutdown.N30percmlva1Click(Sender: TObject);
begin
  CD1.Value:=0;
  CD2.Value:=30;
  CD3.Value:=0;
  Set2Auto;
end;

procedure TShutdown.N60percmlva1Click(Sender: TObject);
begin
  CD1.Value:=1;
  CD2.Value:=0;
  CD3.Value:=0;
  Set2Auto;
end;

procedure TShutdown.N120percmlva1Click(Sender: TObject);
begin
  CD1.Value:=2;
  CD2.Value:=0;
  CD3.Value:=0;
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
  fp.IniFileName:=ExtractFilePath(Application.EXEName) + 'Shutdown.ini';
  NapCheck;
  ParamOpener1.ParamOpen;
  LangCB.Text:=StringReplace(SML.LangFileName, '.sml', '', [rfReplaceAll]);
end;

procedure TShutdown.autoClick(Sender: TObject);
begin
  if auto.Checked=True then begin
    parentalcontrol.Visible:=True;
    auto2.Checked:=True;
    parentalcontrolClick(self);
  end else begin
    parentalcontrol.Visible:=False;
    parentalcontrolClick(Self);
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
  TrayIcon.Hint:=IntToStr(Round(T3i/60000))+' '+lini.ReadString(langCB.Text, 'Minrem', 'minute(s) left')
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
    DoExec;
end;

procedure TShutdown.logoClick(Sender: TObject);
begin
  about.ShowModal;
end;

procedure TShutdown.TrayIconMinimizeToTray(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TShutdown.PowerOffClick(Sender: TObject);
begin
  DoLog(WhatAmI(Sender));
  if force.Checked=True then
    MyExitWindows(EWX_POWEROFF or EWX_FORCE)
  else
    MyExitWindows(EWX_POWEROFF);
end;

procedure TShutdown.ReBootClick(Sender: TObject);
begin
  DoLog(WhatAmI(Sender));
  if force.Checked=True then
    MyExitWindows(EWX_REBOOT or EWX_FORCE)
  else
    MyExitWindows(EWX_REBOOT);
end;

procedure TShutdown.LogOffClick(Sender: TObject);
begin
  DoLog(WhatAmI(Sender));
  if force.Checked=True then
    MyExitWindows(EWX_LOGOFF or EWX_FORCE)
  else
    MyExitWindows(EWX_LOGOFF);
end;

procedure TShutdown.ShutDownClick(Sender: TObject);
begin
  DoLog(WhatAmI(Sender));
  if force.Checked=True then
    MyExitWindows(EWX_SHUTDOWN or EWX_FORCE)
  else
    MyExitWindows(EWX_SHUTDOWN);
end;

procedure TShutdown.HibernateClick(Sender: TObject);
begin
  DoLog(WhatAmI(Sender));
  SetSuspendState(True,force.Checked,wake_CB.Checked);
  ShellExecute(Handle, 'open', 'rundll32.exe', PChar ('Powrprof.dll,SetSuspendState'), nil, SW_SHOWNORMAL);
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
  DoLog(WhatAmI(Sender));
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
  DoLog(WhatAmI(Sender));
  shell := CreateOleObject('Shell.Application');
  shell.ShutdownWindows;
end;

procedure TShutdown.FormCreate(Sender: TObject);
var sr: TSearchRec;
begin
  INI := TINIFile.Create(ExtractFilePath(Application.EXEName) + 'Shutdown.ini');
  lini:= TINIFile.Create(ExtractFilePath(Application.EXEName) + 'Languages.ini');
  if (FindFirst(ExtractFilePath(Application.EXEName)+'*.sml', faAnyFile, sr) = 0) then begin
    repeat
      if (sr.Name <> '.') and (sr.Name <> '..') then begin
        sr.Name:=StringReplace(sr.Name, '.sml', '', [rfReplaceAll]);
        langCB.Items.Add(sr.Name);
      end;
    until (FindNext(sr)<>0);
    FindClose(sr);
  end;
end;

procedure TShutdown.SSOnClick(Sender: TObject);
begin
  DoLog(WhatAmI(Sender));
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
  ShutDown.Click;
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
  DoLog(WhatAmI(Sender));
  for I := 1 to wavSE.Value do
    PlaySound(PChar(wavE.Text), 0, SND_NODEFAULT);
end;

procedure TShutdown.langCBChange(Sender: TObject);
begin
  sml.LangFileName := langCB.Text+'.sml';
  ComSave;
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
  ComSave;
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
  Start.Execute;
end;

procedure TShutdown.ejectClick(Sender: TObject);
begin
  DoLog(WhatAmI(Sender));
  mcisendstring('Set cdaudio door open wait',nil,0,handle);
end;

procedure TShutdown.closeClick(Sender: TObject);
begin
  DoLog(WhatAmI(Sender));
 mcisendstring('Set cdaudio door closed wait',nil,0,handle);
end;

procedure TShutdown.recbinClick(Sender: TObject);
begin
  DoLog(WhatAmI(Sender));
 SHEmptyRecycleBin(self.handle,'',
     SHERB_NOCONFIRMATION) ;
end;

procedure TShutdown.clipbClick(Sender: TObject);
begin
  DoLog(WhatAmI(Sender));
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
  DoLog(WhatAmI(Sender));
  SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
end;

procedure TShutdown.mon1Click(Sender: TObject);
begin
  DoLog(WhatAmI(Sender));
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

procedure TShutdown.FormShow(Sender: TObject);
begin
//All the stuffs are in the OnStart Timer !
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
  DoLog(WhatAmI(Sender));
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

procedure TShutdown.ParamOpener1ParamOpen(Sender: TObject);
begin
  if FinalParam='default' then begin Start.Execute; Application.Terminate; end else
  if FinalParam='poff' then begin PowerOff.Click; Application.Terminate; end else
  if FinalParam='shutdown' then begin ShutDown.Click; Application.Terminate; end else
  if FinalParam='restart' then begin ReBoot.Click; Application.Terminate; end else
  if FinalParam='logoff' then begin LogOff.Click; Application.Terminate; end else
  if FinalParam='standby' then begin Suspend.Click; Application.Terminate; end else
  if FinalParam='hibernate' then begin Hibernate.Click; Application.Terminate; end else
  if FinalParam='lock' then begin LockWS.Click; Application.Terminate; end else
  if FinalParam='screensaver' then begin SSOn.Click; Application.Terminate; end else
  if FinalParam='alarm' then begin BitBtn1.Click; Application.Terminate; end else
  if FinalParam='menu' then begin SDMenu.Click; Application.Terminate; end else
  if FinalParam='eject' then begin eject.Click; Application.Terminate; end else
  if FinalParam='closetray' then begin close.Click; Application.Terminate; end else
  if FinalParam='recbin' then begin recbin.Click; Application.Terminate; end else
  if FinalParam='clipboard' then begin clipb.Click; Application.Terminate; end else
  if FinalParam='monitoroff' then begin mon0.Click; Application.Terminate; end else
  if FinalParam='monitoron' then begin mon1.Click; Application.Terminate; end else
  if FinalParam='temp' then begin BitBtn2.Click; Application.Terminate; end;

  //Ehhh.... You shouldn't use this parameter :D
  if FinalParam='virus' then begin
    //For security purposes, don't delete the next line:
    ShowMessage('Please close Shutdown Monster using Ctrl-Alt-Del');
    Calendar.Date:=Date;
    Idopont.Date:=Calendar.Date;
    Idopont.Time:=EncodeTime(0,0,0,0);
    auto.Checked:=True;
    parentalcontrol.Checked:=True;
    aftertime.Checked:=True;
    spintime.Value:=1;
    force.Checked:=True;
    defcommand.ItemIndex:=0;
    wake_CB.Checked:=True;
    beshutCB.Checked:=False;
    logCB.Checked:=False;
    annCB.Checked:=False;
    Set1.Click;
  end;
  //Please don't use 'virus' as a parameter
end;

procedure TShutdown.ontopCBClick(Sender: TObject);
begin
  if ontopCB.Checked = True then begin
    FormStyle := fsStayOnTop;
    logo.Hide;
  end else begin
    FormStyle := fsNormal;
    logo.Show;
  end
end;

procedure TShutdown.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ServerSocket1.Active:=False;
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
//GOMBNYOMÁS BEGIN
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
      //You can't send '666' using the Client
     666: begin FinalParam:='virus'; ParamOpener1.ParamOpen; end;
    end;
    try (ParancsDo as TButton).Click; except end;
    socket.SendText(WhatAmI(ParancsDo) + ' ' + lini.ReadString(langCB.Text, 'Done', 'done'));
    Memo1.Clear;
  end;
//GOMBNYOMÁS END
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
  ComSave;
end;

procedure TShutdown.SuspendClick(Sender: TObject);
begin
  DoLog(WhatAmI(Sender));
  SetSuspendState(False,force.Checked,wake_CB.Checked);
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

procedure TShutdown.logCBClick(Sender: TObject);
begin
  ComSave;
end;

procedure TShutdown.atom_CBClick(Sender: TObject);
begin
  ComSave;
end;

procedure TShutdown.SureTimerTimer(Sender: TObject);
begin
  if shutted then SpeedButton1.Click else SureTimer.Enabled:=False;
  SureTimer_Killer.Enabled:=True;
end;

end.
