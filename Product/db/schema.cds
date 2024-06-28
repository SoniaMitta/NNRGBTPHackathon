namespace com.satinfotech.product;
using {cuid, managed} from '@sap/cds/common';


entity ProductLocal: managed {

    @title: 'Product ID'
    @readonly
    key Product: String(40);
    @title:'Product Type'
    @readonly
    ProductType: String(4);
    @readonly
    @title: 'Base Unit'
    BaseUnit: String(3);
    @readonly
    @title: 'Product Group'
    ProductGroup: String(18);
    @title: 'Product Description'
    ProductDescription: String(40);
}