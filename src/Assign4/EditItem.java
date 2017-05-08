package Assign4;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/edititem")
public class EditItem extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "", itemname = "", selected = "";
		int quantity = 0, itemId = 0;
			
		Integer uid = (Integer) request.getSession().getAttribute("uid");
		
		if (uid==null) {
			// not logged in, send to login with error msg
			response.sendRedirect("login?msg=you have to login first");
		} else {
			itemId = Integer.parseInt(request.getParameter("id"));
			DB_Access db = new DB_Access();
			// there is an item id so get the old data from the table
			if (itemId != 0) {
				Item item = new Item();
				item = db.getItem(itemId);
				itemname = item.getName();
				quantity = item.getQty();
				
				request.setAttribute("itemId", itemId);
				request.setAttribute("itemName", itemname);
				request.setAttribute("quantity", quantity);
				
				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages/modifyitem.jsp");
				rd.forward(request, response);
				
			} else {
				response.sendRedirect("home?msg=Could not find item (" + itemId + ") in database...");
			}
				
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer itemId = Integer.parseInt(request.getParameter("iid"));
		String itemName = request.getParameter("itemname");
		String quantity = request.getParameter("quantity");
		Integer form_uid = Integer.parseInt(request.getParameter("userid"));
		String button = request.getParameter("button");
		
		Integer result = 0;

		if (button.equalsIgnoreCase("update")) {
			// Item i = new Item(itemId, itemName, quantity, form_uid);
			DB_Access db = new DB_Access();
			result = db.updateItem(itemId, itemName, quantity, form_uid);
	
			switch (result) {
				case 0:
					response.sendRedirect("home?msg=Item updated");
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
					request.setAttribute("msg", "Item name is too long. 20 characters max");
					doGet(request,response);
					break;
				case 4:
					request.setAttribute("msg", "There was an unknown save error.");
					doGet(request,response);
					break;
			}
		} else {
			response.sendRedirect("home?msg=Item update aborted");
		}
	}

}
