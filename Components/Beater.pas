unit Beater;

interface

uses
  SysUtils, Classes, Windows;

type
  TBeatDetail = (bdMSec, bdSec, bdMin, bdHour);
  TBeater = class(TComponent)
    private
      FBeatDetail: TBeatDetail;
      procedure Decode;
      function GetBeatsMSec: Extended;
      function GetBeatsSec: Integer;
      function GetBeatsMin: Integer;
      function GetBeatsHour: Integer;
      procedure SetBeatDetail(Value: TBeatDetail);
    protected
    public
      constructor Create(AOwner: TComponent); override;
    published
      function GetTime: String;
      function GetNumb: String;
      property BeatDetail: TBeatDetail read FBeatDetail write SetBeatDetail default bdMSec;
  end;

procedure Register;

const
  TIME_ZONE_ID_UNKNOWN  = 0;
  TIME_ZONE_ID_STANDARD = 1;
  TIME_ZONE_ID_DAYLIGHT = 2;

var
  beats: Extended;
  n: TDateTime; Hour, Min, Sec, MSec: Word;

implementation

constructor TBeater.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

//Functions:

function TBeater.GetBeatsMSec: Extended;
begin
Decode;
beats:=((MSec/1000)+Sec+(Min*60)+((Hour)*3600))/86.4;
Result:=beats;
end;

function TBeater.GetBeatsSec: Integer;
begin
Decode;
beats:=(Sec+(Min*60)+((Hour)*3600))/86.4;
Result:=Round(beats);
end;

function TBeater.GetBeatsMin: Integer;
begin
Decode;
beats:=((Min*60)+((Hour)*3600))/86.4;
Result:=Round(beats);
end;

function TBeater.GetBeatsHour: Integer;
begin
Decode;
beats:=((Hour)*3600)/86.4;
Result:=Round(beats);
end;

function TBeater.GetTime: String;
begin
if BeatDetail = bdMSec then
  Result:='@' + FloatToStr(GetBeatsMSec) + ' .beats'
else
if BeatDetail = bdSec then
  Result:='@' + FloatToStr(GetBeatsSec) + ' .beats'
else
if BeatDetail = bdMin then
  Result:='@' + FloatToStr(GetBeatsMin) + ' .beats'
else
if BeatDetail = bdHour then
  Result:='@' + FloatToStr(GetBeatsHour) + ' .beats'
end;

function TBeater.GetNumb: String;
begin
Result:=FloatToStr(GetBeatsMSec);
end;

//Procedures:

procedure TBeater.SetBeatDetail(Value: TBeatDetail);
begin
  if FBeatDetail <> Value then
    FBeatDetail := Value;
end;

procedure TBeater.Decode;
var
  tz : TTimeZoneInformation;
begin
if GetTimeZoneInformation(tz) = TIME_ZONE_ID_DAYLIGHT then begin
n:=Now; DecodeTime(n, Hour, Min, Sec, MSec);
Hour:=Hour-1;
end else
n:=Now; DecodeTime(n, Hour, Min, Sec, MSec);
end;

procedure Register;
begin
  RegisterComponents('ebertek', [TBeater]);
end;

end.
