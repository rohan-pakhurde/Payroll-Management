package Payroll;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Authenticate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Authenticate() {
        super();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String name=request.getParameter("User");
		String pwd=request.getParameter("Pwd");
		String type="General";
		//String Msg="POPPAT !!!!!";

		HttpSession session=request.getSession(true);
		/*
		Authentication logic and retrieve user type
		*/

		session.setAttribute("Username",name);
		session.setAttribute("Type", type);
		
		/*if valid user*/
		if(name.equalsIgnoreCase("Rohan")){
		session.setAttribute("Type", "HR");
		response.sendRedirect("Home.jsp");}
		else if(name.equalsIgnoreCase("Venky"))
				{
			session.setAttribute("Type", "General");
			response.sendRedirect("Home.jsp");
				}
		/*if invalid user*/
		else if(name.equalsIgnoreCase("Bob")){
		session.setAttribute("Message", "Soory. You cannot be granted acess as your status with company is inactive.");
		response.sendRedirect("Login.jsp");}
		else {
		session.setAttribute("Message", "Please enter a valid username and password.");
		response.sendRedirect("Login.jsp");
		}

	}

}
