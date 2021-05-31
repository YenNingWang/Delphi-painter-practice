object Form1: TForm1
  Left = 192
  Top = 125
  Width = 675
  Height = 531
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Card1: TCard
    Left = 280
    Top = 200
    Width = 71
    Height = 96
    Value = 1
    Suit = Hearts
    ShowDeck = False
    DeckType = Standard1
    OnClick = Card1Click
  end
  object Button1: TButton
    Left = 480
    Top = 200
    Width = 113
    Height = 105
    Caption = 'PRESS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -31
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object Panel1: TPanel
    Left = 192
    Top = 16
    Width = 249
    Height = 137
    Caption = 'Panel1'
    TabOrder = 1
    object Label1: TLabel
      Left = 0
      Top = 0
      Width = 249
      Height = 137
      AutoSize = False
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -40
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object UDPS: TIdUDPServer
    Active = True
    Bindings = <>
    DefaultPort = 3000
    OnUDPRead = UDPSUDPRead
    Left = 520
    Top = 48
  end
  object UDPC: TIdUDPClient
    Active = True
    Host = '134.208.51.204'
    Port = 4000
    Left = 576
    Top = 48
  end
end
