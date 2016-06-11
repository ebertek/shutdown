program Project1;

{%ToDo 'Project1.todo'}

uses
  Forms,
  Unit1 in 'Unit1.pas' {Shutdown},
  Unit2 in 'Unit2.pas' {about},
  Unit3 in 'Unit3.pas' {countd},
  Unit5 in 'Unit5.pas' {SplashForm};

{$R *.res}

begin
  SplashForm := TSplashForm.Create(Application);
  try
    SplashForm.Show;
    Application.Initialize;
    Application.Title := 'Shutdown Monster';
    SplashForm.Update;
    Application.CreateForm(TShutdown, Shutdown);
    Shutdown.DoStart;
    SplashForm.Hide;
  finally
    SplashForm.Free;
  end;
  Application.Run;
end.
