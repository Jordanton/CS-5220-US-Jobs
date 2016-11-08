<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row animated fadeIn">
	<div id="options-list" class="list-group col-md-2 col-md-offset-2">

		<a id="viewProfile" class="list-group-item" href="#"><i
			class="fa fa-address-card" aria-hidden="true"></i>&nbsp;&nbsp;View
			Profile</a><a id="profile" class="list-group-item" href="#"><i
			class="fa fa-adjust" aria-hidden="true"></i>&nbsp;&nbsp;Update
			Profile</a>
	</div>
	<div id="detail" class="col-md-6">
		<div id="viewProfileDetail" class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-address-card" aria-hidden="true"></i>&nbsp;&nbsp;View
					${user.firstName} ${user.lastName }'s Profile
				</h3>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-hover">
					<tr>
						<th>ID</th>
						<th>Username</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Password</th>
					</tr>
					<tr>
						<td>${user.id}</td>
						<td>${user.username}</td>
						<td>${user.firstName}</td>
						<td>${user.lastName}</td>
						<td>${user.email}</td>
						<td>${user.password}</td>
					</tr>
				</table>
			</div>
		</div>
		<div id="profileDetail" class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-adjust" aria-hidden="true"></i>&nbsp;&nbsp;Update
					Profile
				</h3>
			</div>
			<div class="panel-body">
				<form id="editProfileAdmin" action="editProfile.html" method="post"
					class="form-horizontal">
					<form id="editProfileEmployer" action="editProfile.html"
						method="post" class="form-horizontal">
						<fieldset>
							<div class="form-group">
								<label for="username" class="col-lg-2 control-label">Username</label>
								<div class="col-lg-10">
									<input type="text" class="form-control" id="username"
										name="username" value="${user.username}" disabled>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword" class="col-lg-2 control-label">Password</label>
								<div class="col-lg-10">
									<input type="password" name="password" class="form-control"
										id="password" value="${user.password }" placeholder="Password">
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword" class="col-lg-2 control-label">Confirm
									Password</label>
								<div class="col-lg-10">
									<input type="password" name="confirm_password"
										class="form-control" id="confirm_password" value=""
										placeholder="Confirm password">
								</div>
							</div>
							<div class="form-group">
								<label for="email" class="col-lg-2 control-label">Email</label>
								<div class="col-lg-10">
									<input type="email" name="email" class="form-control"
										id="email" placeholder="email" value="${user.email }">
								</div>
							</div>
							<div class="form-group">
								<label for="street" class="col-lg-2 control-label">Street</label>
								<div class="col-lg-10">
									<input type="text" name="street" class="form-control"
										id="street" placeholder="Street"
										value="${user.address.street}">
								</div>
							</div>
							<div class="form-group">
								<label for="city" class="col-lg-2 control-label">City</label>
								<div class="col-lg-10">
									<input type="text" name="city" class="form-control" id="city"
										placeholder="City" value="${user.address.city }">
								</div>
							</div>
							<div class="form-group">
								<label for="state" class="col-lg-2 control-label">State</label>
								<div class="col-lg-10">
									<input type="text" name="state" class="form-control" id="state"
										placeholder="State" value="${user.address.state }">
								</div>
							</div>
							<div class="form-group">
								<label for="zip" class="col-lg-2 control-label">Zip</label>
								<div class="col-lg-10">
									<input type="text" name="zip" class="form-control" id="zip"
										placeholder="Zip code" value="${user.address.zip }">
								</div>
							</div>
							<div class="form-group">
								<label class="col-lg-2 control-label">Contact Sharing</label>
								<div class="col-lg-10">
									<div class="radio">
										<label> <c:choose>
												<c:when test="${!user.supressContact }">
													<input type="radio" checked name="supress"
														id="enableSharing" value="false">
												</c:when>
												<c:otherwise>
													<input type="radio" name="supress" id="enableSharing"
														value="false">
												</c:otherwise>
											</c:choose> Enabled
										</label>
									</div>
									<div class="radio">
										<label> <c:choose>
												<c:when test="${user.supressContact }">
													<input type="radio" checked name="supress"
														id="disableSharing" value="true">
												</c:when>
												<c:otherwise>
													<input type="radio" name="supress" id="disableSharing"
														value="true">
												</c:otherwise>
											</c:choose> Disabled
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="submit" class="btn btn-primary btn-block">Save</button>
									<button type="reset" class="btn btn-default btn-block">Reset</button>
								</div>
							</div>
						</fieldset>
					</form>
			</div>
		</div>
	</div>
</div>
