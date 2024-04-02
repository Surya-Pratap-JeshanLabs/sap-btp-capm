using MyService as service from '../../srv/service';

annotate service.DEB with @(
    UI : {
        SelectionFields  : [
            PostalOutlet,
            Location,
            Status,
            CreatedON
        ],
        HeaderFacets  : [            
			{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'}
            
        ],
        FieldGroup#Main: {
			Data: [
				{Value: ID}
			]
		},
        Facets: [
			{$Type: 'UI.ReferenceFacet', Label: 'Main', Target: '@UI.FieldGroup#Main'},
		],
    },   


    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'PostalOutlet',
            Value : PostalOutlet,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Location',
            Value : Location,
        },
        {
            $Type : 'UI.DataField',
            Label : 'Status',
            Value : Status,
        },
        {
            $Type : 'UI.DataField',
            Label : 'CreatedON',
            Value : CreatedON,
        },
        
    ],
);

annotate service.RevenueSummary with @ (
    UI.LineItem #SR : [
        {
            $Type : 'UI.DataField',
            Label : 'PhilatelicRevenue',
            Value : PhilatelicRevenue
        }
    ]
);


annotate service.Pay with @(
    UI.LineItem #Pay : 
    [
        {
                $Type : 'UI.DataField',
                Value : Reason, 
        },
        {
                $Type : 'UI.DataField',
                Value : Audited, 
        },
        {
                $Type : 'UI.DataField',
                Value : DocumentNumber, 
        }
    ]        
    
);
annotate service.GEN with @(
    UI.LineItem #GEN : 
    [
        {
                $Type : 'UI.DataField',
                Value : Reason, 
        },
        {
                $Type : 'UI.DataField',
                Value : Calculated, 
        },
        {
                $Type : 'UI.DataField',
                Value : DocumentNumber, 
        }
    ]        
    
);


annotate service.DEB with @(
    UI.FieldGroup #GeneratedGroup1 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PostalOutlet,
            },
            {
                $Type : 'UI.DataField',
                Value : Location,
            },
            {
                $Type : 'UI.DataField',
                Value : Status,
            },
            {
                $Type : 'UI.DataField',
                Value : CreatedON,
            },
        ],
    },
    UI.FieldGroup #GEN : {
        $Type: 'UI.FieldGroupType',
        Data : [
            { 
                $Type : 'UI.DataField',
                Value : 'Field'
            },
            {
                $Type : 'UI.DataField',
                Value : 'Reported'
            },
            {
                $Type : 'UI.DataField',
                Value : 'Audited'
            },
            {
                $Type : 'UI.DataField',
                Value : 'Adjustment'
            },
            {
                $Type : 'UI.DataField',
                Value : 'Reason'
            },
            {
                $Type : 'UI.DataField',
                Value : 'Audited'
            },
            
        ]
    },
    UI.FieldGroup #GeneratedGroup2 : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : PostalOutlet,
            },
            {
                $Type : 'UI.DataField',
                Value : Location,
            },
            {
                $Type : 'UI.DataField',
                Value : Status,
            },
            {
                $Type : 'UI.DataField',
                Value : CreatedON,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General',
            Target : '@UI.FieldGroup#GeneratedGroup1',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet2',
            Label : 'Receipts',
            Target : 'To_Gen/@UI.LineItem#GEN',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet3',
            Label : 'Payments',
            Target : 'To_Pay/@UI.LineItem#Pay',
        }
    ]
);

annotate service.DEB with @(
    UI.SelectionPresentationVariant #tableView : {
        $Type : 'UI.SelectionPresentationVariantType',
        PresentationVariant : {
            $Type : 'UI.PresentationVariantType',
            Visualizations : [
                '@UI.LineItem',
            ],
        },
        SelectionVariant : {
            $Type : 'UI.SelectionVariantType',
            SelectOptions : [
            ],
        },
        Text : 'Table View',
    }
);
