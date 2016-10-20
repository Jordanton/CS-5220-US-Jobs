<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>

<link href="css/vendor/bower.css" rel="stylesheet" />
<link href="css/us-jobs.css" rel="stylesheet" />
<link href="bower_components/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
</head>
<body>
	<jsp:include page="header.jsp" />
	<div class="animated fadeIn row">
		<div class="col col-md-4 col-md-offset-4">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">Login</h3>
			
				</div>
				<div class="panel-body">
					<form action="<c:url value='/login' />" method="post" class="form-horizontal">
						<fieldset>
							<div class="form-group">
								<label for="username" class="col-lg-2 control-label">Username</label>
								<div class="col-lg-10">
									<input type="text" name="username" class="form-control" id="username"
										placeholder="Username">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword" class="col-lg-2 control-label">Password</label>
								<div class="col-lg-10">
									<input type="password" name="password" class="form-control" id="inputPassword"
										placeholder="Password">
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="submit" class="btn btn-primary btn-block">Login</button>
									<button class="btn btn-default btn-block">Back</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="js/vendor/bower.js"></script>
</html>