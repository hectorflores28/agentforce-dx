@isTest
public class TestOpportunityChangeTrigger {
    @isTest 
    static void testCreateAndUpdateOpportunity() {
        // 1. Habilitar el Change Data Capture para la prueba
        Test.enableChangeDataCapture();

        // 2. Crear una oportunidad (esto dispara un evento CREATE, 
        // pero nuestro trigger solo actúa en UPDATE con isWon=true)
        insert new Opportunity(
            Name = 'Sell 100 Widgets',
            StageName = 'Prospecting',
            CloseDate = Date.today().addMonths(3)
        );

        // 3. Entregar los eventos para procesar el trigger
        Test.getEventBus().deliver();

        // 4. Recuperar la oportunidad y actualizarla a 'Closed Won'
        Opportunity[] oppRecords = [SELECT Id, StageName FROM Opportunity];
        Opportunity opp = oppRecords[0];
        opp.StageName = 'Closed Won';
        update opp;

        // 5. Entregar los eventos nuevamente para disparar el trigger de actualización
        Test.getEventBus().deliver();

        // 6. Verificación: El trigger debe haber creado 1 tarea
        Task[] taskList = [SELECT Id, Subject FROM Task];
        System.assertEquals(1, taskList.size(), 'The change event trigger did not create the expected task.');
    }
}