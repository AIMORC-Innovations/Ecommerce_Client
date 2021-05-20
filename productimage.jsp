<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
<!-------------------------------------scroolbar and footer------------------------------ -->
body {data-spy ="scroll";
	overflow: hidden;
	font-family: "Amazon Ember", Arial, sans-serif;
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
	height: 0px;
	background: #004d80;
	position: fixed;
	bottom: 0;
}

#product_name {
	font-size: 30px;
}

#product_description {
	font-size: 12px;
}

#category_id {
	width: 15%;
}

#category_id_label {
	box-sizing: border-box;
	font-size: 20px;
}

<!------------------------------------css for cart display button------------------------------ --> 
 body {
	margin: 0;
	font-family: Helvetica, Arial;
	font-size: .8125rem;
	font-weight: 400;
	line-height: 1.5385;
	color: #333;
	text-align: left; /
	background-color: #2196F3;
}

.mt-50 {
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

#product_id {
	background-color: #004d80;
	color: #fff
}

#product_id:hover {
	color: #fff
}

.bg-buy {
	background-color: green;
	color: #fff;
	padding-right: 29px;
}

.bg-buy:hover {
	color: #fff;
}

.a {
	text-decoration: none !important;
}

#rupees {
	font-size: 24px;
	margin-right: 3px;
}

.text-justify {
	height: 80px;
	responsive-font-size: 4rem;
	overflow-y: scroll;
}

.btn {
	background-color: #004d80;
	color: #fff;
}

.quantity {
	width: 35px;
	margin-left: 5px;
	margin-right: 5px;
}
/*--for scroll---- */
::-webkit-scrollbar {
	width: 4px;
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

#selectButton {
	background-color: #004d80;
	border-color: #004d80;
	color: white;
	font-color: white;
	padding: 5px;
	margin-top: 5px;
}
</style>

<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="description" content="$1">

