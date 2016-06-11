unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  Tcountd = class(TForm)
    countd_label: TLabel;
    procedure countd_labelClick(Sender: TObject);
    procedure CreateParams(Var Params: TCreateParams);override;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  countd: Tcountd;

implementation

uses Unit1;

{$R *.dfm}

procedure Tcountd.countd_labelClick(Sender: TObject);
begin
  Shutdown.EnMax;
  Shutdown.Start.AutoStart:=False;
  Shutdown.Timer1.Enabled:=False;
  Shutdown.Timer2.Enabled:=False;
  Shutdown.Most.UserValue:=0;
  Hide;
end;

procedure Tcountd.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do begin
    ExStyle := ExStyle or WS_EX_TOPMOST;
    WndParent := GetDesktopwindow;
  end;
end;

end.
