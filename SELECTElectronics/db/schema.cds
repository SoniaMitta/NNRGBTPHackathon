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

entity Store : cuid,managed {
    @title : 'Store ID'
    store_id : Integer;
    @title : 'Name'
    name : String(30);
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
    product_id : Integer ;
    @title : 'Product Name'
    product_name : String(30);
    @title : 'Product Image URL'
    product_img_url : String(50);
    @title : 'Cost Price'
    product_cost_price : Integer;
    @title : 'Sell Price'
    product_sell_price : Integer;
}

entity StockData : cuid,managed {
    @title : 'Store ID'
    store_id : Association to Store;
    @title : 'Product ID'
    product_id : Association to Product;
    @title : 'Stock Quantity'
    stock_qty : Integer;
}

entity Purchase : cuid,managed {
    @title : 'Purchase Order Number'
    pod : Integer;
    @title : 'Business Partner'
    business_partner_number : Association to BusinessPartner;
    @title : 'Purchase order date'
    purchase_order__date : Date;
    @title : 'Items'
    items : Composition of many {
        key ID : UUID;
        Item : Association to Items;
    }
}

entity Items : cuid,managed {
    @title : 'Product ID'
    product_id : Association to Product;
    @title : 'Quantity'
    qty : Integer;
    @title : 'Price'
    price : Integer;
    @title : 'Store ID'
    store_id : Association to Store;
}

entity Sales : cuid,managed {
    @title : 'Sales Order Number'
    sod : Integer;
    @title : 'Business Partner'
    business_partner_number : Association to BusinessPartner;
    @title : 'Sales date'
    sales_date : Date;
    @title : 'Items'
    items : Composition of many {
        key ID : UUID;
        product_id : Association to Product;
        qty : Association to StockData;
        price : Integer;
        store_id : Association to Store;
    }
}






