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

</head>
<body>
<jsp:include page="header.jsp" />
<div id="main">


      	<div class="leftmenu">
      		<div class="empty"></div>

			<s:if test="productInfoDtoList==null">
				<div class="info">
				検索結果がありません。
				</div>
			</s:if>
			<s:else>
				<div id="product-list">
				<s:iterator value="session.productInfoDtoList">
				<div class="product-list-box">
				<ul>
					<li>
					<div class="grow pic">
					<a href='<s:url action="ProductDetailsAction">
					<s:param name="productId" value="%{productId}"/>
					</s:url>'><img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' class=""/>
					</a><br>
					</div>
				  </li>
				</ul>
				</div>
			</s:iterator>
			</div>

			<div class="pager">
			<s:iterator begin="1" end="#session.totalPageSize" status="pageNo">
				<s:if test="#session.currentPageNo == #pageNo.count">
					<s:property value="%{#pageNo.count}"/>
				</s:if>
				<s:else>
					<a href="<s:url action='SerchItemAction'><s:param name='pageNo' value='%{#pageNo.count}'/><s:param name='categoryId' value='%{categoryId}'/><s:param name='keywords' value='%{keywords}'/></s:url> ">	<s:property value="%{#pageNo.count}"/></a>
				</s:else>
				<span>,,,</span>
			</s:iterator>
			</div>
			</s:else>


      	</div>

      	<div class="rightmenu">
      		<div class="empty"></div>
      		<div class="category">Category</div>
      		<div class="category-box">

      			<ul>
      				<li><a href="<s:url action='SerchItemAction'>
      				<s:param name='categoryId' value='1'/></s:url> ">ALL</a></li>
      				<li>Shop</li>
      				<li><a href="<s:url action='SerchItemAction'>
      				<s:param name='categoryId' value='2'/></s:url> ">Hair</a></li>
      				<li><a href="<s:url action='SerchItemAction'>
      				<s:param name='categoryId' value='3'/></s:url> ">Make</a></li>
      				<li><a href="<s:url action='SerchItemAction'>
      				<s:param name='categoryId' value='4'/></s:url> ">Books</a></li>
      				<li><a href="<s:url action='SerchItemAction'>
      				<s:param name='categoryId' value='5'/></s:url> ">other</a></li>

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