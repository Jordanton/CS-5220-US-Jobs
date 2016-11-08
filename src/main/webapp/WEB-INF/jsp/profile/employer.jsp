<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row animated fadeIn">
	<div id="options-list" class="col-md-2 col-md-offset-2 list-group">

		<a id="viewProfile" class="list-group-item" href="#"><i
			class="fa fa-address-card" aria-hidden="true"></i>&nbsp;&nbsp;View
			Profile</a> <a id="profile" class="list-group-item" href="#"><i
			class="fa fa-adjust" aria-hidden="true"></i>&nbsp;&nbsp;Update
			Profile</a> <a id="company" class="list-group-item" href="#">Company
			Description</a> <a id="newJob" class="list-group-item" href="#"><i
			class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;&nbsp;Add a
			New Job Listing</a> <a id="job" class="list-group-item" href="#"> <i
			class="fa fa-tasks" aria-hidden="true"></i>&nbsp;&nbsp;Manage Job
			Listings
		</a>
	</div>
	<div id="detail" class="col-md-6">
		<div id="viewProfileDetail" class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-address-card" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;&nbsp;View
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
		<div id="profileDetail" class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-adjust" aria-hidden="true"></i>&nbsp;&nbsp;Update
					Profile
				</h3>
			</div>
			<div class="panel-body">
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
								<input type="email" name="email" class="form-control" id="email"
									placeholder="email" value="${user.email }">
							</div>
						</div>
						<div class="form-group">
							<label for="street" class="col-lg-2 control-label">Street</label>
							<div class="col-lg-10">
								<input type="text" name="street" class="form-control"
									id="street" placeholder="Street" value="${user.address.street}">
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
		<div id="companyDetail" class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">Company Description</h3>
			</div>
			<div class="panel-body">TODO</div>
		</div>
		<div id="newJobDetail" class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-plus-square" aria-hidden="true"></i>&nbsp;&nbspPost
					a New Job
				</h3>
			</div>
			<div class="panel-body">
				<form:form id="addJobForm" modelAttribute="newJob"
					class="form-horizontal" action="addJob.html?employerId=${user.id}"
					method="post">
					<fieldset>
						<div class="form-group">
							<label for="jobTitle" class="col-lg-2 control-label">Title</label>
							<div class="col-lg-10">
								<form:input type="text" class="form-control" path="jobTitle"
									id="jobTitle" name="jobTitle" placeholder="Job Title" />
							</div>
						</div>
						<div class="form-group">
							<label for="website" class="col-lg-2 control-label">Website</label>
							<div class="col-lg-10">
								<form:input type="text" class="form-control" path="website"
									id="website" name="website" placeholder="Job posting website" />
							</div>
						</div>
						<div class="form-group">
							<label for="location" class="col-lg-2 control-label">Location</label>
							<div class="col-lg-10">
								<form:input type="text" class="form-control" path="location"
									id="location" name="location" placeholder="Job Location" />
							</div>
						</div>
						<div class="form-group">
							<label for="description" class="col-lg-2 control-label">Description</label>
							<div class="col-lg-10">
								<form:textarea class="form-control" path="jobDescription"
									rows="3" id="jobDescription" name="jobDescription" />
							</div>
						</div>
						<div class="form-group">
							<label for="salary" class="col-lg-2 control-label">Salary</label>
							<div class="col-lg-10">
								<form:input type="text" class="form-control" path="salary"
									id="salary" name="salary" placeholder="Job Salary" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<a href="<c:url value='/user/profile.html' />"
									class="btn btn-default">Cancel</a>
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
						</div>
					</fieldset>
				</form:form>
			</div>
		</div>
		<div id="jobDetail" class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-tasks" aria-hidden="true"></i>&nbsp;&nbsp;Manage
					Job Listings
				</h3>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-hover">
					<tr class="info">
						<th>Title</th>
						<th></th>
					</tr>
					<c:forEach items="${user.jobsPosted}" var="jobPosting">
						<tr>
							<td>${jobPosting.jobTitle }</td>
							<td><a
								href="<c:url value='/application/jobApplications.html?jobId=${jobPosting.id }' />"
								role="button" class="btn btn-sm btn-primary"><i
									class="fa fa-shopping-basket" aria-hidden="true"></i>&nbsp;&nbsp;Applications
							</a> <c:choose>
									<c:when test="${jobPosting.opened}">
										<a
											href="toggleJob.html?employerId=${user.id}&jobId=${jobPosting.id }"
											role="button" class="btn btn-sm btn-warning"> <i
											class="fa fa-level-down" aria-hidden="true"></i>&nbsp;&nbsp;Close
										</a>
									</c:when>
									<c:otherwise>
										<a
											href="toggleJob.html?employerId=${user.id}&jobId=${jobPosting.id }"
											role="button" class="btn btn-sm btn-info"> <i
											class="fa fa-level-up" aria-hidden="true"></i>&nbsp;&nbsp;
											Open
										</a>
									</c:otherwise>
								</c:choose> <a
								href="editJob.html?employerId=${user.id}&jobId=${jobPosting.id}"
								role="button" class="btn btn-sm btn-success"> <i
									class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;&nbsp;Edit
							</a> <a
								href="deleteJob.html?employerId=${user.id}&jobId=${jobPosting.id }"
								role="button" class="btn btn-sm btn-danger"> <i
									class="fa fa-times-circle"></i>&nbsp;&nbsp;Delete
							</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
