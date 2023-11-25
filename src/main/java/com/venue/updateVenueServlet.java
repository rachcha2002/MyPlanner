package com.venue;

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



@WebServlet("/updateVenueServlet")
public class updateVenueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String vid = request.getParameter("vid");
		String vname = request.getParameter("vname");
		String location = request.getParameter("vlocation");
		String owner = request.getParameter("vowner");
		String seating =  request.getParameter("vcapacity");
		String price = request.getParameter("vprice");
		String description = request.getParameter("vdes");
		String link = request.getParameter("vlink");
		

		boolean isTrue;
		HttpSession session = request.getSession(false);
        String lusername = (String) session.getAttribute("username");
        
        String usertype=getusertype.usertype(lusername);
        String uname="";
        
       if(usertype=="Vendor") {
        	uname=lusername;
        }
		isTrue = venueDBUtil.updateVenue(vid,vname,location,owner,seating,price,description,link);
		
		if(isTrue == true) {
			
			List<Venue> vDetails = venueDBUtil.getDetails(uname);
			request.setAttribute("vDetails", vDetails);
			
			String successMessage="Venue Update Successfully.";
			request.setAttribute("successMessage", successMessage);
			
			RequestDispatcher dis1 = request.getRequestDispatcher("venueProfile.jsp");
			dis1.forward(request, response);
		}
		else {
			List<Venue> vDetails = venueDBUtil.getDetails(uname);
			request.setAttribute("vDetails", vDetails);
			
			String unsuccessMessage="Error,Venue details updation failed.";
			request.setAttribute("unsuccessMessage", unsuccessMessage);
			
			RequestDispatcher dis1 = request.getRequestDispatcher("venueProfile.jsp");
			dis1.forward(request, response);
		}
	}

}
