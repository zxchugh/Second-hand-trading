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
				Shopping process
			</div>
		</div>
		<div class="blank"></div>
		<div class="block table">
			<div class="flowBox">
				<h6>
					<span>Product list</span>
				</h6>
				<table width="99%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
					<tr>
						<th bgcolor="#ffffff">
							Product name
						</th>
						<th bgcolor="#ffffff">
							Price
						</th>
						<th bgcolor="#ffffff">
							Purchase quantity
						</th>
						<th bgcolor="#ffffff">
							Total
						</th>
						<th bgcolor="#ffffff">
							Date
						</th>
						<th bgcolor="#ffffff">
							Operating
						</th>
					</tr>

					<s:iterator value="map.cartList">
						<tr>
							<td bgcolor="#ffffff" align="center" style="width: 300px;">
								<a href="index/detail.action?id=${goodsid }" target="_blank"><img style="width: 80px; height: 80px;"
										src="${goods.image }" border="0" title="${goods.goodsname }" /> </a>
								<br />
								<a href="index/detail.action?id=${goodsid }" target="_blank" class="f6">${goods.goodsname }</a>
							</td>
							<td align="center" bgcolor="#ffffff">
								₩${price }
							</td>
							<td align="center" bgcolor="#ffffff">
								${num }
							</td>
							<td align="center" bgcolor="#ffffff">
								₩${num*price }
							</td>
							<td align="center" bgcolor="#ffffff">
								${addtime }
							</td>
							<td align="center" bgcolor="#ffffff">
								<a
									href="javascript:if (confirm('Are you sure you want to remove this item from your shopping cart?')) location.href='<%=basePath%>index/deleteCart.action?id=${cartid}'; "
									class="f6">Remove</a>
							</td>
						</tr>
					</s:iterator>
				</table>
				<table width="99%" align="center" border="0" cellpadding="5" cellspacing="1" bgcolor="#dddddd">
					<tr>
						<td bgcolor="#ffffff" align="right">
							Total of purchase amount ₩${map.total }
						</td>
					</tr>
				</table>

				<table width="99%" align="center" border="0" cellpadding="5" cellspacing="0" bgcolor="#dddddd">
					<tr>
						<td bgcolor="#ffffff">
							<a href="index.jsp"><img src="themes/xecmoban_shunfeng/images/continue.gif" alt="continue" /> </a>
						</td>
						<td bgcolor="#ffffff" align="right">
							<a href="index/preCheckout.action"><img src="themes/xecmoban_shunfeng/images/checkout.gif" alt="checkout" />
							</a>
						</td>
					</tr>
				</table>
			</div>
			<div class="blank"></div>

			<div class="blank5"></div>
		</div>



		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
