@isTest
private class AccountTriggerTest {

    @isTest
    static void testShippingStateUpdate() {
        // Define the state we will use for testing
        String testState = 'CA';
        // Define the number of records to test bulkification
        Integer recordCount = 200;

        // 1. Setup Test Data: Create a list of 200 Account records
        List<Account> accountsToInsert = new List<Account>();
        for (Integer i = 0; i < recordCount; i++) {
            Account newAcc = new Account(
                Name = 'Test Account ' + i,
                BillingState = testState // Set the BillingState
                // ShippingState is left null/blank to verify the trigger sets it
            );
            accountsToInsert.add(newAcc);
        }

        // 2. Execute Test: Use Test.startTest() and Test.stopTest()
        // to clearly mark the transaction being tested.
        Test.startTest();
            // The trigger (AccountTrigger) will execute before this DML finishes
            insert accountsToInsert;
        Test.stopTest();

        // 3. Verification: Query the inserted records and verify the field values.
        // We use a dedicated SOQL query here to retrieve the records as they exist in the database.
        List<Account> insertedAccounts = [
            SELECT Id, Name, BillingState, ShippingState
            FROM Account
            WHERE Name LIKE 'Test Account %'
            LIMIT :recordCount
        ];

        // Assert that the correct number of records were inserted
        System.assertEquals(recordCount, insertedAccounts.size(), 
            'Expected ' + recordCount + ' accounts to be inserted.');

        // Iterate through all inserted accounts to verify the trigger logic
        for (Account acc : insertedAccounts) {
            // Assert that the ShippingState was successfully set to the BillingState value
            System.assertEquals(testState, acc.ShippingState, 
                'ShippingState should match the BillingState (' + testState + ')');
        }
    }
}
