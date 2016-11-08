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
					<i class="fa fa-users" aria-hidden="true"></i>&nbsp;&nbsp;User
					Management
				</h3>
			</div>
			<div class="panel-body">
				<table class="table table-striped table-hover">
					<tr class="info">
						<th>ID</th>
						<th>Username</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Email</th>
						<th>User Roles</th>
						<th>Operations</th>
					</tr>
					<c:forEach items="${users}" var="user">
						<tr>
							<td>${user.id}</td>
							<td>${user.username}</td>
							<td>${user.firstName}</td>
							<td>${user.lastName}</td>
							<td>${user.email}</td>
							<td>${user.userRoles}</td>
							<td><security:authorize access="hasRole('ROLE_ADMIN')">

									<a class="btn btn-info" role="button"
										href="view/${user.id}.html"><i class="fa fa-street-view"
										aria-hidden="true"></i>&nbsp;&nbsp; View</a>
									<a class="btn btn-success" role="button"
										href="edit.html?id=${user.id}"><i
										class="fa fa-pencil-square-o" aria-hidden="true"></i>&nbsp;&nbsp;Edit</a>
									<c:if test="${user.enabled}">
										<a class="btn btn-danger" role="button"
											href="disable.html?id=${user.id}"><i
											class="fa fa-level-down" aria-hidden="true"></i>&nbsp;&nbsp;Disable</a>
									</c:if>
									<c:if test="${not user.enabled}">
										<a class="btn btn-warning" role="button"
											href="enable.html?id=${user.id}"><i
											class="fa fa-level-up" aria-hidden="true"></i>&nbsp;&nbsp;Enable</a>
									</c:if>

								</security:authorize></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<security:authorize access="hasRole('ROLE_ADMIN')">
			<p>
				<a class="btn btn-primary" role="button" href="add.html"><i
					class="fa fa-user-plus" aria-hidden="true"></i>&nbsp;&nbsp; Add New
					User</a>
			</p>
		</security:authorize>
	</div>
</div>
