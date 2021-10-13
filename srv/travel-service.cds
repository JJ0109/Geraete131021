using { sap.fe.cap.travel as my } from '../db/schema';

service GeraetetypService @(path:'/processor', requires: 'authenticated-user') {

  entity Geraetetyp as projection on my.Geraetetyp actions {
    action createTravelByTemplate() returns Geraetetyp;
   /* action rejectTravel();
    action acceptTravel();*/
  };

}
