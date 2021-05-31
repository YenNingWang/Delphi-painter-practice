object Form1: TForm1
  Left = 200
  Top = 132
  Width = 1121
  Height = 869
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Im: TImage
    Left = 217
    Top = 0
    Width = 671
    Height = 810
    Align = alClient
    OnMouseDown = ImMouseDown
    OnMouseMove = ImMouseMove
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 217
    Height = 810
    Align = alLeft
    BorderStyle = bsSingle
    TabOrder = 0
    object rg: TRadioGroup
      Left = 16
      Top = 8
      Width = 185
      Height = 345
      Caption = #30059#31558#31895#32048
      ItemIndex = 0
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10')
      TabOrder = 0
      OnClick = rgClick
    end
    object Panel2: TPanel
      Left = 16
      Top = 368
      Width = 185
      Height = 57
      Color = clRed
      TabOrder = 1
      OnClick = Panel2Click
    end
    object Panel3: TPanel
      Left = 16
      Top = 440
      Width = 185
      Height = 57
      Color = clBlue
      TabOrder = 2
      OnClick = Panel3Click
    end
    object Panel4: TPanel
      Left = 16
      Top = 512
      Width = 185
      Height = 57
      Color = clLime
      TabOrder = 3
      OnClick = Panel4Click
    end
    object Panel5: TPanel
      Left = 16
      Top = 584
      Width = 185
      Height = 57
      TabOrder = 4
    end
    object Panel6: TPanel
      Left = 16
      Top = 656
      Width = 185
      Height = 49
      TabOrder = 5
    end
    object Panel7: TPanel
      Left = 16
      Top = 720
      Width = 185
      Height = 57
      Caption = 'User Define'
      Color = clAppWorkSpace
      TabOrder = 6
      OnClick = Panel7Click
    end
  end
  object ListBox1: TListBox
    Left = 888
    Top = 0
    Width = 217
    Height = 810
    Align = alRight
    ItemHeight = 13
    TabOrder = 1
  end
  object cd: TColorDialog
    Left = 256
    Top = 56
  end
  object MainMenu1: TMainMenu
    Left = 296
    Top = 56
    object file1: TMenuItem
      Caption = 'file'
      object LoadFromFile1: TMenuItem
        Caption = 'Load From File'
        OnClick = LoadFromFile1Click
      end
      object oFile1: TMenuItem
        Caption = 'Save To File'
        OnClick = oFile1Click
      end
    end
    object Clear1: TMenuItem
      Caption = 'Clear'
      OnClick = Clear1Click
    end
    object ReSend1: TMenuItem
      Caption = 'ReSend'
    end
  end
  object SD: TSaveDialog
    Left = 256
    Top = 96
  end
  object OD: TOpenDialog
    Left = 296
    Top = 96
  end
  object UDPC: TIdUDPClient
    Host = '127.0.0.1'
    Port = 3333
    Left = 256
    Top = 136
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 500
    OnTimer = Timer1Timer
    Left = 296
    Top = 136
  end
end
