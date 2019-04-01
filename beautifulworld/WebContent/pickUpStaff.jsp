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

      <div class="staffcontainer">

      <div class="reservemenu">
      	<div class="reservemenulist bg-gray">
      		<h4>Step1</h4>
      		<h3>スタッフ</h3>

      	</div>
       	<div class="reservemenulist">
      		<h4>Step2</h4>
      		<h3>日時</h3>

      	</div>
      	<div class="reservemenulist">
      		<h4>Step3</h4>
      		<h3>確認</h3>

      	</div>
       	<div class="reservemenulist">
      		<h4>Step4</h4>
      		<h3>完了</h3>

      	</div>
      </div>

      <h3>ＰＩＣＫ　ＵＰ　ＳＴＡＦＦ</h3>

      	<ul>
      		<s:iterator value="staffInfoDTOList">
      		<li>

	      			<div class = "staffinfo">
						<div class="staffinfopic">
						<figure>
							<a href='<s:url action="ReservationListAction">
							<s:param name="staffId" value="staffId"/>
							</s:url>'>
							<img src='<s:property value="imageFilePath"/>/<s:property value="imageFileName"/>' width=100% class=""/>
							</a>
						</figure>
						</div>

							<h3><s:property value="position"/></h3>
							<h1><s:property value="staffName"/></h1>
							<h5><s:property value="staffNameKana"/><br></h5>
							<h3><span>得意カット:</span><s:property value="cut"/></h3>
							<h4><s:property value="staffPr"/></h4>
					</div>

      		</li>
      		</s:iterator>
      	</ul>


      </div>


</div>

</body>
</html>


























