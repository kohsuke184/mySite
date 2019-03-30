<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<title>ホーム</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="main">
		<div class="yohaku"></div>

		<div class="leftmenu staff">

			<s:iterator value="staffColumDtoList">
				<div class="columBox">
					<div class="title_bar">
						<span class="gray"><s:property value="updateDate" /></span>
						<span><s:property value="columTitle" /></span>
					</div>

					<div id="columpic">
							<img src="<s:property value="columImageFilePath"/>/<s:property value="columImageFileName"/>" width="200px"/>


					</div>
					<div class="columPackage">
						<div class="columDescription">
							<s:property value="editedColumDescription" />
						</div>
					</div>
					<div class="staffSpace">
						<div class="staffImagePic">
							<img
								src="<s:property value ="staffImageFilePath"/>/<s:property value ="staffImageFileName"/>"
								height="50px" />
						</div>
						<div class="staffInfo">
							<span class="gray"><s:property value="position" /></span><br>
							<s:property value="staffName" />
						</div>
					</div>
				</div>
			</s:iterator>

		</div>
		<div class="rightmenu staff">
			<div class="title_bar">
				<span class="titleHeading">Staff</span>
			</div>
			<s:iterator value="staffInfoDtoList">
				<div class="staffBox">
					<div class="staffBoxPic">
						<a href="<s:url action='GoStaffColumAction'><s:param name='staffId' value='staffId'/></s:url> ">
							<img src="<s:property value ="imageFilePath"/>/<s:property value ="imageFileName"/>" height="120px"/>
						</a>
					</div>
					<div class="staffprof">
						<span class="gray"><s:property value="position"></s:property></span><br>
						<span><s:property value="staffName"></s:property></span>
					</div>
				</div>
			</s:iterator>



		</div>


	</div>

</body>
</html>