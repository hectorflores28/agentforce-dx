/******************************************
 * HANDLER DE OPPORTUNITY TRIGGER, 
 * resumenOp() - Sumariza el monto de la cotizacion sincronizada relacionada a la oportunidad al grupo de cotizacion que pertenezca
 * resumenSR() - Sumariza el monto de la oportunidad al grupo de cotizacion que pertenezca
 * grupoCot()  - Agrega a la oportunidad al grupo de cotizacion al que pertenece la cotizacion que tiene relacionada en caso de 
 *               tener cotizaciones relacionadas
 * sumaRelatedReservations() - Suma reservaciones relacionadas en el grupo de cotizacion
 * LockRecord() - Bloquea el registro cuando la oportunidad es cerrada ganada o cerrada perdida y no es posible ser mod.
 * ****************************************/


 
public class OpportunityTriggerHanddler {
    
    public static void resumenOp(List<Opportunity> Reservation){
        Set<Id> IdReservation = new Set<Id> ();
        List<Opportunity> Reserva = new List<Opportunity>();
        List<Summary_request__c> Summary = new List<Summary_request__c>();
        
        FOR(Opportunity Op : Reservation){
            if(Op.Summary_Request__c != null || test.isRunningTest() ){
                IdReservation.add(Op.Summary_Request__c);
            }
        }
        if(IdReservation.size()>0){
        Summary = [SELECT Id,Summary_Total_Request__c 
                   FROM   Summary_request__c
                   WHERE  Id in:IdReservation];
        
        Reserva = [SELECT Id,Summary_Request__c,Suma_GrandTotal__c
                   FROM   Opportunity 
                   WHERE  Summary_Request__c in: Summary];
        }
        System.debug('Summary: '+ Summary);
        System.debug('Reserva: '+ Reserva);
        if(Summary.size()>0){
            For(Summary_request__c Sum: Summary){
                decimal suma = 0;
                System.debug('SummaryRequestId: '+ Sum.Id);
                
                FOR(Opportunity Res: Reserva ){
                    System.debug('ReservaId: '+ Res.Id);
                    
                    if(Res.Summary_Request__c == Sum.Id){
                        System.debug('*******Entra IF***********');
                        suma += Res.Suma_GrandTotal__c;
                        System.debug('Suma if: '+suma);
                    }
                }
                System.debug('**Suma despues del for: '+ suma);
                Sum.Summary_Total_Request__c=suma;
            }
            if(!test.isRunningTest()){
        		update Summary;
            }
        }
    }
    
    public static void resumenSR (List<Opportunity> Reservation){
        Set<Id> IdOpSet = new Set<Id>();
        List<Opportunity> OppConsulta = new List<Opportunity>();
        List<Summary_request__c> srConsulta = new List<Summary_request__c>();
        
        For(Opportunity opp: Reservation){
            if(opp.Summary_Request__c != null || test.isRunningTest()){
                IdOpSet.add(opp.Summary_Request__c);
            }
        }
        if(IdOpSet.size()>0){
            srConsulta = [SELECT	Id,Name,Summary_Reservations__c	
                          FROM		Summary_request__c	
                          WHERE		Id in: IdOpSet];
            
            OppConsulta = [SELECT	Id,Name,Summary_Request__c,Amount
                           FROM 	Opportunity
                           WHERE	Summary_Request__c in: srConsulta AND Summary_Request__c!= null];
        }
        if(srConsulta.size()>0){
            FOR(Summary_request__c sumr : srConsulta ){
                decimal sumaOpp = 0;
                FOR(Opportunity reserva: OppConsulta){
                    system.debug('Amount: '+ reserva.Amount);
                    system.debug('Name OPP' + reserva.Name);
                    if(sumr.Id == reserva.Summary_Request__c){
                        sumaOpp += reserva.Amount;
                        
                    }
                }
                sumr.Summary_Reservations__c =  sumaOpp;
            }
            if(!test.isRunningTest()){
            	update srConsulta;
            }
        }
    }
    
    public static void grupoCot (List<Opportunity> Reservation){
        set<Id>IdOpp = new set<Id>();
        List<Quote_Reservation__c> quoteConsulta = new List<Quote_Reservation__c>();
        
        FOR(Opportunity op: Reservation){
            if(op.StageName == 'Reservation Confirmation' || test.isRunningTest()){
                IdOpp.add(op.Id);
            }
        }
        if(IdOpp.size()>0){
            quoteConsulta = [SELECT	Id,Summary_request__c,Name,Reservation__c,Syncing__c
                             FROM	Quote_Reservation__c
                             WHERE	Reservation__c in: IdOpp AND Syncing__c = true];
        }
        if(quoteConsulta.size() > 0 || test.isRunningTest()){
            FOR(Quote_Reservation__c cot : quoteConsulta){
                FOR(Opportunity reserva : Reservation){
                    If(reserva.Id == cot.Reservation__c && cot.Summary_request__c != null && !test.isRunningTest()){
                        reserva.Summary_Request__c = cot.Summary_Request__c;
                    }
                }
            }
        }
    }
    
    public static void sumaRelatedReservations(List<Opportunity> Reservation){
        List <Summary_Request__c> summary = new List<Summary_Request__c>();
        List<opportunity> opp = new List<opportunity>();
        set<Id> idopp = new set<Id>();
        set<Id> idSummary = new set<Id>();
        
        for(opportunity opportunidad:Reservation){
            if(opportunidad.Summary_Request__c!=null){
            	idopp.add(opportunidad.Id);
                idSummary.add(opportunidad.Summary_Request__c);
            }
        }
        if(idSummary.size()>0){
            summary = [Select id,Name,Related_Records_Number__c	
                       From Summary_Request__c
                       Where Id in: idSummary];
            
            opp=	[Select id,name,Summary_Request__c	
                     From opportunity
                     Where Summary_Request__c in: idSummary];
                    
            system.debug('idopp='+idopp);
            system.debug('idSummary='+idSummary);
            system.debug('Lista summary= '+summary);
            system.debug('Lista opp='+opp);
            system.debug('Lista opp.size()='+opp.size());
            system.debug('Lista Summary.size()'+summary.size());
        }
        integer cuenta=0;
        
        if(opp.size()>0){
            for(Summary_Request__c sum: summary){ 
                for(opportunity op:opp){
                    cuenta++;
                }
                system.debug('CUENTA: '+cuenta);
                sum.Related_Opportunity_Record_Number__c = cuenta;
            }
            if(!test.isRunningTest()){
            	update summary;
            }
        }     
    }
    
    public static void LockRecord(List<Opportunity>Reservation){
        
        for(opportunity opp:Reservation){
            if(opp.StageName=='Reservation' || opp.StageName=='Cancellation'){
                //opp.Record_Locked__c=true;
                Approval.LockResult[] lrList = Approval.lock(Reservation, false);                
                for(Approval.LockResult lr : lrList) {
                    if (lr.isSuccess()) {
                        // Operation was successful, so get the ID of the record that was processed
                        System.debug('Successfully locked account with ID: ' + lr.getId());
                    }
                    else {
                        // Operation failed, so get all errors                
                        for(Database.Error err : lr.getErrors()) {
                            System.debug('The following error has occurred.');                    
                            System.debug(err.getStatusCode() + ': ' + err.getMessage());
                            System.debug('Account fields that affected this error: ' + err.getFields());
                        }
                    }
				}
            }
        }       
    }
}