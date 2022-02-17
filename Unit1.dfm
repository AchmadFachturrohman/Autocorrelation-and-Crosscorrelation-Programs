object Form1: TForm1
  Left = 386
  Top = 119
  Width = 641
  Height = 607
  Caption = 'Autocorrelation and Cross-Correlation Program'
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
    Left = 8
    Top = 8
    Width = 609
    Height = 553
    ActivePage = Auto
    TabOrder = 0
    object Auto: TTabSheet
      Caption = 'Cross'
      object Input: TGroupBox
        Left = 8
        Top = 8
        Width = 393
        Height = 129
        Caption = 'Input'
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 24
          Width = 46
          Height = 13
          Caption = 'Amplitude'
        end
        object Label2: TLabel
          Left = 8
          Top = 48
          Width = 59
          Height = 13
          Caption = 'Freq. Signal '
        end
        object Label3: TLabel
          Left = 8
          Top = 72
          Width = 70
          Height = 13
          Caption = 'Freq. Sampling'
        end
        object Label4: TLabel
          Left = 8
          Top = 96
          Width = 69
          Height = 13
          Caption = 'Data'#39's Amount'
        end
        object Label5: TLabel
          Left = 152
          Top = 16
          Width = 39
          Height = 13
          Caption = 'Delay   :'
        end
        object Label6: TLabel
          Left = 192
          Top = 16
          Width = 3
          Height = 13
        end
        object Label7: TLabel
          Left = 152
          Top = 56
          Width = 39
          Height = 13
          Caption = 'Gains   :'
        end
        object Label8: TLabel
          Left = 192
          Top = 56
          Width = 3
          Height = 13
        end
        object Edit1: TEdit
          Left = 88
          Top = 24
          Width = 57
          Height = 21
          TabOrder = 0
          Text = '5'
        end
        object Edit2: TEdit
          Left = 88
          Top = 48
          Width = 57
          Height = 21
          TabOrder = 1
          Text = '100'
        end
        object Edit3: TEdit
          Left = 88
          Top = 72
          Width = 57
          Height = 21
          TabOrder = 2
          Text = '1000'
        end
        object Edit4: TEdit
          Left = 88
          Top = 96
          Width = 57
          Height = 21
          TabOrder = 3
          Text = '200'
        end
        object ScrollBar1: TScrollBar
          Left = 152
          Top = 32
          Width = 233
          Height = 17
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBar1Change
        end
        object ScrollBar2: TScrollBar
          Left = 152
          Top = 72
          Width = 233
          Height = 17
          PageSize = 0
          TabOrder = 5
          OnChange = ScrollBar2Change
        end
        object Button6: TButton
          Left = 152
          Top = 96
          Width = 75
          Height = 25
          Caption = 'GENERATE'
          TabOrder = 6
          OnClick = Button6Click
        end
        object Button7: TButton
          Left = 304
          Top = 96
          Width = 75
          Height = 25
          Caption = 'CLEAR'
          TabOrder = 7
          OnClick = Button7Click
        end
      end
      object GroupBox1: TGroupBox
        Left = 408
        Top = 8
        Width = 185
        Height = 129
        Caption = 'Output'
        TabOrder = 1
        object Label9: TLabel
          Left = 8
          Top = 72
          Width = 35
          Height = 13
          Caption = 'Peak X'
        end
        object Label10: TLabel
          Left = 8
          Top = 96
          Width = 35
          Height = 13
          Caption = 'Peak Y'
        end
        object Button1: TButton
          Left = 10
          Top = 24
          Width = 75
          Height = 41
          Caption = 'EXECUTE'
          TabOrder = 0
          OnClick = Button1Click
        end
        object Edit5: TEdit
          Left = 56
          Top = 72
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object Edit6: TEdit
          Left = 56
          Top = 96
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object Button4: TButton
          Left = 96
          Top = 24
          Width = 75
          Height = 41
          Caption = 'CLOSE'
          TabOrder = 3
          OnClick = Button4Click
        end
      end
      object Chart1: TChart
        Left = 8
        Top = 144
        Width = 585
        Height = 185
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Sinus Signal')
        BottomAxis.Title.Caption = 'Time(s)'
        LeftAxis.Title.Caption = 'Amplitude'
        View3D = False
        TabOrder = 2
        object Series1: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Title = 'Pure'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
        object Series2: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Title = 'Addition'
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Chart2: TChart
        Left = 8
        Top = 336
        Width = 585
        Height = 185
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Cross Correlation')
        BottomAxis.Title.Caption = 'Time(s)'
        LeftAxis.Title.Caption = 'Amplitude'
        Legend.Visible = False
        View3D = False
        TabOrder = 3
        object Series3: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlack
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
    end
    object Cross: TTabSheet
      Caption = 'Auto'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 8
        Top = 8
        Width = 113
        Height = 105
        Caption = 'Input'
        TabOrder = 0
        object Button2: TButton
          Left = 14
          Top = 24
          Width = 81
          Height = 25
          Caption = 'Open File ECG'
          TabOrder = 0
          OnClick = Button2Click
        end
        object Button3: TButton
          Left = 16
          Top = 64
          Width = 75
          Height = 25
          Caption = 'EXECUTE'
          TabOrder = 1
          OnClick = Button3Click
        end
      end
      object GroupBox3: TGroupBox
        Left = 128
        Top = 8
        Width = 385
        Height = 105
        Caption = 'Output'
        TabOrder = 1
        object Label11: TLabel
          Left = 184
          Top = 16
          Width = 35
          Height = 13
          Caption = 'Peak Y'
        end
        object Label12: TLabel
          Left = 48
          Top = 16
          Width = 35
          Height = 13
          Caption = 'Peak X'
        end
        object Label13: TLabel
          Left = 264
          Top = 32
          Width = 47
          Height = 13
          Caption = 'Threshold'
        end
        object Label14: TLabel
          Left = 264
          Top = 56
          Width = 35
          Height = 13
          Caption = 'Periods'
        end
        object ListBox1: TListBox
          Left = 8
          Top = 32
          Width = 121
          Height = 65
          ItemHeight = 13
          TabOrder = 0
        end
        object ListBox2: TListBox
          Left = 136
          Top = 32
          Width = 121
          Height = 65
          ItemHeight = 13
          TabOrder = 1
        end
        object Edit7: TEdit
          Left = 320
          Top = 32
          Width = 57
          Height = 21
          TabOrder = 2
        end
        object Edit8: TEdit
          Left = 320
          Top = 56
          Width = 57
          Height = 21
          TabOrder = 3
        end
      end
      object Chart3: TChart
        Left = 8
        Top = 120
        Width = 585
        Height = 197
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'ECG Signal')
        BottomAxis.Title.Caption = 'Sequence'
        LeftAxis.Title.Caption = 'Amplitude'
        Legend.Visible = False
        View3D = False
        TabOrder = 2
        object Series4: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clRed
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Chart4: TChart
        Left = 8
        Top = 322
        Width = 585
        Height = 197
        BackWall.Brush.Color = clWhite
        BackWall.Brush.Style = bsClear
        Title.Text.Strings = (
          'Auto Correlation')
        BottomAxis.Title.Caption = 'Time(s)'
        LeftAxis.Title.Caption = 'Amplitude'
        Legend.Visible = False
        View3D = False
        TabOrder = 3
        object Series5: TLineSeries
          Marks.ArrowLength = 8
          Marks.Visible = False
          SeriesColor = clBlue
          Pointer.InflateMargins = True
          Pointer.Style = psRectangle
          Pointer.Visible = False
          XValues.DateTime = False
          XValues.Name = 'X'
          XValues.Multiplier = 1.000000000000000000
          XValues.Order = loAscending
          YValues.DateTime = False
          YValues.Name = 'Y'
          YValues.Multiplier = 1.000000000000000000
          YValues.Order = loNone
        end
      end
      object Button5: TButton
        Left = 520
        Top = 16
        Width = 75
        Height = 97
        Caption = 'CLOSE'
        TabOrder = 4
        OnClick = Button5Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 116
    Top = 8
  end
end
