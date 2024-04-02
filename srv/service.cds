using { db.database as my } from '../db/schema';
service MyService {
    entity DEB as projection on my.DataEntryBox;
    annotate DEB with @odata.draft.enabled;
    
    entity GEN as projection on my.General;  
    entity Pay as projection on my.Paymemts;
    entity RevenueSummary as projection on my.RevenueSummary;
}
