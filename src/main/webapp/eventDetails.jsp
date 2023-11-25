<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>MyPlanner</title>
    <link rel="stylesheet" type="text/css" href="css/event.css">
    <link rel="stylesheet" type="text/css" href="Header and Footer/header&footer.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="ISO-8859-1">

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
			<a href="customerHome.jsp"><img src="Header and Footer/mainLogo.png" alt="MyPlanner Image"
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

       


    <!--code here-->

    <section class="section-1" id="sec1">
      
      <div class="form-create">
       
        
        <!--Form-->
        <div class="cform">
        

        <form  action="/">
        <c:forEach var="cus" items="${eventDetails}">
	
      <c:set var="id" value="${cus.id}"/>
      <c:set var="name" value="${cus.name}"/>
      <c:set var="date" value="${cus.date}"/>
      <c:set var="time" value="${cus.time}"/>
      <c:set var="guestCount" value="${cus.guestCount}"/>
      <c:set var="hostName" value="${cus.hostName}"/>
      <c:set var="category" value="${cus.category}"/>
      <c:set var="budget" value="${cus.budget}"/>
      <c:set var="venue" value="${cus.venue}"/>
      <c:set var="photo" value="${cus.photo}"/>
      <c:set var="deco" value="${cus.deco}"/>
      <c:set var="lights" value="${cus.lights}"/>
      <c:set var="catering" value="${cus.catering}"/>
      <c:set var="des" value="${cus.des}"/>
      <c:set var="email" value="${cus.email}"/>
      <c:set var="number" value="${cus.number}"/>
      <c:set var="username" value="${cus.username}"/>
      <c:set var="status" value="${cus.planStatus}"/>
          <div class="toppart">
          <h1>${cus.name}</h1>
          </div>
           
          <div class="bottompart">
            <div class="leftpart">
          <div class="item">
              <h3 >Event Name</h3>
              <input id="ename" type="text" name="ename" placeholder="${cus.name}" readonly/>
            </div>
          <div class="item">
          <h3>Event Date</h3>
            <input type="text" name="edate" placeholder="${cus.date}" readonly/>
            
          </div>
          <div class="item">
              <h3>Event Time</h3>
            <input type="text" name="etime" placeholder="${cus.time}" readonly/>
           
          </div>
          <div class="item">
              <h3>Number of Guests</h3>
              <input id="participation" type="text" name="participation" placeholder="${cus.guestCount}" readonly/>
          </div>
          <div class="item">
              <h3>Host Name</h3>
              <input id="hostname" type="text" name="hostname" placeholder="${cus.hostName}" readonly/>
          </div>
          
          <div class="item">
            <h3>Event Category</h3>
            <input id="Category" type="text" name="Category" placeholder="${cus.category}" readonly/>
        </div>
          <div class="item">
              <h3>Budget</h3>
              <input id="budget" type="text" name="budget" placeholder="${cus.budget}" readonly/>
          </div>
          <div class="item">
              <h3>Venue</h3>
              <input type="text" name="vname" placeholder="${cus.venue}" readonly/>
              
          </div>
        </div>
        <div class="rightpart">
          <fieldset>
          <legend><h3>Event Services</h3></legend>
          <div class="city-item">
              <div>
                  <h3>Photography</h3>
                  <P>${cus.photo}</P>
              
              </div>
              <div>
                  <h3>Decoration</h3>
                  <P>${cus.deco}</P>
              </div>
              <div>
                  <h3>Light and Audio</h3>
                  <P>${cus.lights}</P>
              </div>
              <div>
                  <h3>Catering</h3>
                  <P>${cus.catering}</P>
              </div>
          </div>
          </fieldset>
          <div class="item">
              <h3>Description of Event</h3>
            <textarea rows="8" name="des" placeholder="${cus.des}" readonly></textarea>
          </div>
                
          
          
          
          <div class="item">
              <h3>Contact Email</h3>
              <div class="name-item">
            <input type="email" name="email" placeholder="${cus.email}" readonly/>
          </div>
          </div>
          <div class="item">
              <h3>Contact Number</h3>
              <div class="name-item">
            <input type="text" name="pnumber"  placeholder="${cus.number}" readonly/>
          </div>
          </div>
          <div class="item">
              <h3>Status</h3>
              <div class="name-item">
            <input type="text" name="pnumber"  placeholder="${cus.planStatus}" readonly/>
          </div>
          </div>
          
          <div class="btn-block">
          
          <c:url value="updateevent.jsp" var="eventupdate">
	
		      <c:param name="id" value="${id}"/>
		      <c:param name="name" value="${name}"/>
		      <c:param name="date" value="${date}"/>
		      <c:param name="time" value="${time}"/>
		      <c:param name="guestCount" value="${guestCount}"/>
		      <c:param name="hostName" value="${hostName}"/>
		      <c:param name="category" value="${category}"/>
		      <c:param name="budget" value="${budget}"/>
		      <c:param name="venue" value="${venue}"/>
		      <c:param name="photo" value="${photo}"/>
		      <c:param name="deco" value="${deco}"/>
		      <c:param name="lights" value="${lights}"/>
		      <c:param name="catering" value="${catering}"/>
		      <c:param name="des" value="${des}"/>
		      <c:param name="email" value="${email}"/>
		      <c:param name="number" value="${number}"/>
		      <c:param name="username" value="${username}"/>
		    </c:url>
		    <a href="${eventupdate}">
			<input type="button" name="update" value="Edit" id="submitbtn">
			</a>
			
			<c:url value="deleteevent.jsp" var="deleteevent">
	
		      <c:param name="id" value="${id}"/>
		      <c:param name="name" value="${name}"/>
		      <c:param name="date" value="${date}"/>
		      <c:param name="time" value="${time}"/>
		      <c:param name="guestCount" value="${guestCount}"/>
		      <c:param name="hostName" value="${hostName}"/>
		      <c:param name="category" value="${category}"/>
		      <c:param name="budget" value="${budget}"/>
		      <c:param name="venue" value="${venue}"/>
		      <c:param name="photo" value="${photo}"/>
		      <c:param name="deco" value="${deco}"/>
		      <c:param name="lights" value="${lights}"/>
		      <c:param name="catering" value="${catering}"/>
		      <c:param name="des" value="${des}"/>
		      <c:param name="email" value="${email}"/>
		      <c:param name="number" value="${number}"/>
		      <c:param name="username" value="${username}"/>
		    </c:url>
            <a href="${deleteevent}">
			<input type="button" name="delete" value="Delete" id="submitbtn">
			</a>
			
			<button type="button" id="submitbtn" onclick="goBack()">Cancel</button>
			<script>
			function goBack() {
	    	window.history.back();
			}
			</script>
            
          </div>
        
        
        </div>
        </div>
        </c:forEach> 
        </form> 
       
      </div>
		

      </div>
      
    </section>
    

    


   



    <hr style="background-color: black;height:1px;">
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




      
      
      