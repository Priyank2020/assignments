public with sharing class NewSurveyQuery {
    String test = Label.greeting;
    String testI = Label.fgreeting;
    String[] a1{set;get;}
    @AuraEnabled(cacheable=true)
    
    //  private ApexPages.StandardController ctrl; 

    //  public MyExt(ApexPages.StandardController ctrlParam){
    //     ctrl = ctrlParam; 
    //     }
  
        public static List<SObject> getQuestion(){
        // Case theCase = (Case) ctrl.getRecord();
        // Id caseId = ctrl.getRecord().get('id');


        // String Id = ApexPages.CurrentPage().getParameters().get('id');
        List<Case> que_type=[select language__c from Case where id ='5002w000004cSdeAAE'];
        if(que_type[0].language__c == 'French'){
            return [select id,Question__c from FQue__c LIMIT 2];    
        }
        else{
            return [select id,Question__c from Survey_question__c LIMIT 5];    
        }
    }
    @AuraEnabled
    public static void saveResponse(Survey_response__c con){
          System.debug(con); 
        try{
            insert con; 
        }catch(Exception e){
            System.debug('--->'+e);
        }
    }
}