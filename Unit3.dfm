object countd: Tcountd
  Left = 285
  Top = 158
  AutoSize = True
  BorderIcons = []
  BorderStyle = bsNone
  ClientHeight = 446
  ClientWidth = 540
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object countd_label: TLabel
    Left = 0
    Top = 0
    Width = 540
    Height = 446
    Align = alClient
    Alignment = taCenter
    Caption = '10'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -467
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = countd_labelClick
  end
end
