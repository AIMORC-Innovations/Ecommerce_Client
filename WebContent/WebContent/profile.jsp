<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	</head>
	<body>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	<script type="text/javascript">
	/* function postUsernameToServer() {
		  var formData = jsonString
	
    $.ajax({
        type: 'POST', // define the type of HTTP verb we want to use (POST for our form)
        url: 'ProfileServlet', // the url where we want to POST
        data: formData, // our data object
        dataType: 'json', // what type of data do we expect back from the server
        encode: true
      }).done(function(data){ //any name you put in as an argument here will be the json response string.
         var firstname = data.firstname;
         var lastname = data.lastname;

         //check if username is taken
         if(taken == "taken"){
           //make input border red
           $('.yourInput').css({"border-color": "red"});
         }
         else{
           //make input border green
           $('.yourInput').css({"border-color": "green"});
         }
    }).error(function(errorData){
      //Something went wrong with the ajax call. It'll be dealt with here
    });;
} */
	$(document).ready(function() {
	$.ajax({
	url: 'ProfileServlet',
	type: "POST",
	//contentType : "application/json",
	//data : JSON.stringify(data),
	success: function (data) {
	alert(data);
	console.log(data);
	},
	error: function (error) {
	console.log(error);
	}
	});
	});
	</script>
	</body>
	</html>
  
	



