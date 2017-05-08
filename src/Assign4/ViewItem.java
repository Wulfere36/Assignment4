package Assign4;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/viewitem")
public class ViewItem extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String msg = "", itemname = "", selected = "";
		int quantity = 0, itemId = 0;

		Integer uid = (Integer) request.getSession().getAttribute("uid");
		if (uid==null) {
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

				RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/pages/viewitem.jsp");
				rd.forward(request, response);

			} else {
				response.sendRedirect("home?msg=Could not find item (" + itemId + ") in database...");
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
