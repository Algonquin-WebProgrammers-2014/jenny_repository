/**
 * Responsible for internationalizing the website
 * 
 * @author Rodolfo Navalon
 * @version 0.1
 * @see MultiLang
 * **/
package Utilities;

import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class MultiLang {

	/**
	 * Create a ResourceBundle from the specified parameter which is the language to be used within the 
	 * webpage.
	 * 
	 * @param request	the reference of the HttpServletRequest from the Servlet
	 * @return			the ResourceBundle of the generated locale from the get parameter of the request
	 */
	public static ResourceBundle generateResourceBdl(HttpServletRequest request , HttpSession session)
	{
		Locale locale = null;
		String lang = (String)session.getAttribute("lang");
		
		if(lang != null)
			locale = new Locale(lang);
		else
			locale = request.getLocale();
		
		ResourceBundle rb = ResourceBundle.getBundle("app", locale);
		
		return rb;
		
	}
}
