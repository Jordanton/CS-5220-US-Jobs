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
<title>US Jobs - Edit User</title>
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
						<i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;&nbsp;Edit
						${user.firstName}'s Profile
					</h3>
				</div>
				<div class="panel-body">
					<form:form id="adminEditUserForm" modelAttribute="user"
						class="form-horizontal">
						<fieldset>
							<div class="form-group">
								<label for="username" class="col-lg-2 control-label">Username</label>
								<div class="col-lg-10">
									<form:input disabled="true" id="username" name="username"
										type="text" class="form-control" path="username" />
								</div>
							</div>
							<div class="form-group">
								<label for="password" class="col-lg-2 control-label">Password</label>
								<div class="col-lg-10">
									<form:input type="password" name="password"
										class="form-control" path="password" id="password" />
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-lg-2 control-label">Email</label>
								<div class="col-lg-10">
									<form:input type="text" class="form-control" path="email"
										id="email" name="email" placeholder="email" />
								</div>
							</div>
							<div class="form-group">
								<label for="street" class="col-lg-2 control-label">Street</label>
								<div class="col-lg-10">
									<form:input type="text" class="form-control"
										path="address.street" id="street" name="street" rows="3" />
								</div>
							</div>
							<div class="form-group">
								<label for="city" class="col-lg-2 control-label">City</label>
								<div class="col-lg-10">
									<form:input type="text" class="form-control"
										path="address.city" id="city" name="city" placeholder="City" />
								</div>
							</div>
							<div class="form-group">
								<label for="state" class="col-lg-2 control-label">State</label>
								<div class="col-lg-10">
									<form:input type="text" class="form-control"
										path="address.state" id="address.state" placeholder="state" />
								</div>
							</div>
							<div class="form-group">
								<label for="zip" class="col-lg-2 control-label">Zip Code</label>
								<div class="col-lg-10">
									<form:input type="text" class="form-control" path="address.zip"
										id="zip" name="zip" placeholder="zip code" />
								</div>
							</div>
							<div class="form-group">
								<c:set var="isAdmin" value="false" />
								<c:forEach var="role" items="${user.userRoles}">
									<c:if test="${role eq 'ROLE_ADMIN'}">
										<c:set var="isAdmin" value="true" />
									</c:if>
								</c:forEach>

								<label class="col-lg-2 control-label">Role</label>
								<div class="col-lg-10">
									<c:choose>
										<c:when test="${isAdmin }">
											<form:radiobutton id="role" name="role" path="userRoles"
												value="ROLE_ADMIN" disabled="true"/>
									Admin
										</c:when>
										<c:otherwise>
											<form:radiobutton id="role" name="role" path="userRoles"
												value="ROLE_SEEKER" />
											<form:errors class="text-danger" path="userRoles" />
									Job Seeker
									<form:radiobutton id="role" name="role" path="userRoles"
												value="ROLE_EMPLOYER" />
											<form:errors class="text-danger" path="userRoles" />
									Employer
										</c:otherwise>
									</c:choose>
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