<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="row animated fadeIn">
	<div id="options-list" class="list-group col-md-2 col-md-offset-2">

		<a id="viewProfile" class="list-group-item" href="#"><i
			class="fa fa-address-card" aria-hidden="true"></i>&nbsp;&nbsp;View
			Profile</a><a id="profile" class="list-group-item" href="#"><i
			class="fa fa-adjust" aria-hidden="true"></i>&nbsp;&nbsp;Update
			Profile</a> <a id="resume" class="list-group-item" href="#"><i
			class="fa fa-newspaper-o" aria-hidden="true"></i>&nbsp;&nbsp;Manage
			Resumes</a> <a id="appJobs" class="list-group-item" href="#"> <i
			class="fa fa-check-square-o" aria-hidden="true"></i>&nbsp;&nbsp;Applied
			Jobs
		</a> <a id="favJobs" class="list-group-item" href="#"><i
			class="fa fa-star" aria-hidden="true"></i>&nbsp;&nbsp;Favorited Jobs</a>
		<a id="notifications" class="list-group-item" href="#"><i
			class="fa fa-bullhorn" aria-hidden="true"></i>&nbsp;&nbsp;Notifications</a>
	</div>
	<div id="detail" class="col-md-6">
		<div id="viewProfileDetail" class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-address-card" aria-hidden="true"></i>&nbsp;&nbsp;View
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
				<form id="editProfileSeeker" action="editProfile.html" method="post"
					class="form-horizontal">
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
		<div id="resumeDetail" class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-newspaper-o" aria-hidden="true"></i>&nbsp;&nbsp;
					Manage Resume (s)
				</h3>
			</div>
			<div class="panel-body">
				<form id="uploadForm" action="<c:url value='/resume/upload.html' />"
					method="post" enctype="multipart/form-data">
					<fieldset>
						<div class="form-group">
							<label class="control-label text-primary">Upload a Resume</label>
							<div class="input-group">
								<span class="input-group-addon">PDF, DOC, DOCX Format</span> <input
									type="file" name="resume" class="form-control" id="resume">
								<span class="input-group-btn">
									<button type="submit" class="btn btn-primary" type="button">
										<i class="fa fa-upload" aria-hidden="true"></i>&nbsp;&nbsp;Upload
									</button>
								</span>
							</div>
						</div>
					</fieldset>
				</form>

				<table class="table table-striped table-hover">
					<tr class="info">
						<th>Resume</th>
						<th>Upload Date</th>
						<th></th>
					</tr>
					<c:forEach items="${user.resumes}" var="resume">
						<tr>
							<td><a
								href="<c:url value='/resume/download.html?resumeId=${resume.id }' />">
									${resume.fileName } </a></td>
							<td><fmt:formatDate type="date" value="${resume.uploadDate}" /></td>
							<td><a
								href="<c:url value='/resume/delete.html?userId=${user.id }&resumeId=${resume.id }' />"
								role="button" class="btn btn-danger"><i
									class="fa fa-times-circle"></i>&nbsp;&nbsp;Delete</a></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div id="appJobsDetail" class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-check-square-o" aria-hidden="true"></i>&nbsp;&nbsp;Jobs
					Applied
				</h3>
			</div>
			<div class="panel-body">
				<div class="panel-body">
					<table class="table table-striped table-hover">
						<tr class="info">
							<th>Title</th>
							<th>Location</th>
							<th>Date Applied</th>
							<th></th>
						</tr>
						<c:forEach items="${user.applications}" var="application">
							<c:choose>
								<c:when test="${not empty application.jobApplied }">
									<tr>
										<td>${application.jobApplied.jobTitle}</td>
										<td>${application.jobApplied.location }</td>
										<td><fmt:formatDate type="date"
												value="${application.dateApplied}" /></td>
										<td><a
											href="<c:url value='/application/view.html?id=${application.id }' />"
											role="button" class="btn btn-success"><i
												class="fa fa-share-square-o" aria-hidden="true"></i>&nbsp;&nbsp;View
												Application</a></td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td class="text-danger">N/A (Job no longer exists)</td>
										<td>N/A</td>
										<td><fmt:formatDate type="date"
												value="${application.dateApplied}" /></td>
										<td><a
											href="<c:url value='/application/view.html?id=${application.id }' />"
											role="button" class="btn btn-success"><i
												class="fa fa-share-square-o" aria-hidden="true"></i>&nbsp;&nbsp;View
												Application</a></td>
									</tr>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div id="favJobsDetail" class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-star" aria-hidden="true"></i>&nbsp;&nbsp;Jobs
					Favorited
				</h3>
			</div>
			<div class="panel-body">
				<div class="panel-body">
					<table class="table table-striped table-hover">
						<tr class="info">
							<th>Title</th>
							<th>Salary</th>
							<th>Location</th>
							<th>Link</th>
						</tr>
						<c:forEach items="${user.favoritedJobs}" var="favoritedJob">
							<tr>
								<td>${favoritedJob.jobTitle }</td>
								<td>${favoritedJob.salary}</td>
								<td>${favoritedJob.location}</td>
								<td>${favoritedJob.website}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
		<div id="notificationsDetail" class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-bullhorn" aria-hidden="true"></i>&nbsp;&nbsp;Manage
					your Job Posting Notifications
				</h3>
			</div>
			<div class="panel-body">
				<div class="panel-body">
					<form action="editNotifications.html" method="post"
						class="form-horizontal">
						<fieldset>
							<div class="form-group">
								<label class="col-lg-2 control-label">Contact Sharing</label>
								<div class="col-lg-10">
									<div class="radio">
										<label> <c:choose>
												<c:when test="${user.notified }">
													<input type="radio" checked name="notify" value="true">
												</c:when>
												<c:otherwise>
													<input type="radio" name="notify" value="true">
												</c:otherwise>
											</c:choose> Enable
										</label>
									</div>
									<div class="radio">
										<label> <c:choose>
												<c:when test="${!user.notified }">
													<input type="radio" checked name="notify" value="false">
												</c:when>
												<c:otherwise>
													<input type="radio" name="notify" value="false">
												</c:otherwise>
											</c:choose> Disable
										</label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="keywords" class="col-lg-2 control-label">Job
									Keywords</label>
								<div class="col-lg-10">
									<input type="text" name="keywords" class="form-control"
										id="keywords" placeholder="comma separated keywords"
										value="${user.keywords }">
								</div>
							</div>
							<div class="form-group">
								<div class="col-lg-10 col-lg-offset-2">
									<button type="submit" class="btn btn-primary">Save</button>
									<button type="reset" class="btn btn-default">Reset</button>
								</div>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>