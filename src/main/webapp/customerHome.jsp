<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>MyPlanner</title>
    <link rel="stylesheet" type="text/css" href="createevent.css">
    <link rel="stylesheet" type="text/css" href="Header and Footer/header&footer.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/customerHome.css">

   
</head>
<body>
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
			<a href="home.jsp"><button class="active" type="button"
					id="bttn1">
					<b>Home</b>
				</button></a>
			<div class="dropdown">
          <button class="dropbtn">Services</button>
          <div class="dropdown-content">
            <a href="#"><form action="csServices" method="post">
            <input type="hidden" name="data" value="consult">
        	<button type="submit" class="sec3card-btn-1">    
                <div class="name">
                    <span class="aname">Book Conusultation</span>
                </div>
            </button> 
            </form>  </a>
            <a href="viewbooking.jsp">
            
        	<button type="submit" class="sec3card-btn-1">    
                <div class="name">
                    <span class="aname">My Bookings</span>
                </div>
            </button> 
             </a>
            <a href="#"><form action="csServices" method="post">
            <input type="hidden" name="data" value="create">
        	<button type="submit" class="sec3card-btn-1">    
                <div class="name">
                    <span class="aname">Create Event</span>
                </div>
            </button> 
            </form></a>
            <a href="#"><form action="getEvents" method="post">
           
        	<button type="submit" class="sec3card-btn-1">    
                <div class="name">
                    <span class="aname">My Events</span>
                </div>
            </button> 
            </form></a>
            
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




    <section class="section-1" id="sec1">
        <center>
            <div class="u-container-layout-1">
                <center>
                <h2 class="u-text-2">Welcome to MyPlanner!</h2><br>
                <h3 class="u-text-1">Find out best unique plan for your event and leave your guests at amaze.</h3>
            </center>
              </div>
            </center>   
    </section>

    <section class="section-2" id="sec">
        
        <!-- Create Section -->
  <div class="sec2-container" id="about">
    <div class="sec2-img">
     <img src="Images/createevent.jpg" class="w3-round w3-image w3-opacity-min" alt="Table Setting" width="400" height="500">
    </div>

    <div class="sec2-des">
      <h1 class="w3-center">Create Event</h1><br>
      
      <p class="w3-large">Make customze plan for your precious event.Send your preferences by creating event then our planners will make your dream come true by making unique customize plan.</p>
      <br><br>
      <a href="createevent.jsp" class="u-btn-1">Create Event</a>  
       
    </div>
  </div>
    
    </section>

    <section class="section-5" id="sec1">
        
        <div class="u-container-layout-1">
            <h2 class="u-text-2">Want to find experts idea?<br>
            </h2><br><h3 class="u-text-1">Book consultation today find out whta experts has to say about your event plan.</h3><br>
            <a href="booking.jsp" class="u-btn-1">Book Consultation</a>
          </div>
    
    </section>

   
   
    <section class="section-3" id="sec">
   <div class="sec3left">
    <h1 class="text">Find interesting selections from our partners.</h1>
    <div class="sec3-cards">
        <a href="#">
         <form action="getservice" method="post">
            <input type="hidden" name="data" value="venue">
            <button type="submit" class="sec3card-btn-1">
        <div class="swiper-slide" id="card1">
          
             <div class="name">
                   
        
                        <span class="aname">Venues</span>
                       
             </div>
           
        </div> </button> 
            </form></a>
        
        
        <a href="#">
        	<form action="getservice" method="post">
        <input type="hidden" name="data" value="pkg">
        <button type="submit" class="sec3card-btn-1">
            <div class="swiper-slide" id="card2">
               <div class="name">
                 
                        <span class="aname">Other Services</span>
                        
                 </div>
              
            </div></button> 
            </form>  </a>
            
        
        
        
        
    </div>  
    </div>
    <div class="sec3right">
        <div class="sec3-img1">
            <img src="Images/table.jpg" class="w3-round w3-image w3-opacity-min" alt="Table Setting" width="350" height="400">
        </div>
        <div class="sec3-img2">
            <img src="Images/food.jpg" class="w3-round w3-image w3-opacity-min" alt="Table Setting" width="350" height="200">
            <img src="Images/band.jpeg" class="w3-round w3-image w3-opacity-min" alt="Table Setting" width="350" height="200">
        </div>
    </div>
    </section>



    <!-- testimonial area Start -->
 
  
  <section class="section-6">
      
    <div class="sec2-poster">
        <h1 class="y-text-1-1">What Our Client Say?</h1>
        <p class="y-text-2">Find who we are in their words.</p>

        <br>
          
      </div>
      <div class="sec2-2">
        <h2 style="font-family:Brush Script MT,cursive;font-weight: bold;">Popular Testimonials</h2>
        <div class="section-4" id="sec">
            <figure class="snip1390">
                <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample3.jpg" alt="profile-sample3" class="profile" />
                <figcaption>
                  <h2>Eleanor Crisp</h2>
                  <h4>UX Design</h4>
                  <blockquote>Dad buried in landslide! Jubilant throngs fill streets! Stunned father inconsolable - demands recount!</blockquote>
                </figcaption>
              </figure>
              <figure class="snip1390 hover"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample5.jpg" alt="profile-sample5" class="profile" />
                <figcaption>
                  <h2>Gordon Norman</h2>
                  <h4>Accountant</h4>
                  <blockquote>Wormwood : Calvin, how about you? Calvin : Hard to say ma'am. I think my cerebellum has just fused. </blockquote>
                </figcaption>
              </figure>
              <figure class="snip1390"><img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/profile-sample6.jpg" alt="profile-sample6" class="profile" />
                <figcaption>
                  <h2>Sue Shei</h2>
                  <h4>Public Relations</h4>
                  <blockquote>The strength to change what I can, the inability to accept what I can't and the incapacity to tell the difference.</blockquote>
                </figcaption>
              </figure>
             
              <!-- partial -->
                <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script><script  src="home.js"></script>
              
            </div>
</div>  
</section>
      <!-- end client section -->
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
  </body>
  
  </html>