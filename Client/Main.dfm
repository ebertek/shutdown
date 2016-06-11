object Form2: TForm2
  Left = 233
  Top = 207
  Width = 670
  Height = 407
  Caption = 'Shutdown Monster Client'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 662
    Height = 373
    ActivePage = TabSheet5
    Align = alClient
    TabOrder = 0
    object TabSheet5: TTabSheet
      Caption = 'TabSheet5'
      ImageIndex = 4
      object Connect: TButton
        Left = 136
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Csatlakoz'#225's'
        TabOrder = 0
        OnClick = ConnectClick
      end
      object Edit1: TEdit
        Left = 8
        Top = 8
        Width = 121
        Height = 21
        TabOrder = 1
        Text = '127.0.0.1'
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object Calendar: TMonthCalendar
        Left = 8
        Top = 8
        Width = 169
        Height = 153
        Hint = 'Itt adhat'#243' meg a d'#225'tum'
        AutoSize = True
        Date = 32946.889029224530000000
        TabOrder = 0
        WeekNumbers = True
      end
      object Idopont: TDateTimePicker
        Left = 8
        Top = 168
        Width = 204
        Height = 21
        Hint = 'Itt adhat'#243' meg a konkr'#233't id'#337'pont'
        Date = 38024.000000000000000000
        Time = 38024.000000000000000000
        Kind = dtkTime
        TabOrder = 1
      end
      object Set1: TBitBtn
        Left = 240
        Top = 136
        Width = 61
        Height = 24
        Hint = 'A be'#225'll'#237't'#225'sok '#233'rv'#233'nybe hozatala'
        Caption = 'Be'#225'll'#237't'#225's'
        TabOrder = 2
        OnClick = Set1Click
      end
      object Canc1: TBitBtn
        Left = 240
        Top = 160
        Width = 61
        Height = 24
        Hint = 'A le'#225'll'#237't'#225's meg'#225'll'#237't'#225'sa'
        Caption = 'M'#233'gsem'
        Enabled = False
        TabOrder = 3
      end
      object Save1: TBitBtn
        Left = 304
        Top = 136
        Width = 24
        Height = 24
        Hint = 'Be'#225'll'#237't'#225'sok ment'#233'se'
        Enabled = False
        TabOrder = 4
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object DateTimePicker1: TDateTimePicker
        Left = 16
        Top = 16
        Width = 89
        Height = 21
        Hint = 'Itt adhat'#243' meg, hogy h'#225'ny perc m'#250'lva kapcsoljon ki a g'#233'p'#252'nk'
        Date = 38024.000000000000000000
        Time = 38024.000000000000000000
        Kind = dtkTime
        TabOrder = 0
      end
      object BitBtn3: TBitBtn
        Left = 112
        Top = 16
        Width = 61
        Height = 24
        Hint = 'A be'#225'll'#237't'#225'sok '#233'rv'#233'nybe hozatala'
        Caption = 'Be'#225'll'#237't'#225's'
        TabOrder = 1
        OnClick = BitBtn3Click
      end
      object BitBtn4: TBitBtn
        Left = 112
        Top = 40
        Width = 61
        Height = 24
        Hint = 'A le'#225'll'#237't'#225's meg'#225'll'#237't'#225'sa'
        Caption = 'M'#233'gsem'
        Enabled = False
        TabOrder = 2
      end
      object BitBtn5: TBitBtn
        Left = 176
        Top = 16
        Width = 24
        Height = 24
        Hint = 'Be'#225'll'#237't'#225'sok ment'#233'se'
        Enabled = False
        TabOrder = 3
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      object infoPing: TLabel
        Left = 16
        Top = 40
        Width = 237
        Height = 13
        Hint = 'Ha ez a f'#225'jl elt'#369'nik, akkor a sz'#225'm'#237't'#243'g'#233'p kikapcsol'
        Caption = 'Ha ez a f'#225'jl elt'#369'nik, akkor a sz'#225'm'#237't'#243'g'#233'p kikapcsol.'
      end
      object infoCheck: TLabel
        Left = 16
        Top = 72
        Width = 48
        Height = 13
        Hint = 'Ellen'#337'rz'#233's minden megadott percben'
        Caption = 'Ellen'#337'rz'#233's'
      end
      object eleres: TLMDFileOpenEdit
        Left = 16
        Top = 16
        Width = 183
        Height = 21
        Hint = 
          'Itt adhat'#243' meg az ellen'#337'r'#237'zend'#337' f'#225'jl nev'#233't. Aj'#225'nlatos kis m'#233'ret'#369 +
          ' f'#225'jlt megadni!'
        Bevel.Mode = bmWindows
        Caret.BlinkRate = 530
        TabOrder = 0
        CustomButtonWidth = 18
        Filter = 
          'Minden f'#225'jl (*.*)|*.*|Fontosabb f'#225'jlok (*.bat; *.com; *.exe)|*.b' +
          'at;*.com;*.exe'
        Filename = 'C:\autoexec.bat'
        FilenameOnly = False
      end
      object PingTime: TLMDSpinEdit
        Left = 16
        Top = 88
        Width = 124
        Height = 21
        Hint = 
          'Itt adhat'#243' meg, hogy h'#225'ny percenk'#233'nt ellen'#337'rizze a f'#225'jl jelenl'#233't' +
          #233't'
        Bevel.Mode = bmWindows
        Caret.BlinkRate = 530
        TabOrder = 1
        AutoSelect = True
        CustomButtons = <>
        Suffix = ' percenk'#233'nt'
        MinValue = 1
        MaxValue = 60
        Value = 10
        DateTime = 0.000000000000000000
      end
      object Set3: TBitBtn
        Left = 216
        Top = 72
        Width = 61
        Height = 24
        Hint = 'A be'#225'll'#237't'#225'sok '#233'rv'#233'nybe hozatala'
        Caption = 'Be'#225'll'#237't'#225's'
        TabOrder = 2
        OnClick = Set3Click
      end
      object Canc3: TBitBtn
        Left = 216
        Top = 96
        Width = 61
        Height = 24
        Hint = 'A le'#225'll'#237't'#225's meg'#225'll'#237't'#225'sa'
        Caption = 'M'#233'gsem'
        Enabled = False
        TabOrder = 3
      end
      object Save3: TBitBtn
        Left = 280
        Top = 72
        Width = 24
        Height = 24
        Hint = 'Be'#225'll'#237't'#225'sok ment'#233'se'
        Enabled = False
        TabOrder = 4
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333FFFFFFFFFFFFF33000077777770033377777777777773F000007888888
          00037F3337F3FF37F37F00000780088800037F3337F77F37F37F000007800888
          00037F3337F77FF7F37F00000788888800037F3337777777337F000000000000
          00037F3FFFFFFFFFFF7F00000000000000037F77777777777F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF00037F7F333333337F7F000FFFFFFFFF
          00037F7F333333337F7F000FFFFFFFFF07037F7F33333333777F000FFFFFFFFF
          0003737FFFFFFFFF7F7330099999999900333777777777777733}
        NumGlyphs = 2
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 3
      object SpeedButton1: TSpeedButton
        Left = 0
        Top = 272
        Width = 23
        Height = 22
        Hint = 'V'#233'grehajt'#225's'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FF33333333FF3330033333333
          00333377FF33333377FF300003333330000337777FFFFFF7777F000000000000
          000077777777777777770F88FFFF8FFF88F07F333F33333333370FFF9FFF8FFF
          FF707F337FF333FFFFF70FF999FF800000037F377733377777730FFF9FFF0888
          80337F3373337F3337330FFFFFFF088803337FFFFFFF7FFF7333700000000000
          3333777777777777F33333333339399939333333333337773333333333333393
          3333333333333373333333333333933393333333333333333333333333333393
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object PowerOff: TBitBtn
        Left = 0
        Top = 0
        Width = 161
        Height = 25
        Hint = 'Kikapcsolja a g'#233'pet, ha az ATX el'#233'rhet'#337
        Caption = '&Kikapcsol'#225's'
        TabOrder = 0
        OnClick = PowerOffClick
      end
      object ShutDown: TBitBtn
        Left = 0
        Top = 32
        Width = 161
        Height = 25
        Hint = 'Le'#225'll'#237'tja a g'#233'pet (Most m'#225'r kikapcsolhatja a sz'#225'm'#237't'#243'g'#233'pet)'
        Caption = '&Le'#225'll'#237't'#225's'
        TabOrder = 1
        OnClick = ShutDownClick
      end
      object ReBoot: TBitBtn
        Left = 0
        Top = 64
        Width = 161
        Height = 25
        Hint = #218'jraind'#237'tja a sz'#225'm'#237't'#243'g'#233'pet'
        Caption = '&'#218'jraind'#237't'#225's'
        TabOrder = 2
        OnClick = ReBootClick
      end
      object LogOff: TBitBtn
        Left = 0
        Top = 96
        Width = 161
        Height = 25
        Hint = 'Kijelentkezik a Windows-b'#243'l'
        Caption = 'K&ijelentkez'#233's'
        TabOrder = 3
        OnClick = LogOffClick
      end
      object Hibernate: TBitBtn
        Left = 0
        Top = 128
        Width = 161
        Height = 25
        Hint = 'Lefagyassza a sz'#225'm'#237't'#243'g'#233'pet'
        Caption = '&Hibern'#225'l'#225's'
        TabOrder = 4
        OnClick = HibernateClick
      end
      object LockWS: TBitBtn
        Left = 0
        Top = 160
        Width = 161
        Height = 25
        Hint = 'Lez'#225'rja a munka'#225'llom'#225'st'
        Caption = '&Z'#225'rol'#225's'
        TabOrder = 5
        OnClick = LockWSClick
      end
      object SSOn: TBitBtn
        Left = 0
        Top = 192
        Width = 161
        Height = 25
        Hint = 'Elind'#237'tja a k'#233'perny'#337'k'#237'm'#233'l'#337't'
        Caption = 'K'#233'perny'#337'&v'#233'd'#337
        TabOrder = 6
        OnClick = SSOnClick
      end
      object BitBtn1: TBitBtn
        Left = 0
        Top = 224
        Width = 161
        Height = 25
        Hint = 'Hang lej'#225'tsz'#225'sa'
        Caption = '&Riaszt'#225's'
        TabOrder = 7
        OnClick = BitBtn1Click
      end
      object SDMenu: TBitBtn
        Left = 320
        Top = 224
        Width = 161
        Height = 25
        Hint = 'Megjelen'#237'ti a Windows Kikapcsol'#225's men'#252'j'#233't'
        Caption = 'Kikapcsol'#225's &men'#252
        Enabled = False
        TabOrder = 8
        OnClick = SDMenuClick
      end
      object BitBtn2: TBitBtn
        Left = 320
        Top = 192
        Width = 161
        Height = 25
        Hint = 'Az ideiglenesen t'#225'rolt f'#225'jlok let'#246'rl'#233'se'
        Caption = 'Ideiglenesen t'#225'rolt f'#225'jlok t'#246'rl'#233'se'
        TabOrder = 9
        OnClick = BitBtn2Click
      end
      object mon1: TBitBtn
        Left = 320
        Top = 160
        Width = 161
        Height = 25
        Hint = 'Monitor bekapcsol'#225'sa'
        Caption = 'Monitor be'
        TabOrder = 10
        OnClick = mon1Click
      end
      object mon0: TBitBtn
        Left = 320
        Top = 128
        Width = 161
        Height = 25
        Hint = 'Monitor kikapcsol'#225'sa'
        Caption = 'Monitor ki'
        TabOrder = 11
        OnClick = mon0Click
      end
      object clipb: TBitBtn
        Left = 320
        Top = 96
        Width = 161
        Height = 25
        Hint = 'V'#225'g'#243'lap '#252'r'#237't'#233'se'
        Caption = 'V'#225'g'#243'lap '#252'r'#237't'#233'se'
        TabOrder = 12
        OnClick = clipbClick
      end
      object recbin: TBitBtn
        Left = 320
        Top = 64
        Width = 161
        Height = 25
        Hint = 'Lomt'#225'r '#252'r'#237't'#233'se'
        Caption = 'Lomt'#225'r '#252'r'#237't'#233'se'
        TabOrder = 13
        OnClick = recbinClick
      end
      object close: TBitBtn
        Left = 320
        Top = 32
        Width = 161
        Height = 25
        Hint = 'T'#225'lca visszah'#250'z'#225'sa'
        Caption = 'T'#225'lca visszah'#250'z'#225'sa'
        TabOrder = 14
        OnClick = closeClick
      end
      object eject: TBitBtn
        Left = 320
        Top = 0
        Width = 161
        Height = 25
        Hint = 'T'#225'lca kinyit'#225'sa'
        Caption = 'Lemez kiad'#225'sa'
        TabOrder = 15
        OnClick = ejectClick
      end
    end
  end
  object Client: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 381
    Left = 492
    Top = 120
  end
end
