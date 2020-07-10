<?php 
	require "connect.php";
	$email=$_POST['email'];
	$password=$_POST['password'];
	$username=$_POST['username'];

	$sql="insert into login values('','$email','$username','$password','0')";
	$result=mysqli_query($connect,$sql);

	if($result){
		echo "สมัครสมาชิกเรียบร้อย";
	}else{
		echo "Email หรือ username ของท่านมีคนใช้แล้ว";
	}
 ?>