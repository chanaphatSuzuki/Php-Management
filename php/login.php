<?php 
	require "connect.php";
	$username=$_POST['username'];
	$password=$_POST['password'];
	
	$sql = "select * from login where username='$username' && password='$password'";
	$result = mysqli_query($connect,$sql);

	$row = mysqli_num_rows($result);

	if($row==1){
		echo "เข้าสู่ระบบเรียบร้อย";
		session_start();
		while($row=mysqli_fetch_assoc($result)){
			$_SESSION['username']= $row['username'];
			$_SESSION['status'] =$row['status'];
			$_SESSION['username']=$row['username'];
		}
	}else{
		echo "รหัสผ่านของท่านไม่ถูกต้อง";
	}
 ?>