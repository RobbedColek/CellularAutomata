object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Cellular Automata - Piotr Swat'
  ClientHeight = 881
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Image: TImage
    Left = 0
    Top = 81
    Width = 800
    Height = 800
    Align = alClient
    OnMouseDown = ImageMouseDown
    ExplicitWidth = 1290
    ExplicitHeight = 500
  end
  object MainMenu: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 81
    Align = alTop
    TabOrder = 0
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 798
      Height = 79
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = 'Cellular Automata'
        object LblIterations: TLabel
          Left = 160
          Top = 3
          Width = 47
          Height = 13
          Caption = 'Iterations'
        end
        object LblRule: TLabel
          Left = 20
          Top = 3
          Width = 21
          Height = 13
          Caption = 'Rule'
        end
        object LblWidth: TLabel
          Left = 304
          Top = 3
          Width = 28
          Height = 13
          Caption = 'Width'
        end
        object SpeedButton1: TSpeedButton
          Left = 472
          Top = 21
          Width = 97
          Height = 22
          Action = ActDraw
        end
        object SpeedButton2: TSpeedButton
          Left = 608
          Top = 21
          Width = 97
          Height = 22
          Action = ActClear
        end
        object EdtIterations: TEdit
          Left = 160
          Top = 22
          Width = 121
          Height = 21
          NumbersOnly = True
          TabOrder = 0
          Text = '200'
        end
        object EdtRule: TEdit
          Left = 20
          Top = 22
          Width = 121
          Height = 21
          NumbersOnly = True
          TabOrder = 1
          Text = '105'
          OnKeyPress = EdtRuleKeyPress
        end
        object EdtWidth: TEdit
          Left = 304
          Top = 22
          Width = 113
          Height = 21
          NumbersOnly = True
          TabOrder = 2
          Text = '200'
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Game of Life'
        ImageIndex = 1
        object Label1: TLabel
          Left = 20
          Top = 3
          Width = 47
          Height = 13
          Caption = 'Iterations'
        end
        object Label2: TLabel
          Left = 160
          Top = 3
          Width = 28
          Height = 13
          Caption = 'Width'
        end
        object SpeedButton3: TSpeedButton
          Left = 680
          Top = 28
          Width = 97
          Height = 22
          Action = ActClear
        end
        object SpeedButton4: TSpeedButton
          Left = 455
          Top = 3
          Width = 82
          Height = 22
          Action = ActGameOfLifeNotChanging
        end
        object SpeedButton5: TSpeedButton
          Left = 455
          Top = 28
          Width = 82
          Height = 22
          Action = ActGameOfLifeOscilator
        end
        object SpeedButton6: TSpeedButton
          Left = 567
          Top = 3
          Width = 82
          Height = 22
          Action = ActGameOfLifeGlider
        end
        object SpeedButton7: TSpeedButton
          Left = 567
          Top = 26
          Width = 82
          Height = 22
          Action = ActGameOfLifeRandom
        end
        object SpeedButton8: TSpeedButton
          Left = 680
          Top = 3
          Width = 97
          Height = 22
          Action = ActGameOfLifeTimer
        end
        object LblInterval: TLabel
          Left = 304
          Top = 3
          Width = 38
          Height = 13
          Caption = 'Interval'
        end
        object EdtIterationsGameOfLife: TEdit
          Left = 20
          Top = 22
          Width = 121
          Height = 21
          NumbersOnly = True
          TabOrder = 0
          Text = '200'
        end
        object EdtWidthGameOfLife: TEdit
          Left = 160
          Top = 22
          Width = 121
          Height = 21
          NumbersOnly = True
          TabOrder = 1
          Text = '200'
        end
        object EdtInterval: TEdit
          Left = 304
          Top = 22
          Width = 113
          Height = 21
          TabOrder = 2
          Text = '1000'
        end
      end
    end
  end
  object ActionList: TActionList
    Left = 720
    Top = 104
    object ActDraw: TAction
      Caption = 'Draw'
      OnExecute = ActDrawExecute
    end
    object ActClear: TAction
      Caption = 'Clear'
      OnExecute = ActClearExecute
    end
    object ActGameOfLifeRandom: TAction
      Caption = 'Random'
      OnExecute = ActGameOfLifeRandomExecute
    end
    object ActGameOfLifeGlider: TAction
      Caption = 'Glider'
      OnExecute = ActGameOfLifeGliderExecute
    end
    object ActGameOfLifeTimer: TAction
      Caption = 'Start'
      OnExecute = ActGameOfLifeTimerExecute
    end
    object ActGameOfLifeNotChanging: TAction
      Caption = 'Not Changing'
      OnExecute = ActGameOfLifeNotChangingExecute
    end
    object ActGameOfLifeOscilator: TAction
      Caption = 'Oscilator'
      OnExecute = ActGameOfLifeOscilatorExecute
    end
  end
  object TimerGameOfLife: TTimer
    Enabled = False
    OnTimer = TimerGameOfLifeTimer
    Left = 733
    Top = 153
  end
end
