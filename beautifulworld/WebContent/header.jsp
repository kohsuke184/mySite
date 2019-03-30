<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>ヘッダー</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
</head>
<body>
<header>
<div id="header">
<div class="topoftop"></div>

      <div class="logo">
      <a href='<s:url action="HomeAction">
					<s:param name="productId" value="%{productId}"/>
					</s:url>'><img src="./images/logo.jpg" alt="ロゴ画像" width="283px" height="148px"/></a>



      </div>
      <div class="menu">
        <ul>


	          <li class="menuitem"><span><a class="button" href='<s:url action="GoStaffColumAction"/>'>Staff Colums</a></span></li>
	          <li class="menuitem"><span><a class="button" href='<s:url action="StylingListAction"/>'>Styling</a></span></li>
	          <li class="menuitem"><span><a class="button" href="<s:url action='ProductListAction'><s:param name='categoryId' value='1'/></s:url> ">	items</a></span></li>
	          <li class="menuitem"><span><a class="button" href="<s:url action='StaffSelectAction'></s:url> ">	Resevation info</a></span></li>
	          <s:if test='#session.logined == 1'>
	          <li class="menuitem"><span><a class="button" href='<s:url action="LogoutAction"/>'>Logout</a></span></li>
	          </s:if>
	          <s:else>
	          <li class="menuitem"><span><a class="button" href='<s:url action="GoLoginAction"/>'>Login</a></span></li>
	          </s:else>




      </ul>
      </div>




</div>
</header>
</body>
</html>