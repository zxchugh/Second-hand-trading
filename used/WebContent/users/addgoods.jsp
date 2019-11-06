<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<title>${title }</title>
<script type="text/javascript">
function selimage(){
window.open("<%=basePath%>saveimage.jsp","","toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=yes,copyhistory=no,scrollbars=yes,width=400,height=240,top="+(screen.availHeight-240)/2+",left="+(screen.availWidth-400)/2+"");}
</script>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="block box">
		<div class="blank"></div>
		<div id="ur_here">
			Current position: <a href="<%=basePath%>">Home</a>
			<code> &gt; </code>
			Publish goods
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
					<div class="userCenterBox boxCenterList clearfix"
						style="_height: 1%;">

						<h5>
							<span>Publish goods</span>
						</h5>
						<div class="blank"></div>
						<form action="index/addGoods.action" method="post" name="myform">
							<table width="100%" border="0" cellpadding="5" cellspacing="1"
								bgcolor="#dddddd">
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">Title:</td>
									<td width="76%" align="left" bgcolor="#FFFFFF"><input
										type="text" name="goods.goodsname" style="width: 160px"
										id="goodsname" /></td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">Picture:</td>
									<td width="76%" align="left" bgcolor="#FFFFFF">
										<input type="text" name="goods.image"
								style="width: 160px" id="image" onclick="selimage();" readonly="readonly" />
										</td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">Original price:</td>
									<td width="76%" align="left" bgcolor="#FFFFFF"><input
										type="text" name="goods.oldprice" style="width: 160px" id="price" />
									</td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">Price:</td>
									<td width="76%" align="left" bgcolor="#FFFFFF"><input
										type="text" name="goods.price" style="width: 160px" id="price" />
									</td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">Category:</td>
									<td width="76%" align="left" bgcolor="#FFFFFF"><select
										name="goods.cateid" style="width: 160px" id="cateid">
											<s:iterator value="map.cateList">
												<option value="${cateid }">${catename }</option>
											</s:iterator>
									</select></td>
								</tr>
								<tr>
									<td width="28%" align="right" bgcolor="#FFFFFF">Introduction:</td>
									<td align="left" bgcolor="#FFFFFF"><script type="text/javascript"
									src="ckeditor/ckeditor.js"></script><textarea cols="80"
											name="goods.contents" id="contents" rows="10">Add introduction here </textarea><script type="text/javascript">
									CKEDITOR.replace('contents', {
										language : 'zh-cn'
									});
								</script>
									</td>
								</tr>
								<tr>
									<td colspan="2" align="center" bgcolor="#FFFFFF">${msg }</td>
								</tr>
								<tr>
									<td colspan="2" align="center" bgcolor="#FFFFFF"><input
										type="submit" class="bnt_blue_1" style="border: none;"
										value="Confirm" /></td>
								</tr>
							</table>
						</form>

					</div>
				</div>
			</div>
		</div>

	</div>
	<div class="blank"></div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
