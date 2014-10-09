package pizza;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import Utilities.ContextVariable.Size;

public class ToppingPizza extends Pizza implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5623202411090053476L;
	
	public int toppingCount;
	private List<String> toppings;
	
	public ToppingPizza(String name, int toppingCount, Size size, String initial){
		super(name, size, initial);
		this.toppings = new ArrayList<String>();
	}
	
	public int getToppingCount(){
		return this.toppingCount;
	}
	
	public List<String> getToppings(){
		return this.toppings;
	}
}
