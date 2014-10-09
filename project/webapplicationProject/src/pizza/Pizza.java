package pizza;

import java.io.Serializable;

import Utilities.ContextVariable.Size;

public class Pizza implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2392686731442148056L;
	
	private Size size;
	private String name;
	private String initial;
	
	public Pizza(String name, Size size, String initial){
		this.name = name;
		this.size = size;
		this.initial = initial;
	}
	
	public String getName(){
		return this.name;
	}
	
	public Size getSize(){
		return this.size;
	}
	
	public String getInitial(){
		return this.initial;
	}
}
