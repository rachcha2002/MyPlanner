package com.Events;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/updatEeventServlet")
public class updatEeventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String name = request.getParameter("ename");
		String date = request.getParameter("edate");
		String time = request.getParameter("etime");
		String guestCount = request.getParameter("participation");
		String hostName = request.getParameter("hostname");
		String category = request.getParameter("category");
		String budget = request.getParameter("budget");
		String venue = request.getParameter("vname");
		String photo = request.getParameter("photo");
		String deco = request.getParameter("decoration");
		String lights = request.getParameter("light&audio");
		String catering = request.getParameter("catering");
		String des = request.getParameter("des");
		String email = request.getParameter("email");
		String number = request.getParameter("pnumber");
		String eventid = request.getParameter("eid");
		String username =request.getParameter("username");
		
        boolean isTrue;
        
        HttpSession session = request.getSession(false);
        String lusername = (String) session.getAttribute("username");
        
        String usertype=getusertype.usertype(lusername);
        String cname="";
        
        
        if(usertype=="Client") {
        	cname=lusername;
        }
        
        
		isTrue = eventDBUtil.updateevent(eventid,name, date, time, guestCount, hostName, category, budget, venue, photo, deco, lights, catering, des, email, number,username);
		
		
		if(isTrue == true) {
			List<UserEvent> eventsDetails=eventDBUtil.getUserEvent(cname);
			request.setAttribute("eventDetails",eventsDetails);
			
			String successMessage="Event Updation Successfully.";
			request.setAttribute("successMessage", successMessage);
			
			RequestDispatcher dis = request.getRequestDispatcher("eventlist.jsp");
			dis.forward(request, response);
			
			
			
		} else {
			List<UserEvent> eventsDetails=eventDBUtil.getUserEvent(cname);
			request.setAttribute("eventDetails",eventsDetails);
			
			String unsuccessMessage="Error,Event details update failed.";
			request.setAttribute("unsuccessMessage", unsuccessMessage);
			
			RequestDispatcher dis = request.getRequestDispatcher("eventlist.jsp");
			dis.forward(request, response);
		}
		
	}

}
