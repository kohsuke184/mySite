<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<link rel="stylesheet" href="./css/vegas.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="./js/vegas.min.js"></script>
<script>
$(function(){
  $('#mainvisual').vegas({
    slides: [
     { src: './images/image141.jpg' },
     { src: './images/image144.jpg' },
     { src: './images/image143.jpg' },
     { src: './images/image145.jpg' },
     { src: './images/image146.jpg' },
     { src: './images/image147.jpg' },
     { src: './images/image148.jpg' },
     { src: './images/image149.jpg' }
    ],
     delay: 8000,
     timer: false,
     animation: [ 'kenburnsUp', 'kenburnsDown', 'kenburnsLeft', 'kenburnsRight' ],
     transition: [ 'flash', 'burn', 'blur2' ],
     transitionDuration: 2000
  });
});
</script>
<title>ホーム</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="main">

      <div class="maincontainer">
		<div id="content">
		  <div id="mainvisual"></div>
		</div>

        	<div class="homeMenu">
        		<div class="newsBox">
        			<div class="titleBar">News</div>
	        			<s:iterator value="newsInfoDtoList">
		        			<div class="newsInfo">
		        				<span class="gray"><s:property value = "updateDate"/></span><br>
		        				<span class="desc"><s:property value = "newsTitle"/></span><br>
							</div>
	        			</s:iterator>
        		</div>
				<s:iterator value="subStaffColumDtoList">
					<div class="subColum">
						<img src="<s:property value="columImageFilePath"/>/<s:property value="columImageFileName"/>" class="columImg"/>
							<span><s:property value="columTitle" /></span><br>
							<span class="desc"><s:property value="shortEditedColumDescription" /></span>
							<div class="columBottom">
								<span class="gray"><s:property value="position"/></span><br>
								<span><s:property value="staffName"/></span>
							</div>
					</div>
				</s:iterator>
	        </div>
	        <div class="middleMenu">
	        	<div class="styleMenu">
					<div class="titleBar">Styling</div>
					<s:iterator value="stylinListDtoList">
						<img src="<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>" class="hairImg"/>
					<div class="titleBar">
						<div class="styleDate"><s:property value="updateDate"/></div>
						<div class="styleBy"><s:property value="staffName"/></div>
					</div>
					</s:iterator>
	        	</div>
	        	<div class="itemMenu">
	        		<a href="<s:url action='SerchItemAction'>
      				<s:param name='categoryId' value='1'/></s:url> ">
      					<div class="titleBar">Items</div>
      				</a>

	        		<div class="itemImage">
	        			<s:iterator value="productInfoDtoList">
	        				<a href='<s:url action="ProductDetailsAction">
								<s:param name="productId" value="%{productId}"/>
								</s:url>'><img src="<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>" class="itemPic"/>
							</a>

	        			</s:iterator>
	        		</div>

	        	</div>
	        	<div class="salonInfo">
	        		<div class="titleBar">SalonInfo</div>
	        		<img src="./images/map.png" class="mapimg">
	        		<div class = "address">
		        		〒105-0001<br>
		        		東京都港区虎ノ門４丁目３−１ 城山トラストタワー31F<br>
		        		tel:03-6205-7707<br>
						fax:03-6205-7708<br><br>
						営業時間：<br>
						月・木／土日祝日 10:00～19:00<br>
						水・金 13:00～22:00<br><br>
						定休日：毎週火曜日<br>
					</div>
	        	</div>


	        </div>
		</div>

</div>
</body>
</html>