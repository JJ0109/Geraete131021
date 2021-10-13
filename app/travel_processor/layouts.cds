using GeraetetypService from '../../srv/travel-service';

//
// annotatios that control the fiori layout
//

annotate GeraetetypService.Geraetetyp with @UI : {

  Identification : [
   /* { $Type  : 'UI.DataFieldForAction', Action : 'TravelService.acceptTravel',   Label  : '{i18n>AcceptTravel}'   },
    { $Type  : 'UI.DataFieldForAction', Action : 'TravelService.rejectTravel',   Label  : '{i18n>RejectTravel}'   },
    { $Type  : 'UI.DataFieldForAction', Action : 'TravelService.deductDiscount', Label  : '{i18n>DeductDiscount}' }*/
  ],
  HeaderInfo : {
    TypeName       : '{i18n>Gerätetyp}',
    TypeNamePlural : '{i18n>Gerätetypen}',
    Title          : {
      $Type : 'UI.DataField',
      Value : GeraetetypID
    },
    Description    : {
      $Type : 'UI.DataField',
      Value : '{i18n>GerätetypID}'
    }
  },
  PresentationVariant : {
    Text           : 'Default',
    Visualizations : ['@UI.LineItem'],
    SortOrder      : [{
      $Type      : 'Common.SortOrderType',
      Property   : GeraetetypID,
      Descending : true
    }]
  },
  SelectionFields : [
    Bezeichnung,
    //TravelStatus_code
  ],
  LineItem : [
   /* { $Type  : 'UI.DataFieldForAction', Action : 'TravelService.acceptTravel',   Label  : '{i18n>AcceptTravel}'   },
    { $Type  : 'UI.DataFieldForAction', Action : 'TravelService.rejectTravel',   Label  : '{i18n>RejectTravel}'   },
    { $Type  : 'UI.DataFieldForAction', Action : 'TravelService.deductDiscount', Label  : '{i18n>DeductDiscount}' },*/
    { Value : GeraetetypID               },
    { Value : Bezeichnung           },
    { Value : Hersteller               },
    //{ $Type : 'UI.DataField', Value : TravelStatus_code, Criticality : TravelStatus.criticality }
  ],
  Facets : [{
    $Type  : 'UI.CollectionFacet',
    Label  : '{i18n>Gerätetyp}',
    ID     : 'Geraetetyp',
    Facets : [
      {  // travel details
        $Type  : 'UI.ReferenceFacet',
        ID     : 'GeraetetypData',
        Target : '@UI.FieldGroup#GeraetetypData',
        Label  : '{i18n>Allgemeine Informationen}'
      }
      ]
  }, {  // booking list
    $Type  : 'UI.ReferenceFacet',
    Target : 'to_Geraete/@UI.LineItem',
    Label  : '{i18n>Gerät}'
  }],
  FieldGroup#GeraetetypData : { Data : [
    { Value : GeraetetypID               },
    { Value : Bezeichnung           },
    { Value : Hersteller           },
    { Value : Eigenschaft           },
    { Value : Anleitung           },
    { Value : Video          },
   /* {
      $Type       : 'UI.DataField',
      Value       : TravelStatus_code,
      Criticality : TravelStatus.criticality,
      Label : '{i18n>Status}' // label only necessary if differs from title of element
    }*/
  ]},
};

annotate GeraetetypService.Geraete with @UI : {
  Identification : [
    { Value : GeraeteID },
  ],
  HeaderInfo : {
    TypeName       : '{i18n>Gerät}',
    TypeNamePlural : '{i18n>Geräte}',
    Title          : { Value : GeraeteID },
    Description    : {
      $Type : 'UI.DataField',
      Value : '{i18n>GeräteID}'
    }
  },
  PresentationVariant : {
    Text           : 'Default',
    Visualizations : ['@UI.LineItem']
  },
  SelectionFields : [],
  LineItem : [ 
    { Value : GeraeteID,             Label : '{i18n>GeräteID}' },
    { Value : GeraeteStatus_code     }
  ],
  Facets : [{
    $Type  : 'UI.CollectionFacet',
    Label  : '{i18n>Gerät}',
    ID     : 'Geraete',
    Facets : [{  // booking details
      $Type  : 'UI.ReferenceFacet',
      ID     : 'GeraeteData',
      Target : '@UI.FieldGroup#GeraeteData',
      Label  : 'Geraete'
    }]
  }],
  FieldGroup #GeraeteData : { Data : [
    { Value : GeraeteID              },
    { Value : GeraeteStatus_code     },
    { Value : Betriebsstunden        }
  ]},
};


