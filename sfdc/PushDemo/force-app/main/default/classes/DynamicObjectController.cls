public with sharing class DynamicObjectController 
{
    public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    public String selectedObject {get; set;}
    public List<FieldWrapper> listField{get;set;}
    public boolean selectedList{get;set;}
    public boolean normalList{get;set;}
    public DynamicObjectController () 
    {
        listField = new List<FieldWrapper>();
        selectedList = false;
        normalList=true;
    }
    
    
    // find all sObjects available in the organization
    public  List<SelectOption> getListObejectName() 
    {
        List<SelectOption> objNames = new List<SelectOption>();
        List<String> entities = new List<String>(schemaMap.keySet());
        entities.sort();
        for(String name : entities)
            objNames.add(new SelectOption(name,name));
        return objNames;
    }
    
    // Find the fields for the selected object
    public void showFields() 
    {
        listField.clear();
        Map <String, Schema.SObjectField> fieldMap = schemaMap.get(selectedObject).getDescribe().fields.getMap();
        for(Schema.SObjectField sfield : fieldMap.Values())
        {
            schema.describefieldresult dfield = sfield.getDescribe();
            FieldWrapper wObj = new FieldWrapper();
            wObj.fieldName = dfield.getLabel ();
            wObj.fieldAPIName = dfield.getname();
            listField.add(wObj);
        }
    }
    
    //selected List added afterwards
    public List<FieldWrapper> selectedlistField{get;set;}
    public void ProceedWithSelected(){
        selectedlistField = new List<FieldWrapper>();
        normalList=false;
        selectedList = true;
        
        for(FieldWrapper selectedWrapObj: listField){ 
            system.debug('selectedlistField size ---------'+selectedWrapObj.selected);
            if(selectedWrapObj.selected == true)
                selectedlistField.add(selectedWrapObj);
        }
        system.debug('selectedlistField size ---------'+selectedlistField.size());
    }
    
    public class FieldWrapper
    {
        public String fieldName {get; set;}
        public String fieldAPIName {get; set;}
        public Boolean selected {get; set;}
        public FieldWrapper(){
            selected = false; 
        }
    }
    
}