program Test;

uses
  Forms,
  frmMain in 'frmMain.pas' {FormMain},
  QtyLines in 'QtyLines.pas' {frmQtyLines},
  fileContext in 'fileContext.pas' {frmFileContext};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
