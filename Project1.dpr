program Project1;

{%ToDo 'Project1.todo'}

uses
  Forms,
  Unit1 in 'Unit1.pas' {Shutdown},
  Unit2 in 'Unit2.pas' {about};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Shutdown Monster';
  Application.CreateForm(TShutdown, Shutdown);
  Application.CreateForm(Tabout, about);
  Application.Run;
end.
