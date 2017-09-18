<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<s:url var="css" value="/resources/css/"></s:url>
<s:url value="/resources/js" var="js"></s:url>
<s:url var="url_img" value="/resources/Image/"></s:url>
<s:url var="url_product_img" value="/resources/Image/ProductImages"></s:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${css}/styles.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Cart Detail</title>
</head>
<body>
	<div class="container" id="main">
		<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header" id="head">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/Frontend1/"><img src="${url_img}/Logo.jpg"
					width="100px" height="60px" alt="Logo" id="imagetop" /></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="/Frontend1/">Home</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Categories<span class="caret"></span></a>������
						<c:if test="${!empty category}">
							<ul class="dropdown-menu">
								<c:forEach var="cat" items="${category}">
									<li><a href="/Frontend1/bycategory/${cat.category_name}">${cat.category_name}</a></li>
								</c:forEach>
							</ul>
						</c:if></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Brand<span class="caret"></span></a>�
						<c:if test="${!empty brand}"></c:if>�����
						<ul class="dropdown-menu">
							<c:forEach var="brand" items="${brand}">
								<li><a href="/Frontend1/bybrand/${brand.brand_name}">${brand.brand_name}</a></li>
							</c:forEach>
						</ul></li>
					<li><a href="/Frontend1/cartdetail/">Cart<span class="badge">${cart}</span></a></li>
				</ul>
				<form class="navbar-form navbar-left" action="/Frontend1/searchbox">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="Search"
							id="searchbox" name="search">
						<div class="input-group-btn">
							<button class="btn btn-default" type="submit" id="searchbutton">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
				<c:if test="${pageContext.request.userPrincipal.name==null }">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/Frontend1//signup"><span class="glyphicon glyphicon-user"></span>
							Sign Up</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="/Frontend1/login"><span class="glyphicon glyphicon-user"></span>
							Login</a></li>
				</ul></c:if>
				<ul class="nav navbar-nav navbar-right">
				<c:url value="/j_spring_security_logout" var="logout"></c:url>
				<c:if test="${pageContext.request.userPrincipal.name!=null }">
					<li><a href="${logout}"><span class="glyphicon glyphicon-user"></span>
							Logout</a></li></c:if>

				</ul>
			</div>
		</div>
		</nav>
		<div class="row" style="background-color: rgb(255, 190, 119)">
			<div class="col-sm-1"></div>
			<c:if test="${!empty detail}">
				<div class="col-sm-10">
					<div class="w3-responsive">
						<table class="w3-table-all">
							<tr class="w3-striped w3-bordered">
							<th>Remove</th>
								<th style="padding-left: 100px">Name</th>
								<th style="padding-left: 10px">Price</th>
								<th style="padding-left: 10px">Image</th>
								<th style="padding-left: 10px">Quantity</th>
								<th style="padding-left: 10px">Update</th>
							</tr>
							<c:forEach var="pro" items="${detail}">
								<tr>
								<td><a href="/Frontend1/cartitems/remove/${pro.getCartItem_Id()}"><button class="btn btn-primary"><span class="glyphicon glyphicon-remove"></span></button></a></td>
									<td style="padding-left: 15px"><a href="/Frontend1/productdetail/${pro.product.product_id}">${pro.product.name}</a></td>
									<td style="padding-left: 15px">${pro.product.price}</td>
									<td style="padding-left: 10px;padding-top:10px"><img
										src="${url_product_img}/${pro.product.name}.jpg"
										alt="productimage" width="100px" height="100px"></td>
										<form action="/Frontend1/cartitems/update/${pro.getCartItem_Id()}">
									<td style="padding-left: 15px"><input type="text" name="qty" value="${pro.getSell_quantity()}"></td>
									<td style="padding-left: 15px"><button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-ok"></span></button></td>
								</form>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</c:if>
			<c:if test="${!empty detail}">
			<div class="col-sm-1"></div>
			<br> <a href="/Frontend1/" style=" display: inline-block;"><button 
					class="btn btn-primary"style=" margin-left:100px">Back To HoMe</button></a>
					<a href="/Frontend1/user/checkout" style=" display: inline-block;"><button 
					class="btn btn-primary"style=" margin-left:500px">CheckOut</button></a></c:if>
					<c:if test="${empty detail}"><h3 align="center">No Item In Your Cart Item</h3><a href="/Frontend1/" style=" display: inline-block;"><button 
					class="btn btn-primary"style=" margin-left:100px">Back To HoMe</button></a></c:if>
					<br>
					<br>
		</div>
		<br><br>
	</div>
	<footer>
	<div class="container">
		<div class="row">
			<div class="col-sm-2">
				<h6>Copyright &copy:2017{Rahul Gupta}</h6>
			</div>
			<div class="col-sm-4">
				<h6>Abouts Us</h6>
			</div>
			<div class="col-sm-2">
				<h6>Navigation</h6>
				<ul class="list-unstyled">
					<li><a href="#">Home</a></li>
					<li><a href="#">Contact Us</a></li>
				</ul>
			</div>
			<div class="col-sm-2">
				<h6>Follow Us</h6>
				<ul class="list-unstyled">
					<li><a href="#">Twitter</a></li>
					<li><a href="#">Facebook</a></li>
					<li><a href="#">Google Plus</a></li>
				</ul>
			</div>
			<div class="col-sm-2">
				<h6>Bussiness With Us</h6>
			</div>
		</div>
	</div>
	</footer>
	
</body>
</html>