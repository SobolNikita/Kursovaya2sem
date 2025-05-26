object frTableForm: TfrTableForm
  Left = 0
  Top = 0
  Caption = #1057#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1086#1074
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
  OnResize = FormResize
  TextHeight = 15
  object pnItemsTableName: TPanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 97
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 1270
  end
  object sgItemsTable: TStringGrid
    Left = 0
    Top = 97
    Width = 1280
    Height = 623
    Align = alClient
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goFixedRowDefAlign]
    ScrollBars = ssVertical
    TabOrder = 1
    OnDrawCell = sgItemsTableDrawCell
    ExplicitWidth = 1270
    ExplicitHeight = 591
    RowHeights = (
      24
      24
      24
      24
      24)
  end
end
