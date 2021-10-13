using { Currency, custom.managed, sap.common.CodeList } from './common';

namespace sap.fe.cap.travel;

entity Geraetetyp : managed {
  key GeraetetypUUID : UUID;
  GeraetetypID       : Integer @readonly default 0;
  Bezeichnung        : String(1024);
  Eigenschaft        : String(100);
  Hersteller         : String(50);
  Anleitung          : String(100);
  Video              : String(100);       
  GeraetetypStatus   : Association to GeraetetypStatus  @readonly;
  to_Geraete         : Composition of many Geraete on to_Geraete.to_Geraetetyp = $self;
};

entity Geraete : managed {
  key GeraeteUUID   : UUID;
  GeraeteID         : Integer @Core.Computed;
  GeraeteStatus     : Association to GeraeteStatus;
  Betriebsstunden   : Integer; 
  to_Geraetetyp         : Association to Geraetetyp;
};


//
//  Code Lists
//

entity GeraeteStatus : CodeList {
  key code : String enum {   
    Aktiv = 'A';
    Deaktiv = 'D';          
    New      = 'N';
    Booked   = 'B';
    Canceled = 'X';
  };
};

entity GeraetetypStatus : CodeList {
  key code : String enum {
    Open     = 'O';
    Accepted = 'A';
    Canceled = 'X';
  } default 'O'; //> will be used for foreign keys as well
  criticality : Integer; //  2: yellow colour,  3: green colour, 0: unknown
  fieldControl: Integer @odata.Type:'Edm.Byte'; // 1: #ReadOnly, 7: #Mandatory
  createDeleteHidden: Boolean;
}
