const cds = require ('@sap/cds'); require('./workarounds')

class GeraetetypService extends cds.ApplicationService {
init() {

  /**
   * Reflect definitions from the service's CDS model
   */
  const { Geraetetyp, Geraete } = this.entities


  /**
   * Fill in virtual elements to control status of UI elements.
   */
  const _calculateButtonAvailability = any => {
    const status = any.GeraetetypStatus && any.GeraetetypStatus.code || any.GeraetetypStatus_code
    any.acceptEnabled = status !== 'A'
    any.rejectEnabled = status !== 'X'
    any.deductDiscountEnabled = status === 'O'
  }
  this.after ('each', 'Geraetetyp', _calculateButtonAvailability)
  this.after ('EDIT', 'Geraetetyp', _calculateButtonAvailability)


  /**
   * Fill in primary keys for new Travels.
   * Note: In contrast to Bookings and BookingSupplements that has to happen
   * upon SAVE, as multiple users could create new Travels concurrently.
   */
  this.before ('CREATE', 'Geraetetyp', async req => {
    const { maxID } = await SELECT.one `max(GeraetetypID) as maxID` .from (Geraetetyp)
    req.data.GeraetetypID = maxID + 1
  })


  /**
   * Fill in defaults for new Bookings when editing Travels.
   */
  this.before ('NEW', 'Geraete', async (req) => {
    const { to_Geraetetyp_GeraetetypUUID } = req.data
    const { status } = await SELECT `GeraetetypStatus_code as status` .from (Geraetetyp.drafts, to_Geraetetyp_GeraetetypUUID)
    if (status === 'X') throw req.reject (400, 'Cannot add new bookings to rejected travels.')
    const { maxID } = await SELECT.one `max(GeraeteID) as maxID` .from (Geraete.drafts) .where ({to_Geraetetyp_GeraetetypUUID})
    req.data.GeraeteID = maxID + 1
    req.data.GeraeteStatus_code = 'A'
    //req.data.BookingStatus_code = 'N'
  })


  //
  // Action Implementations...
  //

  /*this.on ('acceptTravel', req => UPDATE (req._target) .with ({TravelStatus_code:'A'}))
  this.on ('rejectTravel', req => UPDATE (req._target) .with ({TravelStatus_code:'X'}))
  this.on ('deductDiscount', async req => {
    let discount = req.data.percent / 100
    let succeeded = await UPDATE (req._target)
      .where `TravelStatus_code != 'A'`
    if (!succeeded) { //> let's find out why...
      let travel = await SELECT.one `TravelID as ID, TravelStatus_code as status` .from (req._target)
      if (!travel) throw req.reject (404, `Travel "${travel.ID}" does not exist; may have been deleted meanwhile.`)
      if (travel.status === 'A') req.reject (400, `Travel "${travel.ID}" has been approved already.`)
    } else {
      // Note: it is important to read from this, not db to include draft handling
      // REVISIT: through req._target workaround, IsActiveEntity is non-enumerable, which breaks this.read(Travel, req.params[0])
      const [{ TravelUUID, IsActiveEntity }] = req.params
      return this.read(Travel, { TravelUUID, IsActiveEntity })
    }
  })*/


  // Add base class's handlers. Handlers registered above go first.
  return super.init()

}}
module.exports = {GeraetetypService}
