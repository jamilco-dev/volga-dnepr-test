unit frmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus,
  cxControls, cxContainer, cxEdit, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, DB, dxmdaset, cxGridLevel, cxClasses,Math,
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
    procedure dbViewDataControllerCompare(
      ADataController: TcxCustomDataController; ARecordIndex1,
      ARecordIndex2, AItemIndex: Integer; const V1, V2: Variant;
      var Compare: Integer);
  private
    procedure loadData(cnt:Integer);
    function GenerateRandomString(const ALength: Integer): ShortString;
    function RandomDateTime(Const AFrom, ATo: TDateTime): TDateTime;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

uses
  cxVariants;

{$R *.dfm}

function TFormMain.RandomDateTime(const AFrom, ATo: TDateTime): TDateTime;
var
  SecsBetween: Longint;
begin
  if AFrom >= ATo then
      raise Exception.Create('Time range not correct');

  SecsBetween := Round(60 * 60 * 24 * (ATo - AFrom));
  result := AFrom + (Round(SecsBetween * Random) / (60*60*24));
end;

function TFormMain.GenerateRandomString(const ALength: Integer): ShortString;
var
  Ch, SequenceLength: Integer;
const
  ACharSequence: String = '¿¡¬√ƒ≈®∆«»… ÀÃÕŒœ–—“”‘’÷◊ÿŸ⁄€‹›ﬁﬂ';

begin
  SequenceLength := Length(ACharSequence);
  SetLength(Result, ALength);

  for Ch := 0 to Length(Result) do begin
    Result[Ch] := ACharSequence[RandomRange(1, SequenceLength)];
  end;
end;

procedure TFormMain.loadData(cnt:Integer);
var
   I, Num: Integer;
   P: Pointer;
begin
   mData.Active := True;
   mData.DisableControls;
   GetMem(P, 255);
   try
      for I := 1 to cnt do begin
          mData.Data.Items[0].AddValue(@i);

          VariantToMemDataValue((I mod 2) = 0, P, mDataCHK);
          mData.Data.Items[1].AddValue(P);

          Num := RandomRange(0, 100);
          mData.Data.Items[2].AddValue(@Num);

          VariantToMemDataValue(GenerateRandomString(20), P, mDataSTR);
          mData.Data.Items[3].AddValue(P);

          VariantToMemDataValue(RandomDateTime(StrToDate('01.01.2020'), StrToDate('01.01.2023')), P, mDataDAT);
          mData.Data.Items[4].AddValue(P);

      end;
      mData.FillBookmarks;
      mData.First;
   finally
      FreeMem(P);
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
  if AViewInfo.Item.Name = 'dbViewSTR' then
     begin
        case AViewInfo.GridRecord.Values[dbViewNUM.Index] of
           0..50: begin
                     ACanvas.Brush.Color := clYellow;
                     ACanvas.Font.Color:= clBlue;
                  end;   
           51..75: begin
                      ACanvas.Brush.Color := clGreen;
                      ACanvas.Font.Color:= clWhite;
                   end;
           76..100: begin
                      ACanvas.Brush.Color := clRed;
                      ACanvas.Font.Color:= clWindowText;
                    end
        end
     end
end;

procedure TFormMain.dbViewDataControllerCompare(
  ADataController: TcxCustomDataController; ARecordIndex1, ARecordIndex2,
  AItemIndex: Integer; const V1, V2: Variant; var Compare: Integer);
var  
  ASortColumnIndex: Integer;  
  AValue1, AValue2: Variant;  
begin  
   if (AItemIndex = dbViewSTR.Index) then
      begin
         ASortColumnIndex := dbViewNUM.Index;
         AValue1 := ADataController.Values[ARecordIndex1, ASortColumnIndex];
         AValue2 := ADataController.Values[ARecordIndex2, ASortColumnIndex];
         Compare := VarCompare(AValue1, AValue2);
      end
   else
      Compare := VarCompare(V1, V2);
end;

end.
