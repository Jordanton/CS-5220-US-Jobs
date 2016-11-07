<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>US Jobs - Add User</title>
<link href="<c:url value='/css/vendor/bower.css' />" rel="stylesheet" />
<link href="<c:url value='/css/us-jobs.css' />" rel="stylesheet" />
<link
	href="<c:url value='/bower_components/font-awesome/css/font-awesome.css' />"
	rel="stylesheet" />
<script src="<c:url value='/js/vendor/bower.js' />"></script>
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="animated fadeIn row">
		<div class="col col-md-6 col-md-offset-3">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;&nbsp;Add an Admin
					</h3>
				</div>
				<div class="panel-body">
					<form:form id="addUserForm" modelAttribute="user"
						class="form-horizontal">
						<fieldset>
							<div class="form-group">
								<label for="username" class="col-lg-2 control-label">Username</label>
								<div class="col-lg-10">
									<form:input id="username" name="username"
										type="text" class="form-control" path="username" />
									<form:errors path="username" />
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-lg-2 control-label">Password</label>
								<div class="col-lg-10">
									<form:input type="password" name="password"
										class="form-control" path="password" id="password" />
									<form:errors path="password" />
								</div>
							</div>
							<div class="form-group">
								<label for="password2" class="col-lg-2 control-label">Confirm
									Password</label>
								<div class="col-lg-10">
									<form:input type="password" name="password2"
										class="form-control" path="password2" id="password2" />
										<form:errors
							path="password2" />
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-lg-2 control-label">Email</label>
								<div class="col-lg-10">
									<form:input type="text" class="form-control" path="email"
										id="email" name="email" placeholder="email" />
									<form:errors path="email" />
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-lg-2 control-label">First
									Name</label>
								<div class="col-lg-10">
									<form:input type="text" class="form-control" path="firstName"
										id="firstName" name="firstName" placeholder="First Name" />
										<form:errors
							path="firstName" />
								</div>
							</div>
							<div class="form-group">
								<label for="name" class="col-lg-2 control-label">Last
									Name</label>
								<div class="col-lg-10">
									<form:input type="text" class="form-control" path="lastName"
										id="lastName" name="lastName" placeholder="Last Name" />
										<form:errors
							path="lastName" />
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="reset" class="btn btn-default">Cancel</button>
									<button type="submit" class="btn btn-primary">Submit</button>
								</div>
							</div>
						</fieldset>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</body>
<script
	src="../bower_components/jquery-validation/dist/additional-methods.js"></script>
<script src="../js/validate.js"></script>
</html>
