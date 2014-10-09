/**
 * The final variable to be access by the store
 * 
 * @author Rodolfo Navalon
 * @version 0.1
 * @see ContextVariable
 * **/
package Utilities;

public class ContextVariable {
	
	/**
	 * The enum variable for extinguishing the current status of the order
	 * 
	 * @author Rodolfo Navalon
	 * @version 0.1
	 */
	public enum Status {
		ORDER_DELIVERED, PREP_PIZZA, BAKE_PIZZA, OUT_FOR_DELIVERY
	}
	
	/**
	 * The enum variable for extinguishing which type of pizza the client bought
	 * 
	 * @author Rodolfo Navalon
	 * @version 0.1
	 */
	public enum Size {
		SMALL, MEDIUM, LARGE, XLARGE
	}
	
	public enum Page {
		HOME, ORDERNOW, STORELOGIN, SEARCHORDER, MENU, NONE
	}
}
