public class NewCaseListController {
    
    // Método público que devuelve una lista de objetos Case.
    // Este método será vinculado a la página de Visualforce.
    public List<Case> getNewCases() {
        // Consulta SOQL para seleccionar el ID y el CaseNumber
        // de todos los casos donde el Status es 'New'.
        // Utilizamos el campo 'CaseNumber' para mostrar el número y 'Id' para el enlace.
        List<Case> newCases = [
            SELECT Id, CaseNumber 
            FROM Case 
            WHERE Status = 'New'
            ORDER BY CreatedDate DESC
            LIMIT 100 // Limitar resultados por buenas prácticas
        ];
        
        return newCases;
    }
}