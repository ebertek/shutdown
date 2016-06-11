unit Unit2;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, bsPolyglotUn, SUIForm;

type
  Tabout = class(TForm)
    suiForm1: TsuiForm;
    Panel1: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    OKButton: TButton;
    bsT2: TbsPolyglotTranslator;
    bsM2: TbsPolyglotManager;
    Label1: TLabel;
    procedure Label1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  about: Tabout;

implementation

{$R *.dfm}

procedure Tabout.Label1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ProgramIcon.Visible:=not ProgramIcon.Visible;
end;

end.

