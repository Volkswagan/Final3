<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
button {
	width: 100px;
	height: 50px;
	
	padding-bottom: 2%;
	box-shadow: 14px 10px 4px 5px rgba(0, 0, 0, 0.27);
	-webkit-transition: width 5s, height 5s;
	transition: width 5s, height 5s;
}

button:hover {
	width: 110px;
	height: 50px;
}
</style>
<meta charset="UTF-8">
<title>Update Details</title>
<link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/logostyle.css"></link>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link href='https://fonts.googleapis.com/css?family=Almendra'
	rel='stylesheet'>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${request.contextPath }/static/styles/bootstrap.min.css">
<script type="text/javascript">
	function confirm_alert(node) {
		return confirm("Please click on OK to continue.");
	}
</script>
<link rel="shortcut icon"
	href="http://www.brianshim.com/webtricks/wp-content/uploads/2012/11/stars_favicon.png"
	type="image/x-icon" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body class="hero-bkg-animated" background="/static/images/bluepatt.jpg">
	<%
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Cache-Control", "no-store");
		response.setHeader("Pragma", "no-cache");
		response.setDateHeader("Expires", 0);
	%>
	<c:if test="${sessionScope.currentAdmin.adminId==null}">
		<%
			response.sendRedirect("/Vehicle_Reservation_System/");
		%>
	</c:if>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary"
		style="margin-bottom:45px; box-shadow: 14px 10px 4px 5px rgba(0,0,0,0.27);">
	<div id="nav" class="navbar-header">
		<a class="navbar-brand" href="#"><img class="picture"
			src="${request.contextPath}/static/images/logo1.png" /></a>
	</div>
	<a class="navbar-brand" href="/Vehicle_Reservation_System/homeAgain"><b>Vehicle Reservation System</b></a>
	<div class="collapse navbar-collapse" id="navbarColor01">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link"
				href="/Vehicle_Reservation_System/homeAgain"><b>Home</b></a></li>
			<li class="nav-item"><a class="nav-link"
				href="/Vehicle_Reservation_System/create"><b>Create</b></a></li>
			<li class="nav-item"><a class="nav-link"
				href="/Vehicle_Reservation_System/search"><b>Search</b></a></li>
			<li class="nav-item active"><a class="nav-link" href="/Vehicle_Reservation_System/list"><b>List</b><span
					class="sr-only">(current)</span></a></li>
		</ul>
	</div>
	<form action="/Vehicle_Reservation_System/logout">
		<button type="submit" class="btn btn-secondary my-2 my-sm-0"
			style="color: #000000; box-shadow: 10px 10px 5px 0px rgba(0, 0, 0, 0.75);">
			<i style="font-size: 20px;" class="fa">&#xf08b;<b>Logout</b></i>
		</button>
	</form>
	</nav>
	<!-- table code here -->
	<h3>Vehicles</h3>
	<c:if test="${!empty vehicleList}">
		<table class="table table-hover"
			style="box-shadow: 14px 10px 4px 5px rgba(0, 0, 0, 0.27);">
			<tr class="table-dark">
				<th>Vehicle No</th>
				<th>Branch</th>
				<th>Vehicle Type</th>
				<th>Insurance Expiry Date</th>
				<th>Last Service Date</th>
				<th>Service Due Date</th>
				<th colspan="3"><center>Actions</center></th>
			</tr>
			<c:forEach items="${vehicleList}" var="vh">
				<tr class="table-primary" style="padding-bottom: 2%; box-shadow: 14px 10px 4px 5px rgba(0, 0, 0, 0.27);">
					<td><a href="/Vehicle_Reservation_System/edit/${vh.vehicleNo}"
						style="color: #0c03ba">${vh.vehicleNo}</a></td>
					<td>${vh.branch}</td>
					<td>${vh.vehicleType }</td>
					<td>${vh.insuranceExpiryDate }</td>
					<td>${vh.lastServiceDate }</td>
					<td>${vh.serviceDueDate}</td>
					<td><a class="btn btn-primary"
						style="padding-bottom: 2%; box-shadow: 14px 10px 4px 5px rgba(0, 0, 0, 0.2); color:white;"
						href="/Vehicle_Reservation_System/edit/${vh.vehicleNo}">edit</a></td>
					<td><a class="btn btn-primary"
						style="padding-bottom: 2%; box-shadow: 14px 10px 4px 5px rgba(0, 0, 0, 0.2); color:white;"
						href="/Vehicle_Reservation_System/delete/${vh.vehicleNo}"
						onclick="return confirm_alert(this);">delete</a></td>
					<td><a class="btn btn-primary"
						style="padding-bottom: 2%; box-shadow: 14px 10px 4px 5px rgba(0, 0, 0, 0.2); color:white;"
						href="/Vehicle_Reservation_System/sendMailSSL">send email</a></td>

				</tr>
			</c:forEach>
		</table>
	</c:if>
</body>
</html>