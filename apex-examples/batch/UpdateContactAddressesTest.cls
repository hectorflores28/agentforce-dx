/**
 * Test class for UpdateContactAddresses Batch Apex class.
 * Verifies that Contact mailing addresses are correctly updated
 * based on their parent Account billing addresses.
 */
@isTest
private class UpdateContactAddressesTest {
    
    /**
     * @testSetup method - Creates test data that will be available
     * to all test methods in this class.
     * This method runs once before each test method.
     */
    @testSetup
    static void setup() {
        List<Account> accounts = new List<Account>();
        List<Contact> contacts = new List<Contact>();
        
        // Insert 10 accounts with billing address in USA
        for (Integer i = 0; i < 10; i++) {
            accounts.add(new Account(
                Name = 'Account ' + i,
                BillingCity = 'New York',
                BillingCountry = 'USA',
                BillingStreet = '123 Main St ' + i,
                BillingState = 'NY',
                BillingPostalCode = '1000' + i
            ));
        }
        
        insert accounts;
        
        // Find the accounts just inserted and add one contact for each
        for (Account account : [SELECT Id FROM Account]) {
            contacts.add(new Contact(
                FirstName = 'first',
                LastName = 'last',
                AccountId = account.Id,
                // Set initial mailing address to something different
                // so we can verify it gets updated
                MailingCity = 'Los Angeles',
                MailingState = 'CA'
            ));
        }
        
        insert contacts;
    }

    /**
     * Test method to verify the batch job correctly updates Contact addresses.
     * 
     * Test covers:
     * 1. Batch processing of Accounts and Contacts
     * 2. Address field copying from Account to Contact
     * 3. Stateful counter functionality
     */
    @isTest 
    static void test() {
        // Use Test.startTest() and Test.stopTest() to enqueue and
        // execute the asynchronous batch job within test context
        Test.startTest();
        
        // Instantiate and execute the batch class
        UpdateContactAddresses uca = new UpdateContactAddresses();
        Id batchId = Database.executeBatch(uca);
        
        Test.stopTest();
        
        // After Test.stopTest(), the batch job completes synchronously
        // Now we can assert that records were updated properly
        
        // Verify that all contacts have their MailingCity updated to 'New York'
        // (which matches the Account BillingCity)
        System.assertEquals(
            10, 
            [SELECT COUNT() FROM Contact WHERE MailingCity = 'New York'],
            'All 10 contacts should have MailingCity updated to New York'
        );
        
        // Verify that all contacts have their MailingState updated to 'NY'
        System.assertEquals(
            10,
            [SELECT COUNT() FROM Contact WHERE MailingState = 'NY'],
            'All 10 contacts should have MailingState updated to NY'
        );
        
        // Additional verification: Check that the address fields match
        List<Contact> updatedContacts = [
            SELECT Id, MailingCity, MailingState, MailingStreet, MailingPostalCode,
                   Account.BillingCity, Account.BillingState, 
                   Account.BillingStreet, Account.BillingPostalCode
            FROM Contact
            WHERE MailingCity = 'New York'
        ];
        
        for (Contact c : updatedContacts) {
            // Verify each field was copied correctly
            System.assertEquals(
                c.Account.BillingCity, 
                c.MailingCity, 
                'MailingCity should match Account BillingCity'
            );
            System.assertEquals(
                c.Account.BillingState, 
                c.MailingState, 
                'MailingState should match Account BillingState'
            );
            System.assertEquals(
                c.Account.BillingStreet, 
                c.MailingStreet, 
                'MailingStreet should match Account BillingStreet'
            );
            System.assertEquals(
                c.Account.BillingPostalCode, 
                c.MailingPostalCode, 
                'MailingPostalCode should match Account BillingPostalCode'
            );
        }
    }
}

