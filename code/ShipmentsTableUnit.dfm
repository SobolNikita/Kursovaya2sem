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
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goThumbTracking, goFixedRowDefAlign]
    ScrollBars = ssVertical
    TabOrder = 0
    OnDrawCell = sgShipmentsTableDrawCell
  end
end
