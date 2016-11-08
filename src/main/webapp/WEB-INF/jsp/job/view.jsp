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
					Job Posting
				</h3>
			</div>
			<div class="panel-body">
				<h4>
					<strong>Id</strong>
				</h4>
				<p>${jobPosting.id }</p>
				<h4>
					<strong>Title</strong>
				</h4>
				<p>${jobPosting.jobTitle }</p>
				<h4>
					<strong>Description</strong>
				</h4>
				<p>${jobPosting.jobDescription }</p>
				<h4>
					<strong>Employer</strong>
				</h4>
				<p>${jobPosting.company.employerName}</p>
				<h4>
					<strong>Location</strong>
				</h4>
				<p>${jobPosting.location }</p>
				<h4>
					<strong>Salary</strong>
				</h4>
				<p>${jobPosting.salary }</p>
				<h4>
					<strong>Website</strong>
				</h4>
				<p>${jobPosting.website }</p>
			</div>
		</div>
	</div>
</div>