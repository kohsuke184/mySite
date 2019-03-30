<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<title>Please Login</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="main">
<div class="yohaku">

      </div>
      <div class="maincontainer">

      	<div class="circleBox" >
      		<div class="text">
      		<img src="./images/logo.jpg" alt="ロゴ画像" width="201px" />
		      	<s:form action="LoginAction">
		      		<table class="usertable">
		      		<tr>
				      	<td>USERID:</td><td> <s:textfield class="textfield" name="userId" value="" label="ユーザーID" size="30"/></td>
				    </tr>
				    <tr>
				      	<td>PASSWORD:</td><td><s:password class="textfield" name="password" value="" label="パスワード" size="30"/></td>

				    </tr>
		      		</table>
		      		<s:submit value="LOGINS"/>
		      	</s:form>
	      	</div>
	    </div>



      </div>

















</div>

</body>
</html>