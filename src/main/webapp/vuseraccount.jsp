<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>v Details</title>
    <!-- Add Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="header&footer.css">
    <style>
        
        table {
            width: 100%;
            max-width: 800px; 
            margin: 0 auto;
            font-size: 20px; 
        }
        
		        #submitButton {
		  background: none;
		  border: none;
		  color: black; /* Set the desired link color */
		  text-decoration: none;
		  cursor: pointer;
		 
}
    </style>
</head>



<body class="text-center">

<%
	String successMessage = (String) request.getAttribute("successMessage");
	%>
	<%
	String unsuccessMessage = (String) request.getAttribute("unsuccessMessage");
	%>

	<%
	if (successMessage != null) {
	%>
	<script>
        alert("<%=successMessage%>");
    </script>
	<%
	}
	%>

	<%
	if (unsuccessMessage != null) {
	%>
	<script>
        alert("Error: <%=unsuccessMessage%>
		");
	</script>
	<%
	}
	%>
	<script>

	function highlightOriginalContent() {
	    // Get the search query from the input field
	    var query = document.getElementById("searchQuery").value.trim(); // Trim to remove leading/trailing whitespace

	    // Check if the query is empty or null
	    if (!query) {
	        return false; // Exit the function and prevent form submission
	    }

	    // Reset any previous highlights by removing the <mark> tags
	    var highlightedContent = document.body.innerHTML.replace(/<mark>/g, '').replace(/<\/mark>/g, '');

	    // Create a regular expression to perform a global case-insensitive search
	    var regex = new RegExp(query, 'gi');

	    // Highlight the matched text by wrapping it in <mark> tags
	    highlightedContent = highlightedContent.replace(regex, function (match) {
	        return '<mark>' + match + '</mark>';
	    });

	    // Update the page content with the highlighted text
	    document.body.innerHTML = highlightedContent;

	    return true; // Continue with form submission
	}


document.getElementById("submitlink").addEventListener("click", function(event) {
	  event.preventDefault(); // Prevent the link from navigating
	  document.getElementById("userAccountForm").submit(); // Submit the form
	});

	
	
</script>

	<header class="header">

		<!-- Brand and Slogan-->
		<div class="header-left" style="margin-right: 25px;">
			<!-- Logo-->
			<a href="vendorHome.jsp"><img src="Header and Footer/mainLogo.png" alt="MyPlanner Image"
				class="logo" id="headlogo" height="100px" width="100px"></a>

		</div>

		<div class="navbar" id="Topnav">
			<a href="home.jsp"><button class="active" type="button"
					id="bttn1">
					<b>Home</b>
				</button></a>
			<div class="dropdown">
				<button class="dropbtn">Services</button>
				<div class="dropdown-content">
					<a href="#">Awards</a> <a href="#">Candidates</a> <a href="#">About
						Award Ceremony</a> <a href="#">Nomination Result</a> <a href="#">Sponsors</a>
				</div>
			</div>
			<a href="#contact"><button type="button" id="bttn1">Gallery</button></a>
			<a href="contactus.jsp"><button type="button" id="bttn1">Contact
					Us</button></a> <a href="aboutus.jsp"><button type="button" id="bttn1">About
					Us</button></a>

		</div>
		<div class="search">
			<form action="#" method="get">
				<img src="Header and Footer/search.png" class="searchimg" height="20px" width="20px">
				<input type="text" class="input" name="searchquery" id="searchQuery"
					placeholder="Find here" />
					 <input type="submit" id="searchbtn" onclick="return highlightOriginalContent();" value="Search">
			</form>
		</div>


		<%
		String lusername = (String) session.getAttribute("username");
		if (lusername != null) {
		%>
		<div class="userbtn">
			
			<img src="Header and Footer/uuser.png" class="userbtnimg" height="35px" width="35px">
			&nbsp;&nbsp;
			<form id="userAccountForm" action="navigateuser" method="post" class="userlink">
				
			<input type="submit" id="submitButton"  value="<%=lusername%>">
				
				</form>
		
		</div>

		<div class="logoutbtn" style="margin-top: 20px; text-align: center;">
			<form action="logoutclient" method="post">
				<input type="submit" value="Logout" class="btn btn-dark">
			</form>
		</div>

		<%
		}

		else {
		%>
		<div class="userbtn">
			<div class="userbtntext">
				<a href="clientlogin.jsp" class="userlink">Login/SignUp</a>
			</div>
			<img src="Header and Footer/uuser.png" class="userbtnimg" height="35px" width="35px">
		</div>



		<%
		}
		%>

	</header>
	
	

<div class="container">
    <table class="table table-striped table-bordered">
    <h2>Profile Details</h2>
        <c:forEach var="v" items="${vendorDetails}">
            <tr>
                <th>ID</th>
                <td>${v.id}</td>
            </tr>
            <tr>
                <th>Name</th>
                <td>${v.name}</td>
            </tr>
           
            <tr>
                <th>Email</th>
                <td>${v.email}</td>
            </tr>
            <tr>
                <th>Phone</th>
                <td>${v.phone}</td>
            </tr>
            <tr>
                <th>Address</th>
                <td>${v.address}</td>
            </tr>
            <tr>
                <th>Services</th>
                <td>${v.services}</td>
            </tr>
            <tr>
                <th>Username</th>
                <td>${v.username}</td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <c:url value="updatevendor.jsp" var="vendorupdate">
                        <c:param name="id" value="${v.id}"/>
                        <c:param name="name" value="${v.name}"/>
                        <c:param name="email" value="${v.email}"/>
                        <c:param name="phone" value="${v.phone}"/>
                        <c:param name="address" value="${v.address}"/>
                         <c:param name="services" value="${v.services}"/>
                        <c:param name="username" value="${v.username}"/>
                        <c:param name="password" value="${v.password}"/>
                    </c:url>
                    <a href="${vendorupdate}" class="btn btn-primary">Update</a>

                    <c:url value="deletevendor.jsp" var="vendordelete">
                      <c:param name="id" value="${v.id}"/>
                        <c:param name="name" value="${v.name}"/>
                        <c:param name="email" value="${v.email}"/>
                        <c:param name="phone" value="${v.phone}"/>
                        <c:param name="address" value="${v.address}"/>
                        <c:param name="services" value="${v.services}"/>
                        <c:param name="username" value="${v.username}"/>
                        <c:param name="password" value="${v.password}"/>
                    </c:url>
                    <a href="${vendordelete}" class="btn btn-danger">Delete</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>


	
	<hr style="background-color: black; height: 1px;">
	<footer>
      <div class="footer-container">
       
          <div class="footerhead1">
            <a href="home.jsp"><img src="Header and Footer/mainLogo1.png" alt="logo" class="logo" id="footlogo" height="150px" width="150px" ></a> 
            <p id="footerhead1des">We offer customized event planning services <br>tailored to your specific needs.</p>
            <div>
              <a href="https://www.facebook.com/"><img src="Header and Footer/fb.png" class="fimg"></a>
                <a href="https://www.instagram.com/"><img src="Header and Footer/instagram.png" class="fimg"></a>
                <a href="https://twitter.com/"><img src="Header and Footer/twitter.png" class="fimg"></a>
                
            </div>
          </div>
          <div class="footerhead" id="fhd2">
            <h2>For Customers</h2>
            	
            	<a href="https://www.smartdraw.com/event-plan/#:~:text=Event%20planning%20involves%20the%20coordination,the%20elements%20of%20an%20event.">Events</a>
                 
            <form action="csServices" method="post">
                 
                  <input type="hidden" name="data" value="consult">
  			<input type="submit" value="Consulting"  style="background: none; border: none; cursor: pointer; text-decoration: none; color: #f9f9f9; font-size: 17px; margin-bottom: 0.5rem; font-family: Verdana, Geneva, Tahoma, sans-serif"
    		onmouseover="this.style.color='aqua'; this.style.fontSize='larger';"
    		onmouseout="this.style.color='#f9f9f9'; this.style.fontSize='17px';"
  			>
			</form>
			
			
			
			 <form action="csServices" method="post">
			  <input type="hidden" name="data" value="create">
  			<input type="submit" value="Plan Events" style="background: none; border: none; cursor: pointer; text-decoration: none; color: #f9f9f9; font-size: 17px; margin-bottom: 0.5rem;font-family: Verdana, Geneva, Tahoma, sans-serif"
    		onmouseover="this.style.color='aqua'; this.style.fontSize='larger';"
    		onmouseout="this.style.color='#f9f9f9'; this.style.fontSize='17px';"
  			>
			</form>
			
			
			
			<form action="getservice" method="post">
			
			<input type="hidden" name="data" value="venue">
  			<input type="submit" value="Booking Venues"  style="background: none; border: none; cursor: pointer; text-decoration: none; color: #f9f9f9; font-size: 17px; margin-bottom: 0.5rem;font-family: Verdana, Geneva, Tahoma, sans-serif"
    		onmouseover="this.style.color='aqua'; this.style.fontSize='larger';"
    		onmouseout="this.style.color='#f9f9f9'; this.style.fontSize='17px';"
  			>
			</form>
			
			
			<form action="getservice" method="post">
			
			<input type="hidden" name="data" value="pkg">
  			<input type="submit" value="Reserve Services"  style="background: none; border: none; cursor: pointer; text-decoration: none; color: #f9f9f9; font-size: 17px; margin-bottom: 0.5rem;"
    		onmouseover="this.style.color='aqua'; this.style.fontSize='larger';"
    		onmouseout="this.style.color='#f9f9f9'; this.style.fontSize='17px';"
  			>
			</form>
	
          </div>
          
          
          
          
          <div class="footerhead" id="fhd3">
            <h2>For Vendors</h2>
            
              <a href="https://eventacademy.com/guide/event-advertising/">Advertisement</a>
              <a href="https://planned.com/find-suppliers">Service info</a>
              <a href="https://www.tacticalprojectmanager.com/supplier-rating-criteria/">Recommendation</a>
              <a href="https://www.linkedin.com/pulse/benefits-event-management-systems-event-management-solutions-ems">Why should join</a>
          </div>
          <div class="footerhead" id="fhd4">
				<h2>We are</h2>
				<a href="aboutus.jsp">About Us</a> <a href="contactus.jsp">Contact Us</a> <a href="https://www.smartdraw.com/event-plan/#:~:text=Event%20planning%20involves%20the%20coordination,the%20elements%20of%20an%20event." target="blank">What
					is Event Planing?</a>
			</div>
          
        
        <div class="footer-email">
            <h2>Connect with Us</h2>
            <form action="csServices" method="post">
            <input type="hidden" name="data" value="consult">
        	<button type="submit" id="footerc-btn">    
                <div class="name">
                    <span class="aname">Book Consultation</span>
                </div>
            </button> 
            </form>    
            
             
        </div>
      </div>
      <center>
        <div class="copyright"><h4>© 2023 MyPlanner. All rights reserved.</h4></div>
      </center>
      
     </footer>


	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>





	
	
	
	
	
	
