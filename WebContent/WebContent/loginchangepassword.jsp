<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
<!--
-----------------------------------scroolbar and footer-------------------------------->
body {data-spy ="scroll";
	overflow: hidden;
}
body {
font-family: "Amazon Ember",Arial,sans-serif;
height: 100%;
}

#content {
	max-height: calc(100% - 120px);
	overflow-y: scroll;
	padding: 0px 10% !important;
	margin-top: 0px !important;
}

html, body {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
}

footer {
	width: 100%;
	height: 0px;
	background: #004d80;
	position: fixed;
	bottom: 0;
}

#dropdownMenuButton {
	background: #004d80;
	border-color: #004d80;
}

#dropdown-item {
	background-color: #004d80;
	border-color: #004d80;
	color: white;
	font-color: white;
}

#text {
	color: white;
}

#text:hover {
	background: #3c78b3;
}
</style>

<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description" content="$1">

<title>Change Password</title>

<link rel="stylesheet" type="text/css" href="style.css">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

<!--------------------- ----------------Login eye button icon style------------------------------ -->

<!-- <link rel="stylesheet"
href="https://use.fontawesome.com/releases/v5.1.0/css/all.css"
integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt"
crossorigin="anonymous"> 
 -->

<script type="text/javascript">

<!--------------------- ----------------Login screen Browser back button disable------------------------------ -->

 
	$(document).ready(function() {	
		$('#passcheck').hide();
		$('#conpasscheck').hide();
		
		var pass_err = true;
		var conpass_err = true;
		
<!--------------------- ----------------eye_validation_for_password------------------------------ -->
<!--------------------- ----------------eye_validation_for_old_password------------------------------ -->
$("#toggleold").click(function () {

if ($("#oldpassword").attr("type") == "password")
{
//Change type attribute
$("#oldpassword").attr("type", "text");
} else
{
//Change type attribute
$("#oldpassword").attr("type", "password");
}
});

<!--------------------- ----------------eye validation for new password------------------------------ -->
$("#togglenew").click(function () {
if ($("#newpassword").attr("type") == "password")
{
//Change type attribute
$("#newpassword").attr("type", "text");
} else
{
//Change type attribute
$("#newpassword").attr("type", "password");
}
});

<!--------------------- ----------------eye validation for confirm password------------------------------ -->
$("#toggleconfirm").click(function () {
if ($("#confirmpassword").attr("type") == "password")
{
//Change type attribute
$("#confirmpassword").attr("type", "text");
} else
{
//Change type attribute
$("#confirmpassword").attr("type", "password");
}

});
		
<!--------------------- ----------------password validation check------------------------------ -->

//--------------------------------------old password check -------------------------------------------------------
$('#oldpassword').keyup(function() {
	password_check();
});

function password_check() {
	var oldpassword = $('#oldpassword').val();
	var pattern = /^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%&]).*$/;
	if (oldpassword == '') {
		$('#oldpasscheck').show();
		$('#oldpasscheck').html(
				"**Please Fill the password");
		$('#oldpasscheck').focus();
		$('#oldpasscheck').css("color", "red");
		document.getElementById('sign_in').disabled = true;
		pass_err = false;
		return false;
	} else {
		$('#oldpasscheck').hide();
		document.getElementById('sign_in').disabled = false;
	}
	if (!pattern.test(oldpassword)) {
		$('#oldpasscheck').show();
		$('#oldpasscheck').html(
						"**Password Must be at least 8 characters length which include 1 number, 1 lowercase, 1 uppercase letter, 1 Special Character ");
		$('#oldpasscheck').focus();
		$('#oldpasscheck').css("color", "red");
		document.getElementById('sign_in').disabled = true;
		pass_err = false;
		return false;
	} else {
		$('#oldpasscheck').hide();
		document.getElementById('sign_in').disabled = false;
	}
}
		
//--------------------------------------password check -------------------------------------------------------
						$('#newpassword').keyup(function() {
							password_check();
						});

						function password_check() {
							var password = $('#newpassword').val();
							var pattern = /^.*(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%&]).*$/;
							if (password == '') {
								$('#passcheck').show();
								$('#passcheck').html(
										"**Please Fill the password");
								$('#passcheck').focus();
								$('#passcheck').css("color", "red");
								document.getElementById('sign_in').disabled = true;
								pass_err = false;
								return false;
							} else {
								$('#passcheck').hide();
								document.getElementById('sign_in').disabled = false;
							}
							if (!pattern.test(password)) {
								$('#passcheck').show();
								$('#passcheck')
										.html(
												"**Password Must be at least 8 characters length which include 1 number, 1 lowercase, 1 uppercase letter, 1 Special Character ");
								$('#passcheck').focus();
								$('#passcheck').css("color", "red");
								document.getElementById('sign_in').disabled = true;
								pass_err = false;
								return false;
							} else {
								$('#passcheck').hide();
								document.getElementById('sign_in').disabled = false;
							}
						}
