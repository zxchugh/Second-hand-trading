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
				<a href="index.jsp">Home</a>
				<code>
					&gt;
				</code>
				Shopping evaluation
			</div>
		</div>
		<div class="blank"></div>
		<div class="block">
			<div class="box">
				<div class="box_1">
					<div id="ECS_COMMENT">
						<div class="box">
							<div class="box_1">
								<h3>
									<span class="text">Shopping evaluation</span>
								</h3>
								<div class="boxCenterList clearfix" style="height: 1%;">

									<div class="blank5"></div>
									<div class="commentsList">
										<form action="index/addTopic.action" method="post" name="commentForm" id="commentForm">
											<table width="710" border="0" cellspacing="5" cellpadding="0">
												<tr>
													<td width="64" align="right">
														Username:
													</td>
													<td width="631">
														${sessionScope.username }
													</td>
												</tr>
												<tr>
													<td align="right">
														Evaluation level:
													</td>
													<td>
														<input name="topic.num" type="radio" value="1" id="comment_rank1" />
														<img src="themes/xecmoban_shunfeng/images/stars1.gif" />
														<input name="topic.num" type="radio" value="2" id="comment_rank2" />
														<img src="themes/xecmoban_shunfeng/images/stars2.gif" />
														<input name="topic.num" type="radio" value="3" id="comment_rank3" />
														<img src="themes/xecmoban_shunfeng/images/stars3.gif" />
														<input name="topic.num" type="radio" value="4" id="comment_rank4" />
														<img src="themes/xecmoban_shunfeng/images/stars4.gif" />
														<input name="topic.num" type="radio" value="5" checked="checked" id="comment_rank5" />
														<img src="themes/xecmoban_shunfeng/images/stars5.gif" />
													</td>
												</tr>
												<tr>
													<td align="right" valign="top">
														Comments:
													</td>
													<td>
														<textarea name="topic.contents" class="inputBorder" style="height: 50px; width: 620px;"></textarea>
														<input type="hidden" name="id" value="${id}" />
													</td>
												</tr>
												<tr>
													<td colspan="2">
														<input type="submit" value="Comment" class="f_r bnt_blue_1" style="margin-right: 8px;" />
													</td>
												</tr>
											</table>
										</form>
									</div>

								</div>
							</div>
						</div>
						<div class="blank5"></div>

					</div>
				</div>
			</div>
			<div class="blank5"></div>
		</div>


		<jsp:include page="footer.jsp"></jsp:include>
	</body>
</html>
