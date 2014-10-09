/**
 * Responsible for get topping of pizza
 * @author Rodolfo Navalon
 * @version 0.1
 * @see ToppingPizza
 */
package pizza;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import Utilities.ContextVariable.Size;

public class ToppingPizza extends Pizza implements Serializable{
	
	private static final long serialVersionUID = -5623202411090053476L;
	
	public int toppingCount;
	private List<String> toppings;
	
	/**
	 * Responsible for get topping of pizza
	 * @param name - the name for each topping
	 * @param toppingCount - count the number of topping added
	 * @param size - the size of the pizza
	 * @param initial - initial the topping
	 * @author Rodofol Navalon
	 * 
	 * documented by: Changran Liu
	 */
	public ToppingPizza(String name, int toppingCount, Size size, String initial){
		super(name, size, initial);
		this.toppings = new ArrayList<String>();
	}
	
	/**
	 * Responsible for get number of topping
	 * @author Rodolfol Navalon
	 * @return int, number of topping
	 * 
	 * documented by: Changran Liu
	 */
	public int getToppingCount(){
		return this.toppingCount;
	}
	
	/**
	 * Responsible for get toppings from the list
	 * @author Rodolfo Navalon
	 * @return toppings in the list
	 * 
	 * documented by: Changran Liu
	 */
	public List<String> getToppings(){
		return this.toppings;
	}
}
