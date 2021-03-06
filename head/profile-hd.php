<?php 

session_start();
include "../config/config.php";


$idUser=$_SESSION["id-user"];

$query =  mysqli_query($conn, "SELECT * FROM user WHERE id_user ='$idUser'");
$result = mysqli_fetch_array($query);

if(!isset($_SESSION['head'])){
    header("location: ../index");
}


if(isset($_POST['update'])){
    $id = $idUser;
    $fname = $_POST['name'];
    $password = $_POST['password'];
    $handphone = $_POST['handphone'];
    $email = $_POST['email'];
    $address = $_POST['address'];

    $update = mysqli_query($conn, "UPDATE user SET
    name = '$fname',
    password = '$password',
    handphone = '$handphone',
    email = '$email',
    address = '$address'
    WHERE id_user = '$id' ");

    if ($update){
        $alert = true;
    }
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
    <link rel="stylesheet" href="css/dashboard-hd.css">
    <link rel="stylesheet" href="css/profile-hd.css">

    <!-- Link CDN font-awesome  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

    <!-- Link Font Style Montserrat -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;900&display=swap" rel="stylesheet">

    <!-- Bootstrap Js -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
    <!--  CDN SWAL-->
    <script src="../swal2/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="../swal2/dist/sweetalert2.min.css">

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
                <a class="nav-link" href="dashboard-hd"><i class="fas fa-box-open"></i>Purchase Order</a>
                <a class="nav-link active" href="#"><i class="fas fa-user"></i>Profile</a>
            </div>

            <div class="copyright">
                <small class="text-white text-muted">&copy;Copyright TFME polibatam 2020 &bull; All reserved</small>
            </div>

        </nav>
        <div class="konten">
            <div class="atap"><span> </span></div>
            <div class="navbar justify-content-between">
                <div class="profile">
                    <div class="wrapper-image">
                        <img src="../image/HOD.png" alt="">
                    </div>
                    <div class="profile-name">
                        <h5 style="text-transform: capitalize;"><?= $_SESSION['user']; ?></h5>
                        <p>Head of Division</p>
                    </div>
                    <div class="dropdown">
                        <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false"></button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="../logout"><i class="fas fa-sign-out-alt"></i>Log Out</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box">
                <form method="POST">
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
                    <fieldset id="mySet">
                        <hr style="border-color: gray; opacity: 0.6;">
                        <div class="form-row">
                            <div class="col-sm-10">
                                <label class="text-bold">Full Name</label>
                                <input type="text" class="form-control" style="text-transform: capitalize;"
                                    value="<?= $result['name']; ?>" name="name" readonly>
                            </div>
                            <div class="col">
                                <label>ID</label>
                                <input type="text" readonly class="form-control" style="text-transform: capitalize;"
                                    value="<?= $result['id_user']; ?>" name="id">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-sm-10">
                                <label class="text-bold">Email</label>
                                <input type="text" class="form-control" value="<?= $result['email']; ?>" name="email">
                            </div>
                            <div class="col-sm-2">
                                <label>Handphone</label>
                                <input type="text" class="form-control" style="text-transform: capitalize;"
                                    value="<?= $result['handphone']; ?>" name="handphone">
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="col-sm-10">
                                <label>Address</label>
                                <textarea style="height: 4rem;" class="form-control"
                                    name="address"><?= $result['address']; ?></textarea>
                            </div>
                            <div class="col-sm-2">
                                <label>Password</label>
                                <input type="password" id="pwd" class="form-control" value="<?= $result['password']; ?>"
                                    name="password">
                                <p style="font-size: small;cursor:pointer;" class="text-center" id="see"><i
                                        class="fa fa-eye"></i></p>
                            </div>
                        </div>
                    </fieldset>
                    <label>
                        <input class="checkbox" type="checkbox" onchange="toggleDisable(this);" id="check" />
                        Edit
                    </label>
                    <button class="btn btn-sm float-right btn-info rounded-0" id="btn-update"
                        name="update">Update</button>
                </form>
            </div>
        </div>
    </div>
    <?php if(isset($alert)) :  ?>
    <script>
        swal.fire("Updated Success", "Please re-login", "success");
        setTimeout(function () {
            window.top.location = "../logout"
        }, 1000);
    </script>
    <?php endif; ?>

    <script>
        function toggleDisable(checkbox) {
            var toggle = document.getElementById("mySet");
            var btn = document.getElementById("btn-update");
            checkbox.checked ? toggle.disabled = false : toggle.disabled = true;
            checkbox.checked ? btn.disabled = false : btn.disabled = true;
        }

        window.onload = function () {
            toggleDisable(document.getElementById('check'));
        }

        // see password
        var see = document.getElementById('see');

        see.addEventListener('click', details);

        function details() {
            (pwd.type == 'password') ? pwd.type = 'text':
                pwd.type = 'password';
        }
    </script>

</body>

</html>