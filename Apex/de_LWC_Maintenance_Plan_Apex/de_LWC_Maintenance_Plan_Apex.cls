public class de_LWC_Maintenance_Plan_Apex {

    @AuraEnabled
    public static List<MaintenanceWRWrapper> getAllDetails(string locId){

        List<MaintenanceWRWrapper> accWrapperList = new List<MaintenanceWRWrapper>();

        Map<Id,String> mapWOmainJan = new Map<Id,String>();
        Map<Id,String> mapWOmainFeb = new Map<Id,String>();
        Map<Id,String> mapWOmainMar = new Map<Id,String>();
        Map<Id,String> mapWOmainApr = new Map<Id,String>();
        Map<Id,String> mapWOmainMay = new Map<Id,String>();
        Map<Id,String> mapWOmainJun = new Map<Id,String>();
        Map<Id,String> mapWOmainJul = new Map<Id,String>();
        Map<Id,String> mapWOmainAug = new Map<Id,String>();
        Map<Id,String> mapWOmainSep = new Map<Id,String>();
        Map<Id,String> mapWOmainOct = new Map<Id,String>();
        Map<Id,String> mapWOmainNov = new Map<Id,String>();
        Map<Id,String> mapWOmainDec = new Map<Id,String>();

        List<Id> collWorkRule = new List<Id>();
        List<Id> mainPlanId = new List<Id>();
        List<Id> mainAssetColl = new List<Id>();

        List<MaintenancePlan> mp = [SELECT Id FROM MaintenancePlan WHERE LocationId =: locId];

        for(MaintenancePlan m : mp) {
            mainPlanId.add(m.Id);
        }

        List<MaintenanceWorkRule> wrule1 = [SELECT Id, Name FROM MaintenanceWorkRule WHERE ParentMaintenancePlanId IN : mainPlanId];

        List<MaintenanceAsset> mass = [SELECT Id, MaintenanceAssetNumber, AssetId, Asset.Name FROM MaintenanceAsset WHERE MaintenancePlanId IN : mainPlanId];

        for(MaintenanceAsset ms : mass) {
            mainAssetColl.add(ms.Id);
        }

        system.debug('mass>> '+mass.size());

        if(mass.size() > 0)
            {


                List<MaintenanceWorkRule> wrule2 = [SELECT Id, Name FROM MaintenanceWorkRule WHERE ParentMaintenanceRecordId IN : mainAssetColl];

                for(MaintenanceWorkRule w2 : wrule2){
                    collWorkRule.add(w2.Id);
                }
                system.debug('@@ '+wrule2);

            }

        for(MaintenanceWorkRule w1 : wrule1){
            collWorkRule.add(w1.Id);
        }

        system.debug('>> '+wrule1);
        
        system.debug('!! '+collWorkRule);
        String woNum1 = '';
        String woNum2 = '';
        String woNum3 = '';
        String woNum4 = '';
        String woNum5 = '';
        String woNum6 = '';
        String woNum7 = '';
        String woNum8 = '';
        String woNum9 = '';
        String woNum10 = '';
        String woNum11 = '';
        String woNum12 = '';

        List<MaintenanceWorkRule> mwRule = [SELECT Id, Title, RecurrencePattern, Recurrent_Pattern__c, Name, WorkTypeId, WorkType.Name, Asset__c FROM MaintenanceWorkRule WHERE Id IN: collWorkRule];

        system.debug('>> '+mwRule);

        for(MaintenanceWorkRule mr : mwRule){

            List<WorkOrder> woJan = [SELECT Id, WorkOrderNumber FROM WorkOrder WHERE MaintenanceWorkRuleId =: mr.Id AND (SuggestedMaintenanceDate >= 2023-01-01 AND SuggestedMaintenanceDate <= 2023-01-31)];
            List<WorkOrder> woFeb = [SELECT Id, WorkOrderNumber FROM WorkOrder WHERE MaintenanceWorkRuleId =: mr.Id AND (SuggestedMaintenanceDate >= 2023-02-01 AND SuggestedMaintenanceDate <= 2023-02-28)];
            List<WorkOrder> woMar = [SELECT Id, WorkOrderNumber FROM WorkOrder WHERE MaintenanceWorkRuleId =: mr.Id AND (SuggestedMaintenanceDate >= 2023-03-01 AND SuggestedMaintenanceDate <= 2023-03-31)];
            List<WorkOrder> woApr = [SELECT Id, WorkOrderNumber FROM WorkOrder WHERE MaintenanceWorkRuleId =: mr.Id AND (SuggestedMaintenanceDate >= 2023-04-01 AND SuggestedMaintenanceDate <= 2023-04-30)];
            List<WorkOrder> woMay = [SELECT Id, WorkOrderNumber FROM WorkOrder WHERE MaintenanceWorkRuleId =: mr.Id AND (SuggestedMaintenanceDate >= 2023-05-01 AND SuggestedMaintenanceDate <= 2023-05-31)];
            List<WorkOrder> woJun = [SELECT Id, WorkOrderNumber FROM WorkOrder WHERE MaintenanceWorkRuleId =: mr.Id AND (SuggestedMaintenanceDate >= 2023-06-01 AND SuggestedMaintenanceDate <= 2023-06-30)];
            List<WorkOrder> woJul = [SELECT Id, WorkOrderNumber FROM WorkOrder WHERE MaintenanceWorkRuleId =: mr.Id AND (SuggestedMaintenanceDate >= 2023-07-01 AND SuggestedMaintenanceDate <= 2023-07-31)];
            List<WorkOrder> woAug = [SELECT Id, WorkOrderNumber FROM WorkOrder WHERE MaintenanceWorkRuleId =: mr.Id AND (SuggestedMaintenanceDate >= 2023-08-01 AND SuggestedMaintenanceDate <= 2023-08-31)];
            List<WorkOrder> woSep = [SELECT Id, WorkOrderNumber FROM WorkOrder WHERE MaintenanceWorkRuleId =: mr.Id AND (SuggestedMaintenanceDate >= 2023-09-01 AND SuggestedMaintenanceDate <= 2023-09-30)];
            List<WorkOrder> woOct = [SELECT Id, WorkOrderNumber FROM WorkOrder WHERE MaintenanceWorkRuleId =: mr.Id AND (SuggestedMaintenanceDate >= 2023-10-01 AND SuggestedMaintenanceDate <= 2023-10-31)];
            List<WorkOrder> woNov = [SELECT Id, WorkOrderNumber FROM WorkOrder WHERE MaintenanceWorkRuleId =: mr.Id AND (SuggestedMaintenanceDate >= 2023-11-01 AND SuggestedMaintenanceDate <= 2023-11-30)];
            List<WorkOrder> woDec = [SELECT Id, WorkOrderNumber FROM WorkOrder WHERE MaintenanceWorkRuleId =: mr.Id AND (SuggestedMaintenanceDate >= 2023-12-01 AND SuggestedMaintenanceDate <= 2023-12-31)];

            for(WorkOrder w: woJan){
                woNum1 = woNum1 + '<a href="https://tlsfsdemo3.lightning.force.com/lightning/r/WorkOrder/' + w.Id + '/view">WO-' + w.WorkOrderNumber + '</a>' + '<br/>';
            }
            for(WorkOrder w: woFeb){
                woNum2 = woNum2 + '<a href="https://tlsfsdemo3.lightning.force.com/lightning/r/WorkOrder/' + w.Id + '/view">WO-' + w.WorkOrderNumber + '</a>' + '<br/>';
            }
            for(WorkOrder w: woMar){
                woNum3 = woNum3 + '<a href="https://tlsfsdemo3.lightning.force.com/lightning/r/WorkOrder/' + w.Id + '/view">WO-' + w.WorkOrderNumber + '</a>' + '<br/>';
            }
            for(WorkOrder w: woApr){
                woNum4 = woNum4 + '<a href="https://tlsfsdemo3.lightning.force.com/lightning/r/WorkOrder/' + w.Id + '/view">WO-' + w.WorkOrderNumber + '</a>' + '<br/>';
            }
            for(WorkOrder w: woMay){
                woNum5 = woNum5 + '<a href="https://tlsfsdemo3.lightning.force.com/lightning/r/WorkOrder/' + w.Id + '/view">WO-' + w.WorkOrderNumber + '</a>' + '<br/>';
            }
            for(WorkOrder w: woJun){
                woNum6 = woNum6 + '<a href="https://tlsfsdemo3.lightning.force.com/lightning/r/WorkOrder/' + w.Id + '/view">WO-' + w.WorkOrderNumber + '</a>' + '<br/>';
            }
            for(WorkOrder w: woJul){
                woNum7 = woNum7 + '<a href="https://tlsfsdemo3.lightning.force.com/lightning/r/WorkOrder/' + w.Id + '/view">WO-' + w.WorkOrderNumber + '</a>' + '<br/>';
            }
            for(WorkOrder w: woAug){
                woNum8 = woNum8 + '<a href="https://tlsfsdemo3.lightning.force.com/lightning/r/WorkOrder/' + w.Id + '/view">WO-' + w.WorkOrderNumber + '</a>' + '<br/>';
            }
            for(WorkOrder w: woSep){
                woNum9 = woNum9 + '<a href="https://tlsfsdemo3.lightning.force.com/lightning/r/WorkOrder/' + w.Id + '/view">WO-' + w.WorkOrderNumber + '</a>' + '<br/>';
            }
            for(WorkOrder w: woOct){
                woNum10 = woNum10 + '<a href="https://tlsfsdemo3.lightning.force.com/lightning/r/WorkOrder/' + w.Id + '/view">WO-' + w.WorkOrderNumber + '</a>' + '<br/>';
            }
            for(WorkOrder w: woNov){
                woNum11 = woNum11 + '<a href="https://tlsfsdemo3.lightning.force.com/lightning/r/WorkOrder/' + w.Id + '/view">WO-' + w.WorkOrderNumber + '</a>' + '<br/>';
            }
            for(WorkOrder w: woDec){
                woNum12 = woNum12 + '<a href="https://tlsfsdemo3.lightning.force.com/lightning/r/WorkOrder/' + w.Id + '/view">WO-' + w.WorkOrderNumber + '</a>' + '<br/>';
            }

            mapWOmainJan.put(mr.Id, woNum1);
            mapWOmainFeb.put(mr.Id, woNum2);
            mapWOmainMar.put(mr.Id, woNum3);
            mapWOmainApr.put(mr.Id, woNum4);
            mapWOmainMay.put(mr.Id, woNum5);
            mapWOmainJun.put(mr.Id, woNum6);
            mapWOmainJul.put(mr.Id, woNum7);
            mapWOmainAug.put(mr.Id, woNum8);
            mapWOmainSep.put(mr.Id, woNum9);
            mapWOmainOct.put(mr.Id, woNum10);
            mapWOmainNov.put(mr.Id, woNum11);
            mapWOmainDec.put(mr.Id, woNum12);

            woNum1 = '';
            woNum2 = '';
            woNum3 = '';
            woNum4 = '';
            woNum5 = '';
            woNum6 = '';
            woNum7 = '';
            woNum8 = '';
            woNum9 = '';
            woNum10 = '';
            woNum11 = '';
            woNum12 = '';

        }

       // system.debug('mapWOmain@@> '+mapWOmain);

            MaintenanceWRWrapper wrap = new MaintenanceWRWrapper();

            wrap.finalWRList = mwRule;
            wrap.woMapJan = mapWOmainJan;
            wrap.woMapFeb = mapWOmainFeb;
            wrap.woMapMar = mapWOmainMar;
            wrap.woMapApr = mapWOmainApr;
            wrap.woMapMay = mapWOmainMay;
            wrap.woMapJun = mapWOmainJun;
            wrap.woMapJul = mapWOmainJul;
            wrap.woMapAug = mapWOmainAug;
            wrap.woMapSep = mapWOmainSep;
            wrap.woMapOct = mapWOmainOct;
            wrap.woMapNov = mapWOmainNov;
            wrap.woMapDec = mapWOmainDec;


            accWrapperList.add(wrap);
        
        return accWrapperList;
    }
      
    public class MaintenanceWRWrapper{
        @AuraEnabled
        public List<MaintenanceWorkRule> finalWRList{get;set;}
        @AuraEnabled
        public Map<Id,String> woMapJan{get;set;}
        @AuraEnabled
        public Map<Id,String> woMapFeb{get;set;}
        @AuraEnabled
        public Map<Id,String> woMapMar{get;set;}
        @AuraEnabled
        public Map<Id,String> woMapApr{get;set;}
        @AuraEnabled
        public Map<Id,String> woMapMay{get;set;}
        @AuraEnabled
        public Map<Id,String> woMapJun{get;set;}
        @AuraEnabled
        public Map<Id,String> woMapJul{get;set;}
        @AuraEnabled
        public Map<Id,String> woMapAug{get;set;}
        @AuraEnabled
        public Map<Id,String> woMapSep{get;set;}
        @AuraEnabled
        public Map<Id,String> woMapOct{get;set;}
        @AuraEnabled
        public Map<Id,String> woMapNov{get;set;}
        @AuraEnabled
        public Map<Id,String> woMapDec{get;set;}

    }
}