<?php session_start(); ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Login</title>
	<?php require "component/header.php" ?>
    <link rel="stylesheet" href="node_modules/css/style.css">
    <script>
    	$(document).ready(function(){
    		//login
    		$("[value=Login]").click(function(event) {
    			event.preventDefault();
    			$.ajax({
    				url: 'php/login.php',
    				type: 'post',
    				data: $(".form-login").serialize(),
    				success:function(result){
    					swal(result)
                        setTimeout(()=>{
                            window.location.reload();
                        },1350)
    				}
    			})
    		});

    		//register
    		$("[value=CreateAccount]").click(function(event){
    			event.preventDefault();
    			$.ajax({
    				url: 'php/register.php',
    				type: 'post',
    				data: $(".form-register").serialize(),
    				success:function(result){
                        swal(result)
    					setTimeout(()=>{
                            window.location.reload();
                        },1350)
    				}
    			})
    			
    		});
    	});
    </script>
</head>
<body >
	<div  class="signup-form  "  >
	<?php 
			if(isset($_SESSION['username'])&&isset($_SESSION['status'])){
					header("Location:document.php");
			}
			if($_GET){
				echo 
					'<form class="form-register" action="index.php" method="post">
				        <h2>Register</h2>
				        <input type="email" placeholder="Email" class="txtb form-control border" name="email" required>
				        <input type="text" placeholder="Username" class="txtb form-control border"  name="username" required>
				        <input type="password" placeholder="Password" class="txtb form-control border" name="password" required>
				        <input type="submit" value="CreateAccount" class="btn btn-primary">
				        <a href="index.php" class="btn btn-danger mt-2">Back</a>
				    </form>'
				;
			}else{

				echo 
					'<form  class="form-login">
				        <h2 class="mb-5"><i class="fas fa-user"></i> Login</h2>
				        <input type="text" placeholder="Username" class="txtb form-control border" name="username" required>
				        <input type="password" placeholder="Password" class="txtb form-control border" name="password" required>
				        <input type="submit" value="Login" class="btn btn-primary mt-5">
				       	<a href="index.php?register" class="btn btn-primary mt-2">Cleate Account</a>
				    </form>'
				;
		 }?>
    </div>
	
</body>
</html>