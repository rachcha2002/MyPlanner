<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>MyPlanner</title>
    
    <link rel="stylesheet" type="text/css" href="Header and Footer/header&footer.css">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" type="text/css" href="css/services.css">

   
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
            <a href="#"><form action="serviceHome" method="post">
            <input type="hidden" name="type" value="cService">
        	<button type="submit" class="sec3card-btn-1">    
                <div class="name">
                    <span class="aname">Customer Services</span>
                </div>
            </button> 
            </form>  </a>
            <a href="#"><form action="serviceHome" method="post">
            <input type="hidden" name="type" value="vService">
        	<button type="submit" class="sec3card-btn-1">    
                <div class="name">
                    <span class="aname">Vendor Services</span>
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

<section>
    
	<h1 class="h">Event Service Packages</h1>
<div class="warpper">
  <input class="radio" id="one" name="group" type="radio" checked>
  <input class="radio" id="two" name="group" type="radio">
  <input class="radio" id="three" name="group" type="radio">
  <input class="radio" id="four" name="group" type="radio">
  <div class="tabs">
  <label class="tab" id="one-tab" for="one">Photogrphy</label>
  <label class="tab" id="two-tab" for="two">Catering</label>
  <label class="tab" id="three-tab" for="three">Decoration</label>
  <label class="tab" id="four-tab" for="four">Lights and Audio</label>
    </div>
  <div class="panels">
  <div class="panel" id="one-panel">
    <div class="paneltitle" id="titleone">
        <h2>Photography</h2>
    </div>
    <div class="section-1" id="sec1">
        <div class="container">
        <c:forEach var="packages" items="${serviceDetails1}">
        <c:set var="pid" value="${packages.pid}"/>
        <c:set var="pname" value="${packages.pname}"/>
        <c:set var="pcategory" value="${packages.pcategory}"/>
        <c:set var="ptype" value="${packages.ptype}"/>
        <c:set var="price" value="${packages.price}"/>
        <c:set var="description" value="${packages.description}"/>
        <c:set var="vname" value="${packages.vname}"/>
             
        
        <div class="faq">
          <div class="event">
            <h3>${packages.pname}</h3>
            <div class="details">
            
                <h4>Package:${packages.pname}</h4>
                <h4>Type:${packages.ptype}</h4>
                <h4>Price:${packages.price}</h4>
                <h4>Description:${packages.description}</h4>
                <h4>Vendor Name:${packages.vname}</h4>
               
             
            </div>
          </div>
          
        </div>
        
      
        </c:forEach>
      </div>
    </div>
  </div>
  <div class="panel" id="two-panel">
    <div class="paneltitle" id="titletwo">
        <h2>Catering</h2>
    </div>
    <div class="section-1" id="sec1">
        <div class="container">
        <c:forEach var="packages" items="${serviceDetails3}">
        <c:set var="pid" value="${packages.pid}"/>
        <c:set var="pname" value="${packages.pname}"/>
        <c:set var="pcategory" value="${packages.pcategory}"/>
        <c:set var="ptype" value="${packages.ptype}"/>
        <c:set var="price" value="${packages.price}"/>
        <c:set var="description" value="${packages.description}"/>
        <c:set var="vname" value="${packages.vname}"/>
             
        
        <div class="faq">
          <div class="event">
            <h3>${packages.pname}</h3>
            <div class="details">
            
                <h4>Package:${packages.pname}</h4>
                <h4>Type:${packages.ptype}</h4>
                <h4>Price:${packages.price}</h4>
                <h4>Description:${packages.description}</h4>
                <h4>Vendor Name:${packages.vname}</h4>
               
             
            </div>
          </div>
          
        </div>
        
      
        </c:forEach>
      </div>
    </div>
  </div>
  <div class="panel" id="three-panel">
    <div class="paneltitle" id="titlethree">
        <h2>Decoration</h2>
    </div>
    <div class="section-1" id="sec1">
        <div class="container">
        <c:forEach var="packages" items="${serviceDetails2}">
        <c:set var="pid" value="${packages.pid}"/>
        <c:set var="pname" value="${packages.pname}"/>
        <c:set var="pcategory" value="${packages.pcategory}"/>
        <c:set var="ptype" value="${packages.ptype}"/>
        <c:set var="price" value="${packages.price}"/>
        <c:set var="description" value="${packages.description}"/>
        <c:set var="vname" value="${packages.vname}"/>
             
        
        <div class="faq">
          <div class="event">
            <h3>${packages.pname}</h3>
            <div class="details">
            
                <h4>Package:1234</h4>
                <h4>Type:${packages.ptype}</h4>
                <h4>Price:${packages.price}</h4>
                <h4>Description:${packages.description}</h4>
                <h4>Vendor Name:${packages.vname}</h4>
               
             
            </div>
          </div>
          
        </div>
        
      
        </c:forEach>
      </div>
    </div>
  </div>
  <div class="panel" id="four-panel">
    <div class="paneltitle" id="titlefour">
        <h2>Lights and Audio</h2>
    </div>
    <div class="section-1" id="sec1">
        <div class="container">
        <c:forEach var="packages" items="${serviceDetails4}">
        <c:set var="pid" value="${packages.pid}"/>
        <c:set var="pname" value="${packages.pname}"/>
        <c:set var="pcategory" value="${packages.pcategory}"/>
        <c:set var="ptype" value="${packages.ptype}"/>
        <c:set var="price" value="${packages.price}"/>
        <c:set var="description" value="${packages.description}"/>
        <c:set var="vname" value="${packages.vname}"/>
             
        
        <div class="faq">
          <div class="event">
            <h3>${packages.pname}</h3>
            <div class="details">
            
                <h4>Package:${packages.pname}</h4>
                <h4>Type:${packages.ptype}</h4>
                <h4>Price:${packages.price}</h4>
                <h4>Description:${packages.description}</h4>
                <h4>Vendor Name:${packages.vname}</h4>
               
             
            </div>
          </div>
          
        </div>
        
      
        </c:forEach>
      </div>
    </div>
  </div>
  </div>
</div>

</section>
  <div id="mybutton">

<button type="button" id="submitbtn" onclick="goBack()" class="feedback">Back</button>
			<script>
			function goBack() {
	    	window.history.back();
			}
			</script>
</div> 

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
        <div class="copyright"><h4>� 2023 MyPlanner. All rights reserved.</h4></div>
      </center>
      
     </footer>
  </body>
  
  </html>