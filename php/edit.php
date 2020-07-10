<?php 
	require "connect.php";
	if($_GET){
		$data_id=$_GET['data_id'];
		$name_document=$_GET['name_document'];
		$detail=$_GET['detail'];
		$sql="update documents set 
			 name_document='$name_document',
			 detaile_document='$detail',
			 date=NOW() 
			 where id_document='$data_id'";
		$result =mysqli_query($connect,$sql);
		if($result){
			echo "อัพเดทข้อมูลเรียบร้อยแล้ว";
		}else{
			echo "อัพเดทข้อมูลไม่ได้";
		}

		exit();
	}
	$id_document=$_POST['data_id'];
	$sql="select * from documents where id_document='$id_document' ";
	$result=mysqli_query($connect,$sql);
	$num_row = mysqli_num_rows($result);
	$test=array();
	if($num_row>0){
		while($row=mysqli_fetch_assoc($result)){
			$test[0]=$row['name_document'];
			$test[1]=$row['detaile_document'];
		}
		echo json_encode($test);
	}else{
		echo "ไม่สามารถติดต่อฐานข้อมูลได้";
	}
	mysqli_close($connect);
 ?>