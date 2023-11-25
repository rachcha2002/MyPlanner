package com.venue;

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



@WebServlet("/deleteVenueServlet")
public class deleteVenueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
        String vid = request.getParameter("vid");
		
		boolean isTrue;
		
		HttpSession session = request.getSession(false);
        String lusername = (String) session.getAttribute("username");
        
        String usertype=getusertype.usertype(lusername);
        String uname="";
        
       if(usertype=="Vendor") {
        	uname=lusername;
        }
		
		isTrue = venueDBUtil.deleteVenue(vid);
		
		if(isTrue == true) {
			List<Venue> vDetails = venueDBUtil.getDetails(uname);
			request.setAttribute("vDetails", vDetails);
			
			String successMessage="Venue Deletion Successfully.";
			request.setAttribute("successMessage", successMessage);
			
			RequestDispatcher dis2 = request.getRequestDispatcher("venueProfile.jsp");
			dis2.forward(request, response);
		}
		else {
		
			List<Venue> vDetails = venueDBUtil.getDetails(vid);
			request.setAttribute("vDetails", vDetails);
			
			String unsuccessMessage="Error,Venue details deletion failed.";
			request.setAttribute("unsuccessMessage", unsuccessMessage);
			
			RequestDispatcher dis2 = request.getRequestDispatcher("venueProfile.jsp");
			dis2.forward(request, response);
		}
		
	
	}

	}


