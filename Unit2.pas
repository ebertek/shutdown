unit Unit2;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, SUIForm;

type
  Tabout = class(TForm)
    suiForm1: TsuiForm;
    Panel1: TPanel;
    ProductName: TLabel;
    Version: TLabel;
    BitBtn1: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  about: Tabout;

implementation

{$R *.dfm}

procedure Tabout.SpeedButton1Click(Sender: TObject);
begin
  Close;
end;

end.

