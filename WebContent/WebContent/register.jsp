<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
#formContainer {
	width: 450px;
	height: 910px;
	padding: 2px;
	position: relative;
	margin: 2% auto;
	background:#F5F5F5;
	border: 3px #ccc;
	padding: 5px;
	outline-style: groove;
	outline-color:#F5F5F5;
}

.form-group {
	width: 410px;
	padding: 1% auto;
	margin: 2% auto;
	border: 2px #ccc;
	box-sizing: border-box;
	position: relative;
}

#gender {
	width: 410px;
	padding: 100% auto;
	margin: 2% auto;
	display: inline-block;
	box-sizing: border-box;
	position: relative;
}

#submitFirstForm {
	position: absolute;
	outline-style: dot;
	margin: 10px 10px 10px 180px;
	padding: 5px 12px 5px 12px;
	background: #0000ff;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$('#resultDiv').css('display', 'none');
				$('#submitFirstForm')
						.click(
								function() {
									var today = new Date();
									var date = today.getDate() + '-'
											+ (today.getMonth() + 1) + '-'
											+ today.getFullYear();
									var time = today.getHours() + ":"
											+ today.getMinutes() + ":"
											+ today.getSeconds();
									var dateTime = date + ' ' + time;

									var data = {
										username : $('#username').val(),
										password : $('#password').val(),
										confirm_password : $(
												'#confirm_password').val(),
										firstname : $('#firstname').val(),
										lastname : $('#lastname').val(),
										dob : $('#dob').val(),
										gender : $('#gender').val(),
										phonenum : $('#phonenum').val(),
										address : $('#address').val(),
                                        created_on :dateTime
};
$.ajax({
										type : "POST",
										url : "RegistrationServlet",
										contentType : "application/json", // NOT dataType!
										data : JSON.stringify(data),
										success : function(result) {
											$('#resultDiv').css('display',
													'block');
											$('#result1').css('display',
													'block');
											$('#formContainer').css('display',
													'none');
											$('#result1').html(result);
											console.log(result);
										}
									});
								});
			});
</script>


</head>
<body>


	<div class="container" id="formContainer">

		<h1 align="center">Register Page!</h1>

		<form>
			<div class="form-group">
				<label for="username">Username:</label> <input type="username"
					class="form-control" placeholder="Enter username" id="username">
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" placeholder="Enter password" id="password">
			</div>

			<div class="form-group">
				<label for="pwd">ConfirmPassword:</label> <input type="password"
					class="form-control" placeholder="Enter password"
					id="ConfirmPassword">
			</div>

			<div class="form-group">
				<label for="name">Firstname:</label> <input type="text"
					class="form-control" placeholder="Enter firstname" id="firstname">
			</div>

			<div class="form-group">
				<label for="name">Lastname:</label> <input type="text"
					class="form-control" placeholder="Enter lastname" id="lastname">
			</div>

			<div class="form-group">
				<label for="DOB">Date-of-Birth:</label> <input type="date"
					class="form-control" placeholder="Enter Date_of_birth" id="dob">
			</div>


			<div class="form-group">
				<label for="gender">Gender:</label> <select id="gender"
					placeholder="Enter gender">
					<option value="None">None</option>
					<option value="Male">Male</option>
					<option value="Female">Female</option>
				</select> <br>
			</div>

			<div class="form-group">
				<label for="phoneNum">PhoneNumber:</label> <input type="tel"
					class="form-control" placeholder="Enter phonenum" id="phonenum">
			</div>

			<div class="form-group">
				<label for="address">Address:</label> <input type="text"
					class="form-control" placeholder="Enter Address" id="address">
			</div>
			<div>
				<button type="button" class="btn btn-primary" id="submitFirstForm">Register</button>
			</div>

		</form>
	</div>
	<div class="container" id="resultDiv">

		<span id="result1"></span>
		<p>
					Already User
					<a href="login.jsp">Please Login!</a>
				</p>
	</div>
	
</body>

</html>