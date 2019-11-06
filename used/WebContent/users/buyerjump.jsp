<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<title>${title }</title>

	</head>

	<body>
		<jsp:include page="header.jsp"></jsp:include>
		<div class="block box">
			<div class="blank"></div>
			<div id="ur_here">
				Current position:
				<a href=".">Home</a>
				<code>
					&gt;
				</code>
				User center
			</div>
		</div>
		<div class="blank"></div>

		<div class="blank"></div>
		<div class="block clearfix">

			<div class="AreaL">
				<div class="box">
					<div class="box_1">
						<div class="userCenterBox">
							<jsp:include page="usermenu.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>


			<div class="AreaR">
				<div class="box">
					<div class="box_1">
						<div class="userCenterBox boxCenterList clearfix" style="_height: 1%;">
							<h5>
						<span>Our recommendation:
						</span>
							</h5>
							<div class="blank"></div>
							<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
								<tr>
									<th align="center" bgcolor="#ffffff">Buyer</th>									
									<th align="center" bgcolor="#ffffff">Category</th>
									<th align="center" bgcolor="#ffffff">Product</th>
									<th align="center" bgcolor="#ffffff">Unit price</th>
									
								</tr>
								<tr>
									<td align="center" bgcolor="#ffffff"><a href="">Buyer1</a></td>
									<td align="center" bgcolor="#ffffff"><a href="">Clothing</a></td>
									<td align="center" bgcolor="#ffffff"><a href="users/hoodie.html">Hoodie</a></td>
									<td align="center" bgcolor="#ffffff">9900</td>
								</tr>
								<tr>
									<td align="center" bgcolor="#ffffff"><a href="">Buyer2</a></td>
									<td align="center" bgcolor="#ffffff"><a href="">Clothing</a></td>
									<td align="center" bgcolor="#ffffff"><a href="users/Tshirt.html">T-shirt</a></td>
									<td align="center" bgcolor="#ffffff">5000</td>
								</tr>
								<tr>
									<td align="center" bgcolor="#ffffff"><a href="">Buyer3</a></td>
									<td align="center" bgcolor="#ffffff"><a href="">Electronic product</a></td>
									<td align="center" bgcolor="#ffffff"><a href="users/camera.html">Camera</a></td>
									<td align="center" bgcolor="#ffffff">7000</td>
								</tr>

								
								
								<s:iterator value="map.ordersList">
									<tr>
										<td  align="center" bgcolor="#ffffff"><s:property value="users.username" /></td>
										<td  align="center" bgcolor="#ffffff"><s:property value="goods.goodsname" /></td>
										<td  align="center" bgcolor="#ffffff"><s:property value="price" /></td>
										<td bgcolor="#ffffff" align="center">
										</td>
									</tr>
								</s:iterator>
							</table>
							<div class="blank5"></div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<div class="blank"></div>



		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
