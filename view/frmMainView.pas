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
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    EdtIterationsGameOfLife: TEdit;
    EdtWidthGameOfLife: TEdit;
    Label2: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    ActGameOfLifeRandom: TAction;
    ActGameOfLifeGlider: TAction;
    TimerGameOfLife: TTimer;
    SpeedButton8: TSpeedButton;
    ActGameOfLifeTimer: TAction;
    EdtInterval: TEdit;
    LblInterval: TLabel;
    ActGameOfLifeNotChanging: TAction;
    ActGameOfLifeOscilator: TAction;
    procedure ActClearExecute(Sender: TObject);
    procedure ActDrawExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtRuleKeyPress(Sender: TObject; var Key: Char);
    procedure DrawGrid;
    procedure Draw;
    procedure ImageMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageControl1Change(Sender: TObject);
    procedure ActGameOfLifeRandomExecute(Sender: TObject);
    procedure ActGameOfLifeGliderExecute(Sender: TObject);
    procedure TimerGameOfLifeTimer(Sender: TObject);
    procedure ActGameOfLifeTimerExecute(Sender: TObject);
    procedure ActGameOfLifeNotChangingExecute(Sender: TObject);
    procedure ActGameOfLifeOscilatorExecute(Sender: TObject);
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

procedure TForm1.ActGameOfLifeGliderExecute(Sender: TObject);
var tempX, tempY : Integer;
begin
  if Assigned(FCellularAutomata) then begin
    FCellularAutomata.Free;
    FCellularAutomata := TCellularAutomata.Create;
    FCellularAutomata.PrepareGridGameOfLife(StrToInt(EdtIterationsGameOfLife.Text), StrToInt(EdtWidthGameOfLife.Text));
  end else begin
    FCellularAutomata := TCellularAutomata.Create;
    FCellularAutomata.PrepareGridGameOfLife(StrToInt(EdtIterationsGameOfLife.Text), StrToInt(EdtWidthGameOfLife.Text));
  end;

  ActClear.Execute;

  tempX := StrToInt(EdtWidthGameOfLife.Text) div 2;
  tempY := StrToInt(EdtIterationsGameOfLife.Text) div 2;

  FCellularAutomata.SetValue(tempY, tempX, 1);
  FCellularAutomata.SetValue(tempY, tempX + 1, 1);
  FCellularAutomata.SetValue(tempY - 1, tempX + 1,  1);
  FCellularAutomata.SetValue(tempY - 1, tempX + 2, 1);
  FCellularAutomata.SetValue(tempY + 1, tempX + 2, 1);

  Draw;
end;

procedure TForm1.ActGameOfLifeNotChangingExecute(Sender: TObject);
var tempX, tempY : Integer;
begin
  if Assigned(FCellularAutomata) then begin
    FCellularAutomata.Free;
    FCellularAutomata := TCellularAutomata.Create;
    FCellularAutomata.PrepareGridGameOfLife(StrToInt(EdtIterationsGameOfLife.Text), StrToInt(EdtWidthGameOfLife.Text));
  end else begin
    FCellularAutomata := TCellularAutomata.Create;
    FCellularAutomata.PrepareGridGameOfLife(StrToInt(EdtIterationsGameOfLife.Text), StrToInt(EdtWidthGameOfLife.Text));
  end;

  ActClear.Execute;

  tempX := StrToInt(EdtWidthGameOfLife.Text) div 2;
  tempY := StrToInt(EdtIterationsGameOfLife.Text) div 2;

  FCellularAutomata.SetValue(tempY, tempX, 1);
  FCellularAutomata.SetValue(tempY + 1, tempX + 1, 1);
  FCellularAutomata.SetValue(tempY + 1, tempX + 2, 1);
  FCellularAutomata.SetValue(tempY - 1, tempX + 1, 1);
  FCellularAutomata.SetValue(tempY - 1, tempX + 2,  1);
  FCellularAutomata.SetValue(tempY, tempX + 3, 1);

  Draw;
end;

procedure TForm1.ActGameOfLifeRandomExecute(Sender: TObject);
var I: Integer;
begin
  if Assigned(FCellularAutomata) then begin
    FCellularAutomata.Free;
    FCellularAutomata := TCellularAutomata.Create;
    FCellularAutomata.PrepareGridGameOfLife(StrToInt(EdtIterationsGameOfLife.Text), StrToInt(EdtWidthGameOfLife.Text));
  end else begin
    FCellularAutomata := TCellularAutomata.Create;
    FCellularAutomata.PrepareGridGameOfLife(StrToInt(EdtIterationsGameOfLife.Text), StrToInt(EdtWidthGameOfLife.Text));
  end;

  ActClear.Execute;

  Randomize;
  for I := 0 to Random(StrToInt(EdtWidthGameOfLife.Text) * StrToInt(EdtIterationsGameOfLife.Text)) do begin
    FCellularAutomata.SetValue(Random(StrToInt(EdtIterationsGameOfLife.Text)), Random(StrToInt(EdtWidthGameOfLife.Text)), 1);
  end;

  Draw;
end;

