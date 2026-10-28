unit UFrameTroca;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Effects, FMX.Objects, FMX.Controls.Presentation;

type
  TFrameTroca = class(TFrame)
    Rectangle1: TRectangle;
    ShadowEffect1: TShadowEffect;
    RecImage: TRectangle;
    LbTitulo: TLabel;
    Rectangle3: TRectangle;
    LbTipo: TLabel;
    Rectangle4: TRectangle;
    LbStatus: TLabel;
    LbNome: TLabel;
    Image1: TImage;
    LbCidade: TLabel;
    Rectangle5: TRectangle;
    Label7: TLabel;
    Image2: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
