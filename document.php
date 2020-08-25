<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>หน้าเอกสาร</title>
	<?php require "component/header.php"; ?>
</head>
<body >
	<?php require "component/navbar.php"; ?>
	<div class="container  ">
		<div class="row mt-5 ">
			<div class="col-md-12 mt-5">
				<table class="table table-hover">
				<thead class="thead-dark">
		 		<tr align="center">
						<th>รหัส</th>
						<th>ชื่อเอกสาร</th>
						<th>รายละเอียด</th>
						<th>ชนิด</th>
						<th>วันที่</th>
						<th>สร้างโดย</th>
					</tr>
					</thead>
		 		<?php 
		 			require "php/connect.php";
		 			$size=5;
		 			$url=$_SERVER['PHP_SELF'];
		 			if(isset($_GET['page'])){
		 				$page=$_GET['page'];
		 			}else{
		 				$page=1;
		 			}
		 			$sql = "select * from documents where status_post='active' ";
		 			$result=mysqli_query($connect,$sql);
		 			$total=mysqli_num_rows($result);
		 			$npage=ceil($total/$size);
		 			$start=($page-1)*$size;

		 			$sql = "select * from documents where status_post='active' limit $start,$size ";
		 			$result=mysqli_query($connect,$sql);
		 			while($row=mysqli_fetch_assoc($result)){
		 				echo 
		 				'<tr align="center">
		 					<td >'.$row["id_document"].'</td>
		 					<td ><a  href="documents/'.$row["name_document"].'.'.$row["type"].'">'.$row["name_document"].'</a></td>
		 					<td >'.$row["detaile_document"].'</td>
		 					<td>'.$row["type"].'</td>
		 					<td>'.$row["date"].'</td>
		 					<td>'.$row["username_post"].'</td>
		 				</tr>';
		 			}
		 		 ?>
				</table> 
				<nav aria-label="Page navigation example">
  					<ul class="pagination justify-content-end">
				<?php 
					if($page<>$npage){
					}
					if($page<>1){
						$back=$page-1;
						echo '<li class="page-item "><a class="page-link" href="'.$url.'?page='.$back.'">ย้อนกลับ</a></li>';
					}
					for ($i=1;$i<=$npage;$i++) { 
						if($i==$page){
							if($i>1){
								echo '<li class="page-item"><a class="page-link" href="'.$url.'?page='.$i.'">'.$i.'</a></li>';
							}
						}
						else{
							echo '<li class="page-item"><a class="page-link" href="'.$url.'?page='.$i.'">'.$i.'</a></li>';
						}
					}

					if($page<>$npage){
						$next=$page+1;
						echo '<li class="page-item"><a class="page-link" href="'.$url.'?page='.$next.'">ถัดไป</a></li>';
					}
				 ?>
				 </ul>
					</nav>
				</div>
		</div>
	</div>
	<?php require "component/footer.php"; ?>
</body>
</html>