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
    ExplicitWidth = 1280
    object SpeedButton1: TSpeedButton
      Left = 472
      Top = 38
      Width = 97
      Height = 22
      Action = ActDraw
    end
    object SpeedButton2: TSpeedButton
      Left = 608
      Top = 38
      Width = 97
      Height = 22
      Action = ActClear
    end
    object LblRule: TLabel
      Left = 20
      Top = 20
      Width = 21
      Height = 13
      Caption = 'Rule'
    end
    object LblIterations: TLabel
      Left = 160
      Top = 20
      Width = 47
      Height = 13
      Caption = 'Iterations'
    end
    object LblWidth: TLabel
      Left = 304
      Top = 20
      Width = 28
      Height = 13
      Caption = 'Width'
    end
    object EdtRule: TEdit
      Left = 20
      Top = 39
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 0
      Text = '105'
      OnKeyPress = EdtRuleKeyPress
    end
    object EdtIterations: TEdit
      Left = 160
      Top = 39
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      Text = '200'
    end
    object EdtWidth: TEdit
      Left = 304
      Top = 39
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 2
      Text = '200'
    end
  end
  object ActionList: TActionList
    Left = 728
    Top = 16
    object ActDraw: TAction
      Caption = 'Draw'
      OnExecute = ActDrawExecute
    end
    object ActClear: TAction
      Caption = 'Clear'
      OnExecute = ActClearExecute
    end
  end
end
