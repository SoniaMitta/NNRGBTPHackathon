namespace com.satinfotech.selectelectronicsdb;
using { managed,cuid } from '@sap/cds/common';

entity BusinessPartner : cuid,managed {
    @title : 'Business Partner Number'
    business_partner_number : Integer ;
    @title : 'First Name'
    first_name : String(30) @mandatory;
    @title : 'Last Name'
    last_name : String(30) @mandatory;
    @title : 'Address 1'
    address_1 : String(50) @mandatory;
    @title : 'Address 2'
    address_2 : String(50);
    @title : 'City'
    city : String(20) @mandatory;
     @title : 'State'
    state : String(10) @mandatory;
    @title : 'PIN Code'
    pin_code : String(20) @mandatory;
    @title : 'Is_gstn_registered'
    Is_gstn_registered : Boolean default false;
    @title :'GSTIN Number'
    gstin_number : String(30);
    @title : 'Is Vendor'
    is_vendor : Boolean;
    @title : 'Is Customer'
    is_customer : Boolean;
}


@cds.persistence.skip
entity State  {
    @title : 'code'
    code : String(5);
    @title : 'description'
    description : String(20);
} 


@assert.unique : {
    store_id : [store_id]
}
entity Store : cuid,managed {
    @title : 'Store ID'
    store_id : String(20) @mandatory;
    @title : 'Name'
    name : String(30) @mandatory;
    @title : 'Address 1'
    address_1 : String(50) @mandatory;
    @title : 'Address 2'
    address_2 : String(50);
    @title : 'City'
    city : String(20) @mandatory;
    @title : 'State'
    state : String(10) @mandatory;
    @title : 'PIN Code'
    pin_code : String(10) @mandatory;
}


entity Product : cuid,managed {
    @title : 'Product ID'
    product_id : String(20) @mandatory;
    @title : 'Product Name'
    product_name : String(30) @mandatory;
    @title : 'Product Image URL' 
    product_img_url : String(50) default 'https://img.freepik.com/free-psd/3d-camera-isolated-transparent-background_191095-16439.jpg?t=st=1708945563~exp=1708949163~hmac=73030ea4e800522d1990c71327b7b26599d43417d36193976628e1524d4cee81&w=740';
    @title : 'Cost Price'
    product_cost_price : Integer @mandatory;
    @title : 'Sell Price'
    product_sell_price : Integer @mandatory;
}

entity StockData : cuid,managed {
    @title : 'Store ID'
    store_id : Association to Store @mandatory;
    @title : 'Product ID'
    product_id : Association to Product @mandatory;
    @title : 'Stock Quantity'
    stock_qty : Integer @mandatory;
}

entity Purchase : cuid,managed {
    @title : 'Purchase Order Number'
    pod : Integer @mandatory;
    @title : 'Business Partner'
    business_partner_number : Association to BusinessPartner @mandatory;
    @title : 'Purchase order date'
    purchase_order__date : Date @mandatory;
    @title : 'Items'
    Items : Composition of many {
        key ID : UUID;
        product_id : Association to Product @mandatory;
        qty :  Integer @mandatory;
        price : Integer @mandatory;
        store_id : Association to Store;
    }
}


entity Sales : cuid,managed {
    @title : 'Sales Order Number'
    sod : Integer @mandatory;
    @title : 'Business Partner'
    business_partner_number : Association to BusinessPartner @mandatory;
    @title : 'Sales date'
    sales_date : Date @mandatory;
    @title : 'Items'
    Items : Composition of many {
        key ID : UUID;
        product_id : Association to Product @mandatory;
        qty :  Integer @mandatory;
        price : Integer @mandatory;
        store_id : Association to Store;
    }
}






