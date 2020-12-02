<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="include/top.jsp" />
<jsp:include page="include/nav.jsp" />
<jsp:include page='${empty param.pp ? "joinUI.jsp" : param.pp += ".jsp"}' /> 
<jsp:include page="include/footer.jsp" />