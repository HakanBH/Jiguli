package mobile.servlets;

import java.io.IOException;   

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mobile.jdbc.*;
import mobile.model.*;

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
		
		IUserDAO userDao = UserDAO.getUserDAO();
		
		String referer = request.getHeader("referer");
		
		try {
			int userId = userDao.login(email, password);
			User u = userDao.getUserByID(userId);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("userId", userId);
			session.setAttribute("email", u.getEmail());
			session.setAttribute("firstName", u.getFirstName());
			session.setAttribute("lastName", u.getLastName());
			session.setAttribute("region", u.getRegion());
			
			response.sendRedirect(referer);
		} 
		catch (Exception e) {
			response.sendRedirect(referer);
		}
	}
}
