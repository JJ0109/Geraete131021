using { User, sap, managed } from '@sap/cds/common';

//////////////////////////////////////////////////////////////////////////
//
//  Workaround for the above
//

aspect custom.managed {
  createdAt     : Timestamp @cds.on.insert : $now;
  createdBy     : User      @cds.on.insert : $user;
  LastChangedAt : Timestamp @cds.on.insert : $now  @cds.on.update : $now;
  LastChangedBy : User      @cds.on.insert : $user @cds.on.update : $user;
}

annotate custom.managed with {
  createdAt     @UI.HiddenFilter;
  createdBy     @UI.HiddenFilter;
  LastChangedAt @UI.HiddenFilter;
  LastChangedBy @UI.HiddenFilter;
}

// TODO: these annotations would cause a popup requesting input for these fields on "create travel", ...
// annotate custom.managed with {
//   createdAt  @Core.Immutable;
//   createdBy  @Core.Immutable;
// }

annotate custom.managed with {
  createdAt     @title : '{i18n>CreatedAt}';
  createdBy     @title : '{i18n>CreatedBy}';
  LastChangedAt @title : '{i18n>ChangedAt}';
  LastChangedBy @title : '{i18n>ChangedBy}';
}

//
//////////////////////////////////////////////////////////////////////////
