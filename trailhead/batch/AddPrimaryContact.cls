public class AddPrimaryContact implements Queueable {

    private Contact baseContact;
    private String stateFilter;

    // Constructor
    public AddPrimaryContact(Contact c, String stateAbbrev) {
        this.baseContact = c;
        this.stateFilter = stateAbbrev;
    }

    // Queueable execute method
    public void execute(QueueableContext qc) {

        // Query up to 200 Accounts with the specified BillingState
        List<Account> accts = [
            SELECT Id
            FROM Account
            WHERE BillingState = :stateFilter
            LIMIT 200
        ];

        // Create a Contact for each account
        List<Contact> contactsToInsert = new List<Contact>();

        for (Account a : accts) {
            // Clone the original Contact
            Contact clonedContact = baseContact.clone(false, false, false, false);
            clonedContact.AccountId = a.Id;
            contactsToInsert.add(clonedContact);
        }

        if (!contactsToInsert.isEmpty()) {
            insert contactsToInsert;
        }
    }
}
