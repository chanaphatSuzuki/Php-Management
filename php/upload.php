<?php 
	require "connect.php";
	$name_document=$_POST['name_document'];
	$username_post=$_POST['username'];
	$detail=$_POST['detail'];
	$path=pathinfo($_FILES['file_name_document']['name'],PATHINFO_EXTENSION);
	
	$sql="insert into documents (name_document,detaile_document,type,date,username_post) values('$name_document','$detail','$path',NOW(),'$username_post')";
	$result=mysqli_query($connect,$sql);

	if($result){
		if(move_uploaded_file($_FILES['file_name_document']['tmp_name'],"../documents/".$name_document.".".$path)){
			echo "<script>alert('บันทึกข้อมูลเรียบร้อยแล้ว')</script>";
			header("Refresh:0.1; url=../admin.php");

		}

	}else{
		echo "<script>alert('ไม่สามารถอัพโหลดได้ หรือมีชื่อซ้ำกัน')</script>";
		header("Refresh:0.1; url=../admin.php");
		
	}



 ?>