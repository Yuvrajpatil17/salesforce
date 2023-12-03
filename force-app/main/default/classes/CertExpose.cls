@Restresource(urlmapping='/exposeCert/*')
global class CertExpose {
    @httpGet
    global static List<Certification__c> getAllCert(){
        List<Certification__c> cer = [select name,Comments__c from Certification__c];
        return cer;
    }
    
    @HttpDelete
    global static void certDelete(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String rid = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        Certification__c cert = [SELECT Id FROM Certification__c WHERE Id = :rid];
        delete cert;
    }
    @httpPost
    global static void createCert(List<Certification__c> CertRecord){
        insert CertRecord; 
    }   
    

}