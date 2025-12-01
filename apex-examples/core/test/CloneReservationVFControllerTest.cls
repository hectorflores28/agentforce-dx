@isTest
public class CloneReservationVFControllerTest {
    private static testmethod void prueba(){
        Account acc = new Account ();
        acc.Name = 'tstAcc';
        acc.Phone = '2919191919';
        acc.BillingStreet = 'calle1';
        insert acc;
        
        Opportunity opp = new Opportunity();
        opp.CloseDate = date.today()+5;
        opp.Name = 'opp tst';
        opp.AccountId = acc.id;
        opp.StageName = 'Quote';
        opp.Suma_GrandTotal__c = 0;
        insert opp;
        
        test.startTest();
        ApexPages.StandardController scx = new ApexPages.StandardController(opp);
        CloneReservationVFController vfc = new CloneReservationVFController(scx);
        vfc.clonaopp();
        
        test.stopTest();
    }
    private static testmethod void prueba2(){
        Account acc = new Account ();
        acc.Name = 'tstAcc';
        acc.Phone = '2919191919';
        acc.BillingStreet = 'calle1';
        insert acc;
        
        Summary_request__c sr = new Summary_request__c();
        sr.Name = 'prueba sr';
        insert sr;
        
        Opportunity opp = new Opportunity();
        opp.CloseDate = date.today()+5;
        opp.Name = 'opp tst';
        opp.AccountId = acc.id;
        opp.StageName = 'Quote';
        opp.Amount=500;
        opp.Suma_GrandTotal__c = 0;
        opp.Summary_Request__c=sr.id;
        insert opp;
        

            
        
        test.startTest();
        ApexPages.StandardController scx = new ApexPages.StandardController(opp);
        CloneReservationVFController vfc = new CloneReservationVFController(scx);
        vfc.clonaopp();
        
        test.stopTest();
    }
    
}