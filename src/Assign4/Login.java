package Assign4;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;

@WebServlet("/login")
public class Login extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().invalidate();
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String lname = request.getParameter("lname");
		String lpass = request.getParameter("password");
		Date date = new Date();
		DB_Access db = new DB_Access();
		int uid = db.validateLogin(lname, lpass);
		if(uid==-1){
			// invalid login attempt
			response.sendRedirect("login?msg=Name or pass or both are wrong...");
		} else {
			// valid login attempt - set user id, user name and the current date in session attributes
			request.getSession().setAttribute("uid", uid);
			request.getSession().setAttribute("name", db.getUserName(uid));
			request.getSession().setAttribute("theDate", date);
			
			response.sendRedirect("home");
		}
	}

}
