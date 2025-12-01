public class DailyLeadProcessor implements Schedulable {

    public void execute(SchedulableContext sc) {
        // Buscamos los primeros 200 Leads que tengan LeadSource vacío
        List<Lead> leadsToUpdate = [
            SELECT Id 
            FROM Lead 
            WHERE LeadSource = NULL 
            LIMIT 200
        ];

        // Actualizamos el campo LeadSource
        for (Lead l : leadsToUpdate) {
            l.LeadSource = 'Dreamforce';
        }

        // Guardamos los cambios si hay registros
        if (!leadsToUpdate.isEmpty()) {
            update leadsToUpdate;
        }
    }
}