public class ReaderFromCalloutSample {

  public void getAndParse() {

    // Get the XML document from the external server
    Http http = new Http();
    HttpRequest req = new HttpRequest();
    req.setEndpoint('https://ap16.salesforce.com/survey/runtimeApp.app?invitationId=0Ki2w000000Tmf8&surveyName=newsurvey&UUID=538ec67a-0f85-4bc7-b2fc-41d834748083');
    req.setMethod('GET');
    HttpResponse res = http.send(req);

    // Log the XML content
    System.debug(res.getBody());
    XmlStreamReader reader = res.getXmlStreamReader();

    // Read through the XML
    while(reader.hasNext()) {
      System.debug('Event Type:' + reader.getEventType());
      if (reader.getEventType() == XmlTag.START_ELEMENT) {
        System.debug(reader.getLocalName());
      }
      reader.next();
    }
 
  }
}