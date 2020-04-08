global class assignment implements Database.Batchable <sObject> {
    global Database.QueryLocator start (Database.BatchableContext bc) {
        String Query;
        Query = 'SELECT id,SuppliedEmail From Case where Status=\'Cancelled\'';
        return Database.getquerylocator(Query);
    }
    global void execute(Database.BatchableContext bc, List <Case> clist) {
        try{
            EmailTemplate emailTemplate =(EmailTemplate)[Select Id,Subject,Description,HtmlValue,DeveloperName,Body from EmailTemplate where name = 'assignment'];
            for(Case c:clist){
                Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
                message.setSenderDisplayName('Company Support');
                message.setReplyTo('no-reply@company.com');
                message.setUseSignature(false);
                message.setBccSender(false);
                message.setSaveAsActivity(false);
                message.setTemplateID(emailTemplate.Id);
                message.toAddresses=new String[]{c.SuppliedEmail};
                message.setHtmlBody('<a href = "https://publicc-developer-edition.ap16.force.com/newLancer/s/?id='+c.id+'">click here</a> to complete the survey...');
                Messaging.sendEmail(new Messaging.SingleEmailMessage[]{message});
            }
        }
        catch(exception e){
            System.debug('cannot send email'+e);
        }
    }
    global void finish(database.BatchableContext bc) {}
}