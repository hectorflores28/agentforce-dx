trigger AccountTrigger on Account (before insert) {

    // Check for the specific trigger context: before insert
    if (Trigger.isBefore && Trigger.isInsert) {
        // Call the static method in the handler class
        // and pass the list of new Account records (Trigger.new).
        AccountTriggerHandler.CreateAccounts(Trigger.new);
    }

}
