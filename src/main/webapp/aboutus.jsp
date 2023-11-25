<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About My Planner</title>
<!-- Add Bootstrap CSS link here -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- Add your custom CSS if necessary -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
	 <link rel="stylesheet" type="text/css" href="header&footer.css">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;600&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="css/aboutus.css" />

<link rel="stylesheet" type="text/css" href="Header and Footer/header&footer.css">


<style>

#submitButton {
  background: none;
  border: none;
  color: black; 
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
	
	
	

	<div class="container mt-5">
		<div class="row">
			<div class="col-lg-6">
				<h2>About My Planner</h2>
				<p>My Planner is your premier event planning system. We take
					pride in helping you create memorable events that leave a lasting
					impression. Our platform is designed to simplify the event planning
					process, from weddings to corporate gatherings.</p>
				<p style="margin-bottom: 20px;">At My Planner, we are committed
					to making your vision a reality. Our team of experienced event
					planners and cutting-edge technology come together to bring your
					ideas to life. We handle all the details, so you can relax and
					enjoy your special day.</p>
					<br><br>
				<h3>Our Vision</h3>
				<p>Our vision is to be the go-to event planning solution for
					individuals and businesses worldwide. We strive to innovate and
					simplify event planning, making it an enjoyable and stress-free
					experience for our clients. My Planner aims to set the standard for
					excellence in event planning services, exceeding our clients'
					expectations with every event we organize.</p>
			</div>
			<div class="col-lg-6" style="text-align: right;">
				<img src="img/party.jpg" alt="About Us Image" class="img-fluid"
					id="partyimg" style="padding-left: 150px;"> <br> <br>
				<img src="img/party2.jpg" alt="About Us Image" class="img-fluid"
					id="partyimg" style="padding-left: 150px; padding-top: 20px;">


			</div>
		</div>
	</div>


	<!-- Our Team section with placeholder content -->

	<section>
		<div class="row">
			<h1>Our Team</h1>
		</div>
		<div class="row">
			<!-- Column 1-->
			<div class="column">
				<div class="card">
					<div class="img-container">
						<img src="img/rachith.jpg" />
					</div>
					<h3>Rachith Tharana</h3>
					<p>Co-Founder</p>
					<div class="icons">
						<a href="#"> <i class="fab fa-twitter"></i>
						</a> <a href="#"> <i class="fab fa-linkedin"></i>
						</a> <a href="#"> <i class="fab fa-github"></i>
						</a> <a href="#"> <i class="fas fa-envelope"></i>
						</a>
					</div>
				</div>
			</div>
			<!-- Column 2-->
			<div class="column">
				<div class="card">
					<div class="img-container">
						<img src="img/kavinda.jpg" />
					</div>
					<h3>Kavinda Dimuth</h3>
					<p>Co-Founder</p>
					<div class="icons">
						<a href="#"> <i class="fab fa-twitter"></i>
						</a> <a href="#"> <i class="fab fa-linkedin"></i>
						</a> <a href="#"> <i class="fab fa-github"></i>
						</a> <a href="#"> <i class="fas fa-envelope"></i>
						</a>
					</div>
				</div>
			</div>
			<!-- Column 3-->
			<div class="column">
				<div class="card">
					<div class="img-container">
						<img src="img/githadi.jpg" />
					</div>
					<h3>Githadi Wijayarathna </h3>
					<p>Co-Founder</p>
					<div class="icons">
						<a href="#"> <i class="fab fa-twitter"></i>
						</a> <a href="#"> <i class="fab fa-linkedin"></i>
						</a> <a href="#"> <i class="fab fa-github"></i>
						</a> <a href="#"> <i class="fas fa-envelope"></i>
						</a>
					</div>
				</div>
			</div>
			<div class="column">
				<div class="card">
					<div class="img-container">
						<img src="img/ishini.png" />
					</div>
					<h3>Ishini Warnasooriya</h3>
					<p>Co-Founder</p>
					<div class="icons">
						<a href="#"> <i class="fab fa-twitter"></i>
						</a> <a href="#"> <i class="fab fa-linkedin"></i>
						</a> <a href="#"> <i class="fab fa-github"></i>
						</a> <a href="#"> <i class="fas fa-envelope"></i>
						</a>
					</div>
				</div>
			</div>


		</div>
	</section>





	
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

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	
</body>
</html>





	
	
	
	
	
	


	



