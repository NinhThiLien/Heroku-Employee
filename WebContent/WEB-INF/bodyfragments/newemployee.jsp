<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 

<div class="container">
    <div class="row">
  		<div class="col-sm-10"><h1 class="text-center">Create Employee</h1></div>
    </div><br><br>
    <div class="row">
    	
    	<form id="empForm" action="${pageContext.request.contextPath}/create?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
	  		<div class="col-sm-3"><!--left col-->
				<div class="text-center">
					<img src="<c:url value="/resources/img/no_avatar.jpg"/>" id="imgInp" class="avatar img-circle img-thumbnail" alt="avatar">
					<h6>Upload a photo...</h6>
					<input name="avt" id="avt" type="file" class="text-center center-block file-upload" accept="image/*">
				</div>
			</div><!--/col-3-->
	    	
	    	<div class="col-sm-9">
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
		             			<label class="col-sm-4 control-label" for="EmployeeID">
		             				EmployeeID <span style="color:red;">*</span>
		             			</label>  
		             			<div class="col-sm-5">
		             				<div class="input-group">
		             					<div class="input-group-addon">
		             						<i class="fa fa-id-card"></i>
		             					</div>
		             					<input id="id" type="text" name="id" placeholder="EmployeeID" value="${id}"class="form-control input-md">
		             				</div>
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
		             					<input id="name" name="name" type="text" value="${name}" class="form-control input-md">
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
		             					<input id="dob" name="dob" type="date" value="${dob}" placeholder="Date Of Birth" class="form-control input-md">
		             				</div>
		             			</div>
		             		</div>
		             		
		             		<div class="form-group">
								<label class="col-sm-4 control-label" for="gender">
									Gender <span style="color:red;">*</span>
								</label>
								<div class="col-sm-5"> 
									<label class="radio-inline" for="male">
										<input type="radio" name="gender" id="male" value="Male" checked="checked"> Male
									</label> 
									<label class="radio-inline" for="female">
										<input type="radio" name="gender" id="female" value="Female"> Female
									</label>
									<label class="radio-inline" for="other">
										<input type="radio" name="gender" id="other" value="Other"> Other
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
		             					<input id="address" name="address" type="text" value="${address}" placeholder="Address" class="form-control input-md">
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
		             					<input id="phone" name="phone" type="text" value="${phone}" placeholder="Phone number" class="form-control input-md">
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
		             					<input id="email" name="email" type="text" value="${email}" placeholder="Email Address" class="form-control input-md"
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
		             					<input id="std" name="std" type="date" value="${std}" placeholder="Started Day" class="form-control input-md">
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
		             						<option disabled selected value=""> -- select an option -- </option>
		             						<c:if test="${status_id != null }">
		             							<c:forEach items="${listStatuses}" var="status">
		             								<c:if test="${status_id == status.statusId}">
		             									<option disabled selected value="${status_id}">${status.statusName}</option>
		             								</c:if>
		             							</c:forEach>
		             							<c:forEach items="${listStatuses}" var="status">
		             								<c:if test="${status_id != status.statusId}">
		             									<option value="${status.statusId}">${status.statusName}</option>
		             								</c:if>
		             							</c:forEach>
		             						</c:if>
		             						<c:if test="${status_id == null }">		             							
		             							<c:forEach items="${listStatuses}" var="status">
		             								<option value="${status.statusId}">${status.statusName}</option>
		             							</c:forEach>
		             						</c:if>
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
		             						<option disabled selected value=""> -- select an option -- </option>
		             						<c:if test="${role_id != null }">
		             							<c:forEach items="${listRoles}" var="role">
		             								<c:if test="${role_id == role.roleId}">
		             									<option disabled selected value="${role_id}">${role.roleName}</option>
		             								</c:if>
		             							</c:forEach>
		             							<c:forEach items="${listRoles}" var="role">
		             								<c:if test="${role_id != role.roleId}">
		             									<option value="${role.roleId}">${role.roleName}</option>
		             								</c:if>
	             								</c:forEach>
		             						</c:if>
		             						<c:if test="${role_id == null }">
		             							<c:forEach items="${listRoles}" var="role">
		             								<option value="${role.roleId}">${role.roleName}</option>
	             								</c:forEach>
	             							</c:if>
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
		             						<option disabled selected value=""> -- select an option -- </option>
		             						<c:if test="${department_id != null }">
		             							<c:forEach items="${listDepartments}" var="department">
		             								<c:if test="${department_id == department.departmentId}">
		             									<option selected value="${department_id}">${department.departmentName}</option>
		             								</c:if>
		             							</c:forEach>
		             							<c:forEach items="${listDepartments}" var="department">
		             								<c:if test="${department_id != department.departmentId}">
		             									<option value="${department.departmentId}">${department.departmentName}</option>
		             								</c:if>
	             								</c:forEach>
		             						</c:if>
		             						<c:if test="${department_id == null }">		             			
		             							<c:forEach items="${listDepartments}" var="department">
		             								<option value="${department.departmentId}">${department.departmentName}</option>
	             								</c:forEach>
	             							</c:if>
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
		             						<option disabled selected value=""> -- select an option -- </option>
		             						<c:if test="${position_id != null }">             							
		             							<c:forEach items="${listPositions}" var="position">
		             								<c:if test="${position_id == position.positionId}">
		             									<option selected value="${position_id}">${position.positionName}</option>
		             								</c:if>
		             							</c:forEach>
		             							<c:forEach items="${listPositions}" var="position">
		             								<c:if test="${position_id != position.positionId}">
		             									<option value="${position.positionId}">${position.positionName}</option>
		             								</c:if>
	             								</c:forEach>
		             						</c:if>
		             						<c:if test="${position_id == null }">
		             							<c:forEach items="${listPositions}" var="position">
		             								<option value="${position.positionId}">${position.positionName}</option>
	             								</c:forEach>
	             							</c:if>
		             					</select>
		             				</div>
		             			</div>
		             		</div>
		             		
		             		<div class="form-group form-margin">
		             			<label class="col-sm-4 control-label" ></label>  
		             			<div class="col-sm-5">
		             				<input type="submit" class="btn btn-success" value="Submit">
	             					<a onclick="window.history.back()" class="btn btn-danger">
	             						<span class="glyphicon glyphicon-remove-sign"></span> Cancel
	             					</a>
		             			</div>
		             		</div>
		             	</div>
	             	</div>
	             </div><!--/tab-content-->
			</div><!--/col-9-->
		</form>
	</div><!--/row-->
</div>