package Utilities;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import pizza.Pizza;
import pizza.PizzaContext;

public class PizzaCollection {
//	private List<Pizza> list;
	private Map<String, PizzaContext> hash;
	private int size;
	private double totalPrice = 0;
	
	public PizzaCollection(){
//		list = new ArrayList<>();
		hash = new HashMap<>();
	}
	
	public void add(Pizza pizza){
//		list.add(pizza);
		
		if(hash.get(pizza.getInitial()) == null)
		{
			hash.put(pizza.getInitial(), new PizzaContext(pizza));
		} 
		else 
		{
			hash.get(pizza.getInitial()).incrementBySize(pizza.getSize());
		}
		
	}
	
//	public List<Pizza> getList(){
//		return this.list;
//	}
	
	public Map<String, PizzaContext> getHash(){
		return this.hash;
	}
	
	public int getSize(){
		size = 0;
		for(String pc : hash.keySet())
		{
			size += hash.get(pc).getSmallCount();
			size += hash.get(pc).getMediumCount();
			size += hash.get(pc).getLargeCount();
			size += hash.get(pc).getxLargeCount();
		}
		return this.size;
	}
	
	public String gettotalPrice(){
		Connection conn = null;
		Statement st = null;
		
		totalPrice = 0;
		
		try {
			conn = DatabaseConnection.createDataBaseConnection("storedb", "rodolfouser", "poldz123");
			st = conn.createStatement();

			for(String id : this.hash.keySet())
			{
				
					ResultSet rs = st.executeQuery("SELECT special_pizza_list.special_pizza_price_idspecial_pizza_price, special_pizza_price.small, special_pizza_price.medium, special_pizza_price.large, special_pizza_price.xlarge " +
													"FROM special_pizza_list " + 
													"INNER JOIN special_pizza_price " + 
													"ON special_pizza_list.special_pizza_price_idspecial_pizza_price = special_pizza_price.idspecial_pizza_price " + 
													"WHERE special_pizza_list.initial = '"+ id +"'");
					PizzaContext pc = hash.get(id);
					
					while(rs.next())
					{
						if(pc.getSmallCount() != 0)
							totalPrice += (rs.getDouble("small") * pc.getSmallCount());
						if(pc.getMediumCount() != 0)
							totalPrice += (rs.getDouble("medium") * pc.getMediumCount());
						if(pc.getLargeCount() != 0)
							totalPrice += (rs.getDouble("large") * pc.getLargeCount());
						if(pc.getxLargeCount() != 0)
							totalPrice += (rs.getDouble("xlarge") * pc.getxLargeCount());
					}
			}
		
						
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
			return "0.00";
		} finally {
			try {
				DatabaseConnection.closeDataBaseConnection(conn, st);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return String.format("%.2f", this.totalPrice);
	}
}
