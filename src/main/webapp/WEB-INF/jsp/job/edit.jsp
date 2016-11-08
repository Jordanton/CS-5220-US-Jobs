<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="animated fadeIn row">
	<div class="col-md-6 col-md-offset-3">
		<div class="panel panel-success">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;&nbsp;Edit
					Job
				</h3>
			</div>
			<div class="panel-body">
				<form:form id="editJobForm" modelAttribute="editJob"
					class="form-horizontal">
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
	</div>
</div>