public with sharing class AccountController {
 @AuraEnabled
    public static LIST<Account> getAccount() {
        return [select Name from Account Limit 5];
    }
}