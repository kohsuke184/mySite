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
<script>
function goLoginAction(){
	document.getElementById("form").action="GoLoginAction";
}
function goMyPageAction(){
	document.getElementById("form").action="MyPageAction";
}
function goCartAction(){
	document.getElementById("form").action="CartAction";
}
function goProductListAction(){
	document.getElementById("categoryId").value=1;
	document.getElementById("form").action="ProductListAction";
}
function goLogoutAction(){
	document.getElementById("form").action="LogoutAction";
}
function goSearchItemAction(){
	document.getElementById("form").action="SearchItemAction";
}
</script>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="main">
<div class="yohaku">

</div>
<table>
<tr>
	<th>#</th><th>商品名</th><th>ふりがな</th><th>商品画像</th><th>値段</th><th>発売会社名</th><th>発売年月日</th><th>購入個数</th><th>合計金額</th>
</tr>
<s:iterator value="#session.cartInfoDtoList">
<tr>
	<td>□</td>
	<td><s:property value="productName"/></td>
	<td><s:property value="productNameKana"/></td>
	<td><img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' width="70px" height="70px"></td>
	<td><s:property value="price"/></td>
	<td><s:property value="releaseCompany"/></td>
	<td><s:property value="releaseDate"/></td>
	<td><s:property value="productCount"/></td>
	<td><s:property value="subtotal"/></td>
</tr>
</s:iterator>
</table>

</div>

</body>
</html>