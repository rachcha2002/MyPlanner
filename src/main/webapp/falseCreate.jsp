<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>MyPlanner</title>
    <link rel="stylesheet" type="text/css" href="css/createevent.css">
    <link rel="stylesheet" type="text/css" href="Header and Footer/header&footer.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
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
      <div class="logpic">
        <img src="Images/create.jpeg" class="loginpic">
        <div class="quote">
            
            <p>"We do not remember days;we remember moments."</p>
            <p style="margin-top: 5px;">Cesare Pavese</p>
        </div>
        <div class="quote1">
            
          <p>Describe your event we will plan it to be a moment.</p>
          
      </div>
      </div>
      <div class="form-create">
        
        <!--Form-->
        <div class="cform">
        <form  action="insert" method="post">
        <p style="color:red;">You have already create event with this name!!</p>
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
          <h1>Create Event</h1>
          <div class="item">
              <label for="ename">Event Name*</label>
              <input id="ename" type="text" name="ename" value="${cus.name}" required/>
            </div>
          <div class="item">
          <label for="edate">Event Date*</label>
          <input type="date" name="edate" value="${cus.date}" required/>
            
            <i class="fas fa-calendar-alt"></i>
          </div>
          <div class="item">
              <label for="etime">Event Time*</label>
            <input type="text" name="etime" value="${cus.time}" required/>
            <i class="fas fa-clock"></i>
          </div>
          <div class="item">
              <label for="participation">Number of Guests*</label>
              <input id="participation" type="text" name="participation" value="${cus.guestCount}" required/>
          </div>
          <div class="item">
              <label for="hostname">Host Name*</label>
              <input id="hostname" type="text" name="hostname" value="${cus.hostName}" required/>
          </div>
          
          <div class="item">
              <label for="etime">Event Category</label>
            <select name="category" style="width:300px;">
              <option value="${cus.category}">${cus.category}</option>
              <option value="Wedding" >Wedding</option>
              <option value="Private Party">Private Party</option>
              <option value="Corporate Event">Corporate Event</option>
            </select>
          </div>
          <div class="item">
              <label for="budget">Budget*</label>
              <input id="budget" type="text" name="budget" value="${cus.budget}" required/>
          </div>
          <div class="item">
              <label for="vname">Venue*</label>
              <input type="text" name="vname" value="${cus.venue}" required/>
              
          </div>
          <fieldset>
          <legend><h3>Event Services</h3></legend>
          <div class="city-item">
              <div>
                  <label for="photography">Photography</label><br>
              <select name="photo" style="width:120px;">
              	<option value="${cus.photo}">${cus.photo}</option>
              	<option value="none">None</option>
                <option value="Customize">Custom</option>
                <option value="initial">Initial</option>
                <option value="bestselling">Best Selling</option>
              </select><br>
              
              </div>
              <div>
                  <label for="deco">Decoration</label><br>
              <select name="decoration" style="width:120px;">
              	  <option value="${cus.deco}">${cus.deco}</option>
              	  <option value="none">None</option>
                  <option value="Customize">Custom</option>
                  <option value="initial">Initial</option>
                <option value="bestselling">Best Selling</option>
              </select><br>
              
              </div>
              <div>
                  <label for="light&audio">Light & Audio</label><br>
              <select name="light&audio" style="width:120px;">
              	  <option value="${cus.lights}">${cus.lights}</option>
              	  <option value="none">None</option>
                  <option value="Customize">Custom</option>
                  <option value="initial">Initial</option>
                <option value="bestselling">Best Selling</option>
              </select><br>
              
              </div>
              <div>
                  <label for="catering">Catering</label><br>
              <select name="catering" style="width:120px;">
                  <option value="${cus.catering}">${cus.catering}</option>
                  <option value="none">None</option>
                  <option value="Customize">Custom</option>
                  <option value="initial">Initial</option>
                <option value="bestselling">Best Selling</option>
              </select><br>
              
              </div>
              
          </div>
          
          </fieldset>
          <div class="item">
              <label for="description">Description of Event</label>
            <textarea rows="8" name="des" value="${cus.des}"></textarea>
          </div>
                
          
          
          
          <div class="item">
              <label for="cname">Contact Email*</label>
              <div class="name-item">
            <input type="email" name="email" value="${cus.email}" required/>
          </div>
          </div>
          <div class="item">
              <label for="pnum">Contact Number*</label>
              <div class="name-item">
            <input type="text" name="pnumber"  value="${cus.number}" minlength="10" maxlength="10" required/>
          </div>
          </div>
          
          <div class="btn-block">
            <input type="submit" value="SUBMIT" id="submitbtn"/>
          </div>
          </c:forEach>
        </form>
        
        <br>
        <form action="getservice" method="post">
			
			<input type="hidden" name="data" value="venue">
  			<input type="submit" value="Find interesting places from our partners"  style="background: none; border: none; cursor: pointer; text-decoration: none; color: black; font-size: 17px; margin-bottom: 0.5rem;font-family: Verdana, Geneva, Tahoma, sans-serif"
    		onmouseover="this.style.color='blue'; this.style.fontSize='larger';"
    		onmouseout="this.style.color='black'; this.style.fontSize='17px';"
  			>
			</form>
			
			<form action="getservice" method="post">
			
			<input type="hidden" name="data" value="pkg">
  			<input type="submit" value="Find interesting packages from our partners"  style="background: none; border: none; cursor: pointer; text-decoration: none; color: black; font-size: 17px; margin-bottom: 0.5rem;"
    		onmouseover="this.style.color='blue'; this.style.fontSize='larger';"
    		onmouseout="this.style.color='black'; this.style.fontSize='17px';"
  			>
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