<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>AIMORC Login Page!</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript">

	function validatePassword(){
		if($("#password").val() !== $("#confirmPassword").val()) {
			$('#notMatchedPassword').css('display', 'block');
			return false;
		} else {
			$('#notMatchedPassword').css('display', 'none');
		}
	}

	$(document).ready(function() {
		
		$('#registrationDetails').css('display', 'none');
		$('#userAlreadyExistContent').css('display', 'none');
		$('.alert').css('display', 'none');
		$('#response').css('display', 'none');
		$('#notMatchedPassword').css('display', 'none');
		
		$('#checkUserName').click(function() {
			$(".alert").fadeTo(2000, 500).slideUp(500, function(){
			    $(".alert").slideUp(500);
			});
			
			if($("#username").val().length === 0) {
				$('#invalidUsernameCheck').css('display', 'block');
				return;
			} else {
				$('#invalidUsernameCheck').css('display', 'none');
			}
			  
			var data = {
				username : $('#username').val()
			};
			$.ajax({
				type : "POST",
				url : "CheckUserServlet",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(result) {
					console.log(result);
					if(result === 'available') {
						$('#checkUserName').css('display', 'none');
						$('#occupiedUserAlert').css('display', 'none');
						$('#userAlreadyExistContent').css('display', 'none');
						
						$('#availableUserAlert').css('display', 'block');
						$('#registrationDetails').css('display', 'block');
					}
					else {
						$('#availableUserAlert').css('display', 'none');
						$('#occupiedUserAlert').css('display', 'block');
						$('#userAlreadyExistContent').css('display', 'block');
					}
				},
				error : function(result) {
					$('#result1').html(result);
					console.log(result);
				}
			});
		});
		
		$('#submitRegistrationForm').click(function() {
			var data = {
					username : $('#username').val(),
					firstName : $('#firstName').val(),
					lastName : $('#lastName').val(),
					email : $('#email').val(),
					password : $('#password').val(),
					gender : $("input[type='radio'][name='customRadioInline1']:checked").val(),
					dob : $('#dob').val(),
					phoneNum : $('#phoneNum').val(),
					address : $('#address').val()
			};
			
			$.ajax({
				type : "POST",
				url : "RegistrationServlet",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(result) {
					$('#response').css('display', 'block');
					$('#registrationForm').css('display', 'none');
					
					$("#responseContent").html(result);
					console.log(result);
				},
				error : function(result){
				  $('#response').html(result);
				  console.log(result);
				}
			});
		});
	});
</script>

</head>
<body>
	
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">AIMORC Innovations </a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li><a href="aimorc.jsp">Home</a></li>
	      <li><a href="contactus.jsp">Contact Us</a></li>
	    </ul>
	    <ul class="nav navbar-nav navbar-right">
	      <li class="active"><a href="registration.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
	      <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	    </ul>
	  </div>
	</nav>

	<div class="container" id="formContainer">
		<form id="registrationForm">
			<div class="form-group">
				<label for="username">Username:</label> 
				<input type="username" class="form-control" placeholder="Enter Username:" id="username">
			</div>
			<div class="alert alert-danger alert-dismissible" id="invalidUsernameCheck">
			    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			    <strong>Warning!</strong> Username cannot be blank!
			</div>
			<button type="button" class="btn btn-primary" id="checkUserName">Check Username</button>
		 	<div class="alert alert-success alert-dismissible" id="availableUserAlert">
		    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
		    	<strong>Success!</strong> Username available, Proceed to Fill the rest of the data!
		  	</div>				  
							  
			<div class="alert alert-danger alert-dismissible" id="occupiedUserAlert">
			    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			    <strong>Warning!</strong> Username already exists!
			</div>
			<div id="userAlreadyExistContent">
				<h1> User Already Exist, Try With different username to register!</h1>
				<h1> You may choose to <a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a> here or visit our <a href="aimorc.jsp">Home</a> page</h1>
			</div>
			
			<div id="registrationDetails">
				<div class="form-group">
					<label for="firstName">First Name:</label> 
					<input type="firstName" class="form-control" placeholder="First name" id="firstName">
				</div>
				<div class="form-group">
					<label for="lastName">Last Name:</label> 
					<input type="lastName" class="form-control" placeholder="Last name" id="lastName">
				</div>
				<div class="form-group">
					<label for="email">Email:</label> 
					<input type="email" class="form-control" placeholder="Enter Email" id="email">
				</div>
				<div class="form-group">
					<label for="password">Password:</label> 
					<input type="password" class="form-control" placeholder="Enter Password" id="password">
				</div>
				<div class="form-group">
					<label for="confirmPassword">Confirm Password:</label> 
					<input type="password" class="form-control" placeholder="Confim Password" id="confirmPassword" onblur="validatePassword()">
				</div>
				<div class="alert alert-danger alert-dismissible" id="notMatchedPassword">
			    	<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			    	<strong>Warning!</strong> Passwords doesn't match, Please try again.
				</div>
				<div class="form-group">
					<label for="gender">Gender</label> 
					<div class="custom-control custom-radio custom-control-inline">
					  <input type="radio" id="customRadioInline1" name="customRadioInline1" class="custom-control-input" value="Male">
					  <label class="custom-control-label" for="customRadioInline1">Male</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
					  <input type="radio" id="customRadioInline2" name="customRadioInline1" class="custom-control-input" value="Female">
					  <label class="custom-control-label" for="customRadioInline2">Female</label>
					</div>
				</div>
				<div class="form-group">
					<label for="email">Phone Number:</label> 
					<input type="number" class="form-control" placeholder="Enter Phone Number" id="phoneNum">
				</div>
				<div class="form-group">
					<label for="dob">Date of Birth</label> 
					<input type="date" class="form-control" placeholder="Date of Birth" id="dob">
				</div>
				
				<div class="form-group">
				  <label for="comment">Address</label>
				  <textarea class="form-control" rows="5" id="address"></textarea>
				</div>
				<button	 type="button" class="btn btn-primary" id="submitRegistrationForm">Submit</button>
			</div>
		</form>
		<div id="response">
			<h1> User Registered Successfully!</h1>
			<div id="responseContent"></div>
			<a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a>
		</div>
	</div>
	
</body>
</html>