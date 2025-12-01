/**
 * AccountProcessor class
 * Contains future method to count contacts for a given list of Account IDs
 * and update the 'Number_Of_Contacts__c' field.
 */
public class AccountProcessor {
    
    /**
     * @future annotation ensures this method runs asynchronously.
     * @param accountIds A List of Account IDs to process.
     */
    @future
    public static void countContacts(List<Id> accountIds) {
        
        // Query for Accounts and their related Contacts using a parent-child subquery.
        // This is an efficient way to get the count for each Account.
        List<Account> accounts = [SELECT Id, (SELECT Id FROM Contacts) 
                                  FROM Account 
                                  WHERE Id IN :accountIds];
        
        List<Account> accountsToUpdate = new List<Account>();
        
        // Loop through the queried accounts
        for (Account acc : accounts) {
            // The subquery (acc.Contacts) is a List. We can get its size.
            Integer contactCount = acc.Contacts.size();
            
            // Create a new Account sObject instance for the update
            // We only set the Id and the field to be updated for efficiency.
            accountsToUpdate.add(new Account(
                Id = acc.Id,
                Number_Of_Contacts__c = contactCount
            ));
        }
        
        // Perform the DML update only if the list is not empty
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}
