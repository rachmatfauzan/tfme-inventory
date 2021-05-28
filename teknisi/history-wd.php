<?php 

session_start();
include "../config/config.php";


if(!isset($_SESSION['technician'])){
    header("location: ../index");
}


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
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">

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

                    <div class="col-sm-12">
                        <div class="title mb-4  d-flex flex-column align-items-center justify-content-center">
                            <a href="withdraw" class="text-danger container"><i
                                    class="fas fa-long-arrow-alt-left mr-2"></i>Back</a>
                            <h5 class="font-weight-bold text-secondary"><i class="fas fa-history mr-2"></i>History
                                Withdraw</h5>
                            <label href="history-wd" class=" bg-info text-white p-1 w-100 rounded-0 text-center"
                                style="box-shadow: 2px 10px 26px -7px rgba(0,0,0,0.44); height:100%;" disabled>See
                                History<i class="fa fa-search ml-2"></i></label>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-sm table-bordered w-100" id="data" style="font-size: 13px;">
                                <thead>
                                    <tr class="text-center list-group-item-info">
                                        <th>Item Name</th>
                                        <th>Purpose</th>
                                        <th>QTY</th>
                                        <th>Date</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Magazine LEad Frame</td>
                                        <td>Polshing skuiji</td>
                                        <td>10 Batang</td>
                                        <td>21 May 2021</td>
                                        <td>
                                            <a href="invoice-wd" class="btn btn-sm text-danger">See Detail</a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Magazine LEad Frame</td>
                                        <td>Polshing skuiji</td>
                                        <td>10 Lembar</td>
                                        <td>21 May 2021</td>
                                        <td>
                                            <a href="invoice-wd" class="btn btn-sm text-danger">See Detail</a>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="row" style="position: absolute;bottom:0;">
                    <strong class="text-secondary"><small><i>*Chosse What You Needed</i></small></strong>
                </div>
            </div>

</body>

<script>
        $(document).ready(function () {
            $('#data').DataTable({
                scrollX: true,
                "ordering": false,
                "lengthMenu": [
                    [10, 50, 100, -1],
                    [10, 50, 100, "All"]
                ]
            });
        });
    </script>
</html>