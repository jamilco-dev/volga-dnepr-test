unit fileContext;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxTextEdit, cxMemo;

type
  TfrmFileContext = class(TForm)
    mmFileContext: TcxMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFileContext: TfrmFileContext;

implementation

{$R *.dfm}

end.
