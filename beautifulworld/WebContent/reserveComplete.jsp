<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<meta http-equiv="refresh" content="2;URL='HomeAction'"/>
<title>予約完了</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="main">

      <div class="staffcontainer">


 	      <div class="reservemenu">
	      	<div class="reservemenulist">
	      		<h4>
	      			<a href='<s:url action="StaffSelectAction"></s:url>'>
	      				Step1
	      			</a>
	      		</h4>
		      	<h3>
					<a href='<s:url action="StaffSelectAction"></s:url>'>
						スタッフ
					</a>
				</h3>


	      	</div>
	       	<div class="reservemenulist">
	      		<h4>Step2</h4>
	      		<h3>日時</h3>

	      	</div>
	      	<div class="reservemenulist">
	      		<h4>Step3</h4>
	      		<h3>確認</h3>

	      	</div>
	       	<div class="reservemenulist bg-gray">
	      		<h4>Step4</h4>
	      		<h3>完了</h3>

	      	</div>
	      </div>

			<h3>予約が完了致しました。</h3>
			<table  cellspacing="0"  class="time-table-list">

					<tr>
						<td>MENU</td><td>CUT</td>
					</tr>
					<tr>
						<td>STAFF</td><td><s:property value="staffName"/></td>
					</tr>
					<tr>
						<td>日時</td><td><s:property value="month"/><span>月</span>
										 <s:property value="day"/><span>日</span>
										 <s:property value="hour"/><span>時</span>
										 <s:property value="minute"/><span>分</span>
									</td>
					</tr>

			</table>

      </div>


</div>

</body>
</html>


























