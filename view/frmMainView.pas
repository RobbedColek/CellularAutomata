unit frmMainView;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, cCellularAutomata;

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
    procedure ActClearExecute(Sender: TObject);
    procedure ActDrawExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure EdtRuleKeyPress(Sender: TObject; var Key: Char);
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
end;

procedure TForm1.ActDrawExecute(Sender: TObject);
var xScale, yScale, x, y, I, J : Integer;
begin
  FCellularAutomata := TCellularAutomata.Create;

  ActClearExecute(nil);

  if(StrToInt(EdtWidth.Text) >= Image.Width div 2 + 1) then EdtWidth.Text := IntToStr(Image.Width div 2);
  if(StrToInt(EdtIterations.Text) >= Image.Height div 2 + 1) then EdtIterations.Text := IntToStr(Image.Height div 2);

  Image.Canvas.Pen.Color := clBlack;
  Image.Canvas.Brush.Color := clBlack;

  FCellularAutomata.Calculate(StrToInt(EdtRule.Text), StrToInt(EdtIterations.Text), StrToInt(EdtWidth.Text));

  xScale := Image.Width div StrToInt(EdtWidth.Text);
  yScale := Image.Height div StrToInt(EdtIterations.Text);

  y := 0;
  for I := 0 to StrToInt(EdtIterations.Text) - 1 do begin
    x := 0;
    for J := 0 to StrToInt(EdtWidth.Text) - 1 do begin
      if FCellularAutomata.GetValue(I, J) = 1 then begin
        Image.Canvas.Rectangle(x, y, x + xScale, y + yScale);
      end;
      x := x + xScale;
    end;
    y := y + yScale;
  end;

  FCellularAutomata.Destroy;
end;

procedure TForm1.EdtRuleKeyPress(Sender: TObject; var Key: Char);
begin
  if ord(Key) = VK_RETURN then ActDrawExecute(nil);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Image.Canvas.Brush.Color := clWhite;
  Image.Canvas.FillRect(Rect(0, 0, Image.Width, Image.Height));
end;

end.
