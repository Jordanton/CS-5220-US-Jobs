<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Job Posting ${jobPosting.jobTitle}</title>

<link href="../css/vendor/bower.css" rel="stylesheet" />
<link href="../css/us-jobs.css" rel="stylesheet" />
<link href="../bower_components/font-awesome/css/font-awesome.css"
	rel="stylesheet" />
</head>
<body>
	<jsp:include page="../header.jsp" />
	<div class="col-md-8 col-md-offset-2 page-header">
		<div class="row">
			<h1>${jobPosting.jobTitle }</h1>
			<h4 class="pull-left">${jobPosting.company.employerName}-${jobPosting.location }</h4>
			<h4 class="pull-right">
				Dated posted:
				<c:choose>
					<c:when test="${jobPosting.datePosted == null}">
						Not available
						</c:when>
					<c:otherwise>
						<fmt:formatDate type="date" value="${jobPosting.datePosted}" />
					</c:otherwise>
				</c:choose>
			</h4>
		</div>
	</div>
	<div class="row">
		<div class="col-md-6 col-md-offset-2">
			<div class="panel panel-success">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-industry" aria-hidden="true"></i>&nbsp;&nbsp;Job
						Description
					</h3>
				</div>
				<div class="panel-body">
					<p>${jobPosting.jobDescription }</p>
					<security:authorize access="hasRole('SEEKER') or hasRole('ADMIN')">
						<c:choose>
							<c:when test="${jobPosting.usersApplied.contains(currentUser)}">
								<button class="btn btn-info" disabled>
									<i class="fa fa-check-square-o" aria-hidden="true"></i>&nbsp;&nbsp;Applied
								</button>
							</c:when>
							<c:otherwise>
								<a
									href="apply.html?jobId=${jobPosting.id }"
									role="button" id="apply" class="btn btn-info"> <i
									class="fa fa-arrow-circle-right" aria-hidden="true"></i>&nbsp;&nbsp;Apply
								</a>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${jobPosting.usersFavorited.contains(currentUser)}">
								<a href="favorite.html?jobid=${jobPosting.id}" role="button"
									id="favorite" class="btn btn-warning"> <i
									class="fa fa-undo" aria-hidden="true"></i>
									&nbsp;&nbsp;Unfavorite
								</a>
							</c:when>
							<c:otherwise>
								<a href="favorite.html?jobid=${jobPosting.id}" role="button"
									id="favorite" class="btn btn-warning"> <i
									class="fa fa-star" aria-hidden="true"></i>&nbsp;&nbsp;Favorite
								</a>
							</c:otherwise>
						</c:choose>
					</security:authorize>
				</div>
			</div>
		</div>
		<div class="col-md-2">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-info-circle" aria-hidden="true"></i>&nbsp;&nbsp;Job
						Summary
					</h3>
				</div>
				<div class="panel-body">
					<h4>
						<strong>Company</strong>
					</h4>
					<p>${jobPosting.company.employerName }</p>
					<h4>
						<strong>Job Title</strong>
					</h4>
					<p>${jobPosting.jobTitle }</p>
					<h4>
						<strong>Location</strong>
					</h4>
					<p>${jobPosting.location }</p>
					<h4>
						<strong>Salary</strong>
					</h4>
					<p>
						<fmt:setLocale value="en_US" />
						<fmt:formatNumber value="${jobPosting.salary }" type="currency" />
					</p>
					<h4>
						<strong>Website</strong>
					</h4>
					<p>
						<a target="_blank" href="http://${jobPosting.website }">${jobPosting.website }</a>
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-8 col-md-offset-2">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">
						<i class="fa fa-commenting" aria-hidden="true"></i>&nbsp;&nbsp;Job
						Reviews
					</h3>
				</div>
				<div class="panel-body">
					<c:choose>
						<c:when test="${empty jobPosting.jobReviews}">
							<h4>There are no reviews for this job.</h4>
						</c:when>
						<c:otherwise>
							<c:forEach items="${jobPosting.jobReviews }" var="review">
								<h3>${review.userPosted.username}</h3>
								<h4>${review.jobReview }</h4>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					<security:authorize access="hasRole('SEEKER')">
						<c:choose>
							<c:when test="${currentUser.jobsReviewed.contains(jobPosting)}">
								<button class="btn btn-danger" disabled>
									<i class="fa fa-check-square-o" aria-hidden="true"></i>&nbsp;&nbsp;Reviewed
								</button>
							</c:when>
							<c:otherwise>
								<div class="col-lg-10">
									<textarea class="form-control" rows="4" id="reviewText"
										placeholder="Write your review here."></textarea>
								</div>
								<form class="form-btn-container" method="post"
									action="review.html?jobid=${jobPosting.id}">
									<button type="reset" id="review" class="btn btn-warning">
										<i class="fa fa-paper-plane-o" aria-hidden="true"></i>&nbsp;&nbsp;Review
									</button>
								</form>
							</c:otherwise>
						</c:choose>
					</security:authorize>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="../js/vendor/bower.js"></script>
<script src="../js/job-posting.js"></script>

</html>