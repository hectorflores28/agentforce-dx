import { LightningElement, wire, api } from 'lwc';
import queryAccountsByRevenue from '@salesforce/apex/AccountListControllerLwc.queryAccountsByRevenue';
export default class AccountFinder extends LightningElement {
    // Inicialización de la propiedad a null
    annualRevenue = null; 
    @api annualRevenue;

    // Manejador del evento 'change' del input
    handleChange(event) {
        // Almacena el nuevo valor del input en la propiedad annualRevenue
        this.annualRevenue = event.detail.value;
        console.log('Annual Revenue:', this.annualRevenue); // Opcional: para depuración
    }
    @wire(queryAccountsByRevenue, { annualRevenue: '$annualRevenue' }) 
    accountsByRevenue; 

    // Manejador del evento 'click' del botón
    reset() {
        // Resetea la propiedad a null, lo que provoca el rerenderizado y borra el input
        this.annualRevenue = null;
        console.log('Annual Revenue reset:', this.annualRevenue); // Opcional: para depuración
    }
}