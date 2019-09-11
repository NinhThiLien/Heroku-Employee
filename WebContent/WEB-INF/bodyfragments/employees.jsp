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
        
		<div id="btn-group">
            <button id="list" class="btn btn-default btn-xs" style="border: 2px solid #828282"><i class="fa fa-bars" style="font-size:35px"></i></button> 
            <button id="card" class="btn btn-default btn-xs active" style="border: 2px solid #828282"><i class="fa fa-th-large" style="font-size:35px"></i></button>
        </div>
		<br>
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
                <div id="listlink" style="display:none">
                	<%@include file="employees_list.jsp" %>
                </div>
                <div id="cardlink">
                	<%@include file="employees_card.jsp" %>
                </div>
            </div>
        </div>
    </div>
    
    <div id="pagination">
    <ul class="pagination">
	<% int totalPage = (int)session.getAttribute("totalPage");
		int back = 0;
		int next = 0;
		String active = null;
		boolean has_next = false;
		int page_cur = (int)request.getAttribute("page_pre");
		if(totalPage<=3){
			for (int pageId=1; pageId<= totalPage; pageId++){%>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees/<%=pageId%>"><i><%=pageId%></i></a></li>
			<%}
		}else{
		//Nut Back
		if (page_cur != 1){
			back =page_cur-1;
		%>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees/1"><i>First</i></a></li>
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees/<%=back%>"><i>Back</i></a></li>
		<%} else {
			back = 1;
		}
		//Hien Thi Trang
		if(page_cur+2 < totalPage){
			System.out.println(page_cur);
			for (int pageId=page_cur; pageId<= page_cur+2; pageId++){%>
			<li class="page-item <%if(pageId==page_cur){out.write("active");}%>"><a class="page-link" href="${pageContext.request.contextPath}/employees/<%=pageId%>"><i><%=pageId%></i></a></li>
			<%}
		} else if(page_cur+2 == totalPage){
			for (int pageId=page_cur; pageId<= page_cur+2; pageId++){%>
			<li class="page-item <%if(pageId==page_cur){out.write("active");}%>"><a class="page-link" href="${pageContext.request.contextPath}/employees/<%=pageId%>"><i><%=pageId%></i></a></li>
			<%}
		} else {
			for (int pageId=(totalPage-2); pageId<= totalPage; pageId++){%>
			<li class="page-item <%if(pageId==page_cur){out.write("active");}%>"><a class="page-link" href="${pageContext.request.contextPath}/employees/<%=pageId%>"><i><%=pageId%></i></a></li>
			<%}
		}
		if(page_cur < totalPage){
			has_next = true;
			next=page_cur+1;
		}
		if(has_next == true){%>			
			<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees/<%=next%>"><i>Next</i></a></li>
		<%}
		if(page_cur != totalPage){
		%>
		<li class="page-item"><a class="page-link" href="${pageContext.request.contextPath}/employees/<%=totalPage%>"><i>Last</i></a></li>
		<%}%>
		<%}%>
		</ul>
	</div>
</div>
