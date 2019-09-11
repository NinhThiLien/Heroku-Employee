<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ page import="com.hrsmanager.model.*" %>

<div class="container">
    <div class="row">
  		<div class="col-sm-10"><h1 class="text-center">${emp.employeeName}</h1></div>
    </div><br><br>
    <div class="row">
    	<form id="empForm" action="${fn:replace(requestScope['javax.servlet.forward.request_uri'],'edit','update')}?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	  		<div class="col-sm-3"><!--left col-->
				<div class="text-center">
					<c:choose>
						<c:when test="${empty emp.avatar}">
							<img src="<c:url value="/resources/img/no_avatar.jpg"/>" id="imgInp" class="avatar img-circle img-thumbnail" alt="avatar">
						</c:when>
						<c:otherwise>
							<img src="<c:url value="/resources/img/avatar/${emp.avatar}"/>" id="imgInp" class="avatar img-circle img-thumbnail" alt="avatar">
						</c:otherwise>
					</c:choose>
					<h6>Upload a different photo...</h6>
					<input name="avt" id="avt" type="file" class="text-center center-block file-upload" accept="image/*">
				</div>
			</div><!--/col-3-->
	    	
	    	<div class="col-sm-9">
	        	<ul class="nav nav-tabs">
					<li class="active"><h4>Profile</h4></li>
	             </ul>
	             
	             <div class="tab-content">
	             	<div class="tab-pane active">
	             	
	             		<div class="form-horizontal">
	             			
	             			<c:if test="${error != null}">
		             			<div class="form-group form-margin">
			             			<div class="col-sm-4"></div>  
			             			<div class="col-sm-8">
			             				<span class="error">${error}</span>
			             			</div>
			             		</div>
		             		</c:if>
	             		
		             		<div class="form-group form-margin">
		             			<label class="col-sm-4 control-label" for="id">EmployeeID</label>  
		             			<div class="col-sm-5">
		             				<h4 class="">
		             					${emp.employeeId}
		             				</h4>
		             			</div>
		             		</div>
		             		
		             		<div class="form-group">
		             			<label class="col-sm-4 control-label" for="name">
		             				Name (Full name) <span style="color:red;">*</span>
		             			</label>  
		             			<div class="col-sm-8">
		             				<div class="input-group">
		             					<span class="icon input-group-addon">
		             						<i class="fa fa-user"></i>
		             					</span>
		             					<input id="name" name="name" type="text" value="${emp.employeeName}" class="form-control input-md">
		             				</div>
		             			</div>
		             		</div>
		             		
		             		<div class="form-group">
		             			<label class="col-sm-4 control-label" for="bod">
		             				Date Of Birth <span style="color:red;">*</span>
		             			</label>  
		             			<div class="col-sm-5">
		             				<div class="input-group">
		             					<div class="icon input-group-addon">
		             						<i class="fa fa-birthday-cake"></i>
		             					</div>
		             					<input id="dob" name="dob" type="date" value="${emp.birthday}" class="form-control input-md">
		             				</div>
		             			</div>
		             		</div>
		             		
		             		<div class="form-group">
		             		<% EmployeeInfo emp_edit = (EmployeeInfo)session.getAttribute("emp_edit");
		             		String gender = emp_edit.getGender();%>
								<label class="col-sm-4 control-label" for="gender">
									Gender <span style="color:red;">*</span>
								</label>
								<div class="col-sm-5"> 
									<label class="radio-inline" for="male">
										<input type="radio" name="gender" id="male" value="Male" <%if(gender.equals("Male")){out.write("checked='checked'");} %>> Male
									</label> 
									<label class="radio-inline" for="female">
										<input type="radio" name="gender" id="female" value="Female" <%if(emp_edit.getGender().equals("Female")){out.write("checked='checked'");} %>> Female
									</label>
									<label class="radio-inline" for="other">
										<input type="radio" name="gender" id="other" value="Other" <%if(emp_edit.getGender().equals("Other")){out.write("checked='checked'");} %>> Other
									</label>
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-4 control-label col-xs-12" for="address">Address</label>  
								<div class="col-sm-5">
		             				<div class="input-group">
		             					<div class="icon input-group-addon">
		             						<i class="fa fa-map-marker"></i>
		             					</div>
		             					<input id="address" name="address" type="text" value="${emp.address}" class="form-control input-md">
		             				</div>
		             			</div>
							</div>
		             		
		             		<div class="form-group">
		             			<label class="col-sm-4 control-label" for="phone">Phone number</label>  
		             			<div class="col-sm-5">
		             				<div class="input-group">
		             					<div class="icon input-group-addon">
		             						<i class="fa fa-phone"></i>
		             					</div>
		             					<input id="phone" name="phone" type="text" value="${emp.phone}" class="form-control input-md">
		             				</div>
		             			</div>
		             		</div>
		             		
		             		<div class="form-group">
		             			<label class="col-sm-4 control-label" for="email">
		             				Email Address <span style="color:red;">*</span>
		             			</label>  
		             			<div class="col-sm-5">
		             				<div class="input-group">
		             					<div class="icon input-group-addon">
		             						<i class="fa fa-envelope-o"></i>
		             					</div>
		             					<input id="email" name="email" type="text" value="${emp.email}" class="form-control input-md"
		             						data-rule-checkemail="true">
		             				</div>
		             			</div>
		             		</div>
		             		
		             		<div class="form-group">
		             			<label class="col-sm-4 control-label" for="std">
		             				Started Day <span style="color:red;">*</span>
		             			</label>
		             			<div class="col-sm-5">
		             				<div class="input-group">
		             					<div class="icon input-group-addon">
		             						<i class="fa fa-calendar"></i>
		             					</div>
		             					<input id="std" name="std" type="date" value="${emp.started_day}" class="form-control input-md">
		             				</div>
		             			</div>
		             		</div>
	             		
	 	             		<div class="form-group">
		             			<label class="col-sm-4 control-label" for="status">
		             				Status <span style="color:red;">*</span>
		             			</label>  
		             			<div class="col-sm-5">
		             				<div class="input-group">
		             					<div class="icon input-group-addon">
		             						<i class="fa fa-user"></i>
		             					</div>
		             					<select id="status_id" name="status_id" class="form-control input-md">
		             						<c:forEach items="${listStatuses}" var="status">
		             							<c:choose>
		             								<c:when test="${emp.statusId == status.statusId}">
		             									<option selected value="${status.statusId}">${status.statusName}</option>
		             								</c:when>
		             								<c:otherwise>
		             									<option value="${status.statusId}">${status.statusName}</option>
		             								</c:otherwise>
												</c:choose>
		             						</c:forEach>
		             					</select>
		             				</div>
		             			</div>
		             		</div>
		             		
		             		<ul class="nav nav-tabs">
								<li class="active"><h4>Role</h4></li>
				            </ul>
		             		          			             		
	 	             		<div class="form-group form-margin">
		             			<label class="col-sm-4 control-label" for="role">
		             				Role <span style="color:red;">*</span>
		             			</label>  
		             			<div class="col-sm-5">
		             				<div class="input-group">
		             					<div class="icon input-group-addon">
		             						<i class="fa fa-user-times"></i>
		             					</div>
		             					<select id="role_id" name="role_id" class="form-control input-md">
		             						<c:forEach items="${listRoles}" var="role">
		             							<c:choose>
		             								<c:when test="${emp.roleId == role.roleId}">
		             									<option selected value="${role.roleId}">${role.roleName}</option>
		             								</c:when>
		             								<c:otherwise>
		             									<option value="${role.roleId}">${role.roleName}</option>
		             								</c:otherwise>
												</c:choose>
	             							</c:forEach>
		             					</select>
		             				</div>
		             			</div>
		             		</div>
		             		
		             		<ul class="nav nav-tabs">
								<li class="active"><h4>Position</h4></li>
				            </ul>
		             		     		
	 	             		<div class="form-group form-margin">
		             			<label class="col-sm-4 control-label" for="department">
		             				Department <span style="color:red;">*</span>
		             			</label>  
		             			<div class="col-sm-5">
		             				<div class="input-group">
		             					<div class="icon input-group-addon">
		             						<i class="fa fa-users"></i>
		             					</div>
		             					<select id="department_id" name="department_id" class="form-control input-md">
		             						<c:forEach items="${listDepartments}" var="department">
		             							<c:choose>
		             								<c:when test="${emp.departmentId == department.departmentId}">
		             									<option selected value="${department.departmentId}">${department.departmentName}</option>
		             								</c:when>
		             								<c:otherwise>
		             									<option value="${department.departmentId}">${department.departmentName}</option>
		             								</c:otherwise>
												</c:choose>
	             							</c:forEach>
		             					</select>
		             				</div>
		             			</div>
		             		</div>
		             		          			             		
	 	             		<div class="form-group">
		             			<label class="col-sm-4 control-label" for="position">
		             				Position <span style="color:red;">*</span>
		             			</label>  
		             			<div class="col-sm-5">
		             				<div class="input-group">
		             					<div class="icon input-group-addon">
		             						<i class="fa fa-user"></i>
		             					</div>
		             					<select id="position_id" name="position_id" class="form-control input-md">
		             						<c:forEach items="${listPositions}" var="position">
		             							<c:choose>
		             								<c:when test="${emp.positionId == position.positionId}">
		             									<option selected value="${position.positionId}">${position.positionName}</option>
		             								</c:when>
		             								<c:otherwise>
		             									<option value="${position.positionId}">${position.positionName}</option>
		             								</c:otherwise>
												</c:choose>
	             							</c:forEach>
		             					</select>
		             				</div>
		             			</div>
		             		</div>
		             		
		             		<div class="form-group form-margin">
		             			<label class="col-sm-4 control-label" ></label>  
		             			<div class="col-sm-5">
		             				<input type="submit" name="submit" id="submit" tabindex="4" class="btn btn-success" value="Update">
		             				<a onclick="window.history.back()" class="btn btn-danger">Cancel</a>
		             			</div>
		             		</div>
		             	</div>
	             	</div>
	             </div><!--/tab-content-->
			</div><!--/col-9-->
		</form>
	</div><!--/row-->
</div>
