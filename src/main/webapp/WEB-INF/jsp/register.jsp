<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="animated fadeIn row">
	<div class="col-md-6 col-md-offset-3">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-user-plus" aria-hidden="true"></i>&nbsp;&nbsp;Register
				</h3>
			</div>
			<div class="panel-body">
				<form:form id="registerForm" class="form-horizontal" modelAttribute="user">
					<fieldset>
						<div class="form-group">
							<label for="username" class="col-lg-2 control-label">Username</label>
							<div class="col-lg-10">
								<form:input type="text" class="form-control" path="username"
									id="username" placeholder="Username" />
								<form:errors class="text-danger" path="username" />
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-lg-2 control-label">Password</label>
							<div class="col-lg-10">
								<form:input type="password" path="password" class="form-control"
									id="password" placeholder="Password" />
								<form:errors class="text-danger" path="password" />
							</div>
						</div>
						<div class="form-group">
							<label for="password2" class="col-lg-2 control-label">Confirm
								Password</label>
							<div class="col-lg-10">
								<form:input type="password" path="password2"
									class="form-control" id="password2" placeholder="Password" />
								<form:errors class="text-danger" path="password2" />
							</div>
						</div>
						<div class="form-group">
							<label for="firstName" class="col-lg-2 control-label">First
								Name</label>
							<div class="col-lg-10">
								<form:input type="text" class="form-control" path="firstName"
									id="firstName" placeholder="First Name" />
								<form:errors class="text-danger" path="firstName" />
							</div>
						</div>
						<div class="form-group">
							<label for="lastName" class="col-lg-2 control-label">Last
								Name</label>
							<div class="col-lg-10">
								<form:input type="text" class="form-control" path="lastName"
									id="lastName" placeholder="Last Name" />
								<form:errors class="text-danger" path="lastName" />
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-lg-2 control-label">Email</label>
							<div class="col-lg-10">
								<form:input type="text" class="form-control" path="email"
									id="email" placeholder="email" />
								<form:errors class="text-danger" path="email" />
							</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">User Type</label>
							<div class="col-lg-10">
								<div class="radio">
									<label> <form:radiobutton path="userRoles"
											value="ROLE_SEEKER" checked="true" /> <form:errors class="text-danger"
											path="userRoles" />Job Seeker
									</label>
								</div>
								<div class="radio">
									<label> <form:radiobutton path="userRoles"
											value="ROLE_EMPLOYER" /> <form:errors class="text-danger"
											path="userRoles" />Employer
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="submit" class="btn btn-primary btn-block">Register</button>
								<button type="reset" class="btn btn-default btn-block">Reset</button>
							</div>
						</div>
					</fieldset>
				</form:form>
			</div>
		</div>
	</div>
</div>