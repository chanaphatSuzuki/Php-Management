<?php 
	require_once "connect.php";
	$value=$_POST['value'];
	$data_id=$_POST['data_id'];
	if($value=='inactive'){
		$value="active";
	}else{
		$value="inactive";
	}
	$sql = "update documents set status_post='$value' where id_document='$data_id'";
	$result=mysqli_query($connect,$sql);
	if($result){
		echo "เปลี่ยนสถานะเรียบร้อย";
	}else{
		echo "ไม่สามารถแก้ไขได้";
	}

 ?>