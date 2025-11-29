/*****************************************************
 * Clase controladora de Visualforce CloneReservationVF
 * La cual genera una clonacion de la reservacion y si no pertenece a un grupo de reservaciones
 * genera un grupo y actualiza la original agregandola al grupo de cotizaciones 
 * 
 * ***************************************************/

public class CloneReservationVFController {
    Public Opportunity stdCntrlr {get; set;}
    Public String mensajeError{get;set;}

    
    public CloneReservationVFController(ApexPages.StandardController controller) {
        
        stdCntrlr = (Opportunity)controller.getrecord();
        
        
        
    }
    
    public PageReference clonaopp(){
        string redireccion;
        List<Opportunity> reservation = New List<Opportunity>();
        List<Exchange_Rates__c> ER = new List<Exchange_Rates__c>();
        Id SummaryR_QG_RT =[SELECT Id FROM Recordtype WHERE DeveloperName='Quote_Group'].Id;
        Id SummaryR_RG_RT =[SELECT Id FROM Recordtype WHERE DeveloperName='Reservation_Gruop'].Id;      
        ER = [Select Id,Exchange_Rate__c,Current_Exchange_Rate__c
              From Exchange_Rates__c
              Where Current_Exchange_Rate__c=true];
        
        reservation=[SELECT	 Summary_Request__c, filter_Campaing_by__c, Campaign_Name__c,Promotion_or_Package__c,CloseDate,OwnerId,Name,StageName,
                                    AccountId,Language_velas__c,Resort_Name_Id__c,Which_Resort__c,What_Type_of_Suite_Would_You_Like__c,
                                    Suite_Name_Id__c,Opcion_Seleccionada__c,OpcionSeleccionadaId__c,Adults__c,juniors__c,Junior2__c,Junior3__c,Junior4__c,
                                    Junior5__c,Junior6__c,Junior1__c,Children__c,Children1__c,Children2__c,Children3__c,Children4__c,Children5__c,Children6__c,
                                    Infants__c,Infant1__c,Infant2__c,Infant3__c,Infant4__c,Infant5__c,Infant6__c,inclusions__c,Dinner__c,Dinner_Reservation__c,
                                    transportation__c,Do_you_need_transportation__c,Extra_Beds__c,Do_you_need_a_crib__c,SPA_appointments__c,Currency_Type__c,
                                    Rate_per_Adult__c,Rate_per_Junior__c,Deposit__c,Rate_per_Child__c,Extras__c,Rate_Notes__c,discounts__c,
                                    Desglose__c,Tipo_Pago__c,May_I_have_the_Credit_Card_number__c,Cardholder_Name__c,
                                    Credit_card_number__c,Expiration_Date_Month__c,Expiration_Date_Year__c,Secure_Code_Last_4_Digits__c,The_charge_to_your_credit_card_will_be__c,
                                    Confirmation__c,Canal_de_reservaci_n__c,Tipo_dep_sito__c,dep_sito__c,Clave_reserva__c,Referencia__c,
                                    Forma_de_Pago__c,Referencia_Bancaria__c,Persona_que_env_a_el_dep_sito__c,Observaciones__c,Cancellation_miscellaneous_number__c,
                                    minimo_estancia__c,Your_Cancellation_Policy_will_be__c,Are_you_celebrating_an_ocassion__c,Special_Requests__c,Smoking__c,
                                    ETA__c,Your_Check_In_time_will_be__c,Your_Check_Out_time_will_be__c,NextStep,Description,
                                    Arrival__c,Departure__c,Inclusiones__c,Medios__c,Amount,Type_Rate__c
                     FROM	Opportunity
                     WHERE	Id =: stdCntrlr.Id];
        
        if(reservation.size() > 0 ){
        List<AggregateResult> grupoOPP = [select count(Id) sumaregistros from Opportunity where Summary_request__c =: reservation[0].Summary_request__c];

            if(reservation[0].Summary_Request__c != null){
                Try{
                    
                    Opportunity op = New Opportunity();
                    String NombreOpp= reservation[0].Name.SubStringBefore('Room');
                    NombreOpp = NombreOpp + ' Room ' + grupoOPP[0].get('sumaregistros');
                    //******************************************************************************************************
                    /*op.Name = NombreOpp;
                    op.CloseDate = reservation[0].CloseDate;
                    op.StageName = 'New';//reservation[0].stageName;
                    op.Amount = 0.0;
                    op.Suma_GrandTotal__c = 0.0;
                    op.AccountId = reservation[0].accountId;
                    op.Language_velas__c = reservation[0].Language_velas__c;
                    op.Which_Resort__c = reservation[0].Which_Resort__c;
                    op.RecordTypeId = reservation[0].recordTypeId;
                    op.Summary_Request__c = reservation[0].Summary_Request__c;
                    op.What_Type_of_Suite_Would_You_Like__c = reservation[0].What_Type_of_Suite_Would_You_Like__c;*/
                    //*******************************************************************************************************
                    op.Summary_Request__c = reservation[0].Summary_Request__c;
                    op.filter_Campaing_by__c = reservation[0].filter_Campaing_by__c;
                    op.Campaign_Name__c= reservation[0].Campaign_Name__c;
                    op.Promotion_or_Package__c = reservation[0].Promotion_or_Package__c;
                    op.CloseDate = reservation[0].CloseDate;
                    op.OwnerId = reservation[0].OwnerId;
                    op.Name=NombreOpp;
                    op.StageName = 'New';
                    op.AccountId = reservation[0].accountId;
                    op.Language_velas__c = reservation[0].Language_velas__c;
                    op.Resort_Name_Id__c = reservation[0].Resort_Name_Id__c;
                    op.Which_Resort__c = reservation[0].Which_Resort__c;
                    op.What_Type_of_Suite_Would_You_Like__c = reservation[0].What_Type_of_Suite_Would_You_Like__c;
                    op.Suite_Name_Id__c = reservation[0].Suite_Name_Id__c;
                    op.Opcion_Seleccionada__c = reservation[0].Opcion_Seleccionada__c;
                    op.OpcionSeleccionadaId__c = reservation[0].OpcionSeleccionadaId__c;
                    op.Adults__c = reservation[0].Adults__c;
                    op.juniors__c = reservation[0].juniors__c;
                    op.Junior1__c = reservation[0].Junior1__c;
                    op.Junior2__c = reservation[0].Junior2__c;
                    op.Junior3__c = reservation[0].Junior3__c;
                    op.Junior4__c = reservation[0].Junior4__c;
                    op.Junior5__c = reservation[0].Junior5__c;
                    op.Junior6__c = reservation[0].Junior6__c;
                    op.Children__c = reservation[0].Children__c;
                    op.Children1__c = reservation[0].Children1__c;
                    op.Children2__c = reservation[0].Children2__c;
                    op.Children3__c = reservation[0].Children3__c;
                    op.Children4__c = reservation[0].Children4__c;
                    op.Children5__c = reservation[0].Children5__c;
                    op.Children6__c = reservation[0].Children6__c;
                    op.Infants__c = reservation[0].Infants__c;
                    op.Infant1__c = reservation[0].Infant1__c;
                    op.Infant2__c = reservation[0].Infant2__c;
                    op.Infant3__c = reservation[0].Infant3__c;
                    op.Infant4__c = reservation[0].Infant4__c;
                    op.Infant5__c = reservation[0].Infant5__c;
                    op.Infant6__c = reservation[0].Infant6__c;
                    op.Departure__c = reservation[0].Departure__c;
                    op.Arrival__c = reservation[0].Arrival__c;
                    op.Type_Rate__c = reservation[0].Type_Rate__c;
                    op.Group__c=true;
                    if(ER.size()>0){
                     	op.Exchange_rate__c = ER[0].Exchange_Rate__c;                       
                    }
                    /*op.inclusions__c = reservation[0].inclusions__c;
                    op.Dinner_Reservation__c = reservation[0].Dinner_Reservation__c;
                    op.transportation__c = reservation[0].transportation__c;
                    op.Do_you_need_transportation__c = reservation[0].Do_you_need_transportation__c;
                    op.Extra_Beds__c = reservation[0].Extra_Beds__c;
                    op.Do_you_need_a_crib__c = reservation[0].Do_you_need_a_crib__c;
                    op.SPA_appointments__c = reservation[0].SPA_appointments__c;
                    op.Currency_Type__c = reservation[0].Currency_Type__c;
                    op.Rate_per_Adult__c = reservation[0].Rate_per_Adult__c;
                    op.Exchange_rate__c = reservation[0].Exchange_rate__c;
                    op.Rate_per_Junior__c = reservation[0].Rate_per_Junior__c;
                    op.Deposit__c = reservation[0].Deposit__c;
                    op.Rate_per_Child__c = reservation[0].Rate_per_Child__c;
                    op.Extras__c = reservation[0].Extras__c;
                    op.Rate_Notes__c = reservation[0].Rate_Notes__c;
                    op.discounts__c = reservation[0].discounts__c;
                    op.Desglose__c = reservation[0].Desglose__c;
                    op.Transport_Rate__c = reservation[0].Transport_Rate__c;
                    op.Tipo_Pago__c = reservation[0].Tipo_Pago__c;
                    op.May_I_have_the_Credit_Card_number__c = reservation[0].May_I_have_the_Credit_Card_number__c;
                    op.Cardholder_Name__c = reservation[0].Cardholder_Name__c;
                    op.Credit_card_number__c = reservation[0].Credit_card_number__c;
                    op.Expiration_Date_Month__c = reservation[0].Expiration_Date_Month__c;
                    op.Expiration_Date_Year__c = reservation[0].Expiration_Date_Year__c;
                    op.Secure_Code_Last_4_Digits__c = reservation[0].Secure_Code_Last_4_Digits__c;
                    op.The_charge_to_your_credit_card_will_be__c = reservation[0].The_charge_to_your_credit_card_will_be__c;
                    op.Confirmation__c = reservation[0].Confirmation__c;
                    op.Canal_de_reservaci_n__c = reservation[0].Canal_de_reservaci_n__c;
                    op.Tipo_dep_sito__c = reservation[0].Tipo_dep_sito__c;
                    op.dep_sito__c = reservation[0].dep_sito__c;
                    op.Clave_reserva__c = reservation[0].Clave_reserva__c;
                    op.Referencia__c = reservation[0].Referencia__c;
                    op.Forma_de_Pago__c = reservation[0].Forma_de_Pago__c;
                    op.Referencia_Bancaria__c = reservation[0].Referencia_Bancaria__c;
                    op.Persona_que_env_a_el_dep_sito__c = reservation[0].Persona_que_env_a_el_dep_sito__c;
                    op.Observaciones__c = reservation[0].Observaciones__c;
                    op.minimo_estancia__c = reservation[0].minimo_estancia__c;
                    op.Cancellation_miscellaneous_number__c = reservation[0].Cancellation_miscellaneous_number__c;
                    op.Your_Cancellation_Policy_will_be__c = reservation[0].Your_Cancellation_Policy_will_be__c;
                    op.Are_you_celebrating_an_ocassion__c = reservation[0].Are_you_celebrating_an_ocassion__c;
                    op.Special_Requests__c = reservation[0].Special_Requests__c;
                    op.Smoking__c = reservation[0].Smoking__c;
                    op.Your_Check_In_time_will_be__c = reservation[0].Your_Check_In_time_will_be__c;
                    op.ETA__c = reservation[0].ETA__c;
                    op.Your_Check_Out_time_will_be__c = reservation[0].Your_Check_Out_time_will_be__c;
                    op.NextStep = reservation[0].NextStep;
                    op.Description = reservation[0].Description;                    
                    op.Inclusiones__c = reservation[0].Inclusiones__c;
                    op.Medios__c = reservation[0].Medios__c;*/
                    if(reservation[0].Amount==null){
                        op.Amount = 0;
                    }else{
                       op.Amount = reservation[0].Amount; 
                    }
                    insert op;
                    redireccion = op.Id;
                }
                Catch(Exception e){
                    stdCntrlr.addError('Error: Something Was Wrong, Cause:'+ e.getStackTraceString() + '. Consult it with your salesforce Admin');
                    mensajeError = 'Error: Something Was Wrong, Cause:'+ e.getStackTraceString() + '. Consult it with your salesforce Admin'+e.getMessage();
                }
                
            }else{
                
                Try{
                    Summary_request__c sr = new Summary_request__c();
                    sr.Name = reservation[0].Name + ' - Opportunity Group';
                    sr.RecordTypeId=SummaryR_RG_RT;
                    sr.Summary_Reservations__c = 0;
                    sr.Summary_Total_Request__c = 0;
                    insert sr;
                    
                    Opportunity op = New Opportunity();
                    /*************************************************************************************************
                    op.Name = reservation[0].Name+' Room 1';
                    op.CloseDate = reservation[0].CloseDate;
                    op.StageName = 'New';//reservation[0].stageName;
                    op.AccountId = reservation[0].accountId;
                    op.Language_velas__c = reservation[0].Language_velas__c;
                    op.Which_Resort__c = reservation[0].Which_Resort__c;
                    op.RecordTypeId = reservation[0].recordTypeId;
                    op.Amount = 0.0;
                    op.Summary_Request__c = sr.Id;
                    op.What_Type_of_Suite_Would_You_Like__c = reservation[0].What_Type_of_Suite_Would_You_Like__c;
                    reservation[0].Summary_Request__c = sr.Id;
					***************************************************************************************************/
                    op.Summary_Request__c = sr.Id;
                    op.Campaign_Name__c = reservation[0].Campaign_Name__c;
                    op.filter_Campaing_by__c = reservation[0].filter_Campaing_by__c;
                    op.Promotion_or_Package__c = reservation[0].Promotion_or_Package__c;
                    op.CloseDate = reservation[0].CloseDate;
                    op.OwnerId = reservation[0].OwnerId;
                    op.Name=reservation[0].Name+' Room 1';
                    op.StageName = 'New';
                    op.AccountId = reservation[0].accountId;
                    op.Language_velas__c = reservation[0].Language_velas__c;
                    op.Resort_Name_Id__c = reservation[0].Resort_Name_Id__c;
                    op.Which_Resort__c = reservation[0].Which_Resort__c;
                    op.What_Type_of_Suite_Would_You_Like__c = reservation[0].What_Type_of_Suite_Would_You_Like__c;
                    op.Suite_Name_Id__c = reservation[0].Suite_Name_Id__c;
                    op.Opcion_Seleccionada__c = reservation[0].Opcion_Seleccionada__c;
                    op.OpcionSeleccionadaId__c = reservation[0].OpcionSeleccionadaId__c;
                    op.Adults__c = reservation[0].Adults__c;
                    op.juniors__c = reservation[0].juniors__c;
                    op.Junior1__c = reservation[0].Junior1__c;
                    op.Junior2__c = reservation[0].Junior2__c;
                    op.Junior3__c = reservation[0].Junior3__c;
                    op.Junior4__c = reservation[0].Junior4__c;
                    op.Junior5__c = reservation[0].Junior5__c;
                    op.Junior6__c = reservation[0].Junior6__c;
                    op.Children__c = reservation[0].Children__c;
                    op.Children1__c = reservation[0].Children1__c;
                    op.Children2__c = reservation[0].Children2__c;
                    op.Children3__c = reservation[0].Children3__c;
                    op.Children4__c = reservation[0].Children4__c;
                    op.Children5__c = reservation[0].Children5__c;
                    op.Children6__c = reservation[0].Children6__c;
                    op.Infants__c = reservation[0].Infants__c;
                    op.Infant1__c = reservation[0].Infant1__c;
                    op.Infant2__c = reservation[0].Infant2__c;
                    op.Infant3__c = reservation[0].Infant3__c;
                    op.Infant4__c = reservation[0].Infant4__c;
                    op.Infant5__c = reservation[0].Infant5__c;
                    op.Infant6__c = reservation[0].Infant6__c;
                    op.Type_Rate__c = reservation[0].Type_Rate__c;
                    op.Group__c=true;
                    if(ER.size()>0){
                     	op.Exchange_rate__c = ER[0].Exchange_Rate__c;                       
                    }
                    /*op.inclusions__c = reservation[0].inclusions__c;
                    op.Dinner_Reservation__c = reservation[0].Dinner_Reservation__c;
                    op.transportation__c = reservation[0].transportation__c;
                    op.Do_you_need_transportation__c = reservation[0].Do_you_need_transportation__c;
                    op.Extra_Beds__c = reservation[0].Extra_Beds__c;
                    op.Do_you_need_a_crib__c = reservation[0].Do_you_need_a_crib__c;
                    op.SPA_appointments__c = reservation[0].SPA_appointments__c;
                    op.Currency_Type__c = reservation[0].Currency_Type__c;
                    op.Rate_per_Adult__c = reservation[0].Rate_per_Adult__c;
                    op.Rate_per_Junior__c = reservation[0].Rate_per_Junior__c;
                    op.Deposit__c = reservation[0].Deposit__c;
                    op.Rate_per_Child__c = reservation[0].Rate_per_Child__c;
                    op.Extras__c = reservation[0].Extras__c;
                    op.Rate_Notes__c = reservation[0].Rate_Notes__c;
                    op.discounts__c = reservation[0].discounts__c;
                    op.Desglose__c = reservation[0].Desglose__c;
                    op.Transport_Rate__c = reservation[0].Transport_Rate__c;
                    op.Tipo_Pago__c = reservation[0].Tipo_Pago__c;
                    op.May_I_have_the_Credit_Card_number__c = reservation[0].May_I_have_the_Credit_Card_number__c;
                    op.Cardholder_Name__c = reservation[0].Cardholder_Name__c;
                    op.Credit_card_number__c = reservation[0].Credit_card_number__c;
                    op.Expiration_Date_Month__c = reservation[0].Expiration_Date_Month__c;
                    op.Expiration_Date_Year__c = reservation[0].Expiration_Date_Year__c;
                    op.Secure_Code_Last_4_Digits__c = reservation[0].Secure_Code_Last_4_Digits__c;
                    op.The_charge_to_your_credit_card_will_be__c = reservation[0].The_charge_to_your_credit_card_will_be__c;
                    op.Confirmation__c = reservation[0].Confirmation__c;
                    op.Canal_de_reservaci_n__c = reservation[0].Canal_de_reservaci_n__c;
                    op.Tipo_dep_sito__c = reservation[0].Tipo_dep_sito__c;
                    op.dep_sito__c = reservation[0].dep_sito__c;
                    op.Clave_reserva__c = reservation[0].Clave_reserva__c;
                    op.Referencia__c = reservation[0].Referencia__c;
                    op.Forma_de_Pago__c = reservation[0].Forma_de_Pago__c;
                    op.Referencia_Bancaria__c = reservation[0].Referencia_Bancaria__c;
                    op.Persona_que_env_a_el_dep_sito__c = reservation[0].Persona_que_env_a_el_dep_sito__c;
                    op.Observaciones__c = reservation[0].Observaciones__c;
                    op.minimo_estancia__c = reservation[0].minimo_estancia__c;
                    op.Cancellation_miscellaneous_number__c = reservation[0].Cancellation_miscellaneous_number__c;
                    op.Your_Cancellation_Policy_will_be__c = reservation[0].Your_Cancellation_Policy_will_be__c;
                    op.Are_you_celebrating_an_ocassion__c = reservation[0].Are_you_celebrating_an_ocassion__c;
                    op.Special_Requests__c = reservation[0].Special_Requests__c;
                    op.Smoking__c = reservation[0].Smoking__c;
                    op.Your_Check_In_time_will_be__c = reservation[0].Your_Check_In_time_will_be__c;
                    op.ETA__c = reservation[0].ETA__c;
                    op.Your_Check_Out_time_will_be__c = reservation[0].Your_Check_Out_time_will_be__c;
                    op.NextStep = reservation[0].NextStep;
                    op.Description = reservation[0].Description;
                    op.Departure__c = reservation[0].Departure__c;
                    op.Arrival__c = reservation[0].Arrival__c;
                    op.Inclusiones__c = reservation[0].Inclusiones__c;
                    op.Medios__c = reservation[0].Medios__c;*/
                    if(reservation[0].Amount==null){
                        op.Amount = 0;
                    }else{
                       op.Amount = reservation[0].Amount; 
                    }
                    reservation[0].Summary_Request__c = sr.Id;
                    update reservation;
                    insert op;
                    redireccion = op.Id;
                    
                }
                Catch(Exception e){
                    stdCntrlr.addError('Error: Something Was Wrong, Cause:'+ e.getStackTraceString() + '. Consult it with your salesforce Admin');
                    mensajeError = 'Error: Something Was Wrong, Cause:'+ e.getStackTraceString() + '. Consult it with your salesforce Admin'+e.getMessage();

                }
                
            }
        }
        PageReference oppPage;
        if(redireccion==null){
            oppPage = null;
        }else{
            oppPage= new pagereference('/'+redireccion);
            oppPage.setRedirect(true);
        }
        return oppPage;
        
    }
    
}