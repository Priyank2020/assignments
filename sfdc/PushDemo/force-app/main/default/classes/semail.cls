global class semail implements Database.Batchable <sObject> {
	global Database.QueryLocator start (Database.BatchableContext bc) {
       String Query;
       Query = 'SELECT CaseNumber From Case where Status=\'Closed\' and Survey_send_to__c=true';
       return Database.getquerylocator(Query);
       }
    global void execute(Database.BatchableContext bc, List < Case > clist) {
        
        try{
            for(Case c:clist){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        	String[] toAddresses = new String[] {c.SuppliedEmail};
            mail.setToAddresses(toAddresses);
            
            mail.setSenderDisplayName('Salesforce');
            mail.setSubject('Ownership for account');
            mail.setHtmlBody('<a href = "https://ap16.salesforce.com/survey/runtimeApp.app?invitationId=0Ki2w000000ToFj&surveyName=dfsfsfdfdfdf&UUID=56b3be00-1f4c-4d8d-b8e6-4f4e9a841f98&CaseNumber='+c.CaseNumber+'">click here</a>');
            System.debug('### sending email');
            Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
        }
}
        catch(exception e){
            System.debug('cannot send email'+e);
        }
}
global void finish(database.BatchableContext bc) {}
}