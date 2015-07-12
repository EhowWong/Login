<%@ page language="java" import="java.util.*" pageEncoding="GB18030"%>
<%-- <% --%>
<%-- String path = request.getContextPath(); --%>
<%-- String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; --%>
<%-- %> --%>
<%
	String user=request.getParameter("user");
	String pwd=request.getParameter("pwd");
	if("wang".equals(user)&&"123".equals(pwd)){
		out.print("0");
	}else if( !("wang".equals(user)) && "123".equals(pwd)){
		out.print("1");
	}else if("wang".equals(user) && !("123".equals(pwd))){
		out.print("2");
	}
%>