<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><tiles:insertAttribute name="title"
		defaultValue="US Jobs" defaultValueType="string" /></title>

<link href="<c:url value='/css/vendor/bower.css' />" rel="stylesheet" />
<link href="<c:url value='/css/us-jobs.css' />" rel="stylesheet" />
<link
	href="<c:url value='/bower_components/font-awesome/css/font-awesome.css' />"
	rel="stylesheet" />
</head>
<body>
	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-2">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="<c:url value='/home.html' />"><i
				class="fa fa-wpforms" aria-hidden="true"></i>&nbsp;&nbsp;U.S. Jobs</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-2">
			<ul class="nav navbar-nav">
				<li><a href="<c:url value='/home.html' />"><i
						class="fa fa-home" aria-hidden="true"></i>&nbsp;&nbsp;Home</a></li>
				<security:authorize access="hasAnyRole('ROLE_ADMIN')">
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false"><i
							class="fa fa-cog" aria-hidden="true"></i> &nbsp;&nbsp;Admin
							Control Panel <span class="caret"></span> </a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="<c:url value='/user/list.html' />"><i
									class="fa fa-users" aria-hidden="true"></i>&nbsp;&nbsp;User
									Management</a></li>
							<li><a href="<c:url value='/job/list.html' />"><i
									class="fa fa-tasks" aria-hidden="true"></i>&nbsp;&nbsp;Job
									Posting Management</a></li>
						</ul></li>
				</security:authorize>
			</ul>
			<form method="post" action="<c:url value='/home.html' />"
				class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input id="searchKey" type="text" class="form-control"
						name="searchBar" placeholder="Search"> <input
						id="searchLoc" type="text" class="form-control" name="searchLoc"
						placeholder="Location (Optional)"> <select
						class="form-control" id="searchType" name="searchType">
						<option><i class="fa fa-hand-spock-o" aria-hidden="true"></i>Job
							Postings
						</option>
						<option><i class="fa fa-usd" aria-hidden="true"></i>Salary
						</option>
						<security:authorize access="hasRole('ROLE_ADMIN')">
							<option><i class="fa fa-usd" aria-hidden="true"></i>User
							</option>
						</security:authorize>
						<security:authorize
							access="hasAnyRole('ROLE_ADMIN', 'ROLE_EMPLOYER')">
							<option><i class="fa fa-usd" aria-hidden="true"></i>Job
								Seeker
							</option>
						</security:authorize>
					</select>
				</div>
				<button type="submit" class="btn btn-default" id="search-btn">
					<i class="fa fa-search"></i>&nbsp;&nbsp;Search
				</button>
			</form>
			<security:authorize
				access="hasAnyRole('ROLE_ADMIN', 'ROLE_SEEKER', 'ROLE_EMPLOYER')">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value='/user/profile.html' />"><i
							class="fa fa-user" aria-hidden="true"></i>&nbsp;&nbsp;Welcome, <security:authentication
								property="principal.username" /> </a></li>
					<li><a href="<c:url value='/logout' />"><i
							class="fa fa-sign-out" aria-hidden="true"></i>&nbsp;&nbsp;Logout</a></li>
				</ul>
			</security:authorize>
			<security:authorize access="!isAuthenticated()">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value='/login.html' />"><i
							class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;&nbsp;Login</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<c:url value='/register.html' />"><i
							class="fa fa-user-plus" aria-hidden="true"></i>&nbsp;&nbsp;Register</a></li>
				</ul>
			</security:authorize>
		</div>
	</div>
	</nav>
	<div class="container-fluid">
		<tiles:insertAttribute name="content" />
	</div>

	<footer class="footer">
	<div class="container">
		<span class="text-default"> Copyright &copy; 2016, <a
			href="https://github.com/Jordanton/CS-5220-US-Jobs" target="_blank">CS-5220-US-Jobs</a>.
			All rights reserved.
		</span>
	</div>
	</footer>
</body>

<script src="<c:url value='/js/vendor/bower.js' />"></script>
<script
	src="<c:url value='/bower_components/jquery-validation/dist/additional-methods.js' />"></script>
<script src="<c:url value='/js/list-detail.js' />"></script>
<script src="<c:url value='/js/validate.js' />"></script>
</html>