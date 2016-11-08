<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="animated fadeIn row">
	<div class="col-md-8 col-md-offset-2 jumbotron">
		<h1>U.S. Jobs</h1>
		<p>We all go to college in the hopes of landing good and
			high-paying jobs. Unfortunately, there are too many job websites out
			there such as Monster and CareerBuilder that mostly contain
			employment agencies listings designed to pool for candidates instead
			of bonafide employers listing real job openings. There are just too
			many unemployed recent college grads. Therefore, we want to create a
			website where recent college grads and college students can easily
			connect with bonafide employers with legit job openings without
			jumping through hoops.</p>
		<p>
			<a class="btn btn-primary btn-lg">Learn more</a>
		</p>
	</div>
</div>

<c:choose>
	<c:when test="${not empty searchBar}">
		<jsp:include page="search.jsp" />
	</c:when>

	<c:otherwise>
		<div class="animated fadeIn row">
			<div class="col-md-8 col-md-offset-2">
				<h1 class="text-warning">Trending Jobs</h1>
				<hr />
				<div class="list-group">
					<c:forEach items="${jobPostings}" var="jobPosting">
						<a href="job/post.html?jobid=${jobPosting.id}"
							class="list-group-item">
							<h4 class="list-group-item-heading">${jobPosting.jobTitle}</h4>
							<h6>${jobPosting.company.employerName}</h6>
							<div class="job-listing-preview">
								<p class="list-group-item-text">${jobPosting.jobDescription }</p>
							</div>
						</a>
					</c:forEach>
				</div>
				<div class="btn-container row pull-left">
					<button class="btn btn-singleton btn-info">Show More</button>
				</div>
			</div>
		</div>
	</c:otherwise>
</c:choose>
