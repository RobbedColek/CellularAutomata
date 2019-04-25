unit cCellularAutomata;

interface

uses
  System.SysUtils;

type
  TCellularAutomata = class
    private
      Grid : array of array of Integer;
      Rules : array[0..7] of Integer;

      procedure PrepareRules(Rule : Integer);
      procedure PrepareGrid(Iterations, Width : Integer);
      function CheckRule(Row, Cell1, Cell2, Cell3: Integer): Boolean;
    public
      procedure Calculate(Rule : Integer;
        Iterations : Integer;
        Width : Integer);
      function GetValue(I, J : Integer) : Integer;
  end;

implementation

uses
  uUtils;

procedure TCellularAutomata.Calculate(Rule : Integer;
        Iterations : Integer;
        Width : Integer);
var Cell1, Cell2, Cell3, I, J : Integer;
begin
  PrepareRules(Rule);

  PrepareGrid(Iterations, Width);

  for I := Low(Grid) to High(Grid) - 1 do begin
    Cell1 := -1;
    Cell2 := 0;
    Cell3 := 1;

    for J := Low(Grid[I]) to High(Grid[I]) do begin
      if J = 0 then begin
        Cell1 := High(Grid[I]);
      end;

      if J = High(Grid[I]) then begin
        Cell3 := Low(Grid[I]);
      end;

      if CheckRule(I, Cell1, Cell2, Cell3) then begin
        Grid[I + 1][Cell2] := 1;
      end;

      Cell1 := Cell2;
      Cell2 := Cell2 + 1;
      Cell3 := Cell3 + 1;
    end;
  end;
end;

function TCellularAutomata.CheckRule(Row, Cell1, Cell2, Cell3: Integer): Boolean;
var
  I: Integer;
begin
  Result := False;
  for I := Low(Rules) to High(Rules) do begin
    if (Rules[I] = 1) then begin
      case I of
        7: begin
          if ((Grid[Row][Cell1] = 0) and
              (Grid[Row][Cell2] = 0) and
              (Grid[Row][Cell3] = 0)) then Result := True;
        end;
        6: begin
          if ((Grid[Row][Cell1] = 0) and
              (Grid[Row][Cell2] = 0) and
              (Grid[Row][Cell3] = 1)) then Result := True;
        end;
        5: begin
          if ((Grid[Row][Cell1] = 0) and
              (Grid[Row][Cell2] = 1) and
              (Grid[Row][Cell3] = 0)) then Result := True;
        end;
        4: begin
          if ((Grid[Row][Cell1] = 0) and
              (Grid[Row][Cell2] = 1) and
              (Grid[Row][Cell3] = 1)) then Result := True;
        end;
        3: begin
          if ((Grid[Row][Cell1] = 1) and
              (Grid[Row][Cell2] = 0) and
              (Grid[Row][Cell3] = 0)) then Result := True;
        end;
        2: begin
          if ((Grid[Row][Cell1] = 1) and
              (Grid[Row][Cell2] = 0) and
              (Grid[Row][Cell3] = 1)) then Result := True;
        end;
        1: begin
          if ((Grid[Row][Cell1] = 1) and
              (Grid[Row][Cell2] = 1) and
              (Grid[Row][Cell3] = 0)) then Result := True;
        end;
        0: begin
          if ((Grid[Row][Cell1] = 1) and
              (Grid[Row][Cell2] = 1) and
              (Grid[Row][Cell3] = 1)) then Result := True;
        end;
      end;
    end;
  end;
end;

procedure TCellularAutomata.PrepareRules(Rule : Integer);
var RuleTmp : String;
    I : Integer;
    StrTmp : String;
begin
  RuleTmp := TUtils.DecToBin(Rule);
  for I := 0 to High(Rules) do begin
    StrTmp := Copy(RuleTmp, I+1, 1);
    Rules[I] := StrToInt(StrTmp);
  end;
end;

procedure TCellularAutomata.PrepareGrid(Iterations, Width : Integer);
var I : Integer;
begin
  SetLength(Grid, Iterations);
  for I := 0 to High(Grid) do begin
    SetLength(Grid[I], Width);
  end;
  Grid[0][Width div 2] := 1;
end;

function TCellularAutomata.GetValue(I, J: Integer): Integer;
begin
  Result := Grid[I][J];
end;

end.
