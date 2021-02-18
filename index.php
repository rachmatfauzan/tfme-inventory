<?php  

session_start();
include 'config/config.php';

if (isset($_SESSION["admin"] )){
    header("location: admin/dashboard-admin.php"); //Buat session sesuaikan dengan posisi
}else if (isset($_SESSION["iqa"] )){
    header("location: iqa/dashboard-iqa.php"); //Buat session sesuaikan dengan posisi
}else if (isset($_SESSION["technician"] )){
    header("location: teknisi/dashboard-tech.php"); //Buat session sesuaikan dengan posisi
}




// Logic Login
if (isset($_POST["login"])){
    
    $id = $_POST['id'];
    $pass = $_POST['password'];

    $query = mysqli_query($conn, "SELECT * FROM  user WHERE id_user = '$id'");


    if(mysqli_num_rows($query) == 1){
        // cek Password
        $result = mysqli_fetch_assoc($query);
        $_SESSION["id-user"] = $result["id_user"];
        $id = $_SESSION["id-user"];
        $_SESSION['user'] = $result["name"];

        if ( $pass === $result['password']){
            
            if($result['position'] == 'admin'){
                header("location: admin/dashboard-admin.php");
                // Set session
                $_SESSION['admin'] = $result['position'] == 'admin';
            }else if($result['position'] == "iqa"){
                header("location: iqa/dashboard-iqa.php");
                // Set session
                $_SESSION['iqa'] = $result['position'] == 'iqa';
            }
            else if($result['position'] == "technician"){
                header("location: teknisi/dashboard-tech.php");
                // Set session
                $_SESSION['technician'] = $result['position'] == 'technician';
            }

        }
        else{
            $userPass = true;
        }
    }
    else{
        $userWrong = true;
    }

}

?>





<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Link CSS  -->
    <link rel="stylesheet" href="css/style.css">
    <title>TFME Inventory</title>
    <link rel="icon" href="image/TFME.jpg">

    <!--  CDN SWAL-->
    <script src="swal2/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="swal2/dist/sweetalert2.min.css">
</head>

<body>
    <div class="left bg-dark">
        <div class="container">
            <img src="image/TFME-white.png" class="mt-4 ml-5" alt="logo-tfme">
            <h2 class="text-white font-weight-bold  ml-5">Log in.</h2>
            <p class="text-white text-lead text-muted ml-5 mr-5">Log in with your data that you entered during in admin
                inventory</p>
            <form class="ml-5 mr-5 mt-5" method="post">
                <div class="form-group">
                    <label for="exampleInputEmail1">Your ID</label>
                    <input type="number" class="form-control input-sm" id="exampleInputEmail1"
                        aria-describedby="emailHelp" placeholder="Your ID" autofocus name="id">
                </div>
                <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control input-group-sm" id="exampleInputPassword1"
                        placeholder="Password" name="password">
                </div>
                <button type="submit" class="btn font-weight-bold text-white btn-sm" name="login">Log in</button>
            </form>
        </div>
        <div class="copyright">
            <small class="text-white text-muted">&copy;Copyright TFME polibatam 2020 &bull; All reserved</small>
        </div>
    </div>
    <div class="right">
        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-pause="false"
            data-interval="3500">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="image/second-slide.svg" alt="First slide">
                    <div class="carousel-caption d-none d-md-block text-dark ml-4">
                        <h5>TFME Polibatam</h5>
                        <p>Teaching Factory Manufacturing of Electronics Politeknik Negeri Batam - Indonesia IC Packaging - PCB Manufacture and Assembly RF Test and Compliance</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="image/third-slide.svg" alt="Second slide">
                    <div class="carousel-caption d-none d-md-block text-dark ml-4">
                        <h5>TFME Vision</h5>
                        <p>Being a Center of Technolgy in Manufacturing Electronics That Support National Electronics Ecosystem</p>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="image/vel.svg" alt="Third slide">
                    <div class="carousel-caption d-none d-md-block text-dark ml-4">
                        <h5>TFME Mission</h5>
                        <p style="text-align: left;">1. Provides access to "real-like" manufacturing facilities to students and researchers <br>
                        2. Provides relevant trainings to improves knowledge, practical skills and comptencies <br>
                        3. Provide prototyping and low volume manufacturing services to SMEs, government bodies and other educational institutions</p>
                    </div>
                </div>
            </div>
        </div>
    </div>







    <!-- Swal2 -->
    <?php if(isset($userWrong)) :  ?>
    <script>
        swal.fire("ID Not Found", "Please Try Again !", "error");
    </script>
    <?php endif; ?>
    <?php if(isset($userPass)) :  ?>
    <script>
        swal.fire("Wrong Password", "Please Try Again !", "error");
    </script>
    <?php endif; ?>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
</body>

</html>