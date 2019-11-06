<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<div class="userMenu">
	
	<a href="index/susercenter.action"><img src="themes/xecmoban_shunfeng/images/u2.gif" />Seller center</a>
	<a href="index/preSPwd.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />Change password</a>
	<a href="index/preGoods.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />Publish goods</a>
	<a href="index/myGoods.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />My goods</a>
	<a href="index/showSOrders.action"><img src="themes/xecmoban_shunfeng/images/u3.gif" />My order</a>
	<a href="users/what I want to sell.jsp"><img src="themes/xecmoban_shunfeng/images/u3.gif" />what I want to sell</a>
	<a href="index/exit.action" style="background: none; text-align: right; margin-right: 10px;"> 
	<img src="themes/xecmoban_shunfeng/images/bnt_sign.gif" /> </a>
	
</div>
