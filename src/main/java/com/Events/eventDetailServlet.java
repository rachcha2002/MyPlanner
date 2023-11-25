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

@WebServlet("/eventDetailServlet")
public class eventDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String name = request.getParameter("ename");
		String id = request.getParameter("eid");
		
		
		//Update this from using sessions
				String userName="Rachith";
				HttpSession session = request.getSession(false);
		        String lusername = (String) session.getAttribute("username");
		        
		        String usertype=getusertype.usertype(lusername);
		        String cname="";
		        
		        
		        if(usertype=="Client") {
		        	cname=lusername;
		        }
				
				
				
				
				try {
					List<Event> moreEventsDetails=eventDBUtil.getEvent(cname, name,id);
					// Check if the list has any details
				    if (!moreEventsDetails.isEmpty()) {
				        // List is not empty, there are details
				        request.setAttribute("eventDetails", moreEventsDetails);
				        RequestDispatcher dis = request.getRequestDispatcher("eventDetails.jsp");
						dis.forward(request, response);
				    } else {
				        // List is empty, no details
				    	out.println("<script type='text/javascript'>");
						out.println("alert('Event creation unsuccesful! Try Again');");
						out.println("location='createevent.jsp'");
						out.println("</script>");
				    }

					
					
					
					
					
					
				} catch(Exception e){
					e.printStackTrace();
				}
		
	}

}
