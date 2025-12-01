@isTest
public class LeadProcessorTest {

    @isTest
    public static void testBatch() {

        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            leads.add(new Lead(
                LastName = 'Test' + i,
                Company  = 'Test Co',
                Status   = 'Open - Not Contacted',
                Email 	 = 'test' + i + '@test.com',
                Phone    = '32212345' + i + i
            ));
        }
        insert leads;

        // Verificar que sí se insertaron
        System.assertEquals(200, [SELECT COUNT() FROM Lead]);

        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id jobId = Database.executeBatch(lp, 200);
        Test.stopTest();

        // Verificar actualizaciones
        for (Lead l : [SELECT LeadSource FROM Lead]) {
            System.assertEquals('Dreamforce', l.LeadSource);
        }
    }
}
