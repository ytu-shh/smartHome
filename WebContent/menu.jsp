<%@ page contentType="text/html;charset=UTF-8" language="java"%>

<%-- <div class="col-md-2">
    <ul class="nav nav-pills nav-stacked" id="nav">
        <li><a href="${pageContext.request.contextPath}/aim/queryMyAim.do">我的目标<span class="badge pull-right">8</span></a></li>
        <li><a href="${pageContext.request.contextPath}/plan.jsp">对象目标<span class="badge pull-right">59</span></a></li>
        <li><a href="${pageContext.request.contextPath}/addAim.jsp">创建目标<span class="badge pull-right">10</span></a></li>
        <li><a href="${pageContext.request.contextPath}/passwordRest.jsp">修改密码<sapn class="glyphicon glyphicon-pencil pull-right" /></a></li>
        <li><a href="${pageContext.request.contextPath}/user/logout.do">退出系统<sapn class="glyphicon glyphicon-log-out pull-right" /></a></li>
    </ul>
</div> --%>
	<form action="##" class="navbar-form navbar-right" rol="search">
		<div class="dropdown">
			<button class="btn btn-default dropdown-toggle" type="button"
				id="dropdownMenu2" data-toggle="dropdown" style="margin-right: 20px;">
				<span class="glyphicon glyphicon-user">选项</span> <span
					class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu2">
			
				<li role="presentation">
				<a role="menuitem" tabindex="-1" href="${pageContext.request.contextPath}/aim/queryMyAim.do">
					我的目标<span class="badge pull-right">8</span>
				</a>
				</li>
				<!-分割线--->
				<li role="presentation" class="divider"></li>
				<li role="presentation"><a role="menuitem" tabindex="-1"
					href="${pageContext.request.contextPath}/user/logout.do"> <span
						class="glyphicon glyphicon-off pull-right"></span> 注销
				</a></li>
			</ul>
		</div>
	
	</form>