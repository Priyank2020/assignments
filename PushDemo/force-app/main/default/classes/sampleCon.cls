public class sampleCon{
    /*String country = null;
    List<Name> questionnairequestions = new List<question>();
    Id questionnaireid;
    public CARPOL_inspection_questionnaire(ApexPages.StandardController controller) {
    questionnaireid = ApexPages.currentPage().getParameters().get('id');
    }*/
    /*
    public string selectedValue {get;set;} 
    public string selectedValue1 {get;set;} 
    public string selectedValue2 {get;set;} 
    public string selectedValue3 {get;set;} 
    public string selectedValue4 {get;set;} 
    public string selectedValue5 {get;set;} 
    public string selectedValue6 {get;set;}   
    public PageReference test() {
        if(selectedValue == '1' || selectedValue == '2' || selectedValue == '3' || selectedValue == '4' || selectedValue == '5' || selectedValue == '6' || selectedValue == '7' || selectedValue == '8' || selectedValue == '9' || selectedValue == '10'){
        // Bind it to appropriate field here 
        } else {
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Please atleast one value'));
        }
       
        return null;
    }
                
    public List<SelectOption> getItems() {
        List<SelectOption> options = new List<SelectOption>(); 
        options.add(new SelectOption('1','1')); 
        options.add(new SelectOption('2','2')); 
        options.add(new SelectOption('3','3')); 
        options.add(new SelectOption('4','4')); 
        options.add(new SelectOption('5','5')); 
        options.add(new SelectOption('6','6')); 
        options.add(new SelectOption('7','7')); 
        options.add(new SelectOption('8','8')); 
        options.add(new SelectOption('9','9')); 
        options.add(new SelectOption('10','10')); 
        return options; 
    } */  
    public sampleCon(){
    string labelName = 'DemoLabel';
    Component.Apex.OutputText output;
    output = new Component.Apex.OutputText();
    output.expressions.value = '{!$Label.' + labelName + '}';
    string labelValue = string.valueOf(output.value);
        }
       /*public question(String question, List<Survey_response__c> answers){
			this.question = question;
			List<selectOption> lstAns = new List<SelectOption>();
			for(Survey_response__c ans: answers){
					lstAns.add(new selectOption(ans.Survey_response__c, ans.Survey_response__c));
			}
			this.ansOptions = lstAns;
		}*/
}