object frMainForm: TfrMainForm
  Left = 0
  Top = 0
  Caption = #1052#1086#1085#1080#1090#1086#1088#1080#1085#1075' '#1086#1090#1075#1088#1091#1079#1082#1080' '#1090#1086#1074#1072#1088#1086#1074
  ClientHeight = 719
  ClientWidth = 1280
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnResize = FormResize
  TextHeight = 15
  object pnMapWrap: TPanel
    Left = 0
    Top = 0
    Width = 1280
    Height = 696
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 1270
    ExplicitHeight = 664
    object spMapPoint: TShape
      AlignWithMargins = True
      Left = 72
      Top = 125
      Width = 14
      Height = 14
      Brush.Color = clLime
      Shape = stCircle
      Visible = False
    end
    object pbMap: TPaintBox
      Left = 1
      Top = 1
      Width = 1278
      Height = 694
      Align = alClient
      OnMouseMove = pbMapMouseMove
      OnMouseUp = imgMapMouseUp
      OnPaint = pbMapPaint
      ExplicitTop = 0
    end
    object pnCreateSelect: TPanel
      Left = 80
      Top = 6
      Width = 145
      Height = 127
      AutoSize = True
      ParentBackground = False
      TabOrder = 0
      Visible = False
      object btnCreateSelectShop: TButton
        Tag = 1
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 133
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1084#1072#1075#1072#1079#1080#1085
        TabOrder = 0
        OnClick = btnCreateSelectClick
      end
      object btnCreateSelectWarehouse: TButton
        Tag = 2
        AlignWithMargins = True
        Left = 6
        Top = 46
        Width = 133
        Height = 30
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1089#1082#1083#1072#1076
        TabOrder = 1
        OnClick = btnCreateSelectClick
      end
      object btnCreateSelectCancel: TButton
        AlignWithMargins = True
        Left = 6
        Top = 96
        Width = 133
        Height = 25
        Margins.Left = 5
        Margins.Top = 15
        Margins.Right = 5
        Margins.Bottom = 5
        Align = alTop
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 2
        OnClick = btnCreateSelectCancelClick
      end
    end
    object pnCreateObj: TPanel
      Left = 410
      Top = 6
      Width = 258
      Height = 206
      AutoSize = True
      Ctl3D = True
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 1
      Visible = False
      object lbCreateObjName: TLabel
        Left = 11
        Top = 14
        Width = 55
        Height = 15
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
      end
      object lbCreateObjStreet: TLabel
        Left = 13
        Top = 43
        Width = 37
        Height = 15
        Caption = #1059#1083#1080#1094#1072':'
      end
      object lbCreateObjHouse: TLabel
        Left = 13
        Top = 72
        Width = 27
        Height = 15
        Caption = #1044#1086#1084':'
      end
      object lbCreateObjBuilding: TLabel
        Left = 13
        Top = 101
        Width = 43
        Height = 15
        Caption = #1050#1086#1088#1087#1091#1089':'
      end
      object lbCreateObjCapacity: TLabel
        Left = 13
        Top = 130
        Width = 105
        Height = 15
        Caption = #1042#1084#1077#1089#1090#1080#1084#1086#1089#1090#1100' ('#1091'.'#1077'.):'
      end
      object edCreateObjName: TEdit
        Left = 125
        Top = 11
        Width = 121
        Height = 23
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnExit = OnClickValidateLength
      end
      object edCreateObjStreet: TEdit
        Left = 125
        Top = 40
        Width = 121
        Height = 23
        TabOrder = 1
        OnExit = OnClickvalidateAll
      end
      object edCreateObjHouse: TEdit
        Left = 125
        Top = 69
        Width = 121
        Height = 23
        NumbersOnly = True
        TabOrder = 2
        OnExit = OnClickValidateLength
      end
      object btnCreateObjConfirm: TButton
        Left = 133
        Top = 170
        Width = 114
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = #1057#1086#1079#1076#1072#1090#1100
        TabOrder = 3
        OnClick = btnCreateObjConfirmClick
      end
      object btnCreateObjCancel: TButton
        Left = 13
        Top = 170
        Width = 114
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 4
        OnClick = btnCreateObjCancelClick
      end
      object edCreateObjBuilding: TEdit
        Left = 125
        Top = 98
        Width = 121
        Height = 23
        NumbersOnly = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        TextHint = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
      end
      object edCreateObjCapacity: TEdit
        Left = 124
        Top = 127
        Width = 121
        Height = 23
        NumbersOnly = True
        TabOrder = 6
        OnExit = OnClickValidateLength
      end
    end
    object pnSelectObject: TPanel
      Left = 231
      Top = 6
      Width = 173
      Height = 105
      AutoSize = True
      ParentBackground = False
      TabOrder = 2
      Visible = False
      object btnSelectObjEdit: TButton
        AlignWithMargins = True
        Left = 6
        Top = 6
        Width = 75
        Height = 25
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 0
        OnClick = btnSelectObjEditClick
      end
      object btnSelectObjDelete: TButton
        AlignWithMargins = True
        Left = 92
        Top = 6
        Width = 75
        Height = 25
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #1059#1076#1072#1083#1080#1090#1100
        TabOrder = 1
        OnClick = btnSelectObjDeleteClick
      end
      object btnSelectObjCancel: TButton
        AlignWithMargins = True
        Left = 6
        Top = 74
        Width = 160
        Height = 25
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 2
        OnClick = btnSelectObjCancelClick
      end
      object btnSelectObjItemList: TButton
        AlignWithMargins = True
        Left = 6
        Top = 40
        Width = 160
        Height = 25
        Margins.Left = 5
        Margins.Top = 5
        Margins.Right = 5
        Margins.Bottom = 5
        Caption = #1057#1087#1080#1089#1086#1082' '#1090#1086#1074#1072#1088#1086#1074
        TabOrder = 3
        OnClick = btnSelectObjItemListClick
      end
    end
    object pnEditObj: TPanel
      Left = 674
      Top = 6
      Width = 258
      Height = 206
      AutoSize = True
      Ctl3D = True
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 3
      Visible = False
      object lbEditObjName: TLabel
        Left = 11
        Top = 14
        Width = 55
        Height = 15
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
      end
      object lbEditObjStreet: TLabel
        Left = 13
        Top = 43
        Width = 37
        Height = 15
        Caption = #1059#1083#1080#1094#1072':'
      end
      object lbEditObjHouse: TLabel
        Left = 13
        Top = 72
        Width = 27
        Height = 15
        Caption = #1044#1086#1084':'
      end
      object lbEditObjBuilding: TLabel
        Left = 13
        Top = 101
        Width = 43
        Height = 15
        Caption = #1050#1086#1088#1087#1091#1089':'
      end
      object lbEditObjCapacity: TLabel
        Left = 13
        Top = 130
        Width = 105
        Height = 15
        Caption = #1042#1084#1077#1089#1090#1080#1084#1086#1089#1090#1100' ('#1091'.'#1077'.):'
      end
      object edEditObjName: TEdit
        Left = 125
        Top = 11
        Width = 121
        Height = 23
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnExit = OnClickValidateLength
      end
      object edEditObjStreet: TEdit
        Left = 125
        Top = 40
        Width = 121
        Height = 23
        TabOrder = 1
        OnExit = OnClickvalidateAll
      end
      object edEditObjHouse: TEdit
        Left = 125
        Top = 69
        Width = 121
        Height = 23
        NumbersOnly = True
        TabOrder = 2
        OnExit = OnClickValidateLength
      end
      object btnEditObjConfirm: TButton
        Left = 133
        Top = 170
        Width = 114
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = #1048#1079#1084#1077#1085#1080#1090#1100
        TabOrder = 3
        OnClick = btnEditObjConfirmClick
      end
      object btnEditObjCancel: TButton
        Left = 13
        Top = 170
        Width = 114
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 4
        OnClick = btnEditObjCancelClick
      end
      object edEditObjBuilding: TEdit
        Left = 125
        Top = 98
        Width = 121
        Height = 23
        NumbersOnly = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        TextHint = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
      end
      object edEditObjCapacity: TEdit
        Left = 124
        Top = 127
        Width = 121
        Height = 23
        NumbersOnly = True
        TabOrder = 6
        OnExit = OnClickValidateLength
      end
    end
    object pnObjectInfo: TPanel
      Left = 349
      Top = 444
      Width = 224
      Height = 246
      AutoSize = True
      Ctl3D = True
      Padding.Left = 10
      Padding.Top = 5
      Padding.Right = 10
      Padding.Bottom = 10
      ParentBackground = False
      ParentCtl3D = False
      TabOrder = 4
      Visible = False
      object lbObjInfoName: TLabel
        Left = 24
        Top = 46
        Width = 55
        Height = 15
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077':'
      end
      object lbObjInfoStreet: TLabel
        Left = 24
        Top = 75
        Width = 37
        Height = 15
        Caption = #1059#1083#1080#1094#1072':'
      end
      object lbObjInfoHouse: TLabel
        Left = 24
        Top = 104
        Width = 27
        Height = 15
        Caption = #1044#1086#1084':'
      end
      object lbObjInfoBuilding: TLabel
        Left = 24
        Top = 133
        Width = 43
        Height = 15
        Caption = #1050#1086#1088#1087#1091#1089':'
      end
      object lbObjInfoCapacity: TLabel
        Left = 24
        Top = 162
        Width = 105
        Height = 15
        Caption = #1042#1084#1077#1089#1090#1080#1084#1086#1089#1090#1100' ('#1091'.'#1077'.):'
      end
      object lbObjInfoNameVal: TLabel
        Left = 136
        Top = 46
        Width = 56
        Height = 15
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbObjInfoStreetVal: TLabel
        Left = 136
        Top = 75
        Width = 35
        Height = 15
        Caption = #1059#1083#1080#1094#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbObjInfoHouseVal: TLabel
        Left = 136
        Top = 104
        Width = 25
        Height = 15
        Caption = #1044#1086#1084
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbObjInfoBuildingVal: TLabel
        Left = 136
        Top = 133
        Width = 41
        Height = 15
        Caption = #1050#1086#1088#1087#1091#1089
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbObjInfoCapacityVal: TLabel
        Left = 136
        Top = 162
        Width = 77
        Height = 15
        Caption = #1042#1084#1077#1089#1090#1080#1084#1086#1089#1090#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbObjInfoTitle: TLabel
        AlignWithMargins = True
        Left = 11
        Top = 6
        Width = 202
        Height = 30
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Alignment = taCenter
        Caption = #1058#1080#1087' '#1086#1073#1098#1077#1082#1090#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 30
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 127
      end
      object lbObjInfoUsedCapacity: TLabel
        Left = 24
        Top = 191
        Width = 70
        Height = 15
        Caption = #1047#1072#1085#1103#1090#1086' ('#1091'.'#1077'.):'
      end
      object lbObjInfoUsedCapacityVal: TLabel
        Left = 136
        Top = 191
        Width = 39
        Height = 15
        Caption = #1047#1072#1085#1103#1090#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbObjInfoId: TLabel
        Left = 24
        Top = 220
        Width = 14
        Height = 15
        Caption = 'ID:'
      end
      object lbObjInfoIdVal: TLabel
        Left = 136
        Top = 220
        Width = 10
        Height = 15
        Caption = 'id'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnFilter: TPanel
      Left = 1021
      Top = 622
      Width = 258
      Height = 74
      AutoSize = True
      ParentBackground = False
      TabOrder = 5
      object btnFilter: TButton
        AlignWithMargins = True
        Left = 29
        Top = 11
        Width = 200
        Height = 52
        Cursor = crHandPoint
        Margins.Left = 28
        Margins.Top = 10
        Margins.Right = 28
        Margins.Bottom = 10
        Align = alRight
        Caption = #1060#1080#1083#1100#1090#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 32
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnClick = btnFilterClick
      end
    end
    object pnFilterParams: TPanel
      Left = 349
      Top = 218
      Width = 370
      Height = 222
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      ParentBackground = False
      TabOrder = 6
      Visible = False
      object pnFilterButtons: TPanel
        AlignWithMargins = True
        Left = 11
        Top = 186
        Width = 348
        Height = 25
        Margins.Left = 0
        Margins.Top = 20
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        Ctl3D = False
        ParentBackground = False
        ParentColor = True
        ParentCtl3D = False
        TabOrder = 0
        object btnFilterCancel: TButton
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 90
          Height = 25
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = #1054#1090#1084#1077#1085#1072
          TabOrder = 0
          OnClick = btnFilterCancelClick
        end
        object btnFilterDefault: TButton
          AlignWithMargins = True
          Left = 129
          Top = 0
          Width = 90
          Height = 25
          Margins.Left = 39
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = #1057#1073#1088#1086#1089#1080#1090#1100
          TabOrder = 1
          OnClick = btnFilterDefaultClick
        end
        object btnFilterConfirm: TButton
          Left = 258
          Top = 0
          Width = 90
          Height = 25
          Align = alRight
          Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
          TabOrder = 2
          OnClick = btnFilterConfirmClick
        end
      end
      object pnFilterParamsType: TPanel
        Left = 11
        Top = 11
        Width = 348
        Height = 22
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object lbFilterType: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 24
          Height = 22
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = #1058#1080#1087':'
          ExplicitHeight = 15
        end
        object cbFilterTypeShop: TCheckBox
          AlignWithMargins = True
          Left = 180
          Top = 0
          Width = 70
          Height = 22
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 41
          Margins.Bottom = 0
          Align = alRight
          Caption = #1052#1072#1075#1072#1079#1080#1085
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object cbFilterTypeWarehouse: TCheckBox
          AlignWithMargins = True
          Left = 291
          Top = 0
          Width = 57
          Height = 22
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alRight
          Caption = #1057#1082#1083#1072#1076
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object pnFilterParamsStreet: TPanel
        AlignWithMargins = True
        Left = 11
        Top = 38
        Width = 348
        Height = 22
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object lbFilterStreet: TLabel
          Left = 0
          Top = 0
          Width = 37
          Height = 22
          Align = alLeft
          Caption = #1059#1083#1080#1094#1072':'
          ExplicitHeight = 15
        end
        object edFilterStreetVal: TEdit
          Left = 180
          Top = 0
          Width = 168
          Height = 22
          Align = alRight
          TabOrder = 0
          TextHint = #1051#1102#1073#1072#1103
          OnChange = OnClickValidateLetters
          ExplicitHeight = 23
        end
      end
      object pnFilterParamsHouse: TPanel
        AlignWithMargins = True
        Left = 11
        Top = 65
        Width = 348
        Height = 22
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object lbFilterHouse: TLabel
          Left = 0
          Top = 0
          Width = 27
          Height = 22
          Align = alLeft
          Caption = #1044#1086#1084':'
          ExplicitHeight = 15
        end
        object edFilterHouseVal: TEdit
          Left = 180
          Top = 0
          Width = 168
          Height = 22
          Align = alRight
          NumbersOnly = True
          TabOrder = 0
          TextHint = #1051#1102#1073#1086#1081
          ExplicitHeight = 23
        end
      end
      object pnFilterParamsBuilding: TPanel
        AlignWithMargins = True
        Left = 11
        Top = 92
        Width = 348
        Height = 22
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
        object lbFilterBuilding: TLabel
          Left = 0
          Top = 0
          Width = 158
          Height = 22
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Caption = #1050#1086#1088#1087#1091#1089' (0, '#1077#1089#1083#1080' '#1086#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090'):'
          ExplicitHeight = 15
        end
        object edFilterBuildingVal: TEdit
          Left = 180
          Top = 0
          Width = 168
          Height = 22
          Align = alRight
          NumbersOnly = True
          TabOrder = 0
          TextHint = #1051#1102#1073#1086#1081
          ExplicitHeight = 23
        end
      end
      object pnFilterParamsCapacity: TPanel
        AlignWithMargins = True
        Left = 11
        Top = 119
        Width = 348
        Height = 22
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
        object lbFilterCapacityFrom: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 91
          Height = 22
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 90
          Margins.Bottom = 0
          Align = alLeft
          Caption = #1042#1084#1077#1089#1090#1080#1084#1086#1089#1090#1100' '#1086#1090' '
          ExplicitHeight = 15
        end
        object lbFilterCapacityTo: TLabel
          AlignWithMargins = True
          Left = 258
          Top = 0
          Width = 13
          Height = 22
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Align = alLeft
          Caption = #1076#1086
          ExplicitHeight = 15
        end
        object edFilterCapacityFromVal: TEdit
          AlignWithMargins = True
          Left = 181
          Top = 0
          Width = 67
          Height = 22
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Align = alLeft
          NumbersOnly = True
          TabOrder = 0
          TextHint = #1052#1080#1085#1080#1084#1091#1084
          OnChange = edFilterCapacityFromValChange
          OnExit = edFilterCapacityFromValExit
          ExplicitHeight = 23
        end
        object edFilterCapacityToVal: TEdit
          AlignWithMargins = True
          Left = 281
          Top = 0
          Width = 67
          Height = 22
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Align = alLeft
          NumbersOnly = True
          TabOrder = 1
          TextHint = #1052#1072#1082#1089#1080#1084#1091#1084
          OnChange = edFilterCapacityToValChange
          OnExit = edFilterCapacityToValExit
          ExplicitHeight = 23
        end
      end
      object pnFilterParamsUsedCapacity: TPanel
        AlignWithMargins = True
        Left = 11
        Top = 146
        Width = 348
        Height = 20
        Margins.Left = 0
        Margins.Top = 5
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 6
        object lbFilterUsedCapacityFrom: TLabel
          AlignWithMargins = True
          Left = 0
          Top = 0
          Width = 91
          Height = 20
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 90
          Margins.Bottom = 0
          Align = alLeft
          AutoSize = False
          Caption = #1047#1072#1085#1103#1090#1086' '#1086#1090' '
          ExplicitLeft = 90
        end
        object lbFilterUsedCapacityTo: TLabel
          AlignWithMargins = True
          Left = 258
          Top = 0
          Width = 13
          Height = 20
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Align = alLeft
          Caption = #1076#1086
          ExplicitHeight = 15
        end
        object edFilterUsedCapacityFromVal: TEdit
          AlignWithMargins = True
          Left = 181
          Top = 0
          Width = 67
          Height = 20
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Align = alLeft
          NumbersOnly = True
          TabOrder = 0
          TextHint = #1052#1080#1085#1080#1084#1091#1084
          OnChange = edFilterUsedCapacityFromValChange
          OnExit = edFilterUsedCapacityFromValExit
          ExplicitHeight = 23
        end
        object edFilterUsedCapacityToVal: TEdit
          AlignWithMargins = True
          Left = 281
          Top = 0
          Width = 67
          Height = 20
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 10
          Margins.Bottom = 0
          Align = alLeft
          NumbersOnly = True
          TabOrder = 1
          TextHint = #1052#1072#1082#1089#1080#1084#1091#1084
          OnChange = edFilterUsedCapacityToValChange
          OnExit = edFilterUsedCapacityToValExit
          ExplicitHeight = 23
        end
      end
    end
    object pnCreateShipment: TPanel
      Left = 8
      Top = 151
      Width = 335
      Height = 391
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      ParentBackground = False
      TabOrder = 7
      Visible = False
      DesignSize = (
        335
        391)
      object lbCreateShipment: TLabel
        Left = 11
        Top = 11
        Width = 313
        Height = 30
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1086#1090#1075#1088#1091#1079#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 30
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = -29
        ExplicitTop = 78
        ExplicitWidth = 301
      end
      object lbCreateShipmentName: TLabel
        Left = 24
        Top = 57
        Width = 106
        Height = 15
        Anchors = [akLeft, akBottom]
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1090#1075#1088#1091#1079#1082#1080':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lbCreateShipmentSenderName: TLabel
        Left = 24
        Top = 115
        Width = 137
        Height = 15
        Anchors = [akLeft, akBottom]
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100' ('#1053#1072#1079#1074#1072#1085#1080#1077'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitTop = 72
      end
      object lbCreateShipmentDestName: TLabel
        Left = 24
        Top = 202
        Width = 132
        Height = 15
        Anchors = [akLeft, akBottom]
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' ('#1053#1072#1079#1074#1072#1085#1080#1077'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitTop = 159
      end
      object lbCreateShipmentItemName: TLabel
        Left = 24
        Top = 260
        Width = 95
        Height = 15
        Anchors = [akLeft, akBottom]
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lbCreateShipmentCnt: TLabel
        Left = 24
        Top = 318
        Width = 68
        Height = 15
        Anchors = [akLeft, akBottom]
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitTop = 275
      end
      object lbCreateShipmentSenderID: TLabel
        Left = 24
        Top = 144
        Width = 96
        Height = 15
        Anchors = [akLeft, akBottom]
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100' (ID):'
        ExplicitTop = 101
      end
      object lbCreateShipmentDestID: TLabel
        Left = 24
        Top = 231
        Width = 91
        Height = 15
        Anchors = [akLeft, akBottom]
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' (ID):'
        ExplicitTop = 188
      end
      object lbCreateShipmentItemID: TLabel
        Left = 24
        Top = 289
        Width = 89
        Height = 15
        Anchors = [akLeft, akBottom]
        Caption = #1040#1088#1090#1080#1082#1091#1083' '#1090#1086#1074#1072#1088#1072':'
        ExplicitTop = 246
      end
      object lbCreateShipmentSenderType: TLabel
        Left = 24
        Top = 86
        Width = 96
        Height = 15
        Anchors = [akLeft, akBottom]
        Caption = #1058#1080#1087' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103':'
        ExplicitTop = 43
      end
      object lbCreateShipmentDestType: TLabel
        Left = 24
        Top = 173
        Width = 91
        Height = 15
        Anchors = [akLeft, akBottom]
        Caption = #1058#1080#1087' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103':'
        ExplicitTop = 130
      end
      object edCreateShipmentName: TEdit
        Left = 171
        Top = 54
        Width = 141
        Height = 23
        Anchors = [akLeft, akBottom]
        TabOrder = 0
        TextHint = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
      end
      object edCreateShipmentSenderName: TEdit
        Left = 171
        Top = 112
        Width = 141
        Height = 23
        Anchors = [akLeft, akBottom]
        TabOrder = 1
        OnExit = edCreateShipmentSenderNameExit
      end
      object edCreateShipmentSenderID: TEdit
        Left = 171
        Top = 141
        Width = 141
        Height = 23
        Anchors = [akLeft, akBottom]
        NumbersOnly = True
        TabOrder = 2
        OnExit = edCreateShipmentSenderIDExit
      end
      object edCreateShipmentDestName: TEdit
        Left = 171
        Top = 199
        Width = 141
        Height = 23
        Anchors = [akLeft, akBottom]
        TabOrder = 3
        OnExit = edCreateShipmentDestNameExit
      end
      object edCreateShipmentDestID: TEdit
        Left = 171
        Top = 228
        Width = 141
        Height = 23
        Anchors = [akLeft, akBottom]
        NumbersOnly = True
        TabOrder = 4
        OnExit = edCreateShipmentDestIDExit
      end
      object edCreateShipmentItemName: TEdit
        Left = 171
        Top = 257
        Width = 141
        Height = 23
        Anchors = [akLeft, akBottom]
        TabOrder = 5
        OnExit = edCreateShipmentItemNameExit
      end
      object edCreateShipmentItemID: TEdit
        Left = 171
        Top = 286
        Width = 141
        Height = 23
        Anchors = [akLeft, akBottom]
        NumbersOnly = True
        TabOrder = 6
        OnExit = edCreateShipmentItemIDExit
      end
      object edCreateShipmentCnt: TEdit
        Left = 171
        Top = 315
        Width = 141
        Height = 23
        Anchors = [akLeft, akBottom]
        NumbersOnly = True
        TabOrder = 7
      end
      object btnCreateShipmentCancel: TButton
        Left = 24
        Top = 355
        Width = 140
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Anchors = [akLeft, akBottom]
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 8
        OnClick = btnCreateShipmentCancelClick
      end
      object btnCreateShipmentConfirm: TButton
        Left = 171
        Top = 355
        Width = 140
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Anchors = [akLeft, akBottom]
        Caption = #1057#1086#1079#1076#1072#1090#1100
        TabOrder = 9
        OnClick = btnCreateShipmentConfirmClick
      end
      object pnCreateShipmentSenderType: TPanel
        Left = 171
        Top = 81
        Width = 135
        Height = 23
        Anchors = [akLeft, akBottom]
        AutoSize = True
        BevelOuter = bvNone
        Ctl3D = False
        Padding.Left = 3
        Padding.Top = 3
        Padding.Right = 3
        Padding.Bottom = 3
        ParentBackground = False
        ParentColor = True
        ParentCtl3D = False
        TabOrder = 10
        DesignSize = (
          135
          23)
        object rbCreateShipmentSenderShop: TRadioButton
          Left = 3
          Top = 3
          Width = 81
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = #1052#1072#1075#1072#1079#1080#1085
          TabOrder = 0
          OnClick = rbCreateShipmentSenderShopClick
        end
        object rbCreateShipmentSenderWarehouse: TRadioButton
          Left = 77
          Top = 3
          Width = 55
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = #1057#1082#1083#1072#1076
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = rbCreateShipmentSenderWarehouseClick
        end
      end
      object pnCreateShipmentDestType: TPanel
        Left = 171
        Top = 168
        Width = 135
        Height = 25
        Anchors = [akLeft, akBottom]
        AutoSize = True
        BevelOuter = bvNone
        Ctl3D = False
        Padding.Left = 3
        Padding.Top = 3
        Padding.Right = 3
        Padding.Bottom = 3
        ParentBackground = False
        ParentColor = True
        ParentCtl3D = False
        TabOrder = 11
        DesignSize = (
          135
          25)
        object rbCreateShipmentDestShop: TRadioButton
          Left = 3
          Top = 5
          Width = 81
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = #1052#1072#1075#1072#1079#1080#1085
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbCreateShipmentDestShopClick
        end
        object rbCreateShipmentDestWarehouse: TRadioButton
          Left = 77
          Top = 3
          Width = 55
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = #1057#1082#1083#1072#1076
          TabOrder = 1
          OnClick = rbCreateShipmentDestWarehouseClick
        end
      end
    end
    object pnAddItem: TPanel
      Left = 725
      Top = 324
      Width = 353
      Height = 305
      AutoSize = True
      Padding.Left = 10
      Padding.Top = 10
      Padding.Right = 10
      Padding.Bottom = 10
      ParentBackground = False
      TabOrder = 8
      Visible = False
      object lbAddItem: TLabel
        Left = 11
        Top = 11
        Width = 331
        Height = 30
        Align = alTop
        Alignment = taCenter
        AutoSize = False
        Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1090#1086#1074#1072#1088#1072
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 30
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitLeft = -13
        ExplicitTop = -5
      end
      object lbAddItemType: TLabel
        Left = 11
        Top = 117
        Width = 91
        Height = 15
        Caption = #1058#1080#1087' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103':'
      end
      object lbAddItemName: TLabel
        Left = 11
        Top = 59
        Width = 95
        Height = 15
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1090#1086#1074#1072#1088#1072':'
      end
      object lbAddItemDestName: TLabel
        Left = 11
        Top = 146
        Width = 132
        Height = 15
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' ('#1053#1072#1079#1074#1072#1085#1080#1077'):'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object lbAddItemDestID: TLabel
        Left = 11
        Top = 175
        Width = 91
        Height = 15
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100' (ID):'
      end
      object lbAddItemVol: TLabel
        Left = 11
        Top = 204
        Width = 162
        Height = 15
        Caption = #1054#1073#1098#1077#1084' '#1077#1076#1080#1085#1080#1094#1099' '#1090#1086#1074#1072#1088#1072' ('#1091'.'#1077'.):'
      end
      object lbAddItemCnt: TLabel
        Left = 11
        Top = 233
        Width = 151
        Height = 15
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1077#1076#1080#1085#1080#1094' '#1090#1086#1074#1072#1088#1072':'
      end
      object lbAddItemCategory: TLabel
        Left = 11
        Top = 88
        Width = 59
        Height = 15
        Caption = #1050#1072#1090#1077#1075#1086#1088#1080#1103':'
      end
      object pnAddItemType: TPanel
        Left = 201
        Top = 110
        Width = 135
        Height = 23
        AutoSize = True
        BevelOuter = bvNone
        Ctl3D = False
        Padding.Left = 3
        Padding.Top = 3
        Padding.Right = 3
        Padding.Bottom = 3
        ParentBackground = False
        ParentColor = True
        ParentCtl3D = False
        TabOrder = 0
        DesignSize = (
          135
          23)
        object rbAddItemTypeShop: TRadioButton
          Left = 3
          Top = 3
          Width = 81
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = #1052#1072#1075#1072#1079#1080#1085
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbAddItemTypeShopClick
        end
        object rbAddItemTypeWarehouse: TRadioButton
          Left = 77
          Top = 3
          Width = 55
          Height = 17
          Anchors = [akLeft, akBottom]
          Caption = #1057#1082#1083#1072#1076
          TabOrder = 1
          OnClick = rbAddItemTypeWarehouseClick
        end
      end
      object edAddItemName: TEdit
        Left = 201
        Top = 54
        Width = 141
        Height = 23
        TabOrder = 1
        OnExit = edAddItemNameExit
      end
      object edAddItemDestName: TEdit
        Left = 201
        Top = 141
        Width = 141
        Height = 23
        TabOrder = 2
        OnExit = edAddItemDestNameExit
      end
      object edAddItemDestID: TEdit
        Left = 201
        Top = 170
        Width = 141
        Height = 23
        NumbersOnly = True
        TabOrder = 3
        OnExit = edAddItemDestIDExit
      end
      object edAddItemVol: TEdit
        Left = 201
        Top = 199
        Width = 141
        Height = 23
        NumbersOnly = True
        TabOrder = 4
        OnExit = edAddItemVolExit
      end
      object edAddItemCnt: TEdit
        Left = 201
        Top = 228
        Width = 141
        Height = 23
        NumbersOnly = True
        TabOrder = 5
        OnExit = edAddItemCntExit
      end
      object btnAddItemCancel: TButton
        Left = 11
        Top = 269
        Width = 158
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = #1054#1090#1084#1077#1085#1072
        TabOrder = 6
        OnClick = btnAddItemCancelClick
      end
      object btnAddItemConfirm: TButton
        Left = 184
        Top = 269
        Width = 158
        Height = 25
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 7
        OnClick = btnAddItemConfirmClick
      end
      object edAddItemCategory: TEdit
        Left = 201
        Top = 83
        Width = 141
        Height = 23
        TabOrder = 8
        TextHint = #1054#1090#1089#1091#1090#1089#1090#1074#1091#1077#1090
      end
    end
    object pnArrowInfo: TPanel
      Left = 894
      Top = 13
      Width = 268
      Height = 346
      Cursor = crArrow
      AutoSize = True
      Padding.Left = 15
      Padding.Top = 5
      Padding.Right = 15
      Padding.Bottom = 15
      ParentBackground = False
      TabOrder = 9
      Visible = False
      object lbArrowInfoShipmentName: TLabel
        AlignWithMargins = True
        Left = 16
        Top = 6
        Width = 236
        Height = 30
        Margins.Left = 0
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alTop
        Alignment = taCenter
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1086#1090#1075#1088#1091#1079#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = 30
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ExplicitWidth = 194
      end
      object lbArrowInfoSenderType: TLabel
        Left = 16
        Top = 54
        Width = 99
        Height = 15
        Caption = #1058#1080#1087' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103': '
      end
      object lbArrowInfoSenderNameVal: TLabel
        Left = 155
        Top = 83
        Width = 75
        Height = 15
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbArrowInfoSenderName: TLabel
        Left = 16
        Top = 83
        Width = 74
        Height = 15
        Caption = #1054#1090#1087#1088#1072#1074#1080#1090#1077#1083#1100':'
      end
      object lbArrowInfoDestTypeVal: TLabel
        Left = 155
        Top = 141
        Width = 90
        Height = 15
        Caption = #1058#1080#1087' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbArrowInfoSenderID: TLabel
        Left = 16
        Top = 112
        Width = 86
        Height = 15
        Caption = 'ID '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103':'
      end
      object lbArrowInfoSenderIDVal: TLabel
        Left = 155
        Top = 112
        Width = 89
        Height = 15
        Caption = 'ID '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbArrowInfoDestName: TLabel
        Left = 16
        Top = 170
        Width = 69
        Height = 15
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100':'
      end
      object lbArrowInfoSenderTypeVal: TLabel
        Left = 155
        Top = 54
        Width = 97
        Height = 15
        Caption = #1058#1080#1087' '#1086#1090#1087#1088#1072#1074#1080#1090#1077#1083#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbArrowInfoDestType: TLabel
        Left = 16
        Top = 141
        Width = 91
        Height = 15
        Caption = #1058#1080#1087' '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103':'
      end
      object lbArrowInfoDestNameVal: TLabel
        Left = 155
        Top = 170
        Width = 68
        Height = 15
        Caption = #1055#1086#1083#1091#1095#1072#1090#1077#1083#1100
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbArrowInfoDestID: TLabel
        Left = 16
        Top = 199
        Width = 81
        Height = 15
        Caption = 'ID '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103':'
      end
      object lbArrowInfoDestIDVal: TLabel
        Left = 155
        Top = 199
        Width = 82
        Height = 15
        Caption = 'ID '#1087#1086#1083#1091#1095#1072#1090#1077#1083#1103
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbArrowInfoItemID: TLabel
        Left = 16
        Top = 257
        Width = 49
        Height = 15
        Caption = #1040#1088#1090#1080#1082#1091#1083':'
      end
      object lbArrowInfoItemIDVal: TLabel
        Left = 155
        Top = 257
        Width = 47
        Height = 15
        Caption = #1040#1088#1090#1080#1082#1091#1083
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbArrowInfoItemName: TLabel
        Left = 16
        Top = 228
        Width = 36
        Height = 15
        Caption = #1058#1086#1074#1072#1088':'
      end
      object lbArrowInfoItemNameVal: TLabel
        Left = 155
        Top = 228
        Width = 33
        Height = 15
        Caption = #1058#1086#1074#1072#1088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbArrowInfoItemCnt: TLabel
        Left = 16
        Top = 286
        Width = 68
        Height = 15
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086':'
      end
      object lbArrowInfoItemCntVal: TLabel
        Left = 155
        Top = 286
        Width = 69
        Height = 15
        Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbArrowInfoItemVol: TLabel
        Left = 16
        Top = 315
        Width = 92
        Height = 15
        Caption = #1054#1073#1098#1105#1084' '#1086#1090#1075#1088#1091#1079#1082#1080':'
      end
      object lbArrowInfoItemVolVal: TLabel
        Left = 155
        Top = 315
        Width = 94
        Height = 15
        Caption = #1054#1073#1098#1105#1084' '#1086#1090#1075#1088#1091#1079#1082#1080
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object pnHints: TPanel
    Left = 0
    Top = 696
    Width = 1280
    Height = 23
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 664
    ExplicitWidth = 1270
    object lbHints: TLabel
      AlignWithMargins = True
      Left = 8
      Top = 4
      Width = 232
      Height = 15
      Margins.Left = 7
      Align = alLeft
      Caption = #1053#1072#1078#1084#1080#1090#1077' '#1085#1072' '#1082#1072#1088#1090#1091' '#1095#1090#1086#1073#1099' '#1076#1086#1073#1072#1074#1080#1090#1100' '#1086#1073#1098#1077#1082#1090
      ExplicitLeft = 4
    end
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 26
    object File1: TMenuItem
      Caption = #1060#1072#1081#1083
      object Open1: TMenuItem
        Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100
        ShortCut = 16463
        OnClick = Open1Click
      end
      object Save1: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
        ShortCut = 16467
        OnClick = Save1Click
      end
    end
    object N4: TMenuItem
      Caption = #1054#1089#1090#1072#1090#1082#1080
      object N6: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100
        OnClick = N6Click
      end
    end
    object N10: TMenuItem
      Caption = #1054#1090#1075#1088#1091#1079#1082#1080
      object N11: TMenuItem
        Caption = #1057#1086#1079#1076#1072#1090#1100
        OnClick = N11Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
        object N3: TMenuItem
          Caption = #1042#1089#1077
          OnClick = N3Click
        end
        object N14: TMenuItem
          Caption = #1042#1099#1073#1088#1072#1090#1100
          OnClick = N14Click
        end
      end
      object N15: TMenuItem
        Caption = '-'
      end
      object N16: TMenuItem
        Caption = #1055#1086#1082#1072#1079#1072#1090#1100
        OnClick = N16Click
      end
    end
    object N12: TMenuItem
      Caption = #1058#1086#1074#1072#1088#1099
      object N13: TMenuItem
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        OnClick = N13Click
      end
    end
  end
end
