<%@page import="sanupkisa01.dto.Member"%>
<%@page import="sanupkisa01.dao.MemberDao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDao memberDao = MemberDao.getInstance();
	int custNo = Integer.parseInt(request.getParameter("custNo"));
	Member member = memberDao.selectMemberByNo(custNo);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	String joinDate = sdf.format(member.getJoindate());
%>
	<section>
		<article>
			<h2>홈쇼핑 회원 정보 수정</h2>
			
			<form action="./action.jsp" method="post" id="join">
				<input type="hidden" name="action" value="update">
				<table border="1">
				    <tr>
				        <td>회원번호(자동발생)</td>
				        <td><input type="text" name="custNo" id="custNo" value="<%=member.getCustno() %>" readonly="readonly"></td>
				    </tr>
				    <tr>
				        <td>회원성명</td>
				        <td><input type="text" name="custName" id="custName" value="<%=member.getCustname() %>"></td>
				    </tr>
				    <tr>
				        <td>회원전화</td>
				        <td><input type="text" name="phone" id="phone" value="<%=member.getPhone() %>"></td>
				    </tr>
				    <tr>
				        <td>회원주소</td>
				        <td><input type="text" name="address" id="address" value="<%=member.getAddress() %>"></td>
				    </tr>
		 		    <tr>
				        <td>가입일자</td>
				        <td><input type="text" name="joinDate" id="joinDate" value="<%=joinDate %>" ></td>
				    </tr> 
				    <tr>
				        <td>고객등급</td>
				        <td><input type="text" name="grade" id="grade" value="<%=member.getGrade() %>"></td>
				    </tr>
				    <tr>
				        <td>도시코드</td>
				        <td><input type="text" name="city" id="city" value="<%=member.getCity() %>"></td>
				    </tr>
				</table>
		 		<div class="btn_group">
				    <button type="submit" onclick="update();return false">수정</button>
				    <button type="button" onclick="history.back();">목록</button>
				</div> 
			</form>
		</article>
	</section>