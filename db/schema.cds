namespace db.database;

using { cuid } from '@sap/cds/common';

entity DataEntryBox : cuid {
    ID : UUID @UI.ExcludeFromNavigationContext;
    key DocumentNumber : String;
    PostalOutlet: String;
    Location: String;
    Status : String;
    Type: String;
    CreatedON : Date;
    ReciveDate: Date;
    To_Gen : Association to many General on To_Gen.DocumentNumber = DocumentNumber;
    To_Pay : Composition of many Paymemts on To_Pay.DocumentNumber = DocumentNumber;    
}

entity General : cuid {
    DocumentNumber: String;
    Field : String;
    Reported: String;
    Audited: String;
    Adjustment : String;
    Reason: String; 
    Rate: String;
    Calculated: String;
}

entity Paymemts : cuid {
    DocumentNumber: String;
    Field : String;
    Reported: String;
    Audited: String;
    Adjustment : String;
    Reason: String; 
    Rate: String;
    Calculated: String;
}
entity RevenueSummary : cuid {
    HuntingPermitsRevenue: String;
    PostageSuppliesRevenue: String;
    RetailsRevenue: String;
    PhilatelicRevenue: String;
}

