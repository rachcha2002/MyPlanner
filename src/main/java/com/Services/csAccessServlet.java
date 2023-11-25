package com.Services;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.client.getusertype;

/**
 * Servlet implementation class csAccessServlet
 */
@WebServlet("/csAccessServlet")
public class csAccessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");

		HttpSession session = request.getSession(false);
        String lusername = (String) session.getAttribute("username");
        
        String usertype=getusertype.usertype(lusername);
        String cname="";
        
        
        if(usertype=="Client") {
        	cname=lusername;
        }
		
        else if(usertype=="Vendor") {
        	out.println("<script type='text/javascript'>");
			out.println("location='csAccessDenied.jsp'");
			out.println("</script>");
        }
        

		String type=request.getParameter("data");
		String cus="consult";
		String ven="create";
		boolean cusTypeEq=(type.equals(cus));
		boolean venTypeEq=(type.equals(ven));
		
		if(cusTypeEq && !cname.isEmpty()) {
			out.println("<script type='text/javascript'>");
			out.println("location='booking.jsp'");
			out.println("</script>");
		}
		else if(venTypeEq && !cname.isEmpty()) {
			out.println("<script type='text/javascript'>");
			out.println("location='createevent.jsp'");
			out.println("</script>");
		}
		else {
			out.println("<script type='text/javascript'>");
			out.println("location='csAccessDenied.jsp'");
			out.println("</script>");
		}
		
	}

}
