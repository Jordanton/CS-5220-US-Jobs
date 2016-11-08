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
					Application
				</h3>
			</div>
			<div class="panel-body">
				<h4>
					<strong>Name</strong>
				</h4>
				<p>${application.firstName }${application.lastName }</p>
				<h4>
					<strong>Email</strong>
				</h4>
				<p>${application.email }</p>
				<h4>
					<strong>Phone Number</strong>
				</h4>
				<p>${application.phoneNumber }</p>
				<h4>
					<strong>Cover Letter</strong>
				</h4>
				<p>${application.coverLetter}</p>
				<h4>
					<strong>Email</strong>
				</h4>
				<p>${application.email }</p>
				<h4>
					<strong>Resume</strong>
				</h4>
				<p>
					<c:choose>
						<c:when test="${not empty application.resume.id }">
							<a
								href="<c:url value='/resume/download.html?resumeId=${application.resume.id}' />"
								role="button" class="btn btn-primary"><i
								class="fa fa-download" aria-hidden="true"></i>&nbsp;&nbsp;Download</a>
						</c:when>
						<c:otherwise>
							<p class="text-danger">Resume submitted for this application
								doesn't exist.</p>
						</c:otherwise>
					</c:choose>
				</p>
			</div>
		</div>
	</div>
</div>