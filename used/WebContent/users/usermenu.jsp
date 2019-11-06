<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="userMenu">
	
	<a href="index/usercenter.action"><img src="themes/xecmoban_shunfeng/images/u2.gif" />Buyer center</a>
	<a href="index/prePwd.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />Change password</a>
	<a href="index/myFav.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />My collection</a>
	<a href="index/showOrders.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />My order</a>
	<a href="users/what I want to buy.jsp"><img src="themes/xecmoban_shunfeng/images/u3.gif" />what I want to buy</a>
	<a href="index/exit.action" style="background: none; text-align: right; margin-right: 10px;"> 
	<img src="themes/xecmoban_shunfeng/images/bnt_sign.gif" /> </a>
	
</div>
