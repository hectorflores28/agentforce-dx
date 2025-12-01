@isTest
public class AddPrimaryContactTest {

    @isTest
    static void testAddPrimaryContact() {

        List<Account> accounts = new List<Account>();

        // 50 Accounts with BillingState = 'NY'
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(Name = 'NY Account ' + i, BillingState = 'NY'));
        }

        // 50 Accounts with BillingState = 'CA'
        for (Integer i = 0; i < 50; i++) {
            accounts.add(new Account(Name = 'CA Account ' + i, BillingState = 'CA'));
        }

        insert accounts;

        // Create a base Contact to clone
        Contact baseContact = new Contact(
            FirstName = 'Test',
            LastName = 'Contact'
        );

        // Queue the job for CA
        AddPrimaryContact job = new AddPrimaryContact(baseContact, 'CA');

        Test.startTest();
        System.enqueueJob(job);
        Test.stopTest();

        // Verify contacts were created for the 50 CA accounts
        Integer countContacts = [
            SELECT COUNT()
            FROM Contact
            WHERE LastName = 'Contact'
        ];

        System.assertEquals(50, countContacts, 'Exactly 50 cloned Contacts should be inserted.');
    }
}
