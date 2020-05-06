<%@ page import="java.net.URLEncoder" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.google.android.gcm.server.*" %>

<%
	ArrayList<String> token=new ArrayList<String>();
	String MESSAGE_ID= String.valueOf(Math.random()%100+1);
	boolean SHOW_ON_IDLE=false;
	int LIVE_TIME=2;
	int RETRY=2;
	
	String simpleApiKey="fmc 서버키";
	String gcmURL="";
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	String msg=request.getParameter("message");//index에서 전송한 message
	
	if(msg==null||msg.equals("")){
		msg="";
		}
		
	msg=new String(msg.getBytes("UTF-8"),"UTF-8");
	
	try{
		String url="jdbc:sqlserver://localhost:1433;databaseName=;user;password;";
		conn=DriverManager.getConnection(url);
		stmt=conn.createStatement();
		String sql="select token from users";//token attribute 호출
		rs=stmt.executeQuery(sql);
		
		//bd에서 토큰 읽어옴 
		while(rs.next()){
			token.add(rs.getString("Token"));
		}
		conn.close();
		
		Sender sender=new Sender(simpleApiKey);
		Message message= new Message.Builder()
							.collapseKey(MESSAGE_ID)
							.delayWhileIdle(SHOW_ON_IDLE)
							.timeToLive(LIVE_TIME)
							.addData("message",msg)
							.build();
		MulticastResult result1=sender.send(message,token,RETRY);
		if(result1!=null){
		List<Result> resultList=result1.getResults();
		for(Result result:resultList){
		System.out.println(result.getErrorCodeName());
				}
			}
	}catch(Exception e){
		e.printStackTrace();
	}
	%>
		