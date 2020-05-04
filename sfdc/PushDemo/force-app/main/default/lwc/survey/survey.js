import { LightningElement , track ,wire  } from 'lwc';
import {  ShowToastEvent } from 'lightning/platformShowToastEvent';
import Survey_response__c_OBJECT from '@salesforce/schema/Survey_response__c';
import Name_FIELD from '@salesforce/apex/NewSurveyQuery.saveResponse';
import getQuestion from '@salesforce/apex/NewSurveyQuery.getQuestion';
import greeting from '@salesforce/label/c.greeting';
// import fgreeting from '@salesforce/label/c.greeting';
// import LANG from '@salesforce/i18n/lang';
// import DIR from '@salesforce/i18n/dir';
export default class Survey extends LightningElement {

    
    // lang = LANG;
    // dir = DIR;
    label = {
        greeting,
    };

    // label = {
    //     fgreeting,
    // };
    @wire (getQuestion) question;
    
    @track
    options = [
        {'label': '1', 'value': '1'},
        {'label': '2', 'value': '2'},
        {'label': '3', 'value': '3'},
        {'label': '4', 'value': '4'},
        {'label': '5', 'value': '5'},
    ];

    
    @track
    selectedOption = Survey_response__c_OBJECT;
    @track
    paramValue //to fatch the id from the url
    handleInput(event){
    this.selectedOption.Survey_question__c=event.target.value;
    }
   connectedCallback() {
    const param = 'id';
    this.paramValue = this.getUrlParamValue(window.location.href, param);
}
getUrlParamValue(url, key) {
    return new URL(url).searchParams.get(key);
}

    handleChange(event) {
        this.selectedOption.case__c=this.paramValue;
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0');
        var yyyy = today.getFullYear();
        today = mm + '/' + dd + '/' + yyyy;
        this.selectedOption.response_date__c=today;
        this.selectedOption.s__c =event.target.value;
    }
   
    saveResponse(){
        Name_FIELD({
            con:this.selectedOption
        })
        .then(result => {
            this.selectedOption = {};
            this.dispatchEvent(new ShowToastEvent({
                title: 'Success!!',
                message: 'Response Stored Successfully!!',
                variant: 'success'
            }), );
        })
        .catch(error=>{
            this.error = error.message;
        });
        
    }
    @track flag = false;
    showMSG(){
        this.flag=true;
    }
    closeMSG(){
        this.flag=false;
    }
}