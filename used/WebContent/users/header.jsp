<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String message = (String) request.getAttribute("message");
	if (message == null) {
		message = "";
	}
	if (!message.trim().equals("")) {
		out.println("<script language='javascript'>");
		out.println("alert('" + message + "');");
		out.println("</script>");
	}
	request.removeAttribute("message");
%>
<link href="themes/xecmoban_shunfeng/style.css" rel="stylesheet"
	type="text/css" />

<div id="Top">
	<div class=" block header_bg">

		<div class="top_nav">
			<div class="block">
				<div class="header_r">
					<s:if test="#session.role == null">
						<font id="ECS_MEMBERZONE"> welcome to our website，
						<a href="index/preLogin.action">[Log in]</a>
						&nbsp;&nbsp;
						<a href="index/preReg.action">[Buyer registration]</a>
						&nbsp;&nbsp;
						<a href="index/preSReg.action">[Seller registration]</a>
						</font>
					</s:if>
					<s:if test="#session.role == 'Buyer'">
						<font id="ECS_MEMBERZONE"> welcome to our website ${sessionScope.username }，
							<a href="index/usercenter.action">[Buyer center]</a>
							&nbsp;<a href="index/cart.action">[Cart]</a>
							&nbsp;<a href="index/exit.action">[Exit]</a>
						</font>
					</s:if>
					<s:if test="#session.role == 'Seller'">
						<font id="ECS_MEMBERZONE"> welcome to our website ${sessionScope.username }，
							<a href="index/susercenter.action">[Seller center]</a>
							&nbsp;<a href="index/exit.action">[Exit]</a>
						</font>
					</s:if>
				</div>
			</div>
		</div>

		<div class="clearfix"></div>
		<div class="header_top logo_wrap clearfix">
			<a class="logo_new" href="index.jsp"><img src="themes/xecmoban_shunfeng/images/logo.gif"/></a>
			<div class="ser_n">
				<form id="searchForm" class="searchBox" name="searchForm" method="post" action="index/query.action">
					<input name="name" type="text" id="keyword" value="" class="searchKey" /> 
					<input type="submit" class="fm_hd_btm_shbx_bttn" value="">
				</form>
				<div class="search_hot"></div>
				<div class="clearfix"></div>
			</div>
		</div>
	</div>
</div>
<div style="clear: both"></div>

<div class="menu_box clearfix">
	<div class="block">
		<div class="menu">
			<a href="index.jsp" class="cur">Home</a>
			<a href="index/article.action" class="cur">Announcement</a>
			<a href="index/all.action" class="cur">All products</a>
			
		</div>
	</div>
</div>