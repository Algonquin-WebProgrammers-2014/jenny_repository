/**
 * Responsible for get special pizza's details
 * @author Rodofol Navalon
 * @version 0.1
 * @see SpecialPizza
 */
package pizza;

import java.io.Serializable;

import Utilities.ContextVariable.Size;

public class SpecialPizza extends Pizza implements Serializable{

	private static final long serialVersionUID = -3045652466915330080L;
	/**
	 * Responsible for get special pizza's name, size and initial
	 * @author Rodolfo Navalon
	 * @param name - name of the special pizza
	 * @param size - size of the special pizza
	 * @param initial - initial of the special pizza
	 * 
	 * documented by: Changran Liu
	 */
	public SpecialPizza(String name, Size size, String initial) {
		super(name, size, initial);
	}
	
}
