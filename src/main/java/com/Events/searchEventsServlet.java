package com.Events;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class searchEventsServlet
 */
@WebServlet("/searchEventsServlet")
public class searchEventsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String searchdata = request.getParameter("searchdata");
		
		
		//Update this from using sessions
		
		HttpSession session = request.getSession(false);
        String lusername = (String) session.getAttribute("username");
        
        String usertype=getusertype.usertype(lusername);
        String cname="";
        
        
        if(usertype=="Client") {
        	cname=lusername;
        }
		
		try {
			List<UserEvent> eventDetails=eventDBUtil.searchEvent(cname,searchdata);
			// Check if the list has any details
		    if (!eventDetails.isEmpty()) {
		        // List is not empty, there are details
		    	request.setAttribute("eventDetails",eventDetails);
				RequestDispatcher dis = request.getRequestDispatcher("eventlist.jsp");
				dis.forward(request, response);		
		    } else {
		        // List is empty, no details
		    	List<UserEvent> eventsDetails=new ArrayList<>();
		    	UserEvent ue=new UserEvent(0, "No results found","","","");
		    	eventsDetails.add(ue);
				request.setAttribute("eventDetails",eventsDetails);
				
				RequestDispatcher dis = request.getRequestDispatcher("eventlist.jsp");
				dis.forward(request, response);
		    }

			
			
			
			
			
			
		} catch(Exception e){
			e.printStackTrace();
		}
	}

}
