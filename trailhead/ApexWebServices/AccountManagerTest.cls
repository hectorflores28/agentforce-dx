@IsTest private class AccountManagerTest {
    @IsTest static void testGetAccount() {
        Account testAccount = new Account(Name = 'Test Account');
        insert testAccount;
        List<Contact> testContacts = new List<Contact>();
        testContacts.add(new Contact(FirstName = 'John', LastName = 'Doe', AccountId = testAccount.Id));
        testContacts.add(new Contact(FirstName = 'Jane', LastName = 'Smith', AccountId = testAccount.Id));
        insert testContacts;
        RestRequest request = new RestRequest();
        request.requestUri = 'https://curious-impala-jjivd0-dev-ed.trailblaze.lightning.force.com/services/apexrest/Accounts/' + testAccount.Id + '/contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        Account resultAccount = AccountManager.getAccount();
        System.assertNotEquals(null, resultAccount, 'The returned account should not be null.');
        System.assertEquals(testAccount.Id, resultAccount.Id, 'The returned account ID should match the test account ID.');
        System.assertEquals(testAccount.Name, resultAccount.Name, 'The returned account name should match the test account name.');
        System.assertEquals(2, resultAccount.Contacts.size(), 'The number of contacts returned should be 2.');
        Boolean foundContact1 = false;
        Boolean foundContact2 = false;
        for (Contact c : resultAccount.Contacts) {
            if (c.FirstName == 'John' && c.LastName == 'Doe') {
                foundContact1 = true;
            }
            if (c.FirstName == 'Jane' && c.LastName == 'Smith') {
                foundContact2 = true;
            }
        }
        System.assertEquals(true, foundContact1, 'The first test contact should have been found.');
        System.assertEquals(true, foundContact2, 'The second test contact should have been found.');
    }
}