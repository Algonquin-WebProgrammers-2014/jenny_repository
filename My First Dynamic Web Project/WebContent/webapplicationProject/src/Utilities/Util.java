/**
 * Responsible for checking the password in the database for store users
 * 
 * @author Rodolfo Navalon
 * @version 0.2
 * @see Util
 * **/

package Utilities;

import pizza.SpecialPizza;
import Utilities.ContextVariable.Size;

public class Util {

	/**
	 * Responsible for checking if a string is empty or zero
	 * 
	 * @author Rodolfo Navalon
	 * 
	 * @param check - is the string to check if it is empty or zero
	 * @return boolean - true if the string is empty or zero
	 * 
	 * documented by: Rodolfo Navalon
	 * **/
	public static boolean isEmptyAndZero(String check){
		return  check == null || check.isEmpty() || check.equals("0");
	}
	
	public static void addPizzaToList(int count, String type, Size size, String name, String initial, PizzaCollection pizza){
		for(int i = 0; i < count; i++){
			if(type.equals("sp"))
				pizza.add(new SpecialPizza(name, size, initial));
		}
	}
}
