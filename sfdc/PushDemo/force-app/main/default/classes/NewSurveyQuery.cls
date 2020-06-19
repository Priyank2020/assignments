public with sharing class NewSurveyQuery {
    // String test = Label.greeting;
    // String testI = Label.fgreeting;
    // String[] a1{set;get;}
  
    public NewSurveyQuery() {
        Map<String, String> reqParams = ApexPages.currentPage().getParameters(); 
        String language = reqParams.get('language');
        String label = reqParams.get('label');
    }

    @AuraEnabled
    public static String getLanguage(){
       List<Case> Lan = [select language__c from Case where id ='5002w000004cSdeAAE'];
       String s = Lan[0].language__c;
       return s;
    }

    @AuraEnabled(cacheable=true)  
    public static List<SObject> getQuestion(){
       
        List<Case> que_type=[select language__c from Case where id ='5002w000004cSdeAAE'];
        //List<Case> que_type=[select language__c from Case where id = :ApexPages.currentPage().getParameters().get('Id')];
        if(que_type[0].language__c == 'French'){
            return [select id,Question__c from FQue__c LIMIT 2];    
        }
        else{
            return [select id,Question__c from Survey_question__c LIMIT 5];    
        }
    }
    
    @AuraEnabled(cacheable=true)
    public static string getLabelTranslator(String label,String language) {
        try{
            PageReference r = Page.LabelTranslator; // the page
            r.getParameters().put('language', language);
            r.getParameters().put('label', label);
            String rt = r.getContent().toString();
            System.debug(rt);
            return rt;
        } 
        catch(Exception e){
            return label;
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