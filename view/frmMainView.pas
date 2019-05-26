unit frmMainView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, cCellularAutomata, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    Image: TImage;
    MainMenu: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    EdtRule: TEdit;
    EdtIterations: TEdit;
    EdtWidth: TEdit;
    ActionList: TActionList;
    LblRule: TLabel;
    LblIterations: TLabel;
    LblWidth: TLabel;
    ActDraw: TAction;
    ActClear: TAction;
    ActGameOfLifeRandom: TAction;
    ActGameOfLifeGlider: TAction;
    ActGameOfLifeTimer: TAction;
    ActGameOfLifeNotChanging: TAction;
    ActGameOfLifeOscilator: TAction;
    procedure ActClearExecute(Sender: TObject);
    procedure ActDrawExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtRuleKeyPress(Sender: TObject; var Key: Char);
    procedure DrawGrid;
    procedure Draw;
  private
    FCellularAutomata : TCellularAutomata;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ActClearExecute(Sender: TObject);
begin
  Image.Canvas.Brush.Color := clWhite;
  Image.Canvas.FillRect(Rect(0, 0, Image.Width, Image.Height));

  DrawGrid;
end;

procedure TForm1.ActDrawExecute(Sender: TObject);
begin
  FCellularAutomata := TCellularAutomata.Create;

  ActClearExecute(nil);

  if(StrToInt(EdtWidth.Text) >= Image.Width div 2 + 1) then EdtWidth.Text := IntToStr(Image.Width div 2);
  if(StrToInt(EdtIterations.Text) >= Image.Height div 2 + 1) then EdtIterations.Text := IntToStr(Image.Height div 2);

  FCellularAutomata.Calculate(StrToInt(EdtRule.Text), StrToInt(EdtIterations.Text), StrToInt(EdtWidth.Text));

  Draw;

  FCellularAutomata.Destroy;
end;


procedure TForm1.Draw;
var xScale, yScale, x, y, I, J, Width, Iterations, Scale: Integer;
begin
  if Assigned(FCellularAutomata) then begin

    Image.Canvas.Pen.Color := clBlack;
    Image.Canvas.Brush.Color := clBlack;

    Width := StrToInt(EdtWidth.Text);
    Iterations := StrToInt(EdtIterations.Text);

    xScale := Image.Width div Width;
    yScale := Image.Height div Iterations;

    if xScale > yScale then Scale := yScale else Scale := xScale;

    y := 0;
    for I := 0 to Iterations - 1 do begin
      x := 0;
      for J := 0 to Width - 1 do begin
        if FCellularAutomata.GetValue(I, J) = 1 then begin
          Image.Canvas.Rectangle(x, y, x + Scale, y + Scale);
        end;
        x := x + Scale;
      end;
      y := y + Scale;
    end;
  end;
end;

procedure TForm1.DrawGrid;
var xScale, yScale, I, Width, Iterations, Scale: Integer;
begin
  Image.Canvas.Pen.Color := clBlack;

  Width := StrToInt(EdtWidth.Text);
  Iterations := StrToInt(EdtIterations.Text);

  xScale := Image.Width div Width;
  yScale := Image.Height div Iterations;

  if xScale > yScale then Scale := yScale else Scale := xScale;


  for I := 0 to Width do begin
    Image.Canvas.MoveTo(Scale * I, 0);
    Image.Canvas.LineTo(Scale * I, Iterations * 4 * (Scale div 4));
  end;

  for I := 0 to Iterations do begin
    Image.Canvas.MoveTo(0, Scale * I);
    Image.Canvas.LineTo(Width * 4 * (Scale div 4), Scale * I);
  end;

end;

procedure TForm1.EdtRuleKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_RETURN then ActDrawExecute(nil);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Image.Canvas.Brush.Color := clWhite;
  Image.Canvas.FillRect(Rect(0, 0, Image.Width, Image.Height));

  DrawGrid;
end;

end.
