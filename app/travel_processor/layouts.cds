using GeraetetypService from '../../srv/travel-service';

//
// annotatios that control the fiori layout
//

annotate GeraetetypService.Geraetetyp with @UI : {
  SelectionFields : [
    Bezeichnung
  ],

//Sortiert die ID
  PresentationVariant : {
    Text           : 'Default',
    Visualizations : ['@UI.LineItem'],
    SortOrder      : [{
      $Type      : 'Common.SortOrderType',
      Property   : GeraetetypID,
      Descending : true
    }]
  },

  LineItem : [
    { Value : GeraetetypID          },
    { Value : Bezeichnung           },
    { Value : Hersteller            },
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


  Facets : [{
    $Type  : 'UI.CollectionFacet',
    Label  : '{i18n>Gerätetyp}',
    ID     : 'Geraetetyp',
    Facets : [
      {  // Geraetetyp details
        $Type  : 'UI.ReferenceFacet',
        ID     : 'GeraetetypData',
        Target : '@UI.FieldGroup#GeraetetypData',
        Label  : '{i18n>Allgemeine Informationen}'
      }
      ]
  }, {  // Geraete list
    $Type  : 'UI.ReferenceFacet',
    Target : 'to_Geraete/@UI.LineItem',
    Label  : '{i18n>Gerät}'
  }],
  FieldGroup#GeraetetypData : { Data : [
    { Value : GeraetetypID          },
    { Value : Bezeichnung           },
    { Value : Hersteller            },
    { Value : Eigenschaft           },
    { Value : Anleitung             },
    { Value : Video                 },
    { Value : createdAt             },
    { Value : createdBy             },
    { Value : modifiedAt            },
    { Value : modifiedBy            }
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
    { Value : GeraeteStatus_code     },
    { Value : Betriebsstunden,       }
  ],
  Facets : [{
    $Type  : 'UI.CollectionFacet',
    Label  : '{i18n>Gerät}',
    ID     : 'Geraete',
    Facets : [{  // Geraete details
      $Type  : 'UI.ReferenceFacet',
      ID     : 'GeraeteData',
      Target : '@UI.FieldGroup#GeraeteData',
      Label  : 'Geraete'
    }]
  }],
  FieldGroup #GeraeteData : { Data : [
    { Value : GeraeteID              },
    { Value : GeraeteStatus_code     },
    { Value : Betriebsstunden        },
    { Value : createdAt              },
    { Value : createdBy              },
    { Value : modifiedAt             },
    { Value : modifiedBy             }
  ]},
};


