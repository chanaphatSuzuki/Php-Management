<nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4 fixed-top" style="z-index:101;">
  <a class="navbar-brand ml-4" href="document.php"> <i > Document</i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav mr-auto">
    </ul>
      <!-- <?php if(isset($_SESSION['admin'])){
        echo '<form action="admin.php" class="mr-2"><input type="submit" class="btn btn-danger" value="admin"></form>';
        echo '<form action="logout.php" class="mr-2"><input type="submit" class="btn btn-danger" value="Logout"></form>';
      }else{ ?>
       
          <form class="form-inline my-2 my-lg-0" action="login.php" method="post">
            <input class="form-control mr-sm-2" type="text" placeholder="userename" name="username">
            <input class="form-control mr-sm-2" type="password" placeholder="password" name="password">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
          </form>



      <?php } ?> -->
      <?php 
          if(isset($_SESSION['username'])){
            echo <<<HTML
              <form class="form-inline my-2 my-lg-0" action="./admin.php" method="post">
                <button class="btn btn-outline-danger mr-3 my-sm-0" type="submit"><i class="fas fa-user"></i> {$_SESSION['username']}</button>
              </form>
              <form class="form-inline my-2 my-lg-0" action="./php/logout.php" method="post">
                <button class="btn btn-outline-danger mr-3 my-sm-0" type="submit" ><i class="fas fa-angle-up"></i></i> Login</button>
              </form>
            HTML;
          }else{
            header("location:index.php");
          }
       ?>
  </div>
</nav>
