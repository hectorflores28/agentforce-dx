/**
 * Controller for the StationCheck Visualforce page.
 * Handles the logic for the Flight Systems Checklist.
 */
public with sharing class StationCheckController {

    // Properties for Engine Status (6 total)
    public Boolean engine1Checked { get; set; }
    public Boolean engine2Checked { get; set; }
    public Boolean engine3Checked { get; set; }
    public Boolean engine4Checked { get; set; }
    public Boolean engine5Checked { get; set; }
    public Boolean engine6Checked { get; set; }
    
    // Properties for Fuel Tank Status (6 total)
    public Boolean tank1Checked { get; set; }
    public Boolean tank2Checked { get; set; }
    public Boolean tank3Checked { get; set; }
    public Boolean tank4Checked { get; set; }
    public Boolean tank5Checked { get; set; }
    public Boolean tank6Checked { get; set; }
    
    // Constructor
    public StationCheckController() {
        // Initialize all boolean properties to false when the page loads
        engine1Checked = false;
        engine2Checked = false;
        engine3Checked = false;
        engine4Checked = false;
        engine5Checked = false;
        engine6Checked = false;

        tank1Checked = false;
        tank2Checked = false;
        tank3Checked = false;
        tank4Checked = false;
        tank5Checked = false;
        tank6Checked = false;
    }
    
    /**
     * The action method called when the "Save" button is clicked.
     */
    public PageReference save() {
        
        // Example Business Logic: Check if all items are ready
        Boolean allSystemsReady = 
            engine1Checked && engine2Checked && engine3Checked && engine4Checked && engine5Checked && engine6Checked &&
            tank1Checked && tank2Checked && tank3Checked && tank4Checked && tank5Checked && tank6Checked;
            
        if (allSystemsReady) {
            ApexPages.addMessage(new ApexPages.Message(
                ApexPages.Severity.CONFIRM, 
                '✅ All Systems Ready! Station checklist saved successfully.'
            ));
        } else {
            ApexPages.addMessage(new ApexPages.Message(
                ApexPages.Severity.WARNING, 
                '⚠️ Warning: Not all systems checked. Status saved.'
            ));
        }
        
        // In a real application, you would update a database record here.
        
        // Return null to refresh the current page and display messages
        return null; 
    }
}