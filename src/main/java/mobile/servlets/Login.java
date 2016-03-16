package mobile.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import mobile.jdbc.UserDAO;
import mobile.model.User;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public Login() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
			
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		
		UserDAO userDao = new UserDAO();
		PrintWriter out = response.getWriter();
		
		try {
			int userID = userDao.login(email, password);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("UserID", userID);
			
			response.sendRedirect("./main.jsp");
		} 
		catch (Exception e) {
			response.sendRedirect("./main.jsp");
		}
	}
}
