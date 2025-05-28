object frSelectShipments: TfrSelectShipments
  Left = 0
  Top = 0
  Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
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
  object sgSelectShipmentsTable: TStringGrid
    Left = 0
    Top = 0
    Width = 1280
    Height = 656
    Align = alClient
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goFixedRowDefAlign]
    ScrollBars = ssVertical
    TabOrder = 0
    OnDrawCell = sgSelectShipmentsTableDrawCell
    OnTopLeftChanged = sgSelectShipmentsTableTopLeftChanged
    ExplicitWidth = 1270
    ExplicitHeight = 624
  end
  object pnSelectShipments: TPanel
    Left = 0
    Top = 656
    Width = 1280
    Height = 64
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 624
    ExplicitWidth = 1270
    object btnSelectConfirm: TButton
      Left = 1144
      Top = 16
      Width = 115
      Height = 33
      Cursor = crHandPoint
      Caption = #1054#1090#1075#1088#1091#1079#1080#1090#1100
      TabOrder = 0
      OnClick = btnSelectConfirmClick
    end
    object btnSelectAll: TButton
      Left = 1015
      Top = 16
      Width = 115
      Height = 33
      Cursor = crHandPoint
      Caption = #1042#1099#1073#1088#1072#1090#1100' '#1074#1089#1077
      TabOrder = 1
      OnClick = btnSelectAllClick
    end
    object btnSelectReset: TButton
      Left = 887
      Top = 16
      Width = 115
      Height = 33
      Cursor = crHandPoint
      Caption = #1057#1073#1088#1086#1089#1080#1090#1100
      TabOrder = 2
      OnClick = btnSelectResetClick
    end
  end
end
