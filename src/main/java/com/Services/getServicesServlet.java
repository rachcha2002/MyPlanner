package com.Services;

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

import com.Events.UserEvent;
import com.Events.eventDBUtil;

/**
 * Servlet implementation class getServicesServlet
 */
@WebServlet("/getServicesServlet")
public class getServicesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Update this from using sessions
				String userName="Rachith";
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		String rqst=request.getParameter("data");
		String pkg="pkg";
		String venu="venue";
		
		if(rqst.equals(pkg)) {
				
		
			try {
				List<Package> photo=servicesDBUtil.getPhoto();
				List<Package> deco=servicesDBUtil.getDeco();
				List<Package> cater=servicesDBUtil.getCater();
				List<Package> light=servicesDBUtil.getLights();
				
				// Check if any of the lists have details
			   boolean anyListNotEmpty = 
			        !photo.isEmpty()||
				!deco.isEmpty()||
				!cater.isEmpty()||
				!light.isEmpty();
	
				
			    if (anyListNotEmpty) {
			        // List is not empty, there are details
			    	request.setAttribute("serviceDetails1",photo);
			    	request.setAttribute("serviceDetails2",deco);
			    	request.setAttribute("serviceDetails3",cater);
			    	request.setAttribute("serviceDetails4",light);
					RequestDispatcher dis = request.getRequestDispatcher("services.jsp");
					dis.forward(request, response);		
			    } else {
			        // List is empty, no details
			    	out.println("<script type='text/javascript'>");
					out.println("alert('Page loading unsuccesful! Try Again');");
					out.println("location='home.jsp'");
					out.println("</script>");
			    }
	
			} catch(Exception e){
				e.printStackTrace();
			}
			
		}
		else if(rqst.equals(venu)) {
			
			try {
				List<Venue> venue=servicesDBUtil.getVenues();
				if (!venue.isEmpty()) {
			        request.setAttribute("venueDetails",venue);
					RequestDispatcher dis = request.getRequestDispatcher("venues.jsp");
					dis.forward(request, response);		
			    } else {
			        // List is empty, no details
			    	out.println("<script type='text/javascript'>");
					out.println("alert('Page loading unsuccesful! Try Again');");
					out.println("location='home.jsp'");
					out.println("</script>");
			    }
	
			} catch(Exception e){
				e.printStackTrace();
			}
		}
		
	}

}
