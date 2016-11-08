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
					<i class="fa fa-tasks" aria-hidden="true"></i>&nbsp;&nbsp;Job
					Posting Management
				</h3>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-hover">
					<tr class="info">
						<th>ID</th>
						<th>Job Title</th>
						<th>Employer</th>
						<th>Location</th>
						<th>Salary</th>
						<th>Website</th>
						<th>Operations</th>
					</tr>
					<c:forEach items="${jobPostings}" var="jobPosting">
						<tr>
							<td>${jobPosting.id}</td>
							<td>${jobPosting.jobTitle}</td>
							<td>${jobPosting.company.employerName}</td>
							<td>${jobPosting.location}</td>
							<td>${jobPosting.salary}</td>
							<td>${jobPosting.website}</td>
							<td><security:authorize access="hasRole('ROLE_ADMIN')">
									<a class="btn btn-info" role="button"
										href="view/${jobPosting.id}.html"><i
										class="fa fa-opencart" aria-hidden="true"></i>&nbsp;&nbsp;View</a>
									<c:if test="${jobPosting.enabled}">
										<a class="btn btn-danger" role="button"
											href="disable.html?id=${jobPosting.id}"><i
											class="fa fa-level-down" aria-hidden="true"></i>&nbsp;&nbsp;Disable</a>
									</c:if>
									<c:if test="${not jobPosting.enabled}">
										<a class="btn btn-success" role="button"
											href="enable.html?id=${jobPosting.id}"><i
											class="fa fa-level-up" aria-hidden="true"></i>&nbsp;&nbsp;Enable</a>
									</c:if>
								</security:authorize></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
