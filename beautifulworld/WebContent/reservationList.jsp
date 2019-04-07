<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/style.css">
<title>予約画面～時間～</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div id="main">

      <div class="staffcontainer">


	      <div class="reservemenu">
	      	<a href='<s:url action="StaffSelectAction"></s:url>'>
		      	<div class="reservemenulist">
		      		<h4>Step1</h4>
			      	<h3>スタッフ</h3>
		      	</div>
	      	</a>
		       	<div class="reservemenulist bg-gray">
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
<s:if test="!reserveErrorMessage.equals('')">
			<div class="errorMessage">
	      		<s:property value="reserveErrorMessage"/>
	      	</div>
	      	</s:if>

			<table  cellspacing="0"  class="time-table-list">
					<tr>
						<td>日時</td>
						<s:iterator value="session.calendarList">
							<s:if test='dayOfWeek.equals("（土）")'>
							<td class="backSUT">
								<s:property value="month"/>/<s:property value="day"/><br>
								<s:property value="dayOfWeek"/>
							</td>
							</s:if>
							<s:elseif test='dayOfWeek.equals("（日）")'>
							<td class="backSUN">
								<s:property value="month"/>/<s:property value="day"/><br>
								<s:property value="dayOfWeek"/>
							</td>
							</s:elseif>
							<s:else>
							<td>
								<s:property value="month"/>/<s:property value="day"/><br>
								<s:property value="dayOfWeek"/>
							</td>
							</s:else>
						</s:iterator>
					</tr>
						<s:iterator value="session.timeList">
							<tr>
								<td><s:property value="hour"/>:<s:property value="stminute"/></td>
								<s:iterator value="session.calendarList">
								<td>
									<%String maru="○"; %>
									<s:if test='dayOfWeek.equals("（火）")'>
										<%maru ="×"; %>
									</s:if>

									<s:iterator value="session.reservationList">
										<s:if test='day==resDay'>
											<s:if test='month==resMonth'>
												<s:if test='hour==resHour'>
													<s:if test='minute==resMinute'>
														<%maru ="×"; %>
													</s:if>
												</s:if>
											</s:if>
										</s:if>
									</s:iterator>
								<h3>
									<a href='<s:url action="ReserveConfirmAction">
										<s:param name="month" value="month"/>
										<s:param name="day" value="day"/>
										<s:param name="dayOfWeek" value="dayOfWeek"/>
										<s:param name="hour" value="hour"/>
										<s:param name="minute" value="minute"/>
										<s:param name="staffId" value="staffId"/>
										</s:url>'><%=maru %>
									</a>
								</h3>
								</td>
								</s:iterator>


							</tr>
						</s:iterator>

			</table>
      </div>


</div>

</body>
</html>


























