using {com.satinfotech.product as product} from '../db/schema';
using {API_PRODUCT_SRV as productapi} from './external/API_PRODUCT_SRV';



service product_api @(requires: 'authenticated-user') {
   

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

  entity ProductLocal as projection on product.ProductLocal;


}


annotate product_api.ProductLocal with @odata.draft.enabled;