package com.vendor;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;




/**
 * Servlet implementation class VloginServlet
 */
@WebServlet("/VloginServlet")
public class VloginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		
		
		String username=request.getParameter("uid");
		String password=request.getParameter("pass");
		
		
		boolean isTrue;
		
		isTrue= VendorDBUtil.validate(username, password);
		
		if(isTrue==true) {

			HttpSession session = request.getSession();
            session.setAttribute("username", username);
            response.sendRedirect("vendorHome.jsp");
			
			
		}
		
		else {
			
			out.println("<script type='text/javascript'>");
			out.println("alert('Your Username or Password is incorrect.Please try again');");
			out.println("location='vendorlogin.jsp'");
			out.println("</script>");
			
		}
		
	}
}
