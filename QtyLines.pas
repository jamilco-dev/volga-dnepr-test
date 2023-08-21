unit QtyLines;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  cxProgressBar, StdCtrls, cxButtons, ExtCtrls;

type
  TfrmQtyLines = class(TForm)
    pnButtons: TPanel;
    btnLoad: TcxButton;
    btnSave: TcxButton;
    cxProgressBar1: TcxProgressBar;
    edQty: TcxSpinEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQtyLines: TfrmQtyLines;

implementation

{$R *.dfm}

end.
