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
                <a class="nav-link" href="mtl"><i class="fas fa-copy"></i>Material Issues</a>
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
            <div class="box" style="position:relative;font-family:'Times New Roman', Times, serif;">
                <div class="content">
                    <div class="row">
                        <a href="history-wd" class="btn text-danger container"><i class="fas fa-long-arrow-alt-left"></i> Back</a>
                    </div>
                    <header>
                        <div class="row" style=" border-bottom:double;">
                            <div class="col-3 title">
                                <img src="../image/poltek.png" style="width: 200px; height:150px;">
                            </div>
                            <div class="col-lg-6 text-center">
                                <label>
                                    <p>POLITEKNIK NEGERI BATAM</p>
                                    <h5><strong>TEACHING FACTORY MANUFACTURING OF ELECTRONICS</strong></h5>
                                    <p class="m-0">Jalan Ahmad Yani, Batam Centre, Kecamatan Batam Kota, Batam 29461</p>
                                    <p class="m-0">Telepon +62 778 469856 - 469860 Faksimile +62 778 463620</p>
                                    <p class="m-0">Laman: www.tfme.polibatam.ac.id/inventory Surel: tfmeminteractive@gmail.com</p>
                                </label>
                            </div>
                            <div class="col-3 d-flex justify-content-end title">
                                <img src="../image/black-tfme.png" style="width: 250px; height:150px;">
                            </div>
                        </div>
                    </header>
                    <section>
                        <div class="row mt-2">
                            <h5 class="text-center w-100"><b>BUKTI PENGELUARAN INVENTORY</b></h5>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="indent ml-5">
                                    <label style="width:150px;"><b>Ditujukan Kepada</b></label>
                                    <label>: Garda</label>
                                    <br>
                                    <label style="width:150px;"><b>NIP</b></label>
                                    <label>: 3311801036</label>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="indent ">
                                    <label style="width:150px;" class="text-left"><b>No. Bukti</b></label>
                                    <label>: BP0000001</label>
                                    <br>
                                    <label style="width:150px;" class="text-left"><b>Tanggal</b></label>
                                    <label>: 19 MEI 2021</label>
                                </div>
                            </div>
                            <div class="col-6"></div>
                        </div>
                    </section>
                    <div class="row container">
                        <div class="status text-center w-100">
                            <label ><b>Status</b></label>
                            <label>: <span class="bg-danger p-1 text-white rounded">Rejected</span></b></label>
                        </div>
                    </div>
                    <div class="section mt-4">
                        <div class="table-responsive container">
                            <table class="table table-hover table-bordered table-sm">
                                <tr>
                                    <th width="1%" rowspan="2">No</th>
                                    <th rowspan="2">ITEM</th>
                                    <th rowspan="2">CC</th>
                                    <th rowspan="2">Part Number</th>
                                    <th rowspan="2">Purpose</th>
                                    <th colspan="2">Volume</th>
                                </tr>
                                <tr>
                                    <th>QTY</th>
                                    <th>UOM</th>
                                </tr>
                                <tr>
                                    <td class="text-center">1</td>
                                    <td>Magazine Lead Frame</td>
                                    <td>40</td>
                                    <td>PIK9091</td>
                                    <td>Penelitian</td>
                                    <td>209 Liter</td>
                                    <td>-</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>

</html>