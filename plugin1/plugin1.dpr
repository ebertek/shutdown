library plugin1;

uses
  Windows, Messages,
  SysUtils, Classes, ActnList, PSInterface;

{$R *.RES}

type
  TPlugin = class (TInterfacedObject, IPlugin)
  private
    Host: IHost;
    ASomeAction: TAction;
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

procedure TPlugin.ASomeActionExecute(Sender: TObject);
begin
(*
Power Off (1st: foce applications to exit. 2nd: normal):
    MyExitWindows(EWX_POWEROFF or EWX_FORCE)
    MyExitWindows(EWX_POWEROFF);

Shutdown (1st: foce applications to exit. 2nd: normal):
    MyExitWindows(EWX_SHUTDOWN or EWX_FORCE)
    MyExitWindows(EWX_SHUTDOWN);

Reboot (1st: foce applications to exit. 2nd: normal):
    MyExitWindows(EWX_REBOOT or EWX_FORCE)
    MyExitWindows(EWX_REBOOT);

Log Off (1st: foce applications to exit. 2nd: normal):
    MyExitWindows(EWX_LOGOFF or EWX_FORCE)
    MyExitWindows(EWX_LOGOFF);

Hibernate:
ShellExecute(Handle, 'open', 'rundll32.exe', PChar ('Powrprof.dll,SetSuspendState'), nil, SW_SHOWNORMAL);

Lock Workstation:
WinExec('rundll32.exe user32.dll,LockWorkStation', SW_SHOWNORMAL);

Empty Recycle Bin:
SHEmptyRecycleBin(self.handle,'',SHERB_NOCONFIRMATION);

Clear Clipboard:
Clipboard.Clear;

Turn Monitor 1st: off, 2nd: on:
  SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
  SendMessage(Application.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, - 1);

This plugin will turn off the monitor, wait 2 secs and turn it on again
*)
  SendMessage(Host.GetApplication.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, 2);
  Sleep(5000);
  SendMessage(Host.GetApplication.Handle, WM_SYSCOMMAND, SC_MONITORPOWER, - 1);
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
