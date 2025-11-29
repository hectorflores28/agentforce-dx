/**
 * @description Clase para demostrar la funcionalidad de escritura y lectura en la Org Cache
 * con manejo de cache misses, simulando un horario de autobuses.
 */
public class BusScheduleCache {

    // Variable para almacenar la partición de la caché de la organización.
    // La partición 'local.BusSchedule' debe ser creada manualmente en Setup > Platform Cache.
    private Cache.OrgPartition part;

    /**
     * @description Constructor de la clase. Inicializa la partición de la caché.
     */
    public BusScheduleCache() {
        // Se inicializa la partición con el nombre 'local.BusSchedule'
        // 'local.' es obligatorio para las particiones de la Organización (Org Cache)
        this.part = Cache.Org.getPartition('local.BusSchedule');
    }

    /**
     * @description Almacena un horario de bus en la caché de la organización.
     * Salesforce Cache solo soporta tipos primitivos, por lo que convertimos
     * el array de Time a una cadena JSON.
     * @param busLine La clave bajo la cual se almacenará el horario (ej. 'LineaA').
     * @param schedule El array de objetos Time que representan el horario.
     */
    public void putSchedule(String busLine, Time[] schedule) {
        // Serializa el array de Time a una cadena JSON para almacenarlo.
        String scheduleJson = JSON.serialize(schedule);
        
        // Almacena el valor en la caché usando la clave y la partición.
        // La clave completa es el nombre de la partición + ':' + la clave definida.
        this.part.put(busLine, scheduleJson);
        
        System.debug('✅ Horario de ' + busLine + ' almacenado en caché: ' + scheduleJson);
    }

    /**
     * @description Recupera un horario de bus de la caché.
     * Maneja el cache miss devolviendo un horario por defecto si el valor es nulo.
     * @param busLine La clave del horario a recuperar (ej. 'LineaA').
     * @return El horario del bus (Time[]) o un horario por defecto en caso de cache miss.
     */
    public Time[] getSchedule(String busLine) {
        // 1. Intentar obtener el valor de la caché.
        String scheduleJson = (String)this.part.get(busLine);
        
        Time[] retrievedSchedule;

        // 2. Manejo de Cache Miss (Si el valor es null)
        if (scheduleJson == null) {
            System.debug('❌ Cache Miss para ' + busLine + '. Devolviendo horario por defecto.');
            
            // Definir el horario por defecto (8am y 5pm)
            retrievedSchedule = new Time[]{
                Time.newInstance(8, 0, 0, 0),  // 8:00 AM
                Time.newInstance(17, 0, 0, 0) // 5:00 PM
            };
            
        } else {
            // 3. Cache Hit (Si el valor existe)
            System.debug('✅ Cache Hit para ' + busLine + '. Deserializando horario...');
            
            // Deserializa la cadena JSON de vuelta al array de Time.
            retrievedSchedule = (Time[])JSON.deserialize(scheduleJson, List<Time>.class);
        }
        
        return retrievedSchedule;
    }
}