<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
body {
	font-family: "Amazon Ember", Arial, sans-serif;
	height: 100%;
}

#content {
	max-height: calc(109% - 120px);
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

<!--
----------------------------------css

 

for cart display button------------------------------ --> / / .mt-50 {
	margin-top: 50px;
}

.mb-50 {
	margin-bottom: 50px;
}

.card {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border-radius: .1875rem;
}

.card-img-actions {
	position: relative;
}

.card-body {
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	padding: 1.25rem;
	text-align: center;
}

.card-img {
	width: 350px;
}

/* .form-control-sm {
	width: 65px;
	margin-left: 8px;
	margin-right: 8px;
	margin-bottom: 5px;
} */
.quantity {
width: 120px;
margin-left: 5px;
margin-right: 5px;
margin-top: 10px;
}
/* #total {
	margin-left: 10px;
} */

/* .totals-item {
	background-color: #fff;
	border: 0;
	color: black;
	font-weight: 100;
} */
#rupees {
	font-size: 18px;
	margin-right: 3px;
}
#total_price {
margin-top: 25px;
}
#rupee {
	font-size: 15px;
	margin-right: 1px;
}

#symbol {
	margin-left: 245px;
	margin-top: 5px;
}

/*----------side bar------------------ */
.row {
	border: none;
	width: 500%;
	height: 500px;
	overflow-y: scroll;
}

.text-justify {
	height: 50px;
	responsive-font-size: 4rem;
	overflow-y: scroll;
}

::-webkit-scrollbar {
	width: 3.8px;
	height: 12px;
}

::-webkit-scrollbar-track {
	border: 1px solid grey;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb {
	background: grey;
	border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
	background: grey;
}

.total_price {
	margin-top: 5px;
}

#totals {
	position: -webkit-sticky;
	position: sticky;
	width: 45%;
	margin: 25px 40px 10px;
	/* 	margin-top: 80px; */
}

.table-bordered {
	height: 295px;
	/* width: 150%; */
	display: block;
	overflow-y: scroll;
}

.form-check-label {
	margin-top: 5px;
}

#btn {
	background-color: #004d80;
	border: 0;
	color: #fff;
	font-weight: 600;
	width: 120px;
}

#product_id {
	background-color: #004d80;
	color: #fff;
	margin-top: 5px;
}

#product_id:hover {
	color: #fff
}
#product_id {
background-color: #004d80;
color: #fff
}

#product_description {
font-size: 12px;
}
</style>

<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description" content="$1">

<title>Cartdisplay Page</title>

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="style.css">

