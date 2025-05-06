object frBalance: TfrBalance
  Left = 0
  Top = 0
  Caption = #1054#1089#1090#1072#1090#1082#1080
  ClientHeight = 720
  ClientWidth = 1280
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnBalance: TPanel
    Left = 0
    Top = 640
    Width = 1280
    Height = 80
    Align = alBottom
    TabOrder = 0
    ExplicitTop = 608
    ExplicitWidth = 1270
  end
  object sgBalanceTable: TStringGrid
    Left = 0
    Top = 0
    Width = 1280
    Height = 640
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 1270
    ExplicitHeight = 608
  end
end
