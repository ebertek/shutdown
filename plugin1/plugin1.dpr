library plugin1;

uses
  Windows, Messages, ExtCtrls,
  SysUtils, Classes, ActnList, PSInterface;

{$R *.RES}

type
  TPlugin = class (TInterfacedObject, IPlugin)
  private
    Host: IHost;
    ASomeAction: TAction;
    Timerr: TTimer;
    Timerrr: TTimer;
    procedure TimerrTimer(Sender: TObject);
    procedure TimerrrTimer(Sender: TObject);
  public
    procedure InitPlugin(AHost: IHost);
    procedure ASomeActionExecute(Sender: TObject);
    destructor Destroy; override;
  end;

procedure TPlugin.InitPlugin(AHost: IHost);
begin
  Host := AHost;
  ASomeAction := TAction.Create(nil);
  ASomeAction.Caption := 'Turn monitor on and off';
  ASomeAction.OnExecute := ASomeActionExecute;
  Host.RegisterAction(ASomeAction);
end;

procedure TPlugin.TimerrTimer(Sender: TObject);
begin
  SendMessage(Host.GetApplication.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, - 1);
  Timerr.Enabled:=False;
end;

procedure TPlugin.TimerrrTimer(Sender: TObject);
begin
  SendMessage(Host.GetApplication.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
  Sleep(1000);
  SendMessage(Host.GetApplication.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
  Timerrr.Enabled:=False;
end;

procedure TPlugin.ASomeActionExecute(Sender: TObject);
begin
  Timerr := TTimer.Create(Timerr);
  Timerr.Enabled:=False;
  Timerr.Interval:=5000;
  Timerr.OnTimer:=TimerrTimer;
  Timerr.Enabled:=True;
  Timerrr := TTimer.Create(Timerrr);
  Timerrr.Enabled:=False;
  Timerrr.Interval:=1;
  Timerrr.OnTimer:=TimerrrTimer;
  Timerrr.Enabled:=True;
end;

destructor TPlugin.Destroy;
begin
  Host.UnregisterAction(ASomeAction);
  ASomeAction.Free;
  inherited;
end;

function PluginLoad: IPlugin; stdcall;
begin
  Result := TPlugin.Create;
end;

exports
  PluginLoad name PLUGINLOAD_ENTRY_POINT;

begin
end.

