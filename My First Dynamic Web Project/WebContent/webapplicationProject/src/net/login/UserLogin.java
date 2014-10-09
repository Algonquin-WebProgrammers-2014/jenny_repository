/**
 * Responsible for checking the password in the database for client users
 * 
 * @author Rodolfo Navalon
 * @version 0.1
 * @see UserLogin
 * **/
package net.login;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SecureAuthentication.Authenticator;
import Utilities.DatabaseConnection;

public class UserLogin extends HttpServlet
{
	/**
	 * The name of the database to be used
	 */
	private final String db = "storedb";
	
	/**
	 * The username of the database to be used
	 */	
	private final String username = "rodolfouser";
	
	/**
	 * The password of the database to be used
	 */
	private final String password = "poldz123";
	
	/**
	 * Create a database connection and check the hashpassword given by the user using the post method of the HttpServlet.
	 */
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		try {
			Connection conn = DatabaseConnection.createDataBaseConnection(db,username,password);
			Statement s = (Statement) conn.createStatement();
			String username = req.getParameter("first_name");
			String password = req.getParameter("last_name");
				
			ResultSet result = s.executeQuery("SELECT password FROM users WHERE username = '"+username +"'");

			while(result.next())
			{
				String dataPassword = result.getString("password");
				resp.getWriter().print("Hashed-Password: " + dataPassword);
				if(Authenticator.validatePassword(password, dataPassword))
					resp.getWriter().println("\n\nRESULT: Password from USERNAME exist in DATABASE. You are log in to the server");
				else
					resp.getWriter().println("\n\nRESULT: Password from USERNAME exist in DATABASE. You provide a WRONG password");
					
				DatabaseConnection.closeDataBaseConnection(conn, s);
				return;
			}
			resp.getWriter().print("RESULT:  Password from USERNAME does not exist in DATABASE");

			DatabaseConnection.closeDataBaseConnection(conn, s);
			
		}catch (InvalidKeySpecException | NoSuchAlgorithmException e) {
			e.printStackTrace();
	    } catch (SQLException e) {
			e.printStackTrace();	
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
//		resp.sendRedirect("http://localhost:8080/webapplicationProject/mainpage/");
	}
}
