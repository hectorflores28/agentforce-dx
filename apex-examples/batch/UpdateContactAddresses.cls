/**
 * UpdateContactAddresses class
 * Batch Apex class that updates Contact mailing addresses based on their 
 * parent Account billing addresses.
 * 
 * Implements:
 * - Database.Batchable<sObject>: Required interface for Batch Apex
 * - Database.Stateful: Allows instance variables to retain state across batches
 */
public class UpdateContactAddresses implements
    Database.Batchable<sObject>, Database.Stateful {
    
    // Instance member to retain state across transactions
    // This counter will persist across all execute() method calls
    public Integer recordsProcessed = 0;

    /**
     * start() method - Required by Database.Batchable interface
     * Defines the scope of records to process.
     * 
     * @param bc The BatchableContext provided by the platform
     * @return Database.QueryLocator that defines the records to process
     */
    public Database.QueryLocator start(Database.BatchableContext bc) {
        // Query Accounts with their related Contacts using a parent-child subquery
        // Only process Accounts where BillingCountry = 'USA'
        return Database.getQueryLocator(
            'SELECT ID, BillingStreet, BillingCity, BillingState, ' +
            'BillingPostalCode, (SELECT ID, MailingStreet, MailingCity, ' +
            'MailingState, MailingPostalCode FROM Contacts) FROM Account ' +
            'Where BillingCountry = \'USA\''
        );
    }

    /**
     * execute() method - Required by Database.Batchable interface
     * Processes each batch of records returned from start()
     * 
     * @param bc The BatchableContext provided by the platform
     * @param scope List of Account records for this batch
     */
    public void execute(Database.BatchableContext bc, List<Account> scope){
        // Process each batch of records
        List<Contact> contacts = new List<Contact>();
        
        for (Account account : scope) {
            // Process each Contact related to the Account
            for (Contact contact : account.Contacts) {
                // Copy billing address from Account to mailing address of Contact
                contact.MailingStreet = account.BillingStreet;
                contact.MailingCity = account.BillingCity;
                contact.MailingState = account.BillingState;
                contact.MailingPostalCode = account.BillingPostalCode;
                
                // Add contact to list to be updated
                contacts.add(contact);
                
                // Increment the instance member counter
                // This value persists because we implement Database.Stateful
                recordsProcessed = recordsProcessed + 1;
            }
        }
        
        // Perform DML update if there are contacts to update
        if (!contacts.isEmpty()) {
            update contacts;
        }
    }

    /**
     * finish() method - Required by Database.Batchable interface
     * Called once after all batches have been processed.
     * Useful for cleanup, sending notifications, or logging final results.
     * 
     * @param bc The BatchableContext provided by the platform
     */
    public void finish(Database.BatchableContext bc){
        // Log the total number of records processed
        System.debug(recordsProcessed + ' records processed. Shazam!');
        
        // Query the AsyncApexJob to get job details
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors,
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        
        // Call utility to send email notification
        // Note: EmailUtils class would need to be created separately
        // EmailUtils.sendMessage(job, recordsProcessed);
        
        // For now, just log the job information
        System.debug('Job Status: ' + job.Status);
        System.debug('Job Items Processed: ' + job.JobItemsProcessed);
        System.debug('Total Job Items: ' + job.TotalJobItems);
        System.debug('Number of Errors: ' + job.NumberOfErrors);
    }
}

