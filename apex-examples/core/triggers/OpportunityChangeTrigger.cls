trigger OpportunityChangeTrigger on OpportunityChangeEvent (after insert) {
    List<Task> tasks = new List<Task>();

    // Iterate through each event message.
    for (OpportunityChangeEvent event : Trigger.New) {
        // Get event header fields
        EventBus.ChangeEventHeader header = event.ChangeEventHeader;

        // Check if the operation is an UPDATE and if the Opportunity is won
        if ((header.changetype == 'UPDATE') && (event.isWon == true)) {
            // Create a followup task
            Task tk = new Task();
            tk.Subject = 'Follow up on won opportunities: ' + header.recordIds;
            tk.OwnerId = header.CommitUser;
            tasks.add(tk);
        }
    }

    // Insert all tasks in bulk.
    if (tasks.size() > 0) {
        insert tasks;
    }
}