public class ControllerGetAllObject {
    public List<SelectOption> listOfObjects{get;set;}
    public String selectedObject{get;set;}
    public List<String> listOfselectedFields {get; set;}
    public List<wrapFields> wrapField {get;set;}
    wrapFields fieldInfo;
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
        wrapField = new List<wrapFields>();
      //  listOfFields = new List<SelectOption>();
        MapOfFields = gd.get(selectedObject).getDescribe().fields.getMap();
        for(Schema.SObjectField field : MapOfFields.values()){
            Schema.DescribeFieldResult fr = field.getDescribe();
            Schema.DisplayType fielddataType = field.getDescribe().getType();
            fieldInfo = new wrapFields(String.valueof(fr.getLabel()),String.valueof(fr.getName()),String.valueof(fielddataType));
            wrapField.add(fieldInfo);
         //   listOfFields.add( new SelectOption(String.valueof(fr.getName()),String.valueof(fr.getLabel())));
        } 
    }
  
    public void queryMe(){
        // Get Selected fields list    
        listOfselectedFields = new List<String>() ;
        for(wrapFields fie : wrapField){
            if(fie.selected){
                listOfselectedFields.add(fie.fieldValue);
            }
        }       
        string field = String.join(listOfselectedFields, ',');
        records = database.query('SELECT ' + field + ' FROM '+ selectedObject + ' LIMIT 100');
    }
    
    public class wrapFields {
        public Boolean selected {get; set;}
        public string fielddataType {get; set;}
        public string fieldName {get; set;}
        public string fieldValue{get; set;}
        //This is the contructor method. When we create a new wrapAccount object we pass a Account that is set to the acc property. We also set the selected value to false
        public wrapFields(string name , string value, string dataType) {
            fieldName = name;
            fieldValue = value;
            fielddataType = dataType;
            selected = false;
        }
    }
}