<%@page import="sanupkisa01.dto.Sale"%>
<%@page import="sanupkisa01.dao.SaleDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<section>
		<article>
			<h2>회원 매출 조회</h2>
			<table border="1">
				 <colgroup>
			        <col width="25%"><col width="25%"><col width="25%"><col width="25%">
			    </colgroup>
			    <thead>
			    <tr>
			        <td>회원번호</td><td>회원성명</td><td>고객등급</td><td>매출</td>
			    </tr>
			    </thead>
		 	    <tbody>
		 	    <%
		 	    	List<Sale> list = SaleDao.getInstance().selectSaleByAll();
		 	    	for(Sale sale : list){
		 	    %>		
			 	    <tr>
				       <td><%=sale.getCustNo() %></td>
				       <td><%=sale.getCustName() %></td>
				       <td>
				       <% if (sale.getGrade().equals("A")){        %>
				       		VIP
				       <% }else if (sale.getGrade().equals("B")) { %>
				    	    일반
				       <% }else{ %>
				       	  직원
				       <% } %>
				       </td>
				       <td><%=sale.getTotal() %></td>
			       </tr>
		 	    <% } %>
		
			    </tbody> 
			</table>
		</article>
	</section>
