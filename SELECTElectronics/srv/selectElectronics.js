const cds = require('@sap/cds');


module.exports = cds.service.impl(function() {
    const { BusinessPartner} = this.entities();

    this.before(['CREATE','UPDATE'], BusinessPartner, async(req) => {
        console.log(req.data);
        const Is_gstn_registered = req.data.Is_gstn_registered;
        const gstin_number = req.data.gstin_number;
        console.log(Is_gstn_registered)
        console.log(gstin_number)
        if (Is_gstn_registered && gstin_number === null) {
            console.log("hi");
            req.error({
                'code': 'GSTINREQ',
                message: 'GSTIN number is required',
                target: 'gstin_number'
            });
        }
        



});
});