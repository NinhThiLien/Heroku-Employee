<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<form action="${pageContext.request.contextPath}/ordertype" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="controls controls-row">
				<select name="ordertype">
					<c:forEach items="${sorts}" var="sort">
		             	<c:choose>
		             		<c:when test="${sort == sortkey}">
		             			<option selected value="${sort}">${sort}</option>
		             		</c:when>
		             		<c:otherwise>
		             			<option value="${sort}">${sort}</option>
		             		</c:otherwise>
						</c:choose>
	             	</c:forEach>
					<!-- <option value="1">ASC Users</option>
					<option value="2">DESC Users</option>
					<option value="3">ASC Departments</option>
					<option value="4">DESC Departments</option> -->
				</select>
				<button type="submit" class="btn btn-warning">Sort</button>
			</div>
			</form>
		</div>
       
        <div class="col-md-4">
			<div id="custom-search-input">
                <div class="input-group">
                    <input type="text" class="search-query form-control" placeholder="Search" />
                    <span class="input-group-btn">
                        <button class="btn btn-danger" type="button">
                            <span class=" glyphicon glyphicon-search"></span>
                        </button>
                    </span>
                </div>
            </div>
        </div>
        
        <div class="col-md-1">
	        <button type="button" class="button2" onclick="location.href='${pageContext.request.contextPath}/employee/new'" title="Add">
	            <span class="glyphicon glyphicon-plus"></span> Add
	        </button>
        </div>
        
		<form action="${pageContext.request.contextPath}/type" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="col-md-1 text-right" style="padding:0px;">
		        <button type="submit" name="type_view" value="list" class="show-button">
					<img src="<c:url value="/resources/img/button_list.png"/>" alt="" width="42" height="42"/>
				</button>
		        <button type="submit" name="type_view" value="card" class="show-button">
					<img src="<c:url value="/resources/img/button_card.png"/>" alt="" width="42" height="42">
				</button>
	        </div>
        </form>
	</div>
	
    <div class="row" style="margin-top:50px;">
        <div class="panel panel-default widget">
            <div class="panel-heading">
                <span class="glyphicon glyphicon-user"></span>
                <h3 class="panel-title">
                    All Users</h3>
                <span class="label label-info">
                    ${total}</span>
            </div>
            <div class="panel-body">
            	<%if ((String) session.getAttribute("type_view")==null||(String) session.getAttribute("type_view")=="card"){ %>
                	<%@include file="employees_card.jsp" %>
                <%} else{%>
                	<%@include file="employees_list.jsp" %>
                	<%} %>
            </div>
        </div>
    </div>
    
    <div>
	<% int totalPage = (int)session.getAttribute("totalPage");
		int back = 0;
		int next = 0;
		boolean has_next = false;
		int page_cur = (int)request.getAttribute("page_pre");
		if(totalPage<=3){
			for (int pageId=1; pageId<= totalPage; pageId++){%>
			<button class="btn btn-default"><a href="${pageContext.request.contextPath}/employees/<%=pageId%>"><i><%=pageId%></i></a></button>
			<%}
		}else{
		//Nut Back
		if (page_cur != 1){
			back =page_cur-1;
		%>
			<button class="btn btn-default"><a href="${pageContext.request.contextPath}/employees/1"><i>First</i></a></button>
			<button class="btn btn-default"><a href="${pageContext.request.contextPath}/employees/<%=back%>"><i>Back</i></a></button>
		<%} else {
			back = 1;
		}
		//Hien Thi Trang
		if(page_cur+2 < totalPage){
			for (int pageId=page_cur; pageId<= page_cur+2; pageId++){%>
			<button class="btn btn-default"><a href="${pageContext.request.contextPath}/employees/<%=pageId%>"><i><%=pageId%></i></a></button>
			<%}
		} else if(page_cur+2 == totalPage){
			for (int pageId=page_cur; pageId<= page_cur+2; pageId++){%>
			<button class="btn btn-default"><a href="${pageContext.request.contextPath}/employees/<%=pageId%>"><i><%=pageId%></i></a></button>
			<%}
		} else {
			for (int pageId=(totalPage-2); pageId<= totalPage; pageId++){%>
			<button class="btn btn-default"><a href="${pageContext.request.contextPath}/employees/<%=pageId%>"><i><%=pageId%></i></a></button>
			<%}
		}
		if(page_cur < totalPage){
			has_next = true;
			next=page_cur+1;
		}
		if(has_next == true){%>			
			<button class="btn btn-default"><a href="${pageContext.request.contextPath}/employees/<%=next%>"><i>Next</i></a></button>
		<%}
		if(page_cur != totalPage){
		%>
		<button class="btn btn-default"><a href="${pageContext.request.contextPath}/employees/<%=totalPage%>"><i>Last</i></a></button>
		<%}%>
		<%}%>
	</div>
</div>
