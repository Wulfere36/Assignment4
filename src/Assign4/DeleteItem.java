package Assign4;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/deleteitem")
public class DeleteItem extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int itemId = 0;
		
		Integer uid = (Integer) request.getSession().getAttribute("uid");
		if (uid==null) {
			// not logged in, send to login with error msg
			response.sendRedirect("login?msg=you have to login first");
		} else {
			int status = 0;
			String urlLine = "";
			if(request.getParameter("id") != null) {
				itemId = Integer.parseInt(request.getParameter("id"));
				DB_Access db = new DB_Access();
				status = db.deleteItem(itemId);
				switch (status) {
				case 0:
					urlLine = "home?msg=Item deleted";
					break;
				case 1:
					urlLine = "home?msg=Could not find item "+itemId;
					break;
				case 2:
					urlLine = "home?msg=General DB error";
					break;
				}
			} else {
				urlLine = "home?msg=There was no item id supplied.";
			}
			response.sendRedirect(urlLine);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
