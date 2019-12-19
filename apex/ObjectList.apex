public class ControllerGetAllObject {
    public List<SelectOption> listOfObjects{get;set;}
    public List<SelectOption> listOfFields{get;set;}
    public String selectedObject{get;set;}
    public String selectedField{get;set;}
    public List<SObject> records {get; set;}
    public Map<String, Schema.SobjectType> gd = schema.getGlobalDescribe();
    public Map<String, schema.SObjectField> MapOfFields;
    public ControllerGetAllObject(){
        listOfObjects = new List<SelectOption>();
        
        for(Schema.SObjectType obj : gd.values()){
            Schema.DescribeSObjectResult dr = obj.getDescribe();
            listOfObjects.add(new SelectOption(String.valueOf(dr.getName()), String.valueOf(dr.getLabel())));
        } 
        listOfObjects.sort();
    }
    
    public void fetchFields(){
        listOfFields = new List<SelectOption>();
        MapOfFields = gd.get(selectedObject).getDescribe().fields.getMap();
        for(Schema.SObjectField field : MapOfFields.values()){
            Schema.DescribeFieldResult fr = field.getDescribe();
            Schema.DisplayType fielddataType = field.getDescribe().getType();
            system.debug(fr.getName());
            listOfFields.add( new SelectOption(String.valueof(fr.getName()),String.valueof(fr.getLabel())));
        } 
    }
    
    public void selectedField(){
        system.debug(selectedField);
        system.debug(MapOfFields);
    }
    
    public void queryMe(){
              // if(string.isNotBlank(selectedField))
            //   records = database.query('select Id, Name from '+this.selectedObject);
               //you may need to remove Name field for some objects
        }
}