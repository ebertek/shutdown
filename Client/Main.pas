unit Main;

interface

uses
  IniFiles,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  StdCtrls, IdAntiFreezeBase, Spin, Buttons, ComCtrls, ComObj,
  LMDCustomMaskEdit, LMDCustomExtSpinEdit, LMDSpinEdit, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit,
  LMDCustomBrowseEdit, LMDCustomFileEdit, LMDFileOpenEdit, ScktComp,
  ExtCtrls, SUIForm, RXClock, SMLLangRes, SMLFormLangRes;

type
  TShutdown = class(TForm)
    Client: TClientSocket;
    OnStart: TTimer;
    suiForm1: TsuiForm;
    Valasztas: TPageControl;
    Kapcs: TTabSheet;
    IP_Edit: TEdit;
    langCB: TComboBox;
    Time: TTabSheet;
    Calendar: TMonthCalendar;
    Idopont: TDateTimePicker;
    Set1: TBitBtn;
    Canc1: TBitBtn;
    Save1: TBitBtn;
    CountDown: TTabSheet;
    Set2: TBitBtn;
    Canc2: TBitBtn;
    Save2: TBitBtn;
    IPing: TTabSheet;
    infoPing: TLabel;
    infoCheck: TLabel;
    eleres: TLMDFileOpenEdit;
    PingTime: TLMDSpinEdit;
    Set3: TBitBtn;
    Canc3: TBitBtn;
    Save3: TBitBtn;
    Veszhelyzet: TTabSheet;
    SpeedButton1: TSpeedButton;
    PowerOff: TBitBtn;
    ShutDown: TBitBtn;
    ReBoot: TBitBtn;
    LogOff: TBitBtn;
    Hibernate: TBitBtn;
    LockWS: TBitBtn;
    SSOn: TBitBtn;
    BitBtn1: TBitBtn;
    SDMenu: TBitBtn;
    BitBtn2: TBitBtn;
    mon1: TBitBtn;
    mon0: TBitBtn;
    clipb: TBitBtn;
    recbin: TBitBtn;
    close: TBitBtn;
    eject: TBitBtn;
    RxClock2: TRxClock;
    RxClock1: TRxClock;
    Save4: TBitBtn;
    Suspend: TBitBtn;
    CD1: TLMDSpinEdit;
    CD2: TLMDSpinEdit;
    CD3: TLMDSpinEdit;
    Disconnect: TBitBtn;
    Connect: TBitBtn;
    sml: TsmlFormLangRes;
    procedure ComSave;
    procedure ComOpen;
    procedure Set1Save;
    procedure Set2Save;
    procedure Set3Save;
    procedure NapCheck;
    procedure ConnectClick(Sender: TObject);
    procedure PowerOffClick(Sender: TObject);
    procedure ShutDownClick(Sender: TObject);
    procedure ReBootClick(Sender: TObject);
    procedure LogOffClick(Sender: TObject);
    procedure HibernateClick(Sender: TObject);
    procedure LockWSClick(Sender: TObject);
    procedure SSOnClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure ejectClick(Sender: TObject);
    procedure closeClick(Sender: TObject);
    procedure recbinClick(Sender: TObject);
    procedure clipbClick(Sender: TObject);
    procedure mon0Click(Sender: TObject);
    procedure mon1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SDMenuClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Set1Click(Sender: TObject);
    procedure Set2Click(Sender: TObject);
    procedure Set3Click(Sender: TObject);
    procedure langCBChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OnStartTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bsMCurrentLangChanging(Sender: TObject; OldLanguage,
      NewLanguage: String; var Cancel: Boolean);
    procedure Save1Click(Sender: TObject);
    procedure Save2Click(Sender: TObject);
    procedure Save3Click(Sender: TObject);
    procedure Canc1Click(Sender: TObject);
    procedure DisconnectClick(Sender: TObject);
    procedure Save4Click(Sender: TObject);
    procedure ClientError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientRead(Sender: TObject; Socket: TCustomWinSocket);
  private
    INI, lini: TINIFile;
  public
  end;

var
  Shutdown: TShutdown;

implementation

{$R *.dfm}

procedure TShutdown.ComSave;
begin
  lini.WriteString('Settings', 'Language', langCB.Text);
  INI.WriteString('AutoShutdown', 'IP', IP_Edit.Text);
end;

procedure TShutdown.ComOpen;
begin
  langCB.Text:=lini.ReadString('Settings', 'Language', 'English');
  langCBChange(self);
  IP_Edit.Text:=INI.ReadString('AutoShutdown', 'IP', '127.0.0.1');
end;

procedure TShutdown.Set1Save;
begin
  Idopont.Date:=Calendar.Date;
  INI.WriteDateTime('AutoShutdown', 'Time', Idopont.DateTime);
  ComSave;
end;

procedure TShutdown.Set2Save;
begin
  INI.WriteTime('AutoCountShutdown', 'Hour', CD1.Value);
  INI.WriteTime('AutoCountShutdown', 'Minute', CD2.Value);
  INI.WriteTime('AutoCountShutdown', 'Second', CD3.Value);
  ComSave;
end;

procedure TShutdown.Set3Save;
begin
  INI.WriteString('AutoPingShutdown', 'Path', eleres.Text);
  INI.WriteInteger('AutoPingShutdown', 'Minute', PingTime.Value);
  ComSave;
end;

