package Assign4;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// import Assign3.DB_Access;

@WebServlet("/additem")
public class AddItem extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer uid = (Integer) request.getSession().getAttribute("uid");
		if (uid==null) {
			response.sendRedirect("login?msg=you have to login first");
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages/additem.jsp");
			rd.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer itemId = Integer.parseInt(request.getParameter("iid"));
		String itemName = request.getParameter("itemname");
		request.setAttribute("itemName", itemName);
		String quantity = request.getParameter("quantity");
		request.setAttribute("quantity", quantity);
		String button = request.getParameter("button");
		
		if (button.equalsIgnoreCase("add")) {
			Integer form_uid = Integer.parseInt(request.getParameter("userid"));
			Integer result = 0;
			DB_Access db = new DB_Access();
			result = db.addItem(itemName, quantity, form_uid);
			switch (result) {
				case 0:
					response.sendRedirect("home?msg=Item added");
					break;
				case 1:
					request.setAttribute("msg", "Item name cannot be blank");
					doGet(request,response);
					break;
				case 2:
					request.setAttribute("msg", "Quantity has to be a number");
					doGet(request,response);
					break;
				case 3:
					request.setAttribute("msg", "Item name is too long. 20 characters max.");
					doGet(request,response);
					break;
				case 4:
					request.setAttribute("msg", "There was an unknown save error.");
					doGet(request,response);
					break;
			}
		} else {
			response.sendRedirect("home?msg=Item add aborted");
		}
	}

}
