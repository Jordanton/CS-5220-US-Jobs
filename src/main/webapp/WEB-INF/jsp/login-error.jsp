<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="animated fadeIn row">
	<div class="col-md-4 col-md-offset-4">
		<div class="alert alert-dismissible alert-danger">
			<button type="button" class="close" data-dismiss="alert">&times;</button>
			<strong><i class="fa fa-exclamation-triangle"
				aria-hidden="true"></i>&nbsp;&nbsp;Error.</strong> You've entered the wrong
			username or password. Please try again.
		</div>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-sign-in" aria-hidden="true"></i>&nbsp;&nbsp;Login
				</h3>
			</div>
			<div class="panel-body">
				<form id="loginForm" action="<c:url value='/login' />" method="post"
					class="form-horizontal">
					<fieldset>
						<div class="form-group">
							<label for="username" class="col-lg-2 control-label">Username</label>
							<div class="col-lg-10">
								<input type="text" name="username" class="form-control"
									id="username" placeholder="Username">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-lg-2 control-label">Password</label>
							<div class="col-lg-10">
								<input type="password" name="password" class="form-control"
									id="password" placeholder="Password">
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