procedure TShutdown.NapCheck;
begin
  ComOpen;
  Idopont.DateTime:=INI.ReadDateTime('AutoShutdown', 'Time', 0);
  Calendar.Date:=INI.ReadDateTime('AutoShutdown', 'Time', 0);
  CD1.Value:=INI.ReadInteger('AutoCountShutdown', 'Hour', 0);
  CD2.Value:=INI.ReadInteger('AutoCountShutdown', 'Minute', 0);
  CD3.Value:=INI.ReadInteger('AutoCountShutdown', 'Second', 0);
  eleres.Text:=INI.ReadString('AutoPingShutdown', 'Path', '');
  PingTime.Value:=INI.ReadInteger('AutoPingShutdown', 'Minute', 10);
end;

procedure TShutdown.ConnectClick(Sender: TObject);
begin
  try
    Client.Host:=IP_Edit.Text;
    Client.Active:=True;
    Connect.Enabled:=False;
    Disconnect.Enabled:=True;
  except
//    ShowMessage(lini.ReadString(bsM.CurrentLang, 'Conn_er', 'Please type in a valid IP address!'));
    ShowMessage('A kapcsolódás sikertelen');
  end;
end;

procedure TShutdown.PowerOffClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(0)+' ');
end;

procedure TShutdown.ShutDownClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(1)+' ');
end;

procedure TShutdown.ReBootClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(2)+' ');
end;

procedure TShutdown.LogOffClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(3)+' ');
end;

procedure TShutdown.HibernateClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(5)+' ');
end;

procedure TShutdown.LockWSClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(6)+' ');
end;

procedure TShutdown.SSOnClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(7)+' ');
end;

procedure TShutdown.BitBtn1Click(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(8)+' ');
end;

procedure TShutdown.ejectClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(9)+' ');
end;

procedure TShutdown.closeClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(10)+' ');
end;

procedure TShutdown.recbinClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(11)+' ');
end;

procedure TShutdown.clipbClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(12)+' ');
end;

procedure TShutdown.mon0Click(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(13)+' ');
end;

procedure TShutdown.mon1Click(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(14)+' ');
end;

procedure TShutdown.BitBtn2Click(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(15)+' ');
end;

procedure TShutdown.SDMenuClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(16)+' ');
end;

procedure TShutdown.SpeedButton1Click(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(17)+' ');
end;

procedure TShutdown.Set1Click(Sender: TObject);
var rs: string;
begin
  Client.Socket.SendText('START_1 ');
  rs:=StringReplace(Trim(DateToStr(Calendar.Date)), ' ', '\RS/', [rfReplaceAll]);
  Client.Socket.SendText(rs+' ');
  Client.Socket.SendText(TimeToStr(Idopont.Time)+' ');
  Client.Socket.SendText('STOP_1 ');
end;

procedure TShutdown.Set2Click(Sender: TObject);
begin
  Client.Socket.SendText('START_2 ');
  Client.Socket.SendText(IntToStr(CD1.Value)+' ');
  Client.Socket.SendText(IntToStr(CD2.Value)+' ');
  Client.Socket.SendText(IntToStr(CD3.Value)+' ');
  Client.Socket.SendText('STOP_2 ');
end;

procedure TShutdown.Set3Click(Sender: TObject);
begin
  Client.Socket.SendText('START_3 ');
  Client.Socket.SendText(eleres.Text+' ');
  Client.Socket.SendText(IntToStr(PingTime.Value)+' ');
  Client.Socket.SendText('STOP_3 ');
end;

procedure TShutdown.langCBChange(Sender: TObject);
begin
  sml.LangFileName := langCB.Text+'.sml';

  PingTime.Suffix:=' '+lini.ReadString(langCB.Text, 'Mins', 'minutes');

  ComSave;
end;

procedure TShutdown.FormShow(Sender: TObject);
//var
//  i: integer;
begin
//  for i:=0 to bsM.LangCount-1 do
//    langCB.Items.Add(bsM.Langs[i]);
end;

procedure TShutdown.OnStartTimer(Sender: TObject);
begin
  OnStart.Enabled:=False;
  NapCheck;
  LangCB.Text:=StringReplace(SML.LangFileName, '.sml', '', [rfReplaceAll]);
end;

procedure TShutdown.FormCreate(Sender: TObject);
var sr: TSearchRec;
begin
  INI := TINIFile.Create(ExtractFilePath(Application.EXEName) + 'ShutdC.ini');
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

procedure TShutdown.bsMCurrentLangChanging(Sender: TObject; OldLanguage,
  NewLanguage: String; var Cancel: Boolean);
begin
  PingTime.Suffix:=' '+lini.ReadString(NewLanguage, 'Mins', 'minutes');
  langCB.Text:=NewLanguage;
end;

procedure TShutdown.Save1Click(Sender: TObject);
begin
  Set1Save;
end;

procedure TShutdown.Save2Click(Sender: TObject);
begin
  Set2Save;
end;

procedure TShutdown.Save3Click(Sender: TObject);
begin
  Set3Save;
end;

procedure TShutdown.Canc1Click(Sender: TObject);
begin
  Client.Socket.SendText('CANCEL ');
end;

procedure TShutdown.DisconnectClick(Sender: TObject);
begin
  try
    Client.Active:=False;
    Connect.Enabled:=True;
    Disconnect.Enabled:=False;
  except
  end;
end;

procedure TShutdown.Save4Click(Sender: TObject);
begin
  ComSave;
end;

procedure TShutdown.ClientError(Sender: TObject; Socket: TCustomWinSocket;
  ErrorEvent: TErrorEvent; var ErrorCode: Integer);
begin
  Disconnect.Click;
end;

procedure TShutdown.ClientRead(Sender: TObject; Socket: TCustomWinSocket);
begin
  ShowMessage(socket.ReceiveText);
end;

end.
