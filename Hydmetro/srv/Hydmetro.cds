using {com.satinfotech.metro as metro} from '../db/schema';
using {API_PRODUCT_SRV as productapi} from './external/API_PRODUCT_SRV';



service hydmetro @(requires: 'authenticated-user') {
  entity train @(restrict: [ 
    { grant: ['READ'], to: 'HydmetroRead' },
    { grant: ['WRITE'], to: 'HydmetroWrite'},
    { grant: ['DELETE'], to: 'HydmetroDelete'},
  ]) as projection on metro.train

  entity Products as projection on productapi.A_Product{
    Product,
    ProductType,
    BaseUnit,
    ProductGroup,
    to_Description  
  }

  entity ProductDescription as projection on productapi.A_ProductDescription{
    Product,
    Language,
    ProductDescription
  }

  entity ProductLocal as projection on metro.ProductLocal;


}

annotate hydmetro.train with @odata.draft.enabled;
annotate hydmetro.ProductLocal with @odata.draft.enabled;