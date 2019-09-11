<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<ul class="list-group">
<c:forEach items="${listPage}" var="employee">
    <li class="list-group-item">
        <div class="row">
            <div class="col-xs-2 col-md-1">
				<c:choose>
					<c:when test="${empty employee.avatar}">
						<img src="<c:url value="/resources/img/no_avatar.jpg"/>" class="img-circle img-responsive" alt="avatar">
					</c:when>
					<c:otherwise>
						<img src="<c:url value="/resources/img/avatar/${employee.avatar}"/>" class="img-circle img-responsive" alt="avatar">
					</c:otherwise>
				</c:choose>
            </div>
            <div class="col-xs-10 col-md-11">
	            <div class="row" style="">
	            	<div class="name col-xs-10 col-md-10"><a href="${pageContext.request.contextPath}/employee/${employee.employeeId}">${employee.employeeId}</a></div>
	            	<div class="name col-xs-10 col-md-10"><a href="${pageContext.request.contextPath}/employee/${employee.employeeId}">${employee.employeeName}</a></div>
	            	<div class="col-xs-2 col-md-2">
	            		<div class="action pull-right">
			               <button type="button" onclick="location.href='${pageContext.request.contextPath}/employee/${employee.employeeId}/edit'" class="but-action btn btn-primary btn-xs" title="Edit">
			                   <span class="glyphicon glyphicon-pencil"></span>
			               </button>
	              		</div>
	          		</div>
	          	</div>
                <div class="mic-info">
                    <c:forEach items="${listDepartments}" var="dep">
	                	<c:if test="${dep.departmentId == employee.departmentId}">
	                  		<b style="color:LimeGreen">Department:</b> ${dep.departmentName} 
	                  		<b style="color:red">|</b>
	                    </c:if>
	                 </c:forEach> 
	                 <c:forEach items="${listPositions}" var="posi">
	                 	<c:if test="${posi.positionId == employee.positionId}">
	                  		<b style="color:LimeGreen">Position:</b> ${posi.positionName}
	                    </c:if>
	                 </c:forEach>
                </div>
            </div>
        </div>
    </li>
</c:forEach>
</ul>


