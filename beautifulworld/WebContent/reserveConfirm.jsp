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
<div class="yohaku">

      </div>
      <div class="staffcontainer">


 	      <div class="reservemenu">
	      	<a href='<s:url action="StaffSelectAction"></s:url>'>
		      	<div class="reservemenulist">
		      		<h4>Step1</h4>
			      	<h3>スタッフ</h3>
		      	</div>
	      	</a>
		       	<div class="reservemenulist">
		      		<h4>Step2</h4>
		      		<h3>日時</h3>

		      	</div>
		      	<div class="reservemenulist bg-gray">
		      		<h4>Step3</h4>
		      		<h3>確認</h3>

		      	</div>
		       	<div class="reservemenulist">
		      		<h4>Step4</h4>
		      		<h3>完了</h3>

		      	</div>
	      </div>

			<h3>Reservation contents</h3>
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
						<div class="submit_btn_box">
									<a href='<s:url action="ReserveCompleteAction">
										<s:param name="staffId" value="staffId"/>
										<s:param name="staffName" value="staffName"/>
										<s:param name="month" value="month"/>
										<s:param name="day" value="day"/>
										<s:param name="hour" value="hour"/>
										<s:param name="minute" value="minute"/>
										</s:url>' class="btn-cross">Confirmation
									</a>
						</div>
      </div>


</div>

</body>
</html>


























