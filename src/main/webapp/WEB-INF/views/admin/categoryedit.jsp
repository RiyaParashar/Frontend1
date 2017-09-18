<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<s:url var="css" value="/resources/css/"></s:url>
<s:url value="/resources/js" var="js"></s:url>
<s:url var="url_img" value="/resources/Image/"></s:url>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="${js}/intial.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="${css}/styles.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<title>Edit</title>
</head>
<body style="background-color:   #FAFAFF">
<%@include file="/WEB-INF/views/admin/sidebar.jsp"%>
<div  style="margin-left: 25%; margin-right: 10%" id="box">
<br> <br> <br>
<h3>${delsuccess}</h3>
<form:form action="/Frontend1/admin/category/edit" enctype="multipart/form-data" method="post" modelAttribute="category">
		<form:hidden path="category_id"/>
		<p><label  class="w3-text-orange"><b>Category name:</b></label><span style="color:red">*</span>
		<form:input class="w3-input w3-border " path="category_name"/>
		</p>
		<input type="submit" name="action" class="btn btn-primary" value="UPDATE">
		</form:form>
</div>
</body>
</html>