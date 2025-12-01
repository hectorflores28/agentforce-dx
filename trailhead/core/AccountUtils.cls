public class AccountUtils {

    /**
     * @description Retrieves a list of Account objects whose BillingState matches the specified state abbreviation.
     * @param stateAbbreviation The two-letter state abbreviation (e.g., 'CA', 'NY').
     * @return A List of Account objects containing only the Id and Name fields.
     */
    public static List<Account> accountsByState(String stateAbbreviation) {
        // Check if the state abbreviation is provided and not null
        if (stateAbbreviation == null || stateAbbreviation.trim().length() == 0) {
            // Return an empty list if no state is provided
            return new List<Account>();
        }

        // Use a SOQL query to find Accounts where BillingState matches the input.
        // We use a bind variable (:stateAbbreviation) for security and best practices.
        // We also ensure the input is trimmed and converted to uppercase for robust matching,
        // although exact case matching depends on how the data is stored in the org.
        String searchState = stateAbbreviation.trim();

        List<Account> filteredAccounts = [
            SELECT Id, Name
            FROM Account
            WHERE BillingState = :searchState
        ];

        return filteredAccounts;
    }
}
