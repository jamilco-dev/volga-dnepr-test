program Test;

uses
  Forms,
  frmMain in 'frmMain.pas' {FormMain},
  QtyLines in 'QtyLines.pas' {frmQtyLines},
  progBar in 'progBar.pas' {frmProgress};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
