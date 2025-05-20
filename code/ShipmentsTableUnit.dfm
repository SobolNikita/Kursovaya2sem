object frShipmentsTable: TfrShipmentsTable
  Left = 0
  Top = 0
  Caption = #1054#1090#1075#1088#1091#1079#1082#1080
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
  object sgShipmentsTable: TStringGrid
    Left = 0
    Top = 0
    Width = 1280
    Height = 720
    Align = alClient
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goThumbTracking, goFixedRowDefAlign]
    TabOrder = 0
    OnDrawCell = sgShipmentsTableDrawCell
    ExplicitWidth = 1270
    ExplicitHeight = 688
  end
end
