<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description" content="$1">

<title>Date Picker</title>
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/momentjs/2.14.1/moment.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.5.2/js/bootstrap-datetimepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.5.2/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">


<link rel="stylesheet" type="text/css" href="style.css">


<!-- -------------------------------------css---------------------------------------------------- -->

<style type="text/css">
body {
	overflow: auto;
}

#content {
	max-height: calc(100% - 120px);
	overflow-y: scroll;
	padding: 0px 10% !important;
	margin-top: 60px !important;
}

html, body {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
}

footer {
	width: 100%;
	height: 30px;
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

</head>
<script>
$(document).ready(function () {
$.ajax({
type : "GET",
url : "schedulerServlet",
contentType : "application/json", // NOT dataType!
success : function(data) {
console.log(data);
var userJSON = JSON.parse(data);
if(userJSON!=null)
{
var td = userJSON.date;
document.getElementById("date").value = td;
document.getElementById('cancel').style.display="show";
}
else
{
formatAMPM(new Date);
alert("select date to order");
document.getElementById('cancel').style.display="none";
}
}
});

function formatAMPM(date) {
var hours = date.getHours();
var minutes = date.getMinutes();
var ampm = hours >= 12 ? 'pm' : 'am';
hours = hours % 12;
hours = hours ? hours : 12; // the hour '0' should be '12'
minutes = minutes < 10 ? '0'+minutes : minutes;
var Time = hours + ':' + minutes + ' ' + ampm;


var todate = new Date();
var day = todate.getDate() + '-'
+ (todate.getMonth() + 1)
+ '-' + todate.getFullYear();
var dateTime = day + ' ' + Time;
document.getElementById("date").value = dateTime;
}
formatAMPM(new Date);

var date = new Date();
var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());

$('#datetimepicker1').datetimepicker({
minDate: today

});

<!--------------------- ----------------submit on click------------------------------ -->

$('#submit').click(function() {
var date = $('#date').val();
var data = {
date : $('#date').val()
};
console.log(data);
<!--------------------- ----------------ajax-------------------------------->
$.ajax({
type : "POST",
url : "schedulerServlet",
contentType : "application/json", // NOT dataType!
data : JSON.stringify(data),
statusCode : {
200: function(){
console.log("Date selected is updated successfully ");
setTimeout(function(){ window.location.href = "home.jsp"; }, 1000);
}
},
error : function(error) {
console.log(error);
}
});
});

<!--------------------- ----------------cancel button on click-------------------------------->
$('#cancel').click(function() {
var cancelId = $(this).attr('id');
var data = {
cancel : cancelId
};
console.log(data);
<!--------------------- ----------------ajax-------------------------------->
$.ajax({
type : "POST",
url : "schedulerServlet",
contentType : "application/json", // NOT dataType!
data : JSON.stringify(data),
statusCode : {
200: function(){
console.log("Schedule cancelled successfully ");
setTimeout(function(){ window.location.href = "home.jsp"; }, 1000);
}
},
error : function(error) {
console.log(error);
}
});
});
});
</script>
<body>
	<!--------------------- ----------------header------------------------------ -->
	<nav class="navbar navbar-dark navbar-expand-md"
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
			<ul class="nav navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="home.jsp">
						Home</a></li>
			</ul>
			<a class="navbar-brand" href="#">Welcome ${username}</a>
			<ul class="nav navbar-nav navbar-right">
				<div class="dropdown ">
					<button class="btn btn-secondary dropdown-toggle" type="button"
						id="dropdownMenuButton" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false ">
						<i class="fa fa-user" aria-hidden="true"
							style="padding: 5px; margin-top: 5px;"></i> Account
					</button>
					<div class="dropdown-menu dropdown-menu-right" id="dropdown-item">
						<a class="dropdown-item " id="text" href="profile.jsp"><i
							class="fa fa-user" aria-hidden="true" style="padding: 5px;"></i>
							Profile</a><a class="dropdown-item " id="text"
							href="productimage.jsp"><i class="fa fa-product-hunt"
							aria-hidden="true" style="padding: 5px;"></i> Product</a> <a
							class="dropdown-item " id="text" href="loginsecurityquestion.jsp"><i
							class="fa fa-edit" aria-hidden="true" style="padding: 5px;"></i>
							Change Password</a> <a class="dropdown-item " id="text"
							href="LogoutServlet"><i class="fa fa-sign-out"
							aria-hidden="true" style="padding: 5px;"></i> Logout</a>
					</div>
				</div>


			</ul>
		</div>
	</div>
	</nav>



	<!-- ----------------------------form------------------------------ -->
	<div id="content">
		<!-- scrool button id -->

		<div id="form">
			<form>
				<div class="bgBox ">

					<div class="form-group">
						<label class="control-label">Select Pick Up Date and Time</label>
						<div class='input-group date' id='datetimepicker1'>
							<input type='text' class="form-control" id="date" /> <span
								class="input-group-addon"> <span
								class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>


					<div class="inputRow submit ">
						<input type="button" value="Schedule" class="signIn" id="submit">


					</div>
					<div class="inputRow submit ">
						<input type="button" value="Cancel Schedule" class="signIn"
							id="cancel">


					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>