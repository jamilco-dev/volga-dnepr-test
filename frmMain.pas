unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, dxmdaset, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, StdCtrls, cxButtons,
  ExtCtrls, QtyLines, cxDBData, cxGridDBTableView;

type
  TFormMain = class(TForm)
    pnButtons: TPanel;
    btnLoad: TcxButton;
    btnSave: TcxButton;
    grdMain: TcxGrid;
    lev1: TcxGridLevel;
    dxMemData: TdxMemData;
    dxMemDataCHK: TBooleanField;
    dxMemDataNUM: TFloatField;
    dxMemDataSTR: TStringField;
    dxMemDataDAT: TDateField;
    dsMemData: TDataSource;
    dbView: TcxGridDBTableView;
    dbViewRecId: TcxGridDBColumn;
    dbViewCHK: TcxGridDBColumn;
    dbViewNUM: TcxGridDBColumn;
    dbViewSTR: TcxGridDBColumn;
    dbViewDAT: TcxGridDBColumn;
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
