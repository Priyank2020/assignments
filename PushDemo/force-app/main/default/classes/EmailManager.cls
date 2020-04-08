public class EmailManager {
    public void sendMail(String address, String subject, String body) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        String[] toAddresses = new String[] {'priyank.kotak@aimdek.com'};
        mail.setToAddresses(toAddresses);
        mail.setSubject(subject);
        mail.setPlainTextBody(body);
        mail.setHtmlBody('Your case:<b> ' + case.Id +' </b>has been created.<p>'+'To view your case <a href="https://ap16.salesforce.com/survey/runtimeApp.app?invitationId=0Ki2w000000TlsU&surveyName=salesforce_task_survey&UUID=4de6450e-45e0-4ca8-b8fe-17bc45af07a1/'+case.Id+'>click here.</a>');
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
        inspectResults(results);
    }
    private Boolean inspectResults(Messaging.SendEmailResult[] results) {
        Boolean sendResult = true;
        for (Messaging.SendEmailResult res : results) {
            if (res.isSuccess()) {
                System.debug('Email sent successfully');
            }
            else {
                sendResult = false;
                System.debug('The following errors occurred: ' + res.getErrors());
            }
        }
        return sendResult;
    }
}