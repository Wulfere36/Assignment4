package Assign4;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class Register extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages/register.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// called when createaccount.jsp page submits the form
		// need to get the form field values and save in variables
		// also putting lname and fullname into request attributes in case we return to the form from an error
		String lname = request.getParameter("lname");
		request.setAttribute("lname", lname);
		String fullname = request.getParameter("fullname");
		request.setAttribute("fullname", fullname);
		
		String lpass1 = request.getParameter("lpass1");
		String lpass2 = request.getParameter("lpass2");
		String button = request.getParameter("button");

		// if user clicked in Create then do this
		// will build a url line to place into the sendRedirect method
		if (button.equalsIgnoreCase("create")) {
			
			DB_Access db = new DB_Access();
			int result = 0;
			User u = new User(-1,lname,fullname,lpass1,lpass2);
			result = db.createUserAccount(u);
			
			// setting the msg as a request attribute, since the only time createaccount displays a msg is because of an
			// entry error
			switch (result) {
				case 0:
					response.sendRedirect("login?msg=Account created. Login now");
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
			response.sendRedirect("login?msg=New registration aborted.");
		}
	}
}
