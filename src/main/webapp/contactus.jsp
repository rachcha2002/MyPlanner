<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Contact Us</title>
	 <link rel="stylesheet" type="text/css" href="Header and Footer/header&footer.css">
    <link rel="stylesheet" href="css/contactus.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>

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
	<!-- header-->
    
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

    var query = document.getElementById("searchQuery").value;
    if (!query) {
        return; 
    }

    var highlightedContent = document.body.innerHTML.replace(/<mark>/g, '').replace(/<\/mark>/g, '');

    var regex = new RegExp(query, 'gi');

    highlightedContent = highlightedContent.replace(regex, function (match) {
        return '<mark>' + match + '</mark>';
    });

    document.body.innerHTML = highlightedContent;
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
			<a href="home.jsp"><img src="Header and Footer/mainLogo.png" alt="MyPlanner Image"
				class="logo" id="headlogo" height="100px" width="100px"></a>

		</div>

		<div class="navbar" id="Topnav">
			<a href="home.jsp"><button class="active" type="button" id="bttn1">
					<b>Home</b>
				</button></a>
			<a href="home.jsp"><button type="button" id="bttn1">
					<b>Services</b>
				</button></a>
			<a href="#contact"><button type="button" id="bttn1">Gallery</button></a>
			<a href="contactus.jsp"><button type="button" id="bttn1">Contact
					Us</button></a> <a href="aboutus.jsp"><button type="button" id="bttn1">About
					Us</button></a>

		</div>
		<div class="search">
			<form action="#" method="get">
				<img src="Header and Footer/search.png" class="searchimg" height="20px" width="20px">
				<input type="text" class="input" name="search data" id="searchQuery"
					placeholder="Find here" />
					 <input type="submit" id="searchbtn" onclick="highlightOriginalContent(); return false;" value="Search">
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
		    <input type="submit" value="Logout" class="custom-logout-button">
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
	
	
	
	<br><br>
	
	
	
	  <section  id="section1">

        
      <div class="container">
        <div class="content">
          <div class="left-side">
            <div class="address details">
              <i class="fas fa-map-marker-alt"></i>
              <div class="topic">Address</div>
              <div class="text-one">123A, Galle Road,</div>
              <div class="text-two">Colombo,Sri Lanka.</div>
            </div>
            <div class="phone details">
              <i class="fas fa-phone-alt"></i>
              <div class="topic">Phone</div>
              <div class="text-one">+9411 222 5575</div>
              <div class="text-two">+9471 222 5575</div>
            </div>
            <div class="email details">
              <i class="fas fa-envelope"></i>
              <div class="topic">Email</div>
              <div class="text-one">inquiry@myplanner.com</div>
              <div class="text-two">info@myplanner.com</div>
            </div>
          </div>
          <div class="right-side">
            <div class="topic-text">Contact Us</div>
            <p>Do you have any questions, suggestions, or requests? We'd love to hear from you! Our dedicated team is here to provide assistance and address any inquiries you may have.
              Feel free to reach out to us.</p>
            <form action="#">
              <div class="input-box">
                <input type="text" placeholder="Enter your name" />
              </div>
              <div class="input-box">
                <input type="text" placeholder="Enter your email" />
              </div>
              <div class="input-box message-box">
                <textarea placeholder="Enter your message"></textarea>
              </div>
              <div class="button">
                <input type="button" value="Send Now" />
              </div>
            </form>
          </div>
        </div>
      </div>

      
    </section>

    <br><br>
	

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





	
	
	
	
	
	
	