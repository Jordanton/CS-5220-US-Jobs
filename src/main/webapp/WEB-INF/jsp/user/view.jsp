<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<div class="animated fadeIn row">
	<div class="col-md-8 col-md-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-info-circle" aria-hidden="true"></i>&nbsp;&nbsp;View
					${user.firstName }'s profile
				</h3>
			</div>
			<div class="panel-body">
				<h4>
					<strong>Id</strong>
				</h4>
				<p>${user.id }</p>
				<h4>
					<strong>Username</strong>
				</h4>
				<p>${user.username }</p>
				<h4>
					<strong>First Name</strong>
				</h4>
				<p>${user.firstName }</p>
				<h4>
					<strong>Last Name</strong>
				</h4>
				<p>${user.lastName}</p>
				<h4>
					<strong>Email</strong>
				</h4>
				<p>${user.email }</p>
				<h4>
					<strong>Password</strong>
				</h4>
				<p>${user.password }</p>
			</div>
		</div>
	</div>
</div>