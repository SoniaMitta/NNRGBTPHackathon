const cds = require('@sap/cds');


module.exports = cds.service.impl(function() {
    const { BusinessPartner,Product,State} = this.entities();

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


this.before(['CREATE','UPDATE'], Product, async(req) => {
    console.log(req.data);
    const cost_price = req.data. product_cost_price;
    const selling_price = req.data.product_sell_price;
    if(selling_price<cost_price){
        req.error({
            'code': 'SPLOW',
            message: 'Selling price cannot be less than Cost price',
            target: 'product_sell_price'
        });
    }
});


this.on(['READ'], State, async(req) => {
      
    var states = [
         {"code":"AP", "description":"Andhra Pradesh"},
         {"code":"AR", "description":"Arunachal Pradesh"},
         {"code":"AS", "description":"Assam"},
         {"code":"BR", "description":"Bihar"},
         {"code":"CG", "description":"Chhattisgarh"},
         {"code":"GA", "description":"Goa"},
         {"code":"GJ", "description":"Gujarat"},
         {"code":"HR", "description":"Haryana"},
         {"code":"HP", "description":"Himachal Pradesh"},
         {"code":"JK", "description":"Jammu and Kashmir"},
         {"code":"JH", "description":"Jharkhand"},
         {"code":"KA", "description":"Karnataka"},
         {"code":"KL", "description":"Kerala"},
         {"code":"MP", "description":"Madhya Pradesh"},
         {"code":"MH", "description":"Maharashtra"},
         {"code":"MN", "description":"Manipur"},
         {"code":"ML", "description":"Meghalaya"},
         {"code":"MZ", "description":"Mizoram"},
         {"code":"NL", "description":"Nagaland"},
         {"code":"OR", "description":"Orissa"},
         {"code":"PB", "description":"Punjab"},
         {"code":"RJ", "description":"Rajasthan"},
         {"code":"SK", "description":"Sikkim"},
         {"code":"TN", "description":"Tamil Nadu"},
         {"code":"TR", "description":"Tripura"},
         {"code":"UK", "description":"Uttarakhand"},
         {"code":"UP", "description":"Uttar Pradesh"},
         {"code":"WB", "description":"West Bengal"}
     ]
       states.$count=states.length;
       return states;
     });



});