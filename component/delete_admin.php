<div class="row">
	<div class="col-md-12 mx-auto mb-5">
		 	<table  class="table table-striped table-bordered"  id="data-table">
		 		<thead>
		 		<tr>
						<th>รหัส</th>
						<th>ชื่อเอกสาร</th>
						<th>รายละเอียด</th>
						<th>ชนิด</th>
						<th>วันที่</th>
						<th>สร้างโดย</th>
						<th>คำสั่ง</th>
					</tr>
				</thead>
		 		<?php 
		 			require "../php/connect.php";
		 			$sql = "select * from documents";
		 			$result=mysqli_query($connect,"select * from documents");
		 			while($row=mysqli_fetch_assoc($result)){
		 				echo 
		 				'<tr style="text-align: center;">
		 					<td>'.$row["id_document"].'</td>
		 					<td>'.$row["name_document"].'</td>
		 					<td>'.$row["detaile_document"].'</td>
		 					<td>'.$row["type"].'</td>
		 					<td>'.$row["date"].'</td>
		 					<td>'.$row["username_post"].'</td>
		 					<td><input type="button" value="แก้ไข" class=" btn-sm btn btn-primary " data-id="'.$row['id_document'].'">
		 					<input type="button" value="ลบ" class=" btn-sm btn btn-danger " data-id="'.$row['id_document'].'">
		 					<input style="width:30%;" type="button" value="'.$row['status_post'].'" class="btn-sm btn btn-success status-post" data-id="'.$row['id_document'].'"></td>
		 				</tr>';
		 			}
		 		 ?>
		 		 
				</table> 
	</div>
</div>


<script>
	$(document).ready(function(event){

		$("[value=แก้ไข]").click(function(){  //ปุ่มแก้ไข
			var data_id=$(this).attr("data-id");
			$("#data_id").val(data_id);
			$.ajax({
				url: './php/edit.php',
				type: 'post',
				data: {data_id:data_id},
				dataType:'json',
				success:function(result){
					$("[name=name_document]").val(result[0]);
					$("[name=detaile_document]").val(result[1]);
					$(".modal").modal('show');
				}
			})
		});

		$(".edit").click(function(event) {  //ปุ่มแก้ไขใน Modal
			var name_document= $("[name=name_document]").val();
			var detail= $("[name=detaile_document]").val();
			var data_id=$("#data_id").val();
			$.ajax({
				url: './php/edit.php',
				type: 'get',
				data: {name_document:name_document,detail:detail,data_id:data_id},
				success:function(result){
					
					setTimeout(window.location.reload(),9000000)
				}
			})
		});

		$("[value=ลบ]").click(function(event){  //ปุ่มลบ
			var id_document=$(this).attr("data-id");
			$.ajax({
				url: './php/delete.php',
				type: 'post',
				data: {id_document:id_document},
				success:function(result){
					swal("ลบข้อมูลเรียบร้อยแล้ว")
					$(".delete").click();
				}
			})
		});


		$(".status-post").click(function(){ //ปุ่มอนุญาตให้โพส
			var value= $(this).val();
			var data_id=$(this).attr("data-id");
			$.ajax({
				url:'./php/status_post.php',
				type: 'post',
				data: {value:value,data_id:data_id},
				success:function(result){
					swal(result)
					$("[data-id=edit]").click();
				}
			})
		});
		//Data Table
    		$("#data-table").DataTable();
	});
</script>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">แก้ไข</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form class="form-modal">
        	<div class="form-group">
        		<h6>ชื่อไฟล์</h6>
        		<input type="text" class="form-control"  name="name_document">
        	</div>
        	<div class="form-group">
        		<h6>รายละเอียด</h6>
        		<input type="text" class="form-control" name="detaile_document">
        	</div>        
      </div>
      <div class="modal-footer">
      	<input type="hidden" name="data_id" id="data_id">
        <button type="submit" class="btn btn-primary edit" >แก้ไข</button>
        </form>
      </div>
    </div>
  </div>
</div>