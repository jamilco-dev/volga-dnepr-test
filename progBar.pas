unit progBar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, cxProgressBar;

type
  TfrmProgress = class(TForm)
    cxProgressBar: TcxProgressBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProgress: TfrmProgress;

implementation

{$R *.dfm}

end.