<title>ProductImage Page</title>

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
	$(document)
			.ready(
					function() {
						var val1, val2;
						var cartCount;
						var category_id;
						var selectedOption = 0;
						var selectedOptionText;
						 var data2;
                        var data1;
                       
                        var getObj = JSON.parse(localStorage.getItem('categoryId'));
                        	

                        		if(getObj==null){
                        		document.getElementById("category_id").value = 0;

                        		}
                        		if(getObj!=null){
                        		document.getElementById("category_id").value = getObj;
                        		localStorage.clear();
                        		}

                        		

                        		function cart() {
                        		/*----------display cart ajax---------------- */
                        		$.ajax({
                        		type : "GET",
                        		url : "cartdisplayServlet",
                        		contentType : "application/json", // NOT dataType!
                        		success : function(data) {
                        			let responseData = JSON.parse(data);
									let westernWearData = responseData[2];
									let indianWearData = responseData[1];
								
									var cartValue = westernWearData.products.length + indianWearData.products.length;
									document.getElementById('Value').innerHTML = "[" + cartValue + "]";
									
                        		}
                        		});


                        		}
                        		cart();






/*----function for cart increase--- */
function displayProduct(){
	$.ajax({

																type : "GET",
									url : "productCartServlet",
									contentType : "application/json", // NOT dataType!

									success : function(data) {
										var userJSON = JSON.parse(data);

									
										console.log(userJSON);
										for (var i = 0; i < 1; i++)
											switch(true)
											{
									      case(userJSON[i].category_id==1):
												var parentDiv = document
												.createElement('div');
										parentDiv.className = 'container';
										parentDiv.id = 'block';
										document
												.getElementsByClassName('row')[0]
												.appendChild(parentDiv);

										var category_name = document
												.createElement('h1');
										category_name.className = 'font-weight-semibold mb-2';
										category_name.id = "category_name";
										category_name.innerHTML = userJSON[i].category_name;
										parentDiv
												.appendChild(category_name);
										break;
									      case(userJSON[i].category_id==2):
												var parentDiv = document
												.createElement('div');
										parentDiv.className = 'container';
										parentDiv.id = 'block';
										document
												.getElementsByClassName('row')[0]
												.appendChild(parentDiv);

										var category_name = document
												.createElement('h1');
										category_name.className = 'font-weight-semibold mb-2';
										category_name.id = "category_name";
										category_name.innerHTML = userJSON[i].category_name;
										parentDiv
												.appendChild(category_name);
										break;
									      case(userJSON[i].category_id==3):
												var parentDiv = document
												.createElement('div');
										parentDiv.className = 'container';
										parentDiv.id = 'block';
										document
												.getElementsByClassName('row')[0]
												.appendChild(parentDiv);

										var category_name = document
												.createElement('h1');
										category_name.className = 'font-weight-semibold mb-2';
										category_name.id = "category_name";
										category_name.innerHTML = userJSON[i].category_name;
										parentDiv
												.appendChild(category_name);
										break;
										default:
											break;
								
										}

										

										for (var i = 0; i < userJSON.length; i++) {

											var parentDiv = document
													.createElement('div');
											parentDiv.className = 'col-md-4 mt-2';
											parentDiv.id = 'block';
											document
													.getElementsByClassName('row')[0]
													.appendChild(parentDiv);

											var selectDiv = document
											.createElement('div');
											selectDiv.className = 'col-md-4 mt-2';
											selectDiv.id = 'block';
									document
											.getElementsByClassName('select')[0]
											.appendChild(selectDiv);
									
							
									
											var innerDiv = document
													.createElement('div');
											innerDiv.className = 'card';
											parentDiv.appendChild(innerDiv);

											var bodyDiv = document
													.createElement('div');
											bodyDiv.className = 'card-body';
											innerDiv.appendChild(bodyDiv);

											var childDiv = document
													.createElement('div');
											childDiv.className = 'card-body bg-light text-center';
											innerDiv.appendChild(childDiv);

											var imageDiv = document
													.createElement('div');
											imageDiv.className = 'card-img-actions';
											bodyDiv.appendChild(imageDiv);

											var img = document
													.createElement('img');
											img.src = "images/Party Wear.jpg";
											img.className = 'card-img img-fluid';
											img.id = "images" + i;
											img.width = "96";
											img.height = "350";
											imageDiv.onload = myImages;
											imageDiv.appendChild(img);

											var addDiv = document
													.createElement('div');
											addDiv.className = 'mb-2';
											childDiv.appendChild(addDiv);

											var product_name = document
													.createElement('h1');
											product_name.className = 'font-weight-semibold mb-2';
											product_name.id = "product_name";
											product_name.innerHTML = userJSON[i].product_name;
											addDiv.appendChild(product_name);

											var product_desc = document
													.createElement('p');
											product_desc.className = 'text-justify';
											product_desc.id = "product_description";
											product_desc.innerHTML = userJSON[i].product_description;
											product_desc.href = "#";
											addDiv.appendChild(product_desc);

											var product_price = document
													.createElement('h3');
											product_price.className = 'mb-0 font-weight-semibold';
											product_price.id = "product_price";
											product_price.innerHTML = userJSON[i].product_price;
											childDiv.appendChild(product_price);
										

											var Rupees = document
													.createElement('i');
											Rupees.className = "fa fa-rupee";
											Rupees.id = "rupees";
											product_price.prepend(Rupees);

											var label = document
													.createElement('label');
											label.ClassName = "form-check-label";
											label.innerHTML = "Quantity";
											childDiv.appendChild(label);

											var quaNumber = document
													.createElement('input');
											quaNumber.type = "number";
											quaNumber.className = 'form-control form-control-sm';
											quaNumber.className = 'quantity';
											quaNumber.maxlength = "2";
											quaNumber.size = "1";
											quaNumber.min = "1";
											quaNumber.id = "input"
													+ userJSON[i].product_id;
											quaNumber.value = "1";
											childDiv.appendChild(quaNumber);

											var btn = document
													.createElement('button');
											btn.type = "button"
											btn.className = 'btn btn-primary';
											btn.id = "product_id";
											btn.value = userJSON[i].product_id;
											childDiv.appendChild(btn);

											var fontawsome = document
													.createElement('i');
											fontawsome.className = "fa fa-cart-plus mr-2";
											fontawsome.innerHTML = " Add to cart ";
											btn.appendChild(fontawsome);

										}
									

										var images = [ "images/Frock.jpg", "images/Anarkali Gown.jpg",
											"images/Party Wear.jpg", "images/Denim Jacket.jpg" , "images/Salwar Suit.jpg","images/Flared Skirt.jpg","images/Capri.jpg","images/Jump Suit.jpg","images/Track Suit.jpg","images/Printed Night Suit.jpg"];
										function myImages() {
											for (var i = 0; i < userJSON.length; i++) {
												document.getElementById("images"+ i).src = "images/" + userJSON[i].product_name + ".jpg";
											}
										}
										images.forEach(myImages)

	

										// --------------------------------onclick of quantity------------------------------------------------------- /

										function onClick(elem) {
											var $this = $(elem);
											val1 = $this.siblings(
													'input[type=number]').val();

											if (val1 == '') {
												// alert('no input');
											} else {
												// alert(val1);
											}
										}

										/* --------------------------------onclick of add to cart button-------------------------------------------------------*/

										var counts = 0;
										$(document)
												.on(
														'click',
														'button[id]',
														function(e) {
															if (this.id == 'dropdownMenuButton') {
																return false;
															}
															onClick(this);

															var data = {
																product_id : $(
																		this)
																		.val(),
																quantity : val1
};
console.log(data);

// --------------------------------inside success 3rd ajax------------------------------------------------------- /
$.ajax({
																		type : "POST",
																		url : "productCartServlet",
																		contentType : "application/json", // NOT dataType!
																		data : JSON
																				.stringify(data),
																		statusCode : {
																			409 : function() {
																				
																				$(
																						'#notadded')
																						.slideDown();
																				setTimeout(
																						function() {
																							window.location.href = "http://localhost:8080/AIMORCProject/productimage.jsp";
																						},
																						2000);
																				cart();
																			},
																			200 : function() {
																				
																				$(
																						'#added')
																						.slideDown();

																				console
																						.log("Added To Cart Successfully");
																				setTimeout(
																						function() {
																							window.location.href = "productimage.jsp";
																						},
																						2000);
																			
																				cart();
																			}
																		},

																	});
														});
									},
									error : function(error) {
										console.log(error);
									}
								});

								
 document.getElementById('category_id').onchange = function() {
    localStorage.setItem('selectedtem', document.getElementById('category_id').value);
    
};

if (localStorage.getItem('selectedtem')) {
    document.getElementById('category_id').options[localStorage.getItem('selectedtem')].selected = true;
    localStorage.clear();
  
} 
}
displayProduct();

						// --------------------------------onclick of select button------------------------------------------------------- /

						$("#category_id")
								.change(
										function() {
											var current = $('option:selected',
													$(this));
											selectedOptionText = current.text();
											selectedOption = $(
													'option:selected', $(this))
													.val();
											
											var data = {
												category_id : selectedOption
											};
											console.log("category id" + data);

// --------------------------------inside success 2nd ajax------------------------------------------------------- /
$.ajax({
														type : "POST",
														url : "productCartServlet",
														contentType : "application/json", // NOT dataType!
														data : JSON
																.stringify(data),
														statusCode : {
															409 : function() {
															
																setTimeout(
																		function() {
																			window.location.href = "http://localhost:8090/AIMORCProject/productimage.jsp";
																		}, 0000);
																
															},
															200 : function() {
															

																console
																		.log("Added To Cart Successfully");
																setTimeout(
																		function() {
																			window.location.href = "http://localhost:9979/AIMORCProject/productimage.jsp";
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
							href="loginsecurityquestion.jsp"><i class="fa fa-edit"
							aria-hidden="true" style="padding: 5px;"></i> Change Password</a> <a
							class="dropdown-item " id="text" href="LogoutServlet"><i
							class="fa fa-sign-out" aria-hidden="true" style="padding: 5px;"></i>
							Logout</a>
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

	<div class="container" id="statusDiv">
		<div class="alert alert-success " id="added" role="alert"
			style="display: none; text-align: center; margin-top: 10px;">
			<strong>Added To Cart Successfully!</strong>
		</div>
		<div class="alert alert-danger alert-dismissible" id="notadded"
			role="alert"
			style="display: none; text-align: center; margin-top: 10px;">
			<strong>Add To Cart Failed!</strong>
		</div>
	</div>

	<!------------------ ----------------form------------------------------ -->
	<div id="content">


		<div class="inputRow">
			<div class="select" id="drop"></div>
			<label for="category_id" id="category_id_label">Choose
				Category</label> <select class="combobox input-large form-control"
				name="category_id" id="category_id">

				<option value="0">All</option>
				<option value="1">Indian Wear</option>
				<option value="2">Western Wear</option>
				<option value="3">Casual Wear</option>

			</select>
		</div>

		<div class="container"></div>

		<div class="container d-flex justify-content-center mt-50 mb-50">
			<div class="row" id="form"></div>
		</div>


	</div>

	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-12"></div>
		</div>
	</div>


</body>
</html>