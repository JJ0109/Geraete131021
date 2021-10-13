using GeraetetypService from '../../srv/travel-service';

//
// annotations that control the behavior of fields and actions
//

// Workarounds for overly strict OData libs and clients
annotate cds.UUID with @Core.Computed  @odata.Type : 'Edm.String';

// Add fields to control enablement of action buttons on UI
extend projection GeraetetypService.Geraetetyp with {
  // REVISIT: shall be improved by omitting "null as"
  virtual null as acceptEnabled         : Boolean @UI.Hidden,
  virtual null as rejectEnabled         : Boolean @UI.Hidden,
  virtual null as deductDiscountEnabled : Boolean @UI.Hidden,
}

annotate GeraetetypService.Geraetetyp with @(Common.SideEffects: {
  //SourceProperties: [BookingFee],
  TargetProperties: ['TotalPrice']
}){
  /*BookingFee    @Common.FieldControl  : TravelStatus.fieldControl;
  BeginDate       @Common.FieldControl  : TravelStatus.fieldControl;
  EndDate         @Common.FieldControl  : TravelStatus.fieldControl;
  to_Agency       @Common.FieldControl  : TravelStatus.fieldControl;
  to_Customer     @Common.FieldControl  : TravelStatus.fieldControl;*/

} /*actions {
  rejectTravel @(
    Core.OperationAvailable : in.rejectEnabled,
    Common.SideEffects.TargetProperties : [
      'in/TravelStatus_code',
      'in/acceptEnabled',
      'in/rejectEnabled'
    ],
  );
  acceptTravel @(
    Core.OperationAvailable : in.acceptEnabled,
    Common.SideEffects.TargetProperties : [
      'in/TravelStatus_code',
      'in/acceptEnabled',
      'in/rejectEnabled'
    ],
  );
  deductDiscount @(
    Core.OperationAvailable : in.deductDiscountEnabled,
    Common.SideEffects.TargetProperties : ['in/deductDiscountEnabled'],
  );
}*/

annotate GeraetetypService.Booking with @UI.CreateHidden : to_Geraetetyp.GeraetetypStatus.createDeleteHidden;

annotate GeraetetypService.Booking {
  /*BookingDate   @Core.Computed;
  ConnectionID  @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
  FlightDate    @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
  FlightPrice   @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
  BookingStatus @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
  to_Carrier    @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;
  to_Customer   @Common.FieldControl  : to_Travel.TravelStatus.fieldControl;*/
};


