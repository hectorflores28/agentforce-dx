/**
 * Test class for AccountProcessor.
 * Verifies that the countContacts future method correctly counts
 * contacts and updates the Account record.
 */
@isTest
private class AccountProcessorTest {

    /**
     * Test method to verify contact counting logic.
     * Covers:
     * 1. Accounts with multiple contacts.
     * 2. Accounts with zero contacts.
     */
    @isTest
    static void testCountContacts() {
        // 1. Arrange: Create test data
        
        // Create two accounts for testing
        Account accWithContacts = new Account(Name = 'Account With Contacts');
        Account accWithoutContacts = new Account(Name = 'Account Without Contacts');
        List<Account> testAccounts = new List<Account>{ accWithContacts, accWithoutContacts };
        
        insert testAccounts;
        
        // Create 3 contacts for the first account
        List<Contact> testContacts = new List<Contact>();
        testContacts.add(new Contact(LastName = 'Smith', AccountId = accWithContacts.Id));
        testContacts.add(new Contact(LastName = 'Jones', AccountId = accWithContacts.Id));
        testContacts.add(new Contact(LastName = 'Doe', AccountId = accWithContacts.Id));
        
        insert testContacts;
        
        // Prepare the list of IDs to pass to the future method
        List<Id> accountIds = new List<Id>{ accWithContacts.Id, accWithoutContacts.Id };
        
        // 2. Act: Call the future method
        
        // Use Test.startTest() and Test.stopTest() to enqueue and 
        // execute the asynchronous @future method
        Test.startTest();
            AccountProcessor.countContacts(accountIds);
        Test.stopTest(); // This forces the future method to complete
        
        
        // 3. Assert: Verify the results
        
        // Re-query the accounts from the database to get the updated values
        Map<Id, Account> updatedAccountsMap = new Map<Id, Account>(
            [SELECT Id, Number_Of_Contacts__c 
             FROM Account 
             WHERE Id IN :accountIds]
        );
        
        // Verify the account WITH contacts was updated correctly
        System.assert(updatedAccountsMap.containsKey(accWithContacts.Id), 
                      'Test data should include the first account');
        System.assertEquals(3, updatedAccountsMap.get(accWithContacts.Id).Number_Of_Contacts__c, 
                             'Account 1 should have 3 contacts.');
        
        // Verify the account WITHOUT contacts was updated correctly
        System.assert(updatedAccountsMap.containsKey(accWithoutContacts.Id), 
                      'Test data should include the second account');
        System.assertEquals(0, updatedAccountsMap.get(accWithoutContacts.Id).Number_Of_Contacts__c, 
                             'Account 2 should have 0 contacts.');
    }
}
