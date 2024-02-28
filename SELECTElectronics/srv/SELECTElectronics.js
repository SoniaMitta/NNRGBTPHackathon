const cds = require('@sap/cds');


module.exports = cds.service.impl(function() {
    const { BusinessPartner,Product,State,Purchase,StockData,Sales} = this.entities();

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



this.before(['CREATE','UPDATE'], Purchase, async(req) => {
    //is_vendor validation
    data = req.data 
    bpn=data.business_partner_number_ID;
    let query1 = SELECT.from(BusinessPartner).where({ref:["ID"]}, "=", {val: bpn});
    result = await cds.run(query1);
    is_vendor = result[0].is_vendor;
    if(is_vendor === null){
        req.error({
            'code': 'NOTVENDOR',
            message:  'The business partner must be a Vendor',
            target: 'is_vendor'
        });
    }
    //Purchase Items validation
    Itemdata = req.data.Items
    if(Array.isArray(Itemdata)){
        Itemdata.map(async (each) => {
            product_id = each.product_id_ID;
            price = each.price;
            let query1 = SELECT.from(Product).where({ref:["ID"]}, "=", {val: product_id});
            result = await cds.run(query1);
            console.log(result)
            cost_price = result[0].product_cost_price
            if(price > cost_price){
                req.error({
                    'code': 'pLOW',
                    message:  'Price cannot be more than Cost price',
                    target: 'price'
                });
            }
            //stock changes
            qty = each.qty;
            let query2 = SELECT.from(StockData).where({ref:["product_id_ID"]}, "=", {val: product_id});
            result2 = await cds.run(query2);
            console.log(result2)
            stock_qty = result2[0].stock_qty;
            console.log(stock_qty)
            console.log(qty)
            qty = stock_qty+qty;
            console.log(qty)
            await cds.run(UPDATE.entity(StockData).data({
                'stock_qty':qty,
            }).where({ref:["product_id_ID"]}, "=", {val: product_id}));
        })
    }

});



this.before(['CREATE','UPDATE'], Sales, async(req) => {
    //is_customer validation
    data = req.data 
    bpn=data.business_partner_number_ID;
    let query1 = SELECT.from(BusinessPartner).where({ref:["ID"]}, "=", {val: bpn});
    result = await cds.run(query1);
    is_customer = result[0].is_customer;
    if(is_customer === null){
        req.error({
            'code': 'NOTCUSTOMER',
            message:  'The business partner must be a Customer',
            target: 'is_customer'
        });
    }
    //Sales Items validation
    Itemdata = req.data.Items
    if(Array.isArray(Itemdata)){
        Itemdata.map(async (each) => {
            product_id = each.product_id_ID;
            price = each.price;
            let query1 = SELECT.from(Product).where({ref:["ID"]}, "=", {val: product_id});
            result = await cds.run(query1);
            console.log(result)
            sell_price = result[0].product_sell_price
            if(price < sell_price){
                req.error({
                    'code': 'pLOW',
                    message:  'Price cannot be less than Sell price',
                    target: 'price'
                });
            }
            //stock changes
            qty = each.qty;
            let query2 = SELECT.from(StockData).where({ref:["product_id_ID"]}, "=", {val: product_id});
            result2 = await cds.run(query2);
            console.log(result2)
            stock_qty = result2[0].stock_qty;
            console.log(stock_qty)
            console.log(qty)
            qty = stock_qty-qty;
            console.log(qty)
            await cds.run(UPDATE.entity(StockData).data({
                'stock_qty':qty,
            }).where({ref:["product_id_ID"]}, "=", {val: product_id}));
        })
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