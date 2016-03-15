package mobile.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
			User loggedUser = userDao.getUserByID(userID);
			
			out.println("<script type=\"text/javascript\">");  
			out.println("alert('Здравей "  + loggedUser.getFirstName() +  ". Жигули.бг ти пожелава приятно сърфиране. ')");  
			out.println("window.location.href = \"main.html\";");
			out.println("</script>");
			
		} catch (Exception e) {
			out.println("<script type=\"text/javascript\">");  
			out.println("alert('Грашна парола или Е-мейл.');");
			out.println("window.location.href = \"facebook.com\";");
			out.println("</script>");
		}
	}
}
