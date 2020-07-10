<?php  	session_start();
		echo <<<HTML
	   <form action="php/upload.php"  method="post" class="form-row" enctype="multipart/form-data">
		      	<div class="form-group col-md-12">
		      		<input type="text" class="form-control form-control-sm" placeholder="ชื่อไฟล์" name="name_document" required>
		      	</div>
		      	<div class="form-group col-md-12">
		      		<textarea class="form-control form-control-sm" rows="6" placeholder="รายละเอียด" name="detail" required></textarea>
		      	</div>
		      	<div class="form-group col-md-4">
		      		<div class="custom-file">
					  <input type="file" class="custom-file-input-s"  id="customFile" name="file_name_document" required>
					  <label class="custom-file-label" for="customFile" name="file_name_document" require  >Choose file</label>
					</div>
		      	</div>
		     	<input type="hidden" name="username" value="{$_SESSION['username']}" >
		      	<div class="form-group col-md-12">
		      		<input type="submit" value="save" class="btn btn-primary btn-sm">
		      		<input type="reset" value="reset" class="btn btn-danger btn-sm">
		      	</div>
		</form>
	HTML;
 ?>


