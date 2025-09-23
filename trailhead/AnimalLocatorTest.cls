@isTest private class AnimalLocatorTest {
    @isTest static void testGetAnimalNameById() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());
        String animalName = AnimalLocator.getAnimalNameById(1);
        System.assertEquals('majestic badger', animalName, 'The returned animal name should match the mock response.');
    }
}