<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<base href="<%=basePath%>" />
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	background-color: #ecf4ff;
}

.dtree {
	font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #0000ff;
	white-space: nowrap;
}

.dtree img {
	border: 0px;
	vertical-align: middle;
}

.dtree a {
	color: #333;
	text-decoration: none;
}

.dtree a.node, .dtree a.nodeSel {
	white-space: nowrap;
	padding: 1px 2px 1px 2px;
}

.dtree a.node:hover, .dtree a.nodeSel:hover {
	color: #0000ff;
}

.dtree a.nodeSel {
	background-color: #AED0F4;
}

.dtree .clip {
	overflow: hidden;
}
-->
</style>
<link href="css/four.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/dtree.js"></script>
</head>
<body>
	<table width="96%" border="0" cellpadding="10" cellspacing="0"
		align="center">
		<tr>
			<td valign="top"><div class="menu">
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td><script type="text/javascript">
							d = new dTree('d');
							d.config.target="main";
							d.add(0,-1,'Management menu');
							d.add(1, 0, 'Administrator', '');
							d.add(11, 1, 'Add administrator', 'admin/createAdmin.action');
							d.add(12, 1, 'Administrator list','admin/getAllAdmin.action');
							d.add(13, 1, 'Search for administrator','admin/queryAdminByCond.action');
							d.add(2, 0, 'Seller', '');
							d.add(22, 2, 'Seller list','seller/getAllSeller.action');
							d.add(23, 2, 'Search for seller','seller/querySellerByCond.action');
							d.add(3, 0, 'Buyer', '');
							d.add(32, 3, 'Buyer list','users/getAllUsers.action');
							d.add(33, 3, 'Search for buyer','users/queryUsersByCond.action');
							d.add(4, 0, 'Website announcement', '');
							d.add(41, 4, 'Add website announcement', 'article/createArticle.action');
							d.add(42, 4, 'website announcement list','article/getAllArticle.action');
							d.add(43, 4, 'Search for website announcement','article/queryArticleByCond.action');
							d.add(5, 0, 'Category', '');
							d.add(51, 5, 'Add category', 'cate/createCate.action');
							d.add(52, 5, 'Category list','cate/getAllCate.action');
							d.add(53, 5, 'Search for category','cate/queryCateByCond.action');
							d.add(6, 0, 'Product', '');
							d.add(62, 6, 'Product list','goods/getAllGoods.action');
							d.add(63, 6, 'Search for product','goods/queryGoodsByCond.action');
							d.add(8, 0, 'Order', '');
							d.add(82, 8, 'Order list','orders/getAllOrders.action');
							d.add(83, 8, 'Search for Order','orders/queryOrdersByCond.action');
							d.add(9, 0, 'Product evaluation', '');
							d.add(92, 9, 'Product evaluation list','topic/getAllTopic.action');
							d.add(93, 9, 'Search for product evaluation','topic/queryTopicByCond.action');
							document.write(d);
							</script></td>
						</tr>
					</table>
				</div></td>
		</tr>
	</table>
</body>
</html>