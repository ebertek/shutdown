program PingClient;

uses
  Forms,
  Main in 'Main.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Shutdown Monster Client';
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
