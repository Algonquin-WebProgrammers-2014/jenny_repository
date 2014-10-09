package pizza;

import java.io.Serializable;

import Utilities.ContextVariable.Size;

public class SpecialPizza extends Pizza implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3045652466915330080L;

	public SpecialPizza(String name, Size size, String initial) {
		super(name, size, initial);
	}
	
}
