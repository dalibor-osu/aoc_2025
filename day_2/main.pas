program Hello;
type
    intPair = array [0..1] of int64;
    dataset = array [0..255] of intPair;

function strReverse(str: string): string;
var
    result: string;
    i: integer;
begin
    i := Length(str);
    result := '';
    while i > 0 do
    begin
        result := result + str[i];
        i := i - 1;
    end;
    strReverse := result;
end;

function strToInt(str: string): int64;
var
    result: int64;
    b: byte;
    c: char;
begin
    result := 0;
    for c in str do
    begin
        b := Ord(c);
        if (b < 48) or (b > 57) then Continue; 
        result := (result * 10) + (b - 48);
    end;
    strToInt := result;
end;

function intToStr(num: int64): string;
var
    result: string;
    digit: integer;
    i: integer;
begin
    result := '';
    i := 0;
    while num > 0 do
    begin
        digit := num mod 10;
        result := result + Chr(digit + 48);
        i := i + 1;
        num := num div 10;
    end;

    intToStr := strReverse(result);
end;

function parseInput(data: WideString): dataset;
var
    c: char;
    current: intPair;
    str: string;
    result: dataset;
    result_i, i: integer;

begin
    c := '0';
    current[0] := 0;
    current[1] := 0;
    str := '';
    result_i := 0;
    for i := 0 to 255 do
    begin
        result[i][0] := 0;
        result[i][1] := 0;
    end;

    for c in data do begin
        if c = '-' then
        begin
            current[0] := strToInt(str);
            str := '';
            Continue;
        end;

        if c = ',' then
        begin
            current[1] := strToInt(str);
            result[result_i] := current;
            current[0] := 0;
            current[1] := 0;
            result_i := result_i + 1;
            str := '';
            Continue;
        end;
        str := str + c;
    end;

    current[1] := strToInt(str);
    result[result_i] := current;

    Exit(result);
end;

function checkNumber(num: int64): boolean;
var
    str: string;
    strLen: integer;
    strLenDiv: integer;
    i: integer;
    i_2: integer;
begin
    str := intToStr(num);
    strLen := Length(str);
    if strLen mod 2 = 1 then Exit(false);
    strLenDiv := strLen div 2;
    i_2 := strLenDiv + 1;
    for i := 1 to strLenDiv do
    begin
        if not (str[i] = str[i_2]) then Exit(false);
        i_2 := i_2 + 1;
    end;
    checkNumber := true;
end;

var
    data: WideString;
    myfile: text;
    input: dataset;
    currentPair: intPair;
    currentNum, result: int64;

begin
    assign(myfile, './input.txt');
    reset(myfile);
    read(myfile, data);
    result := 0;
    input := parseInput(data);
    for currentPair in input do
    begin
        if (currentPair[0] = 0) and (currentPair[1] = 0) then Break;
        for currentNum := currentPair[0] to currentPair[1] do
            if checkNumber(currentNum) then result := result + currentNum;
    end;
    writeln(result);
end.
