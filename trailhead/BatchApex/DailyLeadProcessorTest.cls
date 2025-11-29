@isTest
public class DailyLeadProcessorTest {

    @isTest
    static void testDailyLeadProcessor() {
        String cronExp = '0 0 0 15 3 ? 2042'; // Una fecha futura cualquiera
        List<Lead> leads = new List<Lead>();

        // Insertamos 200 Leads de prueba
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(
                LastName = 'Test ' + i, 
                Company = 'Test Company ' + i, 
                Status = 'Open - Not Contacted' // ¡CAMPO OBLIGATORIO AGREGADO!
            ));
        }
        insert leads;

        // Ejecutamos la prueba
        Test.startTest();
            // Programamos el trabajo
            String jobId = System.schedule('ScheduledApexTest', cronExp, new DailyLeadProcessor());
        Test.stopTest(); 
        // Al ejecutar stopTest(), Salesforce ejecuta síncronamente el trabajo programado pendiente

        // Verificamos que los 200 registros se hayan actualizado
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = 'Dreamforce'];
        System.assertEquals(200, updatedLeads.size(), 'Los 200 leads deberían tener LeadSource como Dreamforce');
    }
}