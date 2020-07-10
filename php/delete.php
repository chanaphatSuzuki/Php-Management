<?php 
	require "connect.php";
	$id_document=$_POST['id_document'];

	

 	$sql2="select * from documents where id_document='$id_document'";
 	$result=mysqli_query($connect,$sql2);
 	while($row=mysqli_fetch_assoc($result)){
 		$name=$row['name_document'];
 		$type=$row['type'];
 	}
 	unlink("../documents/".$name.".".$type);
 	$sql="delete from documents where id_document='$id_document'";
 	mysqli_query($connect,$sql);
 ?>