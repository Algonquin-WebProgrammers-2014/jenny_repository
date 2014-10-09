package pizza;

import Utilities.ContextVariable.Size;

public class PizzaContext {

	private int smallCount = 0;
	private int mediumCount = 0;
	private int largeCount = 0;
	private int xLargeCount = 0;
	
	private Pizza pizza;
	
	public PizzaContext(Pizza pizza){
		this.pizza = pizza;
		incrementBySize(pizza.getSize());
	}
	
	public void incrementBySize(Size size){
		switch(size) 
		{
			case SMALL:
				incrementSmall();
				break;
			case MEDIUM:
				incrementMedium();
				break;
			case LARGE:
				incrementLarge();
				break;
			case XLARGE:
				incrementXLarge();
				break;
		}
	}
	
	public void incrementSmall(){
		this.smallCount++;
	}
	
	public void incrementMedium(){
		this.mediumCount++;
	}
	
	public void incrementLarge(){
		this.largeCount++;
	}
	
	public void incrementXLarge(){
		this.xLargeCount++;
	}
	
	public int getSmallCount(){
		return this.smallCount;
	}
	
	public int getMediumCount(){
		return this.mediumCount;
	}
	
	public int getLargeCount(){
		return this.largeCount;
	}
	
	public int getxLargeCount(){
		return this.xLargeCount;
	}
	
	public void setSmallCount(int smallCount){
		this.smallCount = smallCount;
	}
	
	public void setMediumCount(int mediumCount){
		this.mediumCount = mediumCount;
	}
	
	public void setLargeCount(int largeCount){
		this.largeCount = largeCount;
	}
	
	public void setxLargeCount(int xLargeCount){
		this.xLargeCount = xLargeCount;
	}
	
	public Pizza getPizza(){
		return this.pizza;
	}

}
