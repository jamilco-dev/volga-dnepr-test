unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, dxmdaset, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, StdCtrls, cxButtons,
  ExtCtrls, QtyLines;

type
  TFormMain = class(TForm)
    pnButtons: TPanel;
    btnLoad: TcxButton;
    btnSave: TcxButton;
    cxProgressBar1: TcxProgressBar;
    grdMain: TcxGrid;
    view1: TcxGridTableView;
    lev1: TcxGridLevel;
    dxMemData: TdxMemData;
    procedure btnLoadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.btnLoadClick(Sender: TObject);
var qtyLines: TfrmQtyLines;
begin
  try
    qtyLines := TfrmQtyLines.Create(self);
    qtyLines.ShowModal;
  finally
    qtyLines.Free;
  end;
end;

end.
