program PingClient;

uses
  Forms,
  Main in 'Main.pas' {Shutdown};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Shutdown Monster Client';
  Application.CreateForm(TShutdown, Shutdown);
  Application.Run;
end.
