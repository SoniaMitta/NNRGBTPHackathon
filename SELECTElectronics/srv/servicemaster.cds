using {SELECTElectronics} from './selectElectronics';




annotate SELECTElectronics.BusinessPartner with {
    first_name      @assert.format: '^[a-zA-Z]{2,}$';
    last_name      @assert.format: '^[a-zA-Z]{2,}$';    
    pin_code    @assert.format: '^[1-9][0-9]{5}$';
    gstin_number    @assert.format : '^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$';
}

annotate SELECTElectronics.BusinessPartner with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : business_partner_number
        },
        {
            $Type : 'UI.DataField',
            Value : first_name
        },
        {
            $Type : 'UI.DataField',
            Value : last_name
        },
        {
            $Type : 'UI.DataField',
            Value : address_1
        },
        {
            $Type : 'UI.DataField',
            Value : address_2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pin_code
        },
        {
             $Type : 'UI.DataField',
            Value : Is_gstn_registered
        },
        {
             $Type : 'UI.DataField',
            Value : gstin_number
        },
        {
             $Type : 'UI.DataField',
            Value : is_vendor
        },
        {
             $Type : 'UI.DataField',
            Value : is_customer
        }
    ],
    UI.SelectionFields: [ business_partner_number,first_name , last_name],       
);

annotate SELECTElectronics.BusinessPartner with @(
    UI.FieldGroup #BusinessPartnerInformation : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
            $Type : 'UI.DataField',
            Value : business_partner_number
        },
        {
            $Type : 'UI.DataField',
            Value : first_name
        },
        {
            $Type : 'UI.DataField',
            Value : last_name
        },
        {
            $Type : 'UI.DataField',
            Value : address_1
        },
        {
            $Type : 'UI.DataField',
            Value : address_2
        },
        {
            $Type : 'UI.DataField',
            Value : city
        },
        {
            $Type : 'UI.DataField',
            Value : state
        },
        {
            $Type : 'UI.DataField',
            Value : pin_code
        },
        {
             $Type : 'UI.DataField',
            Value : Is_gstn_registered
        },
        {
             $Type : 'UI.DataField',
            Value : gstin_number
        },
        ],
    },
   UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'BusinessPartnerInfoFacet',
            Label : 'Business Partner Information',
            Target : '@UI.FieldGroup#BusinessPartnerInformation',
        },
    ],    
);



