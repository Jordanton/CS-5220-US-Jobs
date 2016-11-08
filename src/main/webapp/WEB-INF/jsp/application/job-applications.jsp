<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="animated fadeIn row">
	<div class="col-md-8 col-md-offset-2">
		<div class="panel panel-info">
			<div class="panel-heading">
				<h3 class="panel-title">
					<i class="fa fa-tasks" aria-hidden="true"></i>&nbsp;&nbsp;Applications
					for ${applications[0].jobApplied.jobTitle }
				</h3>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-hover">
					<tr class="info">
						<th>Date Applied</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>Phone Number</th>
						<th>Cover Letter</th>
						<th>Resume</th>
					</tr>
					<c:forEach items="${applications}" var="application">
						<tr>
							<td><fmt:formatDate type="date"
									value="${application.dateApplied}" /></td>
							<td>${application.firstName}</td>
							<td>${application.lastName}</td>
							<td>${application.email}</td>
							<td>${application.phoneNumber}</td>
							<td><p style="display: none;">${application.coverLetter }</p>
								<button onclick='initModal(this)' class="btn btn-info"
									data-toggle="modal" data-target="#coverLetter">
									<i class="fa fa-share-square-o" aria-hidden="true"></i>&nbsp;&nbsp;View
								</button></td>
							<td><c:choose>
									<c:when test="${empty application.resume.id }">
										<p class="text-danger">This resume has been removed.</p>
									</c:when>
									<c:otherwise>
										<a
											href="<c:url value='/resume/download.html?resumeId=${application.resume.id}' />"
											role="button" class="btn btn-primary"><i
											class="fa fa-download" aria-hidden="true"></i>&nbsp;&nbsp;Download</a>
									</c:otherwise>
								</c:choose></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>

<div id="coverLetter" class="modal fade" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title url">Cover Letter</h4>
			</div>
			<div class="modal-body">
				<p id="coverLetterText"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">
					Close</button>
			</div>
		</div>
	</div>
</div>

<script>
	function initModal(object) {
		var coverLetter = $(object).prev().html(); //hacky solution.
		$("#coverLetterText").html(coverLetter);
	}
</script>
