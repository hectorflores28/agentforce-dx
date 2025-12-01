@isTest public class ParkServiceMock implements WebServiceMock {
    public void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseName,
        String responseType,
        String requestXml
    ) {
        ParkService.byCountryResponse parksResponse = new ParkService.byCountryResponse();
        parksResponse.return_x = new List<String>{'Yosemite National Park', 'Grand Canyon National Park', 'Zion National Park'};
        response.put('response_x', parksResponse);
    }
}