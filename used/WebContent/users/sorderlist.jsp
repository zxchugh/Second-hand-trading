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
							<jsp:include page="susermenu.jsp"></jsp:include>
						</div>
					</div>
				</div>
			</div>


			<div class="AreaR">
				<div class="box">
					<div class="box_1">
						<div class="userCenterBox boxCenterList clearfix" style="_height: 1%;">
							<h5>
								<span>My order</span>
							</h5>
							<div class="blank"></div>
							<table width="100%" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
								<tr>
									<th align="center" bgcolor="#ffffff">Ordercode</th>
									<th align="center" bgcolor="#ffffff">Buyer</th>
									<th align="center" bgcolor="#ffffff">Product</th>
									<th align="center" bgcolor="#ffffff">Price</th>
									<th align="center" bgcolor="#ffffff">Amount</th>
									<th align="center" bgcolor="#ffffff">Addtime</th>
									<th align="center" bgcolor="#ffffff">Status</th>
									<th align="center" bgcolor="#ffffff">Receiver</th>
									<th align="center" bgcolor="#ffffff">Address</th>
									<th align="center" bgcolor="#ffffff">Contact</th>
									<th align="center" bgcolor="#ffffff">Operating</th>
								</tr>
								<s:iterator value="map.ordersList">
									<tr>
										<td  align="center" bgcolor="#ffffff"><s:property value="ordercode" /></td>
										<td  align="center" bgcolor="#ffffff"><s:property value="users.username" /></td>
										<td  align="center" bgcolor="#ffffff"><s:property value="goods.goodsname" /></td>
										<td  align="center" bgcolor="#ffffff"><s:property value="price" /></td>
										<td  align="center" bgcolor="#ffffff"><s:property value="num" /></td>
										<td  align="center" bgcolor="#ffffff"><s:property value="addtime" /></td>
										<td  align="center" bgcolor="#ffffff"><s:property value="status" /></td>
										<td  align="center" bgcolor="#ffffff"><s:property value="receiver" /></td>
										<td  align="center" bgcolor="#ffffff""><s:property value="address" /></td>
										<td  align="center" bgcolor="#ffffff"><s:property value="contact" /></td>
										<td bgcolor="#ffffff" align="center">
											<s:if test="status == 'Paid'">
												<a href="index/send.action?id=${ordersid }">Deliver goods</a>
											</s:if>
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
