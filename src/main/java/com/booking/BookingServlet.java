package com.booking;

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



/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
       
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		response.setContentType("text/html");
		
		HttpSession session = request.getSession(false);
        String cusername = (String) session.getAttribute("username");
        
		
		
	//	String cusername=request.getParameter("cusername");
		String rname=request.getParameter("rname");
		String venue=request.getParameter("venue");
		String edate=request.getParameter("edate");
		String etime=request.getParameter("etime");
		
		boolean isTrue=	BookingDBUtil.bookingevent(cusername, rname, venue, edate, etime);
		
		if(isTrue==true) {
			String successMessage="New event Booked Successfully.";
			request.setAttribute("successMessage", successMessage);
			
			List<Booking> bookingDetails=BookingDBUtil.getBookingDetails(cusername);
			request.setAttribute("bookingDetails", bookingDetails);
			
			RequestDispatcher dis=request.getRequestDispatcher("viewbooking.jsp");
			dis.forward(request, response);
		}
		
		if(isTrue==false) {
			out.println("<script type='text/javascript'>");
			out.println("alert('Booking Unsucessful.Please try again');");
			out.println("location='clientlogin.jsp'");
			out.println("</script>");
		}
		
		
	}

}
