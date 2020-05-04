@istest
public class EmailManagerTestClass{
	static testmethod void EmailTestMethod(){
        List<Case> clist = new List<Case>();
        Case cs = new case();
		cs.language__c = 'French';
        cs.Priority = 'Medium';
        cs.SuppliedEmail = 'priyank.kotak@gmail.com';
        cs.SurveyResponse__c = false;
        cs.Status = 'Cancelled';
         cs.Survey_send_to__c = true;
        clist.add(cs);
		insert clist;
        test.startTest();
        sendEmail em =new sendEmail();
	   	Database.executeBatch(em);
        test.stopTest();
	}
}