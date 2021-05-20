<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="style.css">
<body>
<h1 align="center">WELCOME TO AIMORC</h1>
<div class="sidebar">
<div class="navigation" >
<ul>
<li>
<a href="profile.jsp">
<span class="icon"><i class="fa fa-user-circle-o" aria-hidden="true"></i>
</span>
<span class="title">Profile</span>
</a>
</li>
<li>
<a href="LogoutServlet">
<span class="icon"><i class="fa fa-sign-out" aria-hidden="true"></i>

</span>
<span class="title">SignOut</span>
</a>
</li>
</ul>
</div>
<div class="toggle" onclick="toggleMenu()"></div>
<script type="text/javascript">
    function toggleMenu(){
    	let navigation = document.querySelector('.navigation');
    	let toggle = document.querySelector('.toggle');
    	navigation.classList.toggle('active');
    	toggle.classList.toggle('active');
    }
 </script>
</div>






</body>

</html>