<script type="text/javascript">
<!-------------------------------------callback function------------------------------ -->
	$(document).ready(function() {
						var val1;
						var userdata
						var product_id;
						var base_price;
						var base_quantity;
						var base_name;
						var cartCount;
						//-----------------------------ajax for category2---------------------------------- /

						$.ajax({
									type : "GET",
									url : "cartdisplayServlet",
									contentType : "application/json", // NOT dataType!
									success : function(data) {
										
										let responseData = JSON.parse(data);
										let westernWearData = responseData[2];
										let indianWearData = responseData[1];
										let casualWearData = responseData[3];
										if (data == '{}')
											{
									/* 		alert('No products in cart'); */
											$('#page').hide();
									       var textMore = "No items in cart";
									       $('#Noitem').show();
									     // $('#Noitem').append(textMore).css({"text-align": "center","color":"red","font-size":"70px"});
									  	
										setTimeout(function() {
											window.location.href = "productimage.jsp";
										}, 3000);
											}
										//console.log("westernWearData is" + westernWearData);

								let allProdsCount = 0;

Object.keys(responseData).forEach((eachCategoryId, index) => {
console.log(eachCategoryId, " --- ", responseData[eachCategoryId]);

let currCat = responseData[eachCategoryId].products.length;
allProdsCount = allProdsCount + currCat;
cartValue = allProdsCount;

document.getElementById('Value').innerHTML = "[" + cartValue + "]";
});
										
										Object.keys(responseData).forEach((eachCategoryId, index) => {
										    console.log(eachCategoryId, "  ---  ", responseData[eachCategoryId]);
										
											//Creating Category Name element
											var categoryDiv = document.createElement('div');
											categoryDiv.className = 'container';
											categoryDiv.id = 'block';
											document .getElementsByClassName('row')[0].appendChild(categoryDiv);
											
											var categoryNameElement = document.createElement('h1');
											categoryNameElement.className = 'font-weight-semibold mb-2';
											categoryNameElement.id = "category_name";
											categoryNameElement.innerHTML = responseData[eachCategoryId].category_name;
											categoryDiv.appendChild(categoryNameElement);
											
											//Creating eachproduct element
										responseData[eachCategoryId].products.forEach((eachProduct, index) => {
											
											base_price = eachProduct.product_price;
											base_quantity = eachProduct.quantity;
											base_name = eachProduct.product_name;
											//alert(base_quantity);
											var parentDiv = document.createElement('div');
											parentDiv.className = 'col-md-6 mt-2';
											parentDiv.id = 'block';
											document.getElementsByClassName('row')[0].appendChild(parentDiv);
											
											var innerDiv = document.createElement('div');
											innerDiv.className = 'card';
											parentDiv.appendChild(innerDiv);
											
											var bodyDiv = document.createElement('div');
											bodyDiv.className = 'card-body';
											innerDiv.appendChild(bodyDiv);
											
											var childDiv = document.createElement('div');
											childDiv.className = 'card-body bg-light text-center';
											innerDiv.appendChild(childDiv);
											
											var imageDiv = document.createElement('div');
											imageDiv.className = 'card-img-actions';
											bodyDiv.appendChild(imageDiv);
											
											var img = document.createElement('img');
											img.src =  "images/" + eachProduct.product_name + ".jpg";
											img.className = 'card-img img-fluid';
											img.id = "images" + base_name;
											img.width = "96";
											img.height = "350";
											imageDiv.appendChild(img);
											
											var addDiv = document.createElement('div');
											addDiv.className = 'mb-2';
											childDiv.appendChild(addDiv);
											
											var product_name = document.createElement('h6');
											product_name.className = 'font-weight-semibold mb-2';
											product_name.id = "product_name";
											product_name.innerHTML = base_name;
										    addDiv.appendChild(product_name);
											
											var product_desc = document.createElement('p');
											product_desc.className = 'text-justify';
											product_desc.id = "product_description";
											product_desc.innerHTML = eachProduct.product_description;
											product_desc.href = "#";
											addDiv.appendChild(product_desc);
											
											var totalPrice = document.createElement('h5');
											totalPrice.className = 'mb-0 font-weight-semibold';
											totalPrice.id = "total_price";
											totalPrice.innerHTML = base_quantity * base_price;
											childDiv.appendChild(totalPrice);
											
											var Rupees = document.createElement('i');
											Rupees.className = "fa fa-rupee";
											Rupees.id="rupees";
											totalPrice.prepend(Rupees);
											
										 	var label = document.createElement('label');
											label.ClassName = "form-check-label";
											label.innerHTML = "Quantity";
											childDiv.appendChild(label); 
											
											var quaNumber = document.createElement('input');
											quaNumber.type = "number";
											quaNumber.className = 'form-control-sm';
											quaNumber.className ='quantity';
											quaNumber.maxlength = "2";
											quaNumber.size = "1";
											quaNumber.min = "1";
											quaNumber.id = "input" + eachProduct.product_id;
											quaNumber.value = base_quantity;
											quaNumber.onClick = updateCartTotal;
											childDiv.appendChild(quaNumber);
											
											var btn = document.createElement('button');
											btn.type = "button"
											btn.className = 'btn btn-primary';
											btn.id = "product_id";
											btn.value = eachProduct.product_id;
											btn.onClick = updateCartTotal;
											childDiv.appendChild(btn);
											
											var fontawsome = document.createElement('i');
											fontawsome.className = "fa fa-minus-circle";
											fontawsome.innerHTML = " Remove Item ";
											btn.appendChild(fontawsome);
											
											var totaltr = document
											.createElement('tr');
											totaltr.className = 'text-center';
											/* totaldiv.style="margin-top:20px" */
											totaltr.id = "total_summary";
											
											document.getElementsByClassName('table')[0].appendChild(totaltr);
											
											var totaldiv = document
											.createElement('td');
											totaldiv.className = 'text-center';
											/* totaldiv.style="margin-top:20px" */
											totaldiv.id = "total_summary";
											totaldiv.innerHTML = base_name;
											totaltr
											.appendChild(totaldiv);

											var totaldiv1 = document
											.createElement('td');
											totaldiv1.className = 'text-center';
											totaldiv1.id = "total_summary";
											totaldiv1.innerHTML = base_price;
											totaltr.appendChild(totaldiv1);

											var totaldiv2 = document
											.createElement('td');
											totaldiv2.className = 'text-center';
											totaldiv2.id = "total_summary";
											totaldiv2.innerHTML = base_quantity;
											totaltr
											.appendChild(totaldiv2);

											var totaldiv3 = document
											.createElement('td');
											totaldiv3.className = 'text-center';
											totaldiv3.id = "total_summary";
											totaldiv3.innerHTML =  base_price * base_quantity;
											totaltr
											.appendChild(totaldiv3);
											
											 var Rupees1 = document.createElement('i');
											Rupees1.className = "fa fa-rupee";
											Rupees1.id="rupee"; 
											totaldiv3.prepend(Rupees1);
 
											
										
										});
											
										var images = [ "images/Frock.jpg", "images/Anarkali Gown.jpg",
											"images/Party Wear.jpg", "images/Denim Jacket.jpg" , "images/Salwar Suit.jpg","images/Flared Skirt.jpg","images/Capri.jpg","images/Jump Suit.jpg","images/Track Suit.jpg","images/Printed Night Suit.jpg"];
										function myImages() {
											responseData[eachCategoryId].products.forEach((eachProduct, index) => {
												document.getElementById("images" + base_name).src = "images/" + eachProduct.product_name + ".jpg";
											});
										}
										images.forEach(myImages);
										
										
										
										
										
										
										updateCartTotal();
										function updateCartTotal() {

											var cartItemContainer = document.getElementsByClassName('row ')[0];
											var cartRows = cartItemContainer.getElementsByClassName('col-md-6 mt-2');
											var total = 0;
											for(var i = 0; i < cartRows.length; i++) {
												var cartRow = cartRows[i];
												var priceElement = cartRow.getElementsByClassName('mb-0 font-weight-semibold')[0];
												//var price = priceElement.innerHTML;
												var price = parseFloat(priceElement.innerHTML.replace('<i class="fa fa-rupee" id="rupees"></i>', ' '));
												//alert(price);
												total = total + price;
												//alert(total);
											}
											total = Math.round(total * 100) / 100;
											document.getElementById('total').innerText  =total;
											//alert(total);
										}
										//-------------------on click of remove item-------------------- /
										$(document).on('click', 'button[id]', function(e) {
										if(this.id == "dropdownMenuButton") {
											return false;
										}
										onClick(this);
										product_id = $(this).val();
										console.log(product_id);
										var data = {
											product_id: $(this).val(),
										};

						//--------------------------------inside success 2nd ajax------------------------------------------------------- /
										$.ajax({
											type: "POST",
											url: "cartdisplayServlet",
											contentType: "application/json", // NOT dataType!
											data: JSON.stringify(data),
											statusCode: {
												409: function() {
													//alert("Remove from Cart Failed");
													//$('#form').hide();
													$('#notadded').slideDown();
													setTimeout(function() {
														window.location.href = "cartdisplay.jsp";
													}, 0000);
												},
												200: function() {
													//alert("Removed Successfully");
													//$('#form').hide();
													$('#added').slideDown();
													console.log("Removed Successfully");
													setTimeout(function() {
														window.location.href = "cartdisplay.jsp";
													}, 0000);
												}
											},
											});
										});
											});
											},
											error: function(error) {
											console.log(error);
											}
											}); //ajax close get
											
						//------------------on click of input-------------------------------- /
						function onClick(elem) {
							var $this = $(elem);
							val1 = $this.siblings('button[id]').val();

							if (val1 == '') {
								//alert('no input');
							} else {
								//alert("product_id " + val1);
							}
						}
						/*---------------------------pass JSON fortmat-----------------------------*/
							$(document).on('click', 'input[type=number]', function(e) {
								onClick(this);
								var i = $(this).val();
								// alert("decrement value " + i);
								var data = {
									product_id: val1,
									quantity: i
								};
								console.log(data);
								//alert(data);
//-------------------------------- 3rd ajax outside success, inside onready function------------------------------------------------------- /
								$.ajax({
									type: "POST",
									url: "cartdisplayServlet",
									contentType: "application/json", // NOT dataType!
									data: JSON.stringify(data),
									statusCode: {
										409: function() {
											//alert("Remove from Cart Failed");
											//$('#form').hide();
											//$('#notdecrement').slideDown();
											setTimeout(function() {
												window.location.href = "cartdisplay.jsp";
											}, 0000);
										},
										200: function() {
											//alert("Removed Successfully");
											//$('#form').hide();
											//$('#decrement').slideDown();
											console.log("Decrement Successfully");
											setTimeout(function() {
												window.location.href = "cartdisplay.jsp";
											}, 0000);
										}
									},
								});
									});

					});
