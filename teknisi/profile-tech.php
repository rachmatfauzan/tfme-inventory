<?php 

session_start();
include "../config/config.php";


$idUser=$_SESSION["id-user"];

$query =  mysqli_query($conn, "SELECT * FROM user WHERE id_user ='$idUser'");
$result = mysqli_fetch_array($query);

if(!isset($_SESSION['technician'])){
    header("location: index.php");
}

?>



<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- Link CSS -->
    <link rel="stylesheet" href="css/dashboard-tech.css">
    <link rel="stylesheet" href="css/profile-tech.css">

    <!-- Link CDN font-awesome  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

    <!-- Link Font Style Montserrat -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;900&display=swap" rel="stylesheet">

    <!-- link script datatable -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>

    <!-- Bootstrap Js -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>

    <!-- Bootstrap Ordered Datatables  -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <link rel="icon" href="../image/TFME.jpg">
    <title>Dashboard Inventory</title>
</head>

<body>
    <div class="grid">
        <!-- start navigasi -->
        <nav class="nav flex-column navbar-expand-lg bg-dark">
            <a class="brand" href="#">Inventory.</a>
            <hr>
            <div class="nav-item">
                <a class="nav-link" href="dashboard-tech.php"><i class="fas fa-history"></i>History
                    (PR)</a>
                <a class="nav-link" href="formulir-tech.php"><i class="fas fa-edit"></i>New Form</a>
                <a class="nav-link active" href="profile-tech.php"><i class="fas fa-user"></i>Profile</a>
            </div>

            <div class="copyright">
                <small class="text-white text-muted">&copy;Copyright TFME polibatam 2020 &bull; All reserved</small>
            </div>
        </nav>
        <!-- End navigasi -->
        <!-- start header -->
        <div class="konten">
            <div class="atap"><span> </span></div>

            <div class="navbar justify-content-between">
                <div class="profile">
                    <div class="wrapper-image">
                        <img src="../image/TECHNICIAN.png" alt="">
                    </div>
                    <div class="profile-name">
                        <h5 style="text-transform: capitalize;"><?= $_SESSION['user']; ?></h5>
                        <p>Technician TFME</p>
                    </div>
                    <div class="dropdown">
                        <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false"></button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="../logout.php"><i class="fas fa-sign-out-alt"></i>Log Out</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box">
                <form>
                    <div class="form-row d-flex justify-content-center">
                        <div class="profile-tag d-flex align-items-center justify-content-center">
                            <div class="tag">
                                <i class="fas fa-address-card"></i>
                            </div>
                            <div class="tag">
                                <h5>Profile Data</h5>
                            </div>
                        </div>
                    </div>
                    <hr style="border-color: gray; opacity: 0.6;">
                    <div class="form-row">
                        <div class="col-sm-10">
                            <label class="text-bold">Full Name</label>
                            <input type="text" class="form-control" style="text-transform: capitalize;" value="<?= $result['name']; ?>" disabled>
                        </div>
                        <div class="col">
                            <label>ID</label>
                            <input type="text" class="form-control" style="text-transform: capitalize;" value="<?= $result['id_user']; ?>" disabled>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col-sm-10">
                            <label class="text-bold">Email</label>
                            <input type="text" class="form-control" style="text-transform: capitalize;" value="<?= $result['email']; ?>" disabled>
                        </div>
                        <div class="col-sm-2">
                            <label>Handphone</label>
                            <input type="text" class="form-control" style="text-transform: capitalize;" value="<?= $result['handphone']; ?>" disabled>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="col">
                            <label>Address</label>
                            <textarea style="height: 7rem;" class="form-control" disabled><?= $result['address']; ?></textarea>
                        </div>
                    </div>
                </form>
            </div>
        </div>
</body>

</html>