procedure TForm1.ActGameOfLifeTimerExecute(Sender: TObject);
begin
  timerGameOfLife.Interval := StrToInt(EdtInterval.Text);
  timerGameOfLife.Enabled := not timerGameOfLife.Enabled;

  if timerGameOfLife.Enabled then begin
    ActGameOfLifeTimer.Caption := 'Stop';
    EdtInterval.Enabled := False;
    SpeedButton3.Enabled := False;
  end else begin
    if Assigned(FCellularAutomata) then begin
      FCellularAutomata.Free;
      FCellularAutomata := TCellularAutomata.Create;
      FCellularAutomata.PrepareGridGameOfLife(StrToInt(EdtIterationsGameOfLife.Text), StrToInt(EdtWidthGameOfLife.Text));
    end else begin
      FCellularAutomata := TCellularAutomata.Create;
      FCellularAutomata.PrepareGridGameOfLife(StrToInt(EdtIterationsGameOfLife.Text), StrToInt(EdtWidthGameOfLife.Text));
    end;
    ActGameOfLifeTimer.Caption := 'Start';
    EdtInterval.Enabled := True;
    SpeedButton3.Enabled := True;
  end;
end;

procedure TForm1.ActGameOfLifeOscilatorExecute(Sender: TObject);
var tempX, tempY : Integer;
begin
  if Assigned(FCellularAutomata) then begin
    FCellularAutomata.Free;
    FCellularAutomata := TCellularAutomata.Create;
    FCellularAutomata.PrepareGridGameOfLife(StrToInt(EdtIterationsGameOfLife.Text), StrToInt(EdtWidthGameOfLife.Text));
  end else begin
    FCellularAutomata := TCellularAutomata.Create;
    FCellularAutomata.PrepareGridGameOfLife(StrToInt(EdtIterationsGameOfLife.Text), StrToInt(EdtWidthGameOfLife.Text));
  end;

  ActClear.Execute;

  tempX := StrToInt(EdtWidthGameOfLife.Text) div 2;
  tempY := StrToInt(EdtIterationsGameOfLife.Text) div 2;

  FCellularAutomata.SetValue(tempY, tempX, 1);
  FCellularAutomata.SetValue(tempY + 1, tempX, 1);
  FCellularAutomata.SetValue(tempY + 2, tempX, 1);

  Draw;
end;

procedure TForm1.Draw;
var xScale, yScale, x, y, I, J, Width, Iterations : Integer;
begin
  if Assigned(FCellularAutomata) then begin

    Image.Canvas.Pen.Color := clBlack;
    Image.Canvas.Brush.Color := clBlack;

    if PageControl1.ActivePageIndex = 0 then begin
      Width := StrToInt(EdtWidth.Text);
      Iterations := StrToInt(EdtIterations.Text);
    end;

    if PageControl1.ActivePageIndex = 1 then begin
      Width := StrToInt(EdtWidthGameOfLife.Text);
      Iterations := StrToInt(EdtIterationsGameOfLife.Text);
    end;

    xScale := Image.Width div Width;
    yScale := xScale;

    y := 0;
    for I := 0 to Iterations - 1 do begin
      x := 0;
      for J := 0 to Width - 1 do begin
        if FCellularAutomata.GetValue(I, J) = 1 then begin
          Image.Canvas.Rectangle(x, y, x + xScale, y + yScale);
        end;
        x := x + xScale;
      end;
      y := y + yScale;
    end;
  end;
end;

procedure TForm1.DrawGrid;
var xScale, yScale, I, Width, Iterations: Integer;
begin
  Image.Canvas.Pen.Color := clBlack;

    if PageControl1.ActivePageIndex = 0 then begin
      Width := StrToInt(EdtWidth.Text);
      Iterations := StrToInt(EdtIterations.Text);
    end;

    if PageControl1.ActivePageIndex = 1 then begin
      Width := StrToInt(EdtWidthGameOfLife.Text);
      Iterations := StrToInt(EdtIterationsGameOfLife.Text);
    end;

  xScale := Image.Width div Width;
  yScale := xScale;

  for I := 0 to Width do begin
    Image.Canvas.MoveTo(xScale * I, 0);
    Image.Canvas.LineTo(xScale * I, Image.Height);
  end;

  for I := 0 to Iterations do begin
    Image.Canvas.MoveTo(0, yScale * I);
    Image.Canvas.LineTo(Image.Width, yScale * I);
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

procedure TForm1.ImageMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var xScale, yScale, Value: Integer;
begin
  if PageControl1.ActivePageIndex = 0 then exit;

  if Assigned(FCellularAutomata) then begin
    xScale := Image.Width div StrToInt(EdtWidthGameOfLife.Text);
    yScale := xScale;

    Value := FCellularAutomata.GetValue(y div yScale, x div xScale);

    if Value <> 0 then Value := 0 else Value := 1;

    FCellularAutomata.SetValue(y div yScale, x div xScale, Value);

    ActClear.Execute;
    Draw;
  end;

end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  ActClear.Execute;

  if PageControl1.ActivePageIndex = 0 then begin
    if Assigned(FCellularAutomata) then FCellularAutomata.Free;
  end;

  if PageControl1.ActivePageIndex = 1 then begin
    FCellularAutomata := TCellularAutomata.Create;
    FCellularAutomata.PrepareGridGameOfLife(StrToInt(EdtIterationsGameOfLife.Text), StrToInt(EdtWidthGameOfLife.Text));
  end;

end;

procedure TForm1.TimerGameOfLifeTimer(Sender: TObject);
begin
  FCellularAutomata.StepGameOfLife(StrToInt(EdtIterationsGameOfLife.Text), StrToInt(EdtWidthGameOfLife.Text));

  actClear.Execute;
  Draw;
end;

end.
