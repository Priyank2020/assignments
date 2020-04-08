public class NewApex
{
    public string IssueId
    {    get;set;    }

    public string IssueName
    {    get;set;    }
    
    public NewApex(ApexPages.StandardController ctlr)
    {
        IssueId = System.currentPageReference().getParameters().get('lookupVal');
        IssueName = [select Name from Survey_question__c where Id =: IssueId].Name;
    }
}