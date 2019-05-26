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
    object LblIterations: TLabel
      Left = 160
      Top = 11
      Width = 47
      Height = 13
      Caption = 'Iterations'
    end
    object LblRule: TLabel
      Left = 20
      Top = 11
      Width = 21
      Height = 13
      Caption = 'Rule'
    end
    object LblWidth: TLabel
      Left = 304
      Top = 11
      Width = 28
      Height = 13
      Caption = 'Width'
    end
    object SpeedButton1: TSpeedButton
      Left = 520
      Top = 29
      Width = 97
      Height = 22
      Action = ActDraw
    end
    object SpeedButton2: TSpeedButton
      Left = 656
      Top = 29
      Width = 97
      Height = 22
      Action = ActClear
    end
    object EdtIterations: TEdit
      Left = 160
      Top = 30
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      Text = '200'
    end
    object EdtRule: TEdit
      Left = 20
      Top = 30
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      Text = '105'
      OnKeyPress = EdtRuleKeyPress
    end
    object EdtWidth: TEdit
      Left = 304
      Top = 30
      Width = 113
      Height = 21
      NumbersOnly = True
      TabOrder = 2
      Text = '200'
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
    end
    object ActGameOfLifeGlider: TAction
      Caption = 'Glider'
    end
    object ActGameOfLifeTimer: TAction
      Caption = 'Start'
    end
    object ActGameOfLifeNotChanging: TAction
      Caption = 'Not Changing'
    end
    object ActGameOfLifeOscilator: TAction
      Caption = 'Oscilator'
    end
  end
end
