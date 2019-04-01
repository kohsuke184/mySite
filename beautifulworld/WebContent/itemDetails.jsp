<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<title>Beautiful Worlds Items</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="main">


      	<div class="leftmenu">
	      	<s:form method="get" action="AddCartAction" name="addcart">
				<div class="item">Items</div>


				<div class="itemdetails">
					<div class="yazirushiL">
						<a href='<s:url action="ProductDetailsAction">
						<s:param name="productId" value="%{productId-1}"/>
						</s:url>'><img src="./images/sty_prev.jpg" class=""/></a>
					</div>
					<div class="yazirushiR">
						<a href='<s:url action="ProductDetailsAction">
						<s:param name="productId" value="%{productId+1}"/>
						</s:url>'><img src="./images/sty_next.jpg" class=""/></a>
					</div>
					<div class="left">

						<img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' class="item-image-box-400"/><br>

					</div>

					<div class="right">


					<table cellspacing="15px" class="vertical-list-table-mini">
						<tr>
						<td scope="row"><s:label value="NAME:"/></td>
						<td><s:property value="productName"/></td>
						</tr>
						<tr>
						<td scope="row"><s:label value="READING:"/></td>
						<td><s:property value="productNameKana"/></td>
						</tr>
						<tr>
						<td scope="row"><s:label value="PRICE:"/></td>
						<td><s:property value="price"/>円</td>
						</tr>
						<tr>
						<td scope="row"><s:label value="COUNTS:"/></td>
						<td><s:select name="productCount" list="productCountList"/>個</td>
						</tr>
						<tr>
						<td scope="row"><s:label value="MAKER:"/></td>
						<td><s:property value="releaseCompany"/></td>
						</tr>
						<tr>
						<td scope="row"><s:label value="Release date:"/></td>
						<td><s:property value="releaseDate"/></td>
						</tr>
						<tr>
						<td scope="row"><s:label value="DETAILS:"/></td>
						<td><s:property value="productDescription"/></td>
						</tr>
						</table>
					</div>


				</div>
					<div class="submit_btn_box">

						<s:hidden name="productId" value="%{productId}"/>
						<s:hidden name="productName" value="%{productName}"/>
						<s:hidden name="productNameKana" value="%{productNameKana}"/>
						<s:hidden name="imageFilePath" value="%{imageFilePath}"/>
						<s:hidden name="imageFileName" value="%{imageFileName}"/>
						<s:hidden name="price" value="%{price}"/>
						<s:hidden name="releaseCompany" value="%{releaseCompany}"/>
						<s:hidden name="releaseDate" value="%{releaseDate}"/>
						<s:hidden name="productDescription" value="%{productDescription}"/>


					<a href="javascript:addcart.submit()"



					class="btn-cross">Add To Cart</a>


					</div>



					<div class="product-details-recomｍend-box">
					<s:iterator value="productInfoDtoList">

							<div class="recommend-box">
								<a href='<s:url action="ProductDetailsAction">
								<s:param name="productId" value="%{productId}"/>
								</s:url>'><img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' width="150px"/></a>
								<br><s:property value="productName"/>
							</div>


					</s:iterator>
					</div>


			</s:form>
      	</div>

      	<div class="rightmenu">
      		<div class="category">Category</div>
      		<div class="category-box">
      			<ul>
      				<li><a href="<s:url action='SerchItemAction'>
      				<s:param name='categoryId' value='1'/><s:param name='keywords' value='%{keywords}'/></s:url> ">ALL</a></li>
      				<li>Shop</li>
      				<li><a href="<s:url action='SerchItemAction'>
      				<s:param name='categoryId' value='2'/><s:param name='keywords' value='%{keywords}'/></s:url> ">Hair</a></li>
      				<li><a href="<s:url action='SerchItemAction'>
      				<s:param name='categoryId' value='3'/><s:param name='keywords' value='%{keywords}'/></s:url> ">Make</a></li>
      				<li>Books</li>
      				<li>other</li>
      			</ul>
      		</div>
      		<div class="empty"></div>
      		<div class="category">Archives</div>
      		<div class="category-box">
      			<ul>
      				<li>ALL</li>
      				<li>2013</li>
      				<li>2014</li>
      				<li>2015</li>
      				<li>2016</li>
      				<li>2017</li>
      				<li>2018</li>
      				<li>2019</li>
      			</ul>
      		</div>


      	</div>


</div>

</body>
</html>