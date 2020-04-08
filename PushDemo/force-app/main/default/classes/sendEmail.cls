global class sendEmail implements Database.Batchable <sObject> {
    global Database.QueryLocator start (Database.BatchableContext bc) {
        String Query;
        Query = 'SELECT CaseNumber,SuppliedEmail From Case where Status=\'Cancelled\' and Survey_send_to__c=true';
        return Database.getquerylocator(Query);
    }
    global void execute(Database.BatchableContext bc, List <Case> clist) {
        try{
            for(Case c:clist){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                String[] toAddresses = new String[] {c.SuppliedEmail};
                mail.setToAddresses(toAddresses);
                mail.setSubject('Your feedback is important. Help us to improve by taking this survey.');
                mail.setHtmlBody('<a href = "https://publicc-developer-edition.ap16.force.com/newLancer?CaseId='+c.Id+'">click here</a>');
                Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
            }
        }
        catch(exception e){
            System.debug('cannot send email'+e);
        }
    }
    global void finish(database.BatchableContext bc) {}
}