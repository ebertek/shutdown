unit Unit2;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, bsPolyglotUn, SUIForm, RxGIF;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  about: Tabout;

implementation

{$R *.dfm}

end.

