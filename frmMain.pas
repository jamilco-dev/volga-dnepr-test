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
  cxCalendar, cxMemo, cxLabel;

type
  TFormMain = class(TForm)
    pnButtons: TPanel;
    btnLoad: TcxButton;
    btnSave: TcxButton;
    grdMain: TcxGrid;
    lev1: TcxGridLevel;
    mData: TdxMemData;
    dbView: TcxGridDBTableView;
    DataSource: TDataSource;
    mDataSTR: TStringField;
    dbViewRecId: TcxGridDBColumn;
    dbViewSTR: TcxGridDBColumn;
    mDataCHK: TBooleanField;
    mDataNUM: TIntegerField;
    mDataDAT: TDateField;
    dbViewCHK: TcxGridDBColumn;
    dbViewNUM: TcxGridDBColumn;
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
var
   I: Integer;
   P: Pointer;
begin
   mData.Active := True;
   mData.DisableControls;
   GetMem(P, 255);
   try
      for I := 1 to cnt do begin
          mData.Data.Items[0].AddValue(@i);

          // Boolean
          VariantToMemDataValue((I mod 2) = 0, P, mDataCHK);
          mData.Data.Items[1].AddValue(P);

          // string
          VariantToMemDataValue('Number ' + IntToStr(I), P, mDataSTR);
          mData.Data.Items[3].AddValue(P);

          // Integer
          // mData.Data.Items[2].AddValue(@I);



          // Float
          //VariantToMemDataValue(1 / I, P, mDataFloat);
          //mData.Data.Items[4].AddValue(P);

          // Date
          //VariantToMemDataValue(Now + I, P, mDataDate);
          //mData.Data.Items[5].AddValue(P);

          // Date and time
          //VariantToMemDataValue(Now + 1 / I, P, mDataDateTime);
          //mData.Data.Items[6].AddValue(P);
      end;
      mData.FillBookmarks;
      mData.First;
   finally
      FreeMem(P);
      // Enabled the data controls
      mData.EnableControls;
   end;
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
    //if AViewInfo.GridRecord.Values[dbViewNUM.Index] = 'estimate' then
     //;
       
  if not(AViewInfo.Item.Name = '') then
  if AViewInfo.GridRecord.Selected then
  begin
    ACanvas.Brush.Color := $0097FFFF;
    ACanvas.Font.Color:= clWindowText;
  end;
end;

end.
