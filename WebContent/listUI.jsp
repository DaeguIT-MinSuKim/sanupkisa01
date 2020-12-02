<%@page import="sanupkisa01.dto.Member"%>
<%@page import="sanupkisa01.dao.MemberDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	MemberDao memberDao = MemberDao.getInstance();
	List<Member> list = memberDao.selectMemberByAll();
%>
	<section>
		<article>
			<h2>회원 목록 조회/수정</h2>
			<table border="1">
				<colgroup>
					<col width="10%"><col width="10%"><col width="15%"><col width="30%">
					<col width="15%"><col width="10%"><col width="10%">
				</colgroup>
				<thead>
					<tr>
					    <td>회원번호</td><td>회원성명</td><td>회원전화</td><td>회원주소</td>
					    <td>가입일자</td><td>고객등급</td><td>도시코드</td>
					</tr>
				</thead>
				<tbody>
				<% for(Member member : list){ %>
					<tr>
						<td><a href="./index.jsp?pp=updateUI&custNo=<%=member.getCustno() %>" ><%=member.getCustno() %></a></td>
						<td><%=member.getCustname() %></td>
						<td><%=member.getPhone() %> </td>
						<td><%=member.getAddress() %></td>
						<td><%=member.getJoindate() %></td>
						<td>
						<% if (member.getGrade().equals("A")){ %>
							VIP
						<% }else if (member.getGrade().equals("B")){ %>
						    일반
						<% }else {%>
							직원
						<%} %>
						</td>
						<td><%=member.getCity() %></td>
					</tr>
				<% } %>	
			
				</tbody>
			</table>
		</article>
	</section>