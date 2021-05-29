<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
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

<link rel="stylesheet" type="text/css" href="style.css">

<!-- -------------------------------------css---------------------------------------------------- -->


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.js" integrity="sha256-2JRzNxMJiS0aHOJjG+liqsEOuBb6++9cY4dSOyiijX4=" crossorigin="anonymous"></script>

<!-- -------------------------------------css_test---------------------------------------------------- -->

<style type="text/css">
body {
	overflow: auto;
}

body {
data-spy="scroll";
overflow: hidden;
font-family: "Amazon Ember",Arial,sans-serif;
height: 100%;
}

#content {
	max-height: calc(108.6% - 120px);
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
	height: 30px;
	background: #004d80;
	position: fixed;
	bottom: 0;
}
#dropdownMenuButton{
			background:#004d80;
			border-color:#004d80;
			}
#dropdown-item  {
			 background-color:#004d80; 
			border-color:#004d80; 
			color:white;
			font-color:white;
			}
			#text{
			color:white;
			}
			#text:hover {
    		background: #3c78b3;
			}

#datetimepicker1
{
width:320px;
}
.fa fa-user
{	
font-size: 15px;
}
#datetimepicker1.timepicker-picker  table td  a span,
#datetimepicker1.timepicker-picker  table td,
#datetimepicker1.timepicker-picker  table td  span
{
height: 30px !important;
line-height: 30px !important;
width: 30px !important; 
line-height:30px !important; 
padding:0px !important;
}
</style>

</head> 
<script type="text/javascript">
$(document).ready(function() {
	
	function cart() {
		/*----------display cart ajax---------------- */
		$.ajax({
		type : "GET",
		url : "cartdisplayServlet",
		contentType : "application/json", // NOT dataType!
		success : function(data) {
			
			let responseData = JSON.parse(data);
			/* let westernWearData = responseData[2];
			let indianWearData = responseData[1];
			let casualWearData = responseData[3]; */
			
			let allProdsCount = 0;
			Object.keys(responseData).forEach((data, index) =>{
			    let currCat = responseData[data];
			    console.log(responseData[data].products);
			    allProdsCount += currCat.products.length
			});
			console.log("Overall Length is ", allProdsCount);

		var cartValue = allProdsCount;
		document.getElementById('Value').innerHTML = "[" + cartValue + "]";
			
		}
		});
		}
		cart();
		/*----------ajax get---------------- */
	$.ajax({
type : "GET",
url : "schedulerServlet",
contentType : "application/json", // NOT dataType!
success : function(data) {

console.log(data);
alert("data" + data);

var userJSON = JSON.parse(data);
alert("userJSON" + userJSON);

if(userJSON!=null)
{
var td = userJSON.date;
alert(td);
document.getElementById("datetime").value = td;
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
		alert(Time);

		var todate = new Date();
		var day = todate.getDate() + '-'
		+ (todate.getMonth() + 1)
		+ '-' + todate.getFullYear();
		var dateTime = day + ' ' + Time;
		alert(dateTime);
		document.getElementById("datetime").value = dateTime;
		}
		formatAMPM(new Date);

		var date = new Date();
		var today = new Date(date.getFullYear(), date.getMonth(), date.getDate());

		$('#datetime').datetimepicker({
		minDate: today
		});
	
		/* <!-------------------------------------submitonclick--------------------------------> */

		$('#submit').click(function() {

		var date = $('#datetime').val();

		var data = {
		date : $('#datetime').val()
		};
		alert(data);
		console.log(data);


		<!--------------------- ----------------ajax-------------------------------->
		$.ajax({
		type : "POST",
		url : "schedulerServlet",
		contentType : "application/json", // NOT dataType!
		data : JSON.stringify(data),

		statusCode : {

		200: function(){
		//alert(data);
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
		//alert(data);

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

<body data-spy="scroll">
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
						<i class="fa fa-user fa-lg" aria-hidden="true" style="padding: 2px; margin-top: 10px;"></i>
						Account
					</button>
					<div class="dropdown-menu dropdown-menu-right" id="dropdown-item">
						<a class="dropdown-item " id="text" href="profile.jsp"><i
							class="fa fa-user " aria-hidden="true" style="padding: 1px;"></i>
							Profile</a> <a class="dropdown-item " id="text"
							href="productimage.jsp"><i class="fa fa-list-alt" aria-hidden="true" style="padding: 1px;"></i> Product</a>
							 <a class="dropdown-item " id="text" href="loginsecurityquestion.jsp"><i
							class="fa fa-edit" aria-hidden="true" style="font-size: 1em;"></i>
							Change Password</a> <a class="dropdown-item " id="text"
							href="logoutServlet"><i class="fas fa-sign-out-alt" style="padding: 1px;"></i> Logout</a>
					</div>
				</div>
				<div class="nav-item active">
						<a class="nav-link" href="cartdisplay.jsp"><i
							class="fa fa-shopping-cart fa_custom fa-2x"></i> <i id="Value">
						</i> </a>
					</div>

			</ul>
		</div>
	</div>
	</nav>
<!----------------------------------------- form------------------------------->
	</br>
	<div id = content>
	<div class="bgBox ">
		<!-- <div class="inputRow"> -->
			<div class="container">
				<div class="row">
					<!-- //<div class='col-sm-6'> -->
						<div class="form-group">
							<label class="d-flex justify-content-center">Select Pick Up Date and Time</label>
							<div class="input-group date" id="datetimepicker1"
								data-target-input="nearest">
								<input type="text" class="form-control datetimepicker-input" id = "datetime"
									data-target="#datetimepicker1" />
								<div class="input-group-append" data-target="#datetimepicker1"
									data-toggle="datetimepicker">
									<div class="input-group-text">
										<i class="fa fa-calendar"></i>
									</div>
								</div>
							</div>
						</div>
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
		</div>
	</div>
	</div>
</body>


</html>  