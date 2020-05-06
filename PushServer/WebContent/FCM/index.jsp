<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
            "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> Push server prototype</h2>
<h1> Push 메세지 입력</h1>

<form action="push_notification.jsp" method="POST">
	<textarea name="message" rows="4" cols="50" placeholder="input your message"></textarea><br>
	<input type="submit" name="submit" value="Send" id="submitButton">
	</form>
</body>
</html>