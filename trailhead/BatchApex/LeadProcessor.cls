global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    
    // instance member to retain state across transactions
    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator('SELECT Id, LeadSource FROM Lead');
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        for (Lead lead : scope) {
            lead.LeadSource = 'Dreamforce';
            recordsProcessed++;
        }
        update scope; // ⭐ CORRECCIÓN: se actualiza scope directamente
    }    

    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
    }    
}