</script>
</head>
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
						<i class="fa fa-user" aria-hidden="true"
							style="padding: 5px; margin-top: 5px;"></i> Account
					</button>
					<div class="dropdown-menu dropdown-menu-right" id="dropdown-item">
						<a class="dropdown-item " id="text" href="profile.jsp"><i
							class="fa fa-user" aria-hidden="true" style="padding: 5px;"></i>
							Profile</a> <a class="dropdown-item " id="text"
							href="productimage.jsp"><i class="fa fa-product-hunt"
							aria-hidden="true" style="padding: 5px;"></i> Product</a> <a
							class="dropdown-item " id="text" href="loginsecurityquestion.jsp"><i
							class="fa fa-edit" aria-hidden="true" style="padding: 5px;"></i>
							Change Password</a> <a class="dropdown-item " id="text"
							href="LogoutServlet"><i class="fa fa-sign-out"
							aria-hidden="true" style="padding: 5px;"></i> Logout</a>
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


	<!--------------------- ----------------form------------------------------ -->

	<form id="page">

		<div class="container" id="statusDiv">
			<div class="alert alert-success " id="added" role="alert"
				style="display: none; text-align: center; margin-top: 10px;">
				<strong>Product Removed Successfully!</strong>
			</div>
			<div class="alert alert-danger alert-dismissible" id="notadded"
				role="alert"
				style="display: none; text-align: center; margin-top: 10px;">
				<strong>Product Not Removed</strong>
			</div>
		</div>
		<!-- form-------------------------------->

		<div class="container d-flex justify-content-center mt-50 mb-50">
			<div class="row " id="form"></div>

			<div class="col-sm justify-content-center totals" id="totals">
				<div class="d-flex justify-content-center   mt-1 pt-1" id="">
					<p class="text-capitalize" style="font-size: 20px;">
						<strong>Order Summary</strong>
					</p>
				</div>
				<div class="table-responsive-sm table-responsive-md ">
					<table class="table table-bordered table-striped mb-0">
						<thead>
							<tr>
								<th style="width: 50%">Product Name</th>
								<th style="width: 10%">Price</th>
								<th style="width: 8%">Quantity</th>
								<th style="width: 22%" class="text-center">Subtotal</th>

							</tr>
						</thead>
						<tbody>
							<tr>

							</tr>
						</tbody>

					</table>

				</div>

				<div
					class=" d-flex justify-content-center   mt-2 pt-2 ">
					<p class="text-capitalize">
						<strong>Total</strong>
					</p>

					<i class="fa fa-rupee" id="symbol"></i>
					<p class=" font-weight-bold " id="total">
					</p>

				</div>
				<div>
					<a href="#"
						class="mt-3 d-flex justify-content-center btn-lg rounded-0"
						id="btn">Total</a>
				</div>
				<div>
					<a href="#"
						class="mt-3 btn btn-pay w-100 d-flex justify-content-center btn-lg rounded-0"
						id="btn">Pay Now </a>
				</div>
			</div>
		</div>
	</form>
	
	 <div class="alert alert-primary col-md-8 mx-auto "  id="Noitem" style="display:none; margin-top:80px; border-color: #004d80;">
	<light class="text-center "style="text-align:center; font-size:70px;">No Item In Cart <i class="fa fa-exclamation-triangle"></i></light>
	</div> 


</body>
</html>