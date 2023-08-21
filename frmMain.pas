unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, dxmdaset, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGrid,
  cxProgressBar, cxTextEdit, cxMaskEdit, cxSpinEdit, StdCtrls, cxButtons,
  ExtCtrls, QtyLines, cxDBData, cxGridDBTableView, cxCheckBox, cxCalc,
  cxCalendar, cxMemo;

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
    procedure dbViewCustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
  private
    procedure loadData(cnt:Integer);
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.loadData(cnt:Integer);
begin
     OutputDebugString('This is my message');
end;

procedure TFormMain.btnLoadClick(Sender: TObject);
var qtyLines: TfrmQtyLines;
begin
  qtyLines := TfrmQtyLines.Create(self);   
  try
    if qtyLines.ShowModal = mrOk then
       loadData(qtyLines.edQty.Value);
  finally
    qtyLines.Free;
  end;
end;

procedure TFormMain.dbViewCustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
 if AViewInfo.GridRecord.Selected then  
   begin
     ACanvas.Brush.Color := $0097FFFF;
     ACanvas.Font.Color := clWindowText;
   end;

  //with TcxGridDBTableView(Sender).DataController do
    if AViewInfo.GridRecord.Values[dbViewNUM.Index] = 'estimate' then
     ;
       
  if not(AViewInfo.Item.Name = '') then
  if AViewInfo.GridRecord.Selected then
  begin
    ACanvas.Brush.Color := $0097FFFF;
    ACanvas.Font.Color:= clWindowText;
  end;
end;

end.
