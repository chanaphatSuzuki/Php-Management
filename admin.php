<?php session_start(); 
	if(isset($_SESSION['status'])){
?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>หน้าแอดมิน</title>
	<link rel="stylesheet" href="">
	<?php require "component/header.php"; ?>

<!--DataTable-->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.css"/>
<script type="text/javascript" src="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.js"></script>
<style>
	.sidebar {
  position: fixed;
  top: 0%;
  bottom: 0;
  left: 0;
  z-index: 0; /* Behind the navbar */
  padding: 48px 0 0; /* Height of navbar */
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
}
</style>
<script>
	$(document).ready(function(){
		
		$("a.menu").click(function(event) {
			event.preventDefault();
			$(".menu").removeClass('active');
			$(this).addClass('active');
			var command=$(this).attr("data-id");
			if(command=="insert"){
				$.ajax({
					url: 'component/upload_admin.php',
					success:function(result){
					 $(".details").html(result);
					}
				})
			}else if(command=="edit"){
				$.ajax({
          url: 'component/delete_admin.php',
          success:function(result){
           $(".details").html(result);
          }
        })
			}
		});
		$(".new").click(); //ให้คลิกหน้าเมนูแรกตอนเริ่มหน้าเว็ปของแอดมิน
		
	});
</script> 
</head>
<body>
	<?php require "component/navbar.php"; ?>
	<div class="container-fluid">
  <div class="row">

    <!-- Sidebar -->
    <ul class="sidebar">
      <li class="nav-item ml-4">
            <a class="nav-link active menu new" href="#" data-id="insert">
              เพิ่มเอกสาร
            </a>
          </li>
          <?php 
            if(isset($_SESSION['status'])&&$_SESSION['status']==1){
              echo 
                '<li class="nav-item ml-4">
                  <a class="nav-link menu delete" href="" data-id="edit">
                    จัดการเอกสาร
                  </a>
                </li>'
              ;
            }
           ?>
    </ul>


    

    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4 mt-5">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Admin</h1>
      </div>
      		<div class="details">
      			
      		</div>
    </main>
  </div>
</div>
<?php require "component/footer.php"; ?>
</body>
</html>
<?php 
	}else{
		header("location:index.php");
	}
 ?>


