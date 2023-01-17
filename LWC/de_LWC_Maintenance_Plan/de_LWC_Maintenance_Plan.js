import { LightningElement, api, track } from 'lwc';
import mainPlanDetails from '@salesforce/apex/de_LWC_Maintenance_Plan_Apex.getAllDetails';

export default class De_LWC_Maintenance_Plan extends LightningElement {

    @api recordId;
    @track mapData = [];
    MWRresponse;
    workOrderJan;

    addingWO = [];

    connectedCallback() {

        console.log('>> '+this.recordId);
        
        mainPlanDetails({
            
            locId : this.recordId
        
        }).then(result =>{
            
            console.log('>>> '+JSON.stringify(result));
            this.MWRresponse = result;

            this.workOrderJan = result[0].workOrderJan;

            console.log('$$$$$ '+JSON.stringify(this.MWRresponse[0].finalWRList));

            for(var abc in result[0].finalWRList){
                this.MWRresponse[0].finalWRList[abc] = {...this.MWRresponse[0].finalWRList[abc], WOrdersJan: ''}
                this.MWRresponse[0].finalWRList[abc] = {...this.MWRresponse[0].finalWRList[abc], WOrdersFeb: ''}
                this.MWRresponse[0].finalWRList[abc] = {...this.MWRresponse[0].finalWRList[abc], WOrdersMar: ''}
                this.MWRresponse[0].finalWRList[abc] = {...this.MWRresponse[0].finalWRList[abc], WOrdersApr: ''}
                this.MWRresponse[0].finalWRList[abc] = {...this.MWRresponse[0].finalWRList[abc], WOrdersMay: ''}
                this.MWRresponse[0].finalWRList[abc] = {...this.MWRresponse[0].finalWRList[abc], WOrdersJun: ''}
                this.MWRresponse[0].finalWRList[abc] = {...this.MWRresponse[0].finalWRList[abc], WOrdersJul: ''}
                this.MWRresponse[0].finalWRList[abc] = {...this.MWRresponse[0].finalWRList[abc], WOrdersAug: ''}
                this.MWRresponse[0].finalWRList[abc] = {...this.MWRresponse[0].finalWRList[abc], WOrdersSep: ''}
                this.MWRresponse[0].finalWRList[abc] = {...this.MWRresponse[0].finalWRList[abc], WOrdersOct: ''}
                this.MWRresponse[0].finalWRList[abc] = {...this.MWRresponse[0].finalWRList[abc], WOrdersNoc: ''}
                this.MWRresponse[0].finalWRList[abc] = {...this.MWRresponse[0].finalWRList[abc], WOrdersDec: ''}
            }

            console.log('New$$$$$ '+JSON.stringify(this.MWRresponse[0].finalWRList));

            

            for(var abc in result[0].finalWRList){

            for(var key in result[0].woMapJan){
                
                if( key == result[0].finalWRList[abc].Id)
                {

                    console.log('True' + result[0].finalWRList[abc].Id);
                    console.log('abc >> ' + abc);
                     console.log('key >> ' + key);

                    this.MWRresponse[0].finalWRList[abc].WOrdersJan = result[0].woMapJan[key];

                }

            }
            for(var key in result[0].woMapFeb){
                
                if( key == result[0].finalWRList[abc].Id)
                {

                    console.log('True' + result[0].finalWRList[abc].Id);
                    console.log('abc >> ' + abc);
                     console.log('key >> ' + key);

                    this.MWRresponse[0].finalWRList[abc].WOrdersFeb = result[0].woMapFeb[key];

                }

            }
            for(var key in result[0].woMapMar){
                
                if( key == result[0].finalWRList[abc].Id)
                {

                    this.MWRresponse[0].finalWRList[abc].WOrdersMar = result[0].woMapMar[key];

                }

            }
            for(var key in result[0].woMapApr){
                
                if( key == result[0].finalWRList[abc].Id)
                {

                    this.MWRresponse[0].finalWRList[abc].WOrdersApr = result[0].woMapApr[key];

                }

            }
            for(var key in result[0].woMapMay){
                
                if( key == result[0].finalWRList[abc].Id)
                {

                    this.MWRresponse[0].finalWRList[abc].WOrdersMay = result[0].woMapMay[key];

                }

            }
            for(var key in result[0].woMapJun){
                
                if( key == result[0].finalWRList[abc].Id)
                {

                    this.MWRresponse[0].finalWRList[abc].WOrdersJun = result[0].woMapJun[key];

                }

            }
            for(var key in result[0].woMapJul){
                
                if( key == result[0].finalWRList[abc].Id)
                {

                    this.MWRresponse[0].finalWRList[abc].WOrdersJul = result[0].woMapJul[key];

                }

            }
            for(var key in result[0].woMapAug){
                
                if( key == result[0].finalWRList[abc].Id)
                {

                    this.MWRresponse[0].finalWRList[abc].WOrdersAug = result[0].woMapAug[key];

                }

            }
            for(var key in result[0].woMapSep){
                
                if( key == result[0].finalWRList[abc].Id)
                {

                    this.MWRresponse[0].finalWRList[abc].WOrdersSep = result[0].woMapSep[key];

                }

            }
            for(var key in result[0].woMapOct){
                
                if( key == result[0].finalWRList[abc].Id)
                {

                    this.MWRresponse[0].finalWRList[abc].WOrdersOct = result[0].woMapOct[key];

                }

            }
            for(var key in result[0].woMapNov){
                
                if( key == result[0].finalWRList[abc].Id)
                {

                    this.MWRresponse[0].finalWRList[abc].WOrdersNov = result[0].woMapNov[key];

                }

            }
            for(var key in result[0].woMapDec){
                
                if( key == result[0].finalWRList[abc].Id)
                {

                    this.MWRresponse[0].finalWRList[abc].WOrdersDec = result[0].woMapDec[key];

                }

            }
                
            }


            

            console.log('Final @@@>>> '+JSON.stringify(this.MWRresponse[0].finalWRList));
            
        })
        .catch(error =>{
            this.errorMsg = error;
        })


    }

}