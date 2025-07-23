unit Unit1;

interface

uses
  System.SysUtils, System.Classes, JS, Web, WEBLib.Graphics, WEBLib.Controls,
  WEBLib.Forms, WEBLib.Dialogs, Vcl.Controls, WEBLib.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, WEBLib.StdCtrls, WEBLib.JSON, Types,
  Vcl.Grids, WEBLib.Grids, WEBLib.WebCtrls,  WEBLib.WebTools ;


 type
  // --- HIER DIE CRACKER KLASSE HINZUF�GEN ---
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
  // zur Card
  // Startseite verstecken (MIT ElementHandle)
  divStartseite.ElementHandle.classList.add('hidden');

  // Anwenderseite (Wrapper) anzeigen (MIT ElementHandle)
  divAnwenderWrapper.ElementHandle.classList.remove('hidden');
end;

procedure TForm1.btnZurStartseiteClick(Sender: TObject);
begin
  // zur Startseite
  // Anwenderseite (Wrapper) verstecken (MIT ElementHandle)
  divAnwenderWrapper.ElementHandle.classList.add('hidden');

  // Startseite anzeigen (MIT ElementHandle)
  divStartseite.ElementHandle.classList.remove('hidden');
end;

procedure TForm1.WebFormCreate(Sender: TObject);
begin
  inherited;

   // ===== 1. Zuweisung der CSS-Klassen f�r die Seiten-Struktur =====

  // Weist dem Container f�r die Startseite seine CSS-Klasse zu
  //divStartseite.ElementClassName := 'start-seite';

  // Weist den drei Containern der Anwenderseite ihre jeweiligen Rollen zu
  //divAnwenderWrapper.ElementClassName := 'wrapper';
  //divAnwenderSizer.ElementClassName := 'sizer';
  //divAnwenderCard.ElementClassName := 'card';

  divStartseite.ElementClassName      := 'layout-reset start-seite';
  divAnwenderWrapper.ElementClassName := 'layout-reset wrapper';
  divAnwenderSizer.ElementClassName   := 'layout-reset sizer';
  divAnwenderCard.ElementClassName    := 'card'; // Die Card ist schon !important genug


  // ===== 2. Festlegen des Startzustands f�r die Navigation =====

  // Die Startseite soll zu Beginn sichtbar sein.
  // (Technisch gesehen entfernen wir die 'hidden'-Klasse, falls sie vorhanden w�re.
  //  Dies stellt sicher, dass sie auf jeden Fall sichtbar ist.)
  divStartseite.ElementHandle.classList.remove('hidden');

  // Die komplette Anwenderseite (repr�sentiert durch ihren �u�ersten Container)
  // soll zu Beginn unsichtbar sein.
  divAnwenderWrapper.ElementHandle.classList.add('hidden');
end;


end.