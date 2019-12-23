@isTest
public class ControllerGetAllObjectTest {
    public static testmethod void myUnitTest(){
        
      //  ControllerGetAllObjectTest.wrapFields fields = new ControllerGetAllObjectTest.wrapFields('test','test','test');
        Test.startTest();
        ControllerGetAllObject controller = new ControllerGetAllObject();
        List<String> selectedFields = new List<String>() ;
        controller.selectedObject = 'Account';
        ControllerGetAllObject.wrapFields fields = new ControllerGetAllObject.wrapFields('Account Name','Name','STRING');
        controller.fetchFields();    
        selectedFields.add('Name');
      //  controller.queryMe();
        Test.stopTest();
    }
}