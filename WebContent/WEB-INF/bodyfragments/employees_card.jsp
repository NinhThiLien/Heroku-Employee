<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="list-group">
	<section id="team" class="pb-5">
		<div class="row">
		<c:forEach items="${listPage}" var="employee">
			<div class="col-xs-12 col-sm-6 col-md-4">
	           <div class="image-flip">
	               <div class="mainflip">
	                   <div class="frontside">
	                       <div class="card">
	                           <div class="card-body text-center">
	                               <p>
										<c:choose>
											<c:when test="${empty employee.avatar}">
												<img src="<c:url value="/resources/img/no_avatar.jpg"/>" class="img-fluid" alt="avatar">
											</c:when>
											<c:otherwise>
												<img src="<c:url value="/resources/img/avatar/${employee.avatar}"/>" class="img-fluid" alt="avatar">
											</c:otherwise>
										</c:choose>
	                               </p>
	                               <h4 class="card-title">${employee.employeeId}</h4>
	                               <h4 class="card-title">${employee.employeeName}</h4>
	                               <p class="card-text">
	                               		<c:forEach items="${listDepartments}" var="dep">
	                               			<c:if test="${dep.departmentId == employee.departmentId}">
	                  	            			Department: ${dep.departmentName}
	                               			</c:if>
	                               		</c:forEach>
	                               		 | 
	                               		<c:forEach items="${listPositions}" var="posi">
	                               			<c:if test="${posi.positionId == employee.positionId}">
	                  	            			Position: ${posi.positionName}
	                               			</c:if>
	                               		</c:forEach>
	                               	</p>
	                           </div>
	                       </div>
	                   </div>
	                   <div class="backside">
	                       <div class="card">
	                           <div class="card-body text-center">
									<a href="${pageContext.request.contextPath}/employee/${employee.employeeId}" class="card-title">${employee.employeeName}</a>
									<ul class="card-text">
										<li>Birthday: ${employee.birthday}</li>
										<li>Email: ${employee.email}</li>
										<li>Address: ${employee.address}</li>
									</ul>
	                               
	                    			<div class="action">
			               				<button type="button" onclick="location.href='${pageContext.request.contextPath}/employee/${employee.employeeId}/edit'" class="but-action btn btn-primary btn-xs" title="Edit">
			                   				<span class="glyphicon glyphicon-pencil"></span>
			               				</button>
	              					</div>                              
	                           </div>
	                       </div>
	                   </div>
	               </div>
	           </div>
	       </div>  
		</c:forEach>
		</div>
	</section>
</div>
