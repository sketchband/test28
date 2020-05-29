<%@page import="test28.BoardBean"%>
<%@page import="java.util.Vector"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dao" class="test28.BoardDAO"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String numPage = request.getParameter("numPage");
	if(numPage==null){
		numPage="1";
	}
	int nowPage = Integer.parseInt(numPage);
	int pageRecords = 5;
	int totalPage = 0;
	totalPage = dao.CountRecords();
	int startRow = (nowPage-1)*pageRecords+1;
	int endRow = pageRecords;
	
	Vector<BoardBean> vlist = null;
	
%>

<center><h2>게시판</h2></center>
<div align="center">
<table width="70%">
<tr>
<td width="20%">번 호</td>
<td width="20%">제 목</td>
<td width="20%">작성자</td>
<td width="20%">날 짜</td>
<td width="20%">조회수</td>
</tr>
<%
	vlist = dao.BoardList(startRow, endRow);

	if(vlist.isEmpty()){
		out.println("등록 된 게시글이 없습니다.");
	}else{
		for(int i=0;i<vlist.size();i++){
			BoardBean bean = vlist.get(i);
			%>
			<tr>
			<td width="20%"><%=bean.getNum() %></td>
			<td width="20%"><a href="read.jsp?num=<%=bean.getNum()%>"><%=bean.getSubject() %></a></td>
			<td width="20%"><%=bean.getName() %></td>
			<td width="20%"><%=bean.getRegdate() %></td>
			<td width="20%"><%=bean.getCount() %></td>
			</tr>
		<%}
	}
%>
<tr>
<td><input type="button" value="글작성" onclick="location.href='post.jsp'"></td>
</tr>
</table>
</div>
</body>
</html>