//--------------------------------------confirm password check -------------------------------------------------------
						$('#confirmpassword').keyup(function() {
							conpassword_check();
						});

						function conpassword_check() {
							var password = $('#newpassword').val();
							var confirmpassword = $('#confirmpassword').val();

							if (password != confirmpassword) {
								$('#conpasscheck').show();
								$('#conpasscheck').html(
										"**Password not Matching ");
								$('#conpasscheck').focus();
								$('#conpasscheck').css("color", "red");
								document.getElementById('sign_in').disabled = true;
								conpass_err = false;
								return false;
							} else {
								$('#conpasscheck').hide();
								document.getElementById('sign_in').disabled = false;
							}

						}
	<!--------------------- ----------------login on click------------------------------ -->
						$('#sign_in').click(function() {
											var oldpassword = $('#oldpassword').val();
											var newpassword = $('#newpassword').val();
											var confirmpassword = $('#confirmpassword').val();
											
											if (oldpassword == ''
													|| newpassword == ''
													|| confirmpassword == '') {
												document.getElementById('sign_in').disabled = true;
												
												$('#sign_in').css(
														"background", "grey");
												return false;
											}

											var data = {
												oldpassword : $('#oldpassword').val(),
												newpassword : $('#newpassword').val(),
											};
											
										
	<!--------------------- ----------------callback function------------------------------ -->									
											$.ajax({
														type : "POST",
														url : "securityQuestionLoginChangeServlet",
														contentType : "application/json", // NOT dataType!
														data : JSON.stringify(data),
														
														statusCode : {
															401 : function() {
																alert("Password update Failed");
																$('#passwordform').hide();
																 $('#passwordeditfail').slideDown(); 
															  
													setTimeout(function(){ window.location.href = "http://localhost:8080/AIMORCProject/loginchangepassword.jsp"; }, 3000); 
															},
															200: function(){
																localStorage.clear();
																localStorage.setItem('data',JSON.stringify(data));
																
																alert("Password Updated successfully ");
																$('#passwordform').hide();
																$('#passwordedited').slideDown();
																/* 
																$("#passwordedited").delay(4000).slideUp(200, function() {
																  $(this).alert('close');
																}); */
																
																console.log("successfully profile updated");
																setTimeout(function(){ window.location.href = "http://localhost:8080/AIMORCProject/logoutServlet"; }, 3000);
															
																}
															},

													});
										});
					});
</script>
</head>
<body data-spy="scroll">
	<!--------------------- ----------------header------------------------------ -->
	<nav class="navbar navbar-dark navbar-expand-md mb-3"
		style="background-color:#004d80;">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">AIMORC Innovations </a>
		</div>
		<button data-toggle="collapse" data-target="#navbarToggler"
			type="button" class="navbar-toggler">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarToggler">
			<ul class="nav navbar-nav  mr-auto">
				 <li class="nav-item active"><a class="nav-link" href="home.jsp">Home</a></li> 
			</ul>
			<a class="navbar-brand" href="#">Welcome ${username}</a>
			<ul class="nav navbar-nav navbar-right">
				<div class="dropdown ">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false ">
						<i class="fa fa-user" aria-hidden="true" style="padding: 5px;"></i>
						Account
					</button>
					<div class="dropdown-menu dropdown-menu-right" id="dropdown-item">
						<a class="dropdown-item " id="text" href="profile.jsp"><i
							class="fa fa-user" aria-hidden="true" style="padding: 5px;"></i>
							Profile</a> <a class="dropdown-item " id="text" href="logoutServlet"><i
							class="fa fa-sign-out" aria-hidden="true" style="padding: 5px;"></i>
							Logout</a>
					</div>
				</div>
				<!-- <li class="nav-item active"><a class="nav-link" href="#" style="display:none;"> Pad</a></li> -->
				<!--<li class="nav-item active"><a class="nav-link"	href="logoutServlet"><i class="fa fa-sign-out" aria-hidden="true"></i> Logout</a></li> -->
			</ul>
		</div>
	</div>
	</nav>

	<!--------------------- ----------------form------------------------------ -->

	<form id="passwordform">
		<div class="bgBox  ">
			<h2>Change Password</h2>
			<div class="inputRow">
				<label for="oldpassword">Enter Old Password :</label> <i
					id="toggleold" class="fa fa-fw fa-eye pass-icon"></i> <input
					type="password" name="oldpassword" id="oldpassword"
					placeholder="Enter old password" value="" autocomplete="off">
				<small id="oldpasscheck"></small>
			</div>

			<div class="inputRow">
				<label for="newpassword">Enter New Password :</label> <i
					id="togglenew" class="fa fa-fw fa-eye pass-icon"></i> <input
					type="password" name="newpassword" id="newpassword"
					placeholder="Enter new password" value="" autocomplete="off">
				<small id="passcheck"></small>
			</div>

			<div class="inputRow">
				<label for="confirmpassword">Confirm Password:</label> <i
					id="toggleconfirm" class="fa fa-fw fa-eye pass-icon"></i> <input
					type="password" name="confirmpassword" id="confirmpassword"
					value="" placeholder="confirm password" autocomplete="off">
				<small id="conpasscheck"></small>
			</div>

			<div class="inputRow submit">
				<input type="button" value="Submit" class="signIn" id="sign_in">
			</div>

		</div>
		</div>
	</form>
	<div class="container" id="statusDiv">
		<div class="alert alert-success " id="passwordedited" role="alert"
			style="display: none; text-align: center;">
			<strong>Password Updated Successfully!</strong>
		</div>
		<div class="alert alert-danger alert-dismissible"
			id="passwordeditfail" role="alert"
			style="display: none; text-align: center;">
			<strong>Incorrect Old Password, Update Failed!</strong>
		</div>
	</div>



	<!--------------------- ----------------footer------------------------------ -->
	<footer>
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-12">
				<p class="text-muted">Place sticky footer content here.</p>
			</div>
		</div>
	</footer>

</body>
</html>