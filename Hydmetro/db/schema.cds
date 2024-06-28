namespace com.satinfotech.metro;
using {cuid, managed} from '@sap/cds/common';

entity train: managed, cuid {
     @title:'Train ID'
    train_id: String(10);
    @title: 'Train Number'
    train_no: String(40);
    @title: 'Capacity'
    capacity: Integer;
    @title: 'Number of Cars'
    no_of_cars: Integer;
    @title: 'Manufacture Date'
    m_date: Date;
    @title: 'Maintenance Status'
    maintenance_status: Boolean;
}

entity ProductLocal: managed {

    @title: 'Product ID'
    key Product: String(40);
    @title:'Product Type'
    ProductType: String(4);
    @title: 'Base Unit'
    BaseUnit: String(3);
    @title: 'Product Group'
    ProductGroup: String(18);
    @title: 'Product Description'
    ProductDescription: String(40);
}