<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%--핸드폰에서 토큰값으 전달 받아 DB로 저장--%>
<%
	Connection conn =null;
	PreparedStatement pstmt=null;
	String sql=null;
	String token=null;
	String requestMethod=null;
	
	request.setCharacterEncoding("utf-8");
	
	try{
		String url="jdbc:sqlserver://localhost:1433;databaseName=;user=;password=";
		conn=DriverManager.getConnection(url);//url과 연결  db연결
		out.println("MESSQL 연결 성공");
	}catch(Exception e){
		out.println("MESSQL 연결 실패");
		e.printStackTrace();
	}
	
	token=request.getParameter("Token");//sql에 Token 요청
	
	if(token.equals("")){
		out.println("토큰 값이 전달 되지 않았습니다");
	} else{
		
		sql="INSERT INTO USER(Token) VALUES(?)";
		pstmt=conn.prepareStatement(sql); //sql에 들어갈 명령문
		pstmt.setString(1,token);//첫번쨰 변수 값에 token 
		pstmt.executeUpdate();//pstmt 실행
	}
	%>
