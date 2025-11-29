@isTest
private class BusScheduleCacheTest {

    @isTest
    static void testPutAndGetSchedule_CacheHit() {
        // 1. Configuración
        BusScheduleCache cache = new BusScheduleCache();
        String busLine = 'LineaA';
        
        // Horario de ejemplo
        Time[] originalSchedule = new Time[]{
            Time.newInstance(7, 30, 0, 0),
            Time.newInstance(12, 0, 0, 0),
            Time.newInstance(18, 45, 0, 0)
        };
        
        // 2. Ejecución (Write/Put)
        Test.startTest();
        // Almacenar el horario en la caché
        cache.putSchedule(busLine, originalSchedule);
        
        // 3. Ejecución (Read/Get)
        Time[] retrievedSchedule = cache.getSchedule(busLine);
        Test.stopTest();

        // 4. Verificación (Cache Hit)
        System.assertNotEquals(null, retrievedSchedule, 'El horario no debería ser nulo (Cache Hit esperado).');
        System.assertEquals(originalSchedule.size(), retrievedSchedule.size(), 'El tamaño del horario recuperado debe coincidir.');
        System.assertEquals(originalSchedule[0], retrievedSchedule[0], 'El primer Time debe coincidir.');
    }

    @isTest
    static void testGetSchedule_CacheMiss() {
        // 1. Configuración
        BusScheduleCache cache = new BusScheduleCache();
        String busLine = 'LineaB';
        
        // La caché fue configurada con 0MB, por lo que cualquier lectura resultará en miss.
        // Alternativamente, el valor simplemente no fue escrito.
        
        // Horario por defecto esperado (8:00 AM y 5:00 PM)
        Time[] defaultSchedule = new Time[]{
            Time.newInstance(8, 0, 0, 0), 
            Time.newInstance(17, 0, 0, 0)
        };
        
        // 2. Ejecución (Read/Get - sin Put previo)
        Test.startTest();
        // Intentar obtener un horario que NO está en la caché (Cache Miss)
        Time[] retrievedSchedule = cache.getSchedule(busLine);
        Test.stopTest();

        // 3. Verificación (Cache Miss)
        System.assertNotEquals(null, retrievedSchedule, 'El horario NO debe ser nulo (debe devolver el valor por defecto).');
        System.assertEquals(2, retrievedSchedule.size(), 'El horario debe tener 2 entradas (el valor por defecto).');
        System.assertEquals(defaultSchedule[0], retrievedSchedule[0], 'El primer Time debe ser 8:00 AM.');
        System.assertEquals(defaultSchedule[1], retrievedSchedule[1], 'El segundo Time debe ser 5:00 PM.');
    }
}