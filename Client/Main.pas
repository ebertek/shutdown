unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  StdCtrls, IdAntiFreezeBase, Spin, Buttons, ComCtrls, ComObj,
  LMDCustomMaskEdit, LMDCustomExtSpinEdit, LMDSpinEdit, LMDCustomControl,
  LMDCustomPanel, LMDCustomBevelPanel, LMDBaseEdit, LMDCustomEdit,
  LMDCustomBrowseEdit, LMDCustomFileEdit, LMDFileOpenEdit, ScktComp;

type
  TForm2 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
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
    SpeedButton1: TSpeedButton;
    TabSheet5: TTabSheet;
    Connect: TButton;
    Edit1: TEdit;
    Calendar: TMonthCalendar;
    Idopont: TDateTimePicker;
    Set1: TBitBtn;
    Canc1: TBitBtn;
    Save1: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    eleres: TLMDFileOpenEdit;
    infoPing: TLabel;
    infoCheck: TLabel;
    PingTime: TLMDSpinEdit;
    Set3: TBitBtn;
    Canc3: TBitBtn;
    Save3: TBitBtn;
    Client: TClientSocket;
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
    procedure BitBtn3Click(Sender: TObject);
    procedure Set3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.ConnectClick(Sender: TObject);
begin
  try
    Client.Host:=Edit1.Text;
    Client.Active:=True;
    Connect.Enabled:=False;
  except
    ShowMessage('Kérlek adj meg egy érvényes IP címet!')
  end;
end;

procedure TForm2.PowerOffClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(0)+' ');
end;

procedure TForm2.ShutDownClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(1)+' ');
end;

procedure TForm2.ReBootClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(2)+' ');
end;

procedure TForm2.LogOffClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(3)+' ');
end;

procedure TForm2.HibernateClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(4)+' ');
end;

procedure TForm2.LockWSClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(5)+' ');
end;

procedure TForm2.SSOnClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(6)+' ');
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(7)+' ');
end;

procedure TForm2.ejectClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(8)+' ');
end;

procedure TForm2.closeClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(9)+' ');
end;

procedure TForm2.recbinClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(10)+' ');
end;

procedure TForm2.clipbClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(11)+' ');
end;

procedure TForm2.mon0Click(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(12)+' ');
end;

procedure TForm2.mon1Click(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(13)+' ');
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(14)+' ');
end;

procedure TForm2.SDMenuClick(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(15)+' ');
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  Client.Socket.SendText(IntToStr(16)+' ');
end;

procedure TForm2.Set1Click(Sender: TObject);
var rs: string;
begin
  Client.Socket.SendText('START_1 ');
  rs:=StringReplace(Trim(DateToStr(Calendar.Date)), ' ', 'RS', [rfReplaceAll]);
  Client.Socket.SendText(rs+' ');
  Client.Socket.SendText(TimeToStr(Idopont.Time)+' ');
  Client.Socket.SendText('STOP_1 ');
end;

procedure TForm2.BitBtn3Click(Sender: TObject);
begin
  Client.Socket.SendText('START_2 ');
  Client.Socket.SendText(TimeToStr(DateTimePicker1.Time)+' ');
  Client.Socket.SendText('STOP_2 ');
end;

procedure TForm2.Set3Click(Sender: TObject);
begin
  Client.Socket.SendText('START_3 ');
  Client.Socket.SendText(eleres.Text+' ');
  Client.Socket.SendText(IntToStr(PingTime.Value)+' ');
  Client.Socket.SendText('STOP_3 ');
end;

end.
