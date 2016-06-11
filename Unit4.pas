unit Unit4;

interface

uses
  Classes;

type
  TUpdateThread = class(TThread)
  private
    { Private declarations }
  protected
    procedure CheckUpdate;
    procedure Execute; override;
  end;

implementation

uses Unit1;

{ Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);

  and UpdateCaption could look like,

    procedure TUpdateThread.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; }

{ TUpdateThread }

procedure TUpdateThread.CheckUpdate;
begin
Shutdown.DoDownload;
end;

procedure TUpdateThread.Execute;
begin
  inherited Create(False);
  CheckUpdate;
end;

end.
