unit ParamOpener;

interface

uses
  SysUtils, Classes;

type
  TParamOpener = class(TComponent)
    private
      FParameter: String;
      FLogFile: String;
      FLog: Boolean;
      FActive: Boolean;
      FOnParamOpen: TNotifyEvent;
      procedure SetParameter(value: string);
      procedure SetLogFile(value: string);
      procedure SetLog(value: boolean);
      procedure SetActive(value: boolean);
      function GetParameter: string;
      function GetLogFile: string;
      function GetLog: boolean;
      function GetActive: boolean;
    protected
    public
      constructor Create(AOwner: TComponent); override;
    published
      property OnParamOpen: TNotifyEvent read FOnParamOpen write FOnParamOpen;
      procedure ParamOpen; virtual;
      procedure MoreParamOpen;
      procedure OneParamOpen;
      procedure Ender;
      procedure Log;
      property Parameter: String read GetParameter write SetParameter;
      property LogFile: String read GetLogFile write SetLogFile;
      property Logging: boolean read GetLog write SetLog default False;
      property Active: boolean read GetActive write SetActive default True;
  end;

procedure Register;

var
  FinalParam: string;

implementation

constructor TParamOpener.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Parameter:='';
  LogFile:='';
  Logging:=False;
  Active:=True;
end;

//Properties:

function TParamOpener.GetParameter: string;
begin
  Result := FParameter;
end;

procedure TParamOpener.SetParameter(value: string);
begin
  if FParameter <> Value then FParameter := Value;
end;

function TParamOpener.GetLogFile: string;
begin
  Result := FLogFile;
end;

procedure TParamOpener.SetLogFile(value: string);
begin
  if FLogFile <> Value then FLogFile := Value;
end;

procedure TParamOpener.SetLog(value: boolean);
begin
  if FLog <> Value then FLog := Value;
end;

function TParamOpener.GetLog: boolean;
begin
  Result := FLog;
end;

procedure TParamOpener.SetActive(value: boolean);
begin
  if FActive <> Value then FActive := Value;
end;

function TParamOpener.GetActive: boolean;
begin
  Result := FActive;
end;


//Procedures:

procedure TParamOpener.MoreParamOpen;
var i: integer;
    s: string;
begin
  if ParamCount > 1 then
    begin
      for i := 1 to ParamCount do
        s := s + ' ' + ParamStr(i);
      Delete(s,1,1);
      FinalParam:=s;
    end;
end;

procedure TParamOpener.OneParamOpen;
var i: integer;
begin
  if ParamCount = 1 then
    for i := ParamCount - 1 to ParamCount do FinalParam:=ParamStr(i);
end;

procedure TParamOpener.Log;
var
  F: TextFile;
begin
  AssignFile(F,LogFile);
  Append(F);
  try
    Writeln(F,FinalParam);
  except
    ReWrite(F);
    Writeln(F,FinalParam);
  end;
  CloseFile(F);
end;

procedure TParamOpener.Ender;
begin
  if FinalParam='' then
    if Parameter <> '' then
      FinalParam:=Parameter;

  if Logging then
    if LogFile <> '' then
      if FinalParam <> '' then
        Log;
end;

procedure TParamOpener.ParamOpen;
begin
  if Active then
    begin
      MoreParamOpen; OneParamOpen; Ender;
      if Assigned(FOnParamOpen) then FOnParamOpen(Self);
    end;
end;

procedure Register;
begin
  RegisterComponents('ebertek', [TParamOpener]);
end;

end.
