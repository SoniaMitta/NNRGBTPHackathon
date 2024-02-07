using SELECTElectronics as service from '../../srv/selectElectronics';

annotate service.Sales with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : pod,
        },
        {
            $Type : 'UI.DataField',
            Value : purchase_order__date,
        },
    ]
);
annotate service.Sales with {
    business_partner_number @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'BusinessPartner',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : business_partner_number_ID,
                ValueListProperty : 'ID',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'business_partner_number',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'first_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'last_name',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'address_1',
            },
        ],
    }
};
annotate service.Sales with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : pod,
            },
            {
                $Type : 'UI.DataField',
                Value : purchase_order__date,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
    ]
);
