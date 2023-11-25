package com.Events;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.client.getusertype;


@WebServlet("/cancelEventServlet")
public class cancelEventServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
        String lusername = (String) session.getAttribute("username");
        
        String usertype=getusertype.usertype(lusername);
        String cname="";
        
        
        if(usertype=="Client") {
        	cname=lusername;
        }
		
		String userName = request.getParameter("uname");
		List<UserEvent> eventsDetails=eventDBUtil.getUserEvent(cname);
		request.setAttribute("eventDetails",eventsDetails);
		
		RequestDispatcher dis = request.getRequestDispatcher("eventlist.jsp");
		dis.forward(request, response);
	}

}
