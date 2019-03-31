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
<div class="yohaku">
      </div>
      <div class="maincontainer">
		<div id="content">
		  <div id="mainvisual"></div>
		</div>

        	<div class="homeMenu">
        		<div class="newsBox">
        			<div class="newsTitle">News</div>
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
		</div>

</div>
</body>
</html>