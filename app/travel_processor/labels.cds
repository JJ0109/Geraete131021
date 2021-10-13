using { sap.fe.cap.travel as schema } from '../../db/schema';

//
// annotations that control rendering of fields and labels
//

annotate schema.Geraetetyp with @title: '{i18n>Gerätetyp}' {
  GeraetetypUUID   @UI.Hidden;
  GeraetetypID     @title: '{i18n>GerätetypID}';
  Bezeichnung  @title: '{i18n>Bezeichnung}';
  Eigenschaft  @title: '{i18n>technische Eigenschaften}';
  Hersteller  @title: '{i18n>Hersteller}';
  Anleitung  @title: '{i18n>Anleitung}';
  Video  @title: '{i18n>Video}';
  GeraetetypStatus @title: '{i18n>GerätetypStatus}'  @Common.Text: GeraetetypStatus.name     @Common.TextArrangement: #TextOnly;
}

annotate schema.GeraetetypStatus with {
  code @Common.Text: name @Common.TextArrangement: #TextOnly
}

annotate schema.Geraete with @title: '{i18n>Geräte}' {
  GeraeteUUID   @UI.Hidden;
  to_Geraetetyp     @UI.Hidden;
  GeraeteID     @title: '{i18n>GeräteID}';
  Betriebsstunden     @title: '{i18n>Betriebsstunden}';
  GeraeteStatus @title: '{i18n>GeräteStatus}'  @Common.Text: GeraeteStatus.name    @Common.TextArrangement: #TextOnly;
}

annotate schema.GeraeteStatus with {
  code @Common.Text : name @Common.TextArrangement: #TextOnly
}
