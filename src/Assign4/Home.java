package Assign4;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/home")
public class Home extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer uid = (Integer) request.getSession().getAttribute("uid");
		if (uid==null) {
			// not logged in, send to login with error msg
			response.sendRedirect("login?msg=you have to login first");
		} else {
			
			// show the home page
			DB_Access db = new DB_Access();
			
			// uname and allItems are local to the method so we need to add them to the request scope
			// the user name is actually being saved in a session var on the login screen but I'll keep
			// this here because its an example of db access
			// String uname = (String) request.getSession().getAttribute("name");
			String uname = db.getUserName(uid);
			request.setAttribute("name", uname);
			ArrayList<Item> allItems = db.getAllUserItems(uid);
			request.setAttribute("allItems", allItems);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages/home.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// there are no forms directing output to this controller so no need for any post code
		
	}

}
