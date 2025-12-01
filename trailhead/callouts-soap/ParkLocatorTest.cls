@isTest public class ParkLocatorTest {
    @isTest static void testGetParksByCountry() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<String> parks = ParkLocator.country('United States');
        System.assertEquals(3, parks.size(), 'The list of parks should have 3 items.');
        System.assertEquals('Yosemite National Park', parks[0], 'The first park should be Yosemite.');
        System.assertEquals('Grand Canyon National Park', parks[1], 'The second park should be Grand Canyon.');
    }
}