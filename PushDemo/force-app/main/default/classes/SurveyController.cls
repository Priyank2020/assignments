public class SurveyController {
    public list<Survey_question__c> results = new list<Survey_question__c>();
    list<wrapper> survey = new list<wrapper>();
    public list<wrapper> getSurvey() {
        String res;
        results =[select ID,Name from Survey_question__c];
        for(Integer i=0;i < results.size(); i++){
            survey.add(new wrapper(results[i].Name,res,results[i].ID));
        }
        return survey;
    }
    public class wrapper{
        public String Question{get; set;}
        public String Response{get; set;}
        public ID id{get; set;}
        public wrapper(String Question,String Response,ID id){
            this.Question = Question;
            this.Response = Response;
            this.id = id;
        }
    }
    public PageReference saveResponse() {
        ID id=ApexPages.currentPage().getParameters().get('id');
        list<Survey_response__c> repResult = new list<Survey_response__c>();
        for(Integer i=0;i < results.size(); i++){
            Survey_response__c rs = new Survey_response__c(Name=survey[i].Response,response_date__c=system.today(),Survey_question__c=survey[i].id,case__c=id);
            repResult.add(rs);
            PageReference newPage = Page.Thankyou;
        }
        insert repResult;
        survey = null;
        return page.Thankyou;
    }
}