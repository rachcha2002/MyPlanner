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


@WebServlet("/testinglist")
public class testinglist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String userName="Rachith";
		boolean isTrue;
		
		
			List<UserEvent> eventsDetails=eventDBUtil.getUserEvent(userName);
			request.setAttribute("eventDetails",eventsDetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("eventlist.jsp");
			dis.forward(request, response);
			
			
			
		
		
		
	}

}
