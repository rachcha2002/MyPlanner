package com.Events;

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

import com.client.getusertype;

/**
 * Servlet implementation class getEventList
 */
@WebServlet("/getEventList")
public class getEventList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean isTrue=true;
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
        
        if(isTrue == true) {
			List<UserEvent> eventsDetails=eventDBUtil.getUserEvent(cname);
			request.setAttribute("eventDetails",eventsDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("eventlist.jsp");
			dis.forward(request, response);
			
			
			
		} else {
			out.println("<script type='text/javascript'>");
			out.println("alert('Event list unable to load! Try Again');");
			out.println("location='createevent.jsp'");
			out.println("</script>");
		}
		
	}

}
