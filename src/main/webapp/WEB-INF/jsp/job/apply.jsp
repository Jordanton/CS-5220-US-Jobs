<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="animated fadeIn row">
	<div class="col-md-6 col-md-offset-3">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">Application for
					${application.jobApplied.jobTitle }</h3>
			</div>
			<div class="panel-body">
				<form:form id="applicationForm" modelAttribute="application"
					class="form-horizontal">
					<fieldset>
						<div class="form-group">
							<label for="name" class="col-lg-2 control-label">First
								Name</label>
							<div class="col-lg-10">
								<form:input type="text" class="form-control" path="firstName"
									id="firstName" name="firstName" placeholder="First Name"
									value="${application.seeker.firstName }" />
							</div>
						</div>
						<div class="form-group">
							<label for="name" class="col-lg-2 control-label">Last
								Name</label>
							<div class="col-lg-10">
								<form:input type="text" class="form-control" path="lastName"
									id="lastName" name="lastName" placeholder="Last Name"
									value="${application.seeker.lastName }" />
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-lg-2 control-label">Email</label>
							<div class="col-lg-10">
								<form:input type="text" class="form-control" path="email"
									id="email" name="email" placeholder="Email Address"
									value="${application.seeker.email }" />
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-lg-2 control-label">Phone
								Number</label>
							<div class="col-lg-10">
								<form:input type="text" class="form-control" path="phoneNumber"
									id="phoneNumber" name="phoneNumber" placeholder="Phone Number"
									value="${application.seeker.phones[0]}" />
							</div>
						</div>
						<div class="form-group">
							<label for="coverLetter" class="col-lg-2 control-label">Cover
								Letter</label>
							<div class="col-lg-10">
								<form:textarea class="form-control" path="coverLetter" rows="5"
									id="coverLetter" placeholder="Optional" />
							</div>
						</div>
						<div class="form-group">

							<div class="col-lg-10 col-lg-offset-2">
								<button class="btn btn-primary" data-toggle="modal"
									data-target="#upload">
									<i class="fa fa-plus-square-o" aria-hidden="true"></i>&nbsp;&nbsp;Add
									a New Resume
								</button>
							</div>
						</div>
						<div class="form-group">
							<label for="select" class="col-lg-2 control-label">Select
								a Resume</label>
							<div class="col-lg-10">
								<form:select id="resume" name="resume" path="resume"
									class="form-controller" items="${resumes}" itemLabel="fileName" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-lg-10 col-lg-offset-2">
								<button type="submit" id="apply" class="btn btn-info">Apply</button>
								<button onclick="goBack()" class="btn btn-danger">Cancel</button>
							</div>
						</div>
					</fieldset>
				</form:form>
			</div>
		</div>
	</div>
</div>

<div id="upload" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title url">Upload a New Resume</h4>
			</div>
			<div class="modal-body">
				<form id="uploadForm" action="uploadResume.html" method="post"
					enctype="multipart/form-data">
					<input type="hidden" name="jobId"
						value=${application.jobApplied.id } />
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
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					Close</button>
			</div>
		</div>
	</div>
</div>

<script>
	function goBack() {
		window.history.back();
	}
</script>
