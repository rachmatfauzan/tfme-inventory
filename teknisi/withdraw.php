<?php 

session_start();
include "../config/config.php";


if(!isset($_SESSION['technician'])){
    header("location: ../index");
}


$name = $_SESSION['user'];

$query = mysqli_query($conn, "SELECT * FROM form_wd WHERE requestor = '$name' GROUP BY kode_wd ORDER BY kode_wd DESC LIMIT 2 ");




?>


<!-- Kode PR Auto -->





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

    <!--  CDN SWAL-->
    <script src="../swal2/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="../swal2/dist/sweetalert2.min.css">

    <!-- Bootstrap Js -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
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
                <a class="nav-link" href="dashboard-tech"><i class="fas fa-history"></i>History
                    (PR)</a>
                <a class="nav-link" href="formulir-tech"><i class="fas fa-edit"></i>New Form</a>
                <a class="nav-link active" href="#"><i class="fas fa-edit"></i>With Draw Item</a>
                <a class="nav-link" href="profile-tech"><i class="fas fa-user"></i>Profile</a>
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
                        <h5 style="text-transform:capitalize;"><?= $_SESSION['user']; ?></h5>
                        <p>Technician TFME</p>
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
            <div class="box" style="position:relative;">
                <div class="row">
                    <div class="dataEntry col-sm-6">
                        <div class="title mb-4 text-uppercase d-flex justify-content-center">
                            <h5 class="font-weight-bold text-secondary"><i class="fas fa-fax mr-2"></i>Withdraw Item
                            </h5>
                        </div>
                        <form method="post" action="withdrawForm" autocomplete="off">
                            <div class="col-lg-12 col-lg-offset-3">
                                <div class="form-group">
                                    <label for="count_add">Add record <b>
                                            < 6 Item</b> </label> <input type="text" autofocus name="count_add"
                                                id="count_add" maxlength="1" pattern="[1-5]+" class="form-control"
                                                placeholder="How Many item You Need ? 1-5" required>
                                </div>
                                <div class="form-group pull-right">
                                    <input type="submit" name="genarate" value="Generate" class="btn-sm btn-info"
                                        style="box-shadow: 2px 10px 26px -7px rgba(0,0,0,0.44);">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-6">
                        <div class="title mb-4  d-flex flex-column align-items-center justify-content-center">
                            <h5 class="font-weight-bold text-secondary"><i class="fas fa-history mr-2"></i>Withdraw Item
                            </h5>
                            <a href="history-wd" class="btn btn-info w-100 btn-sm"
                                style="box-shadow: 2px 10px 26px -7px rgba(0,0,0,0.44); height:100%;">See History<i
                                    class="fa fa-search ml-2"></i></a>
                        </div>
                        <light>- Your Last Request -</light>
                        <div class="table-responsive">
                            <table class="table table-sm" style="font-size: 13px;">
                                <tr>
                                    <th>Part Number</th>
                                    <th>Purpose</th>
                                    <th>QTY</th>
                                    <th>Date</th>
                                </tr>
                                <?php foreach ($query as $data) : ?>
                                <tr>
                                    <td><?= $data['part_number']; ?></td>
                                    <td><?= $data['purpose']; ?></td>
                                    <td><?= $data['qty']; ?></td>
                                    <td><?= $data['tanggal']; ?></td>
                                </tr>
                                <?php endforeach; ?>
                            </table>
                            <div>... <a href="history-wd"><small>Load More</small></a></div>
                        </div>
                    </div>
                </div>
                <div class="row" style="position: absolute;bottom:0;">
                    <strong class="text-secondary"><small><i>*Chosse What You Needed</i></small></strong>
                </div>
            </div>
        </div>
    </div>

</body>

</html>