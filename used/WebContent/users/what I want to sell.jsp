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

						<span><tr>
   							<h1><td class="label">Pick the products you want to sell:</td></h1>
   							<br></br>
    						<td class="controler">
       						<input type="checkbox" name="choose" value="electronic product"> Electronic product &nbsp;
      						<input type="checkbox" name="choose" value="Clothing"> Clothing &nbsp;
       			 			<input type="checkbox" name="choose" value="Book materials"> Book materials &nbsp; 
       			 			<input type="checkbox" name="choose" value="Book materials"> Others &nbsp; 
    						</td>
						</tr>
						<a href="users/sellerjump.jsp" ><input type ="button" value="Confirm"></a>
						</span>
							<div class="blank5"></div>
						</div>
					</div>
				</div>
			</div
		</div>
		<div class="blank"></div>
		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
