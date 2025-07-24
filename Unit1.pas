unit Unit1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, WEBLib.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, WEBLib.StdCtrls, WEBLib.JSON, Types,
  Vcl.Grids, WEBLib.Grids, WEBLib.WebCtrls,  WEBLib.WebTools ;


 type
  // --- HIER DIE CRACKER KLASSE HINZUFÜGEN ---
  //TWebPanelCracker = class(TWebPanel);

  TForm1 = class(TWebForm)
    divAnwenderWrapper: TWebHTMLDiv;
    divStartseite: TWebHTMLDiv;
    btnZurAnwend: TWebButton;
    divAnwenderSizer: TWebHTMLDiv;
    divAnwenderCard: TWebHTMLDiv;
    btnZurStartseite: TWebButton;

    procedure WebFormCreate(Sender: TObject);
    procedure btnZurStartseiteClick(Sender: TObject);
    procedure btnZurAnwendClick(Sender: TObject);
  private
    { Private-Deklarationen }

  public
    { Public-Deklarationen }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.btnZurAnwendClick(Sender: TObject);
begin
 // Verstecke die Startseite
  divStartseite.ElementHandle.classList.add('hidden');

  // Zeige die Anwenderseite
  divAnwenderWrapper.ElementHandle.classList.remove('hidden');
end;

procedure TForm1.btnZurStartseiteClick(Sender: TObject);
begin
    // Verstecke die Anwenderseite
  divAnwenderWrapper.ElementHandle.classList.add('hidden');

  // Zeige die Startseite
  divStartseite.ElementHandle.classList.remove('hidden');
end;

procedure TForm1.WebFormCreate(Sender: TObject);
begin
  inherited;

   // ===== FINALE, KORREKTE ZUWEISUNG =====

  divStartseite.ElementClassName      := 'fullscreen-container start-seite';
  divAnwenderWrapper.ElementClassName := 'fullscreen-container wrapper';

  // =========================================================================
  // HIER IST DER ENTSCHEIDENDE FIX:
  // AUCH DER SIZER MUSS DIE STÖRENDEN DESIGNER-STYLES LOSWERDEN!
  // Ohne 'fullscreen-container' wird 'position: absolute' vom Designer gesetzt.
  // =========================================================================
  divAnwenderSizer.ElementClassName   := 'fullscreen-container sizer';

  // Die Card ist das einzige Element, das wirklich 'position: absolute' haben soll,
  // daher bekommt sie den Reset nicht.
  divAnwenderCard.ElementClassName    := 'card';


  // ===== Navigation bleibt unverändert =====
  divStartseite.ElementHandle.classList.remove('hidden');
  divAnwenderWrapper.ElementHandle.classList.add('hidden');

end;


end.