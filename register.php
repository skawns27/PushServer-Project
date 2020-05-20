<meta charset="UTF-8">
<?php
include_once 'config.php';

$conn=mysqli_connect(DB_HOST,DB_USER, DB_PASSWORD, DB_NAME);

if($conn){
	echo"접속 성공<br>";
	}

else{
	echo"접속 실패<br>";
	}

$token=$_POST["Token"];
if($token==NULL) echo "토큰값 없음<br>";

$db_sql="INSERT INTO PushUser(Token) Values ('$token') ON DUPLICATE KEY UPDATE Token='$token';";
mysqli_query($conn, $db_sql);

mysqli_close($conn);

?>