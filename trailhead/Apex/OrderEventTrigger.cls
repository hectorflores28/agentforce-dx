trigger OrderEventTrigger on Order_Event__e (after insert) {
    // Create a list to hold the tasks we want to insert (Best Practice: Bulkification)
    List<Task> tasks = new List<Task>();
    
    // Iterate through the list of incoming events
    for (Order_Event__e event : Trigger.New) {
        
        // Condition: Only create a task if the order has shipped
        if (event.Has_Shipped__c == true) {
            
            // Create the new Task record
            Task t = new Task();
            t.Priority = 'Medium';
            // We append the Order Number from the event to the subject line
            t.Subject = 'Follow up on shipped order ' + event.Order_Number__c;
            t.OwnerId = event.CreatedById;
            
            // Add the new task to our list
            tasks.add(t);
        }
    }
    
    // Insert the list of tasks into the database if the list is not empty
    if (tasks.size() > 0) {
        insert tasks;
    }
}