package Assign4;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/editaccount")
public class EditAccount extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer uid = (Integer) request.getSession().getAttribute("uid");
		if (uid==null) {
			// not logged in, send to login with error msg
			response.sendRedirect("login?msg=you have to login first");
		} else {
			DB_Access db = new DB_Access();
			
			// uname and allItems are local to the method so we need to add them to the request scope
			User user = db.getUserAccount(uid);
			String uname = user.getLoginName();
			String fname = user.getName();
			request.setAttribute("lname", uname);
			request.setAttribute("fullname", fname);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages/modify.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lname = request.getParameter("lname");
		String fullname = request.getParameter("fullname");
		String lpass1 = request.getParameter("lpass1");
		String lpass2 = request.getParameter("lpass2");
		String button = request.getParameter("button");
		
		Integer uid = (Integer) request.getSession().getAttribute("uid");
		if (uid==null) {
			// not logged in, send to login with error msg
			response.sendRedirect("login?msg=you have to login first");
		} else {
			if (button.equalsIgnoreCase("update")) {
				DB_Access db = new DB_Access();
				User u = new User(uid,lname,fullname,lpass1,lpass2);
				int result = db.updateUserAccount(u);
				switch (result) {
					case 0:
						response.sendRedirect("home?msg=Account updated. Welcome back");
						break;
					case 1:
						request.setAttribute("msg", "Values are too long. try again");
						doGet(request,response);
						break;
					case 2:
						request.setAttribute("msg", "Choose another login name. This one is taken");
						doGet(request,response);
						break;
					case 3:
						request.setAttribute("msg", "All values must be provided. Try again.");
						doGet(request,response);
						break;
					case 4:
						request.setAttribute("msg", "Passwords are not the same, Please try again.");
						doGet(request,response);
						break;
				}
			} else {
				response.sendRedirect("home?msg=Account update aborted.");
			}
		}
	}

}
