/**
 * Responsible for updating the database specially the order table
 * 
 * @author Rodolfo Navalon
 * @version 0.1
 * @see DatabaseUpdate
 * **/
package net.update;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DatabaseUpdate extends HttpServlet{
	
	/**
	 * Will update the database table or alter a table to delete some value within the table
	 */
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		if(session.getAttribute("store") != null)
		{
			resp.sendRedirect("mainpage/store/orderlist.jsp");
			session.removeAttribute("store");
		}
		else
			resp.sendRedirect("verification/store/");
		
	}
}
