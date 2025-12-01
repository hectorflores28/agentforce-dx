List<List<SObject>> searchResults = [
    FIND 'Mission Control' IN ALL FIELDS 
    RETURNING Contact (FirstName, LastName)
];

if (!searchResults.isEmpty() && searchResults[0].size() > 0) {
    
    List<Contact> missionSpecialists = (List<Contact>)searchResults[0];
    Contact specialist = missionSpecialists[0];
    
    System.debug(specialist.LastName + ', ' + specialist.FirstName);

} else {
    System.debug('DEBUG|No se encontraron contactos para "Mission Control".');
}