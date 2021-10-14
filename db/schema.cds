//using { custom.managed, sap.common.CodeList } from './common';

using { managed, sap.common, sap.common.CodeList, sap} from '@sap/cds/common';

namespace sap.fe.cap.travel;

entity Geraetetyp : managed {
  key GeraetetypUUID : UUID;
  GeraetetypID       : Integer @Core.Computed;//@readonly default 0;
  @mandatory
  Bezeichnung        : String(100);
  Eigenschaft        : String(150);
  @mandatory  
  Hersteller         : String(80);
  Anleitung          : String(150);
  Video              : String(150);       
  to_Geraete         : Composition of many Geraete on to_Geraete.to_Geraetetyp = $self;
};

entity Geraete : managed {
  key GeraeteUUID   : UUID;
  GeraeteID         : Integer @Core.Computed;
  GeraeteStatus     : Association to GeraeteStatus;
  Betriebsstunden   : Time; 
  to_Geraetetyp     : Association to Geraetetyp;
};


//
//  Code Lists
//

entity GeraeteStatus : CodeList {
  key code : String enum {  
    Neu = 'N';     
    Einsatzbereit = 'E';
    Verfuegbar1 = 'V1';      
    Verfuegbar2 = 'V2';
    Messend = 'M';
    Gesperrt = 'G';    
  };
};


