<%@page import="sanupkisa01.dto.Member"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="sanupkisa01.dao.MemberDao"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/* request.setCharacterEncoding("UTF-8"); */
	String action = request.getParameter("action");
	MemberDao memberDao = MemberDao.getInstance();
	
	String custName = request.getParameter("custName");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    
    String grade = request.getParameter("grade");
    String city = request.getParameter("city");
    
   
    Member member = null;
    
	switch (action) {
		case "insert" :
			member = new Member(custName, phone, address, grade, city);
			System.out.println("insert member > " + member);
			memberDao.insertMember(member);
			break;
		case "update" :
		    int custNo = -1;
		    Date joinDate = null;
		    
		    try{
		    	custNo = Integer.parseInt(request.getParameter("custNo"));
		    }catch(NullPointerException e){}
		    
		    try{
			    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
				joinDate = sdf.parse(request.getParameter("joinDate"));
		    }catch(NullPointerException e){}
		    
			member = new Member(custNo, custName, phone, address, joinDate, grade, city);
			System.out.println("update member > " + member);
			memberDao.updateMember(member);
			break;
	}
%>
<script>
	alert('완료되었습니다.');
	location.replace('./');
</script>