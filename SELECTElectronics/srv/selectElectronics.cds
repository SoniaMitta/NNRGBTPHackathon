using { com.satinfotech.selectelectronicsdb as db} from '../db/schema';


service SELECTElectronics {
    entity BusinessPartner as projection on db.BusinessPartner;
    entity Store as projection on db.Store;
    entity Product as projection on db.Product;
    entity StockData as projection on db.StockData;
    entity Purchase as projection on db.Purchase;
    
}

annotate SELECTElectronics.BusinessPartner with @odata.draft.enabled;
annotate SELECTElectronics.Store with @odata.draft.enabled;
annotate SELECTElectronics.Product with @odata.draft.enabled;
annotate SELECTElectronics.StockData with @odata.draft.enabled;
annotate SELECTElectronics.Purchase with @odata.draft.enabled;




