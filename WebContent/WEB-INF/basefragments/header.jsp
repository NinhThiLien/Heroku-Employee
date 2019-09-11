<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<nav>
	<div class="row">
		<div class="col-md-2">
			<img src="<c:url value="/resources/img/HRSEM.png"/>" class="logo">
		</div>
		<div class="col-md-9">
			<div class="pull-right">
				<ul class="list-inline" style="margin: 7px 0px;">
					<li><h4>Welcome</h4></li>
					<li>
					<c:if test="${emp_login != null }">
						<a href="${pageContext.request.contextPath}/employee/${emp_login.employeeId}">
							<c:choose>
								<c:when test="${empty emp_login.avatar}">
									<img src="<c:url value="/resources/img/no_avatar.jpg"/>" class="header-avatar img-circle img-thumbnail" alt="avatar">
								</c:when>
								<c:otherwise>
									<img src="<c:url value="/resources/img/avatar/${emp_login.avatar}"/>" class="header-avatar img-circle img-thumbnail" alt="avatar">
								</c:otherwise>
							</c:choose>
						</a>
					</c:if>
					</li>
				</ul>
			</div>
		</div>
		
		<div class="col-md-1" style="padding: 0px 30px;">
			<c:if test="${emp_login != null }">
	            <div class="dropdown pull-right">
					<div id="nav-icon2">
						<span></span>
						<span></span>
						<span></span>
						<span></span>
						<span></span>
						<span></span>
					</div>
					<ul class="dropdown-menu pull-right" role="menu">
						<c:if test="${role == 'ADMIN'}">
							<li><a href="${pageContext.request.contextPath}/employees/1">Employee Management</a></li>
							<li class="divider"></li>
						</c:if>
						<li><a href="${pageContext.request.contextPath}/employee/${emp_login.employeeId}">Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/employee/${emp_login.employeeId}/change_password">Change Password</a></li>
						<li class="divider"></li>
						<li><a href="${pageContext.request.contextPath}/logout">Logout</a></li>
					</ul>
	            </div>
			</c:if>
		</div>
	</div>
</nav>
