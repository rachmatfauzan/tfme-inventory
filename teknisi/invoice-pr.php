<?php 

session_start();
include "../config/config.php";


if(!isset($_SESSION['technician'])){
    header("location: index.php");
}


// ambil Id
$id = $_GET['id'];

$sql = mysqli_query($conn, "SELECT * FROM form_pr WHERE kode_pr = '$id'");

$hasil = mysqli_fetch_assoc($sql);
// var_dump($hasil['kode_pr']);





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
                <a class="nav-link active" href="dashboard-tech.php"><i class="fas fa-history"></i>History
                    (PR)</a>
                <a style="opacity: 0.6;" class="nav-link text-white" id="navigation" onclick="navError()"><i class="fas fa-edit"></i>New Form</a>
                <a style="opacity: 0.6;" class="nav-link text-white"  id="navigation" onclick="navError()"><i class="fas fa-user"></i>Profile</a>
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
                            <a class="dropdown-item" href="../logout.php"><i class="fas fa-sign-out-alt"></i>Log Out</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box">
                <div class="data-entry">
                    <div class="title mb-4 text-uppercase d-flex justify-content-center flex-column align-items-center">
                        <h5 class="font-weight-bold text-secondary">PURCHASE REQUEST</h5>
                        <a href="dashboard-tech.php" style="font-size: 11px;" class="btn btn-info btn-sm "><i
                                class="fas fa-backspace mr-2"></i>back to all history</a>
                    </div>
                    <div class="form-group">
                        <form method="post">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tr>
                                        <td colspan="2" align="center">
                                            <h2 style="margin-top:10.5px">Detail Purchase Request</h2>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="overflow-x: hidden;">
                                            <div class="row">
                                                <div class="col-md-8">
                                                    To,<br />
                                                    <b>RECEIVER (BILL TO)</b><br />
                                                    <input type="text" name="order_receiver_name"
                                                        id="order_receiver_name" class="form-control input-sm"
                                                        placeholder="Admin Inventory" disabled>
                                                    <label name="order_receiver_address" id="order_receiver_address"
                                                        class="form-control " rows="4" disabled>Teaching
                                                        Factory Manufacturing of Electrnoics Politeknik Negeri Batam
                                                        (TFME), <br> Jalan Ahmad Yani, Batam Kota, Batam, <br> Kepulauan
                                                        Riau 29461</label>
                                                </div>
                                                <div class="col-md-4">
                                                    PR Code<br />
                                                    <?php $code = sprintf("%05s", $hasil['kode_pr']) ?>
                                                    <p class="form-control d-flex justify-content-between align-items-center list-group-item-secondary" ><?= "PR-".$code; ?><i class="fas fa-barcode mr-2"></i></p>
                                                    <?php $date = date_create($hasil['pr_date']); ?>
                                                    PR Date<br />
                                                    <p class="form-control d-flex justify-content-between align-items-center list-group-item-secondary" ><?= date_format($date, 'j F Y'); ?><i class="far fa-calendar-alt mr-2"></i></p>
                                                </div>
                                            </div>
                                            <br />
                                            <table id="invoice-item-table" class="table table-bordered">
                                                <tr>
                                                    <th width="40%" colspan="3">ITEM</th>
                                                    <th width="15%" colspan="2">NUMBERING</th>
                                                    <th width="15%" colspan="2">ORDER</th>
                                                </tr>
                                                <tr>
                                                    <th>Item Description</th>
                                                    <th>Type</th>
                                                    <th width="3%">Quantity</th>
                                                    <th width="20%">Part Number</th>
                                                    <th width="3%" style="text-align: center;">Cost Center</th>
                                                    <th>Account Code</th>
                                                    <th>Specification</th>
                                                </tr>

                                                <?php foreach($sql as $data) :?>
                                                <tr class="addForm">
                                                    <td><textarea
                                                            id="item_description " rows="2" class="form-control" disabled
                                                            style="height: auto;"> <?= $data['item_description']; ?></textarea></td>
                                                    <td><textarea id="type" rows="2"
                                                            class="form-control" disabled><?= $data['type']; ?></textarea>
                                                    </td>
                                                    <td><textarea id="par_number" rows="2"
                                                            class="form-control" disabled style="text-align: center;"><?= $data['quantity']; ?></textarea>
                                                    </td>
                                                    <td><textarea id="par_number" rows="2"
                                                            class="form-control" disabled><?= $data['part_number']; ?></textarea>
                                                    </td>
                                                    <td>
                                                    <textarea id="account-code" rows="2"
                                                            class="form-control" disabled> <?= $data['cost_center']; ?></textarea>
                                                        </td>
                                                    <td><textarea id="account-code" rows="2"
                                                            class="form-control" disabled><?= $data['account_code']; ?></textarea>
                                                    </td>
                                                    <td><textarea id="account-code" rows="2"
                                                            class="form-control" disabled><?= $data['spesifikasi']; ?></textarea>
                                                    </td>
                                                 </tr>
                                                 <?php endforeach; ?>
                           
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                        </div>
                    </form>
                </div>
                </form>
            </div>
        </div>






        <!-- SWAL action -->
        <?php if(isset($send)) :  ?>
        <script>
            swal.fire({
                title: "Request Success",
                text: "Waiting Your Approval",
                icon: "success",
                showCancelButton: false,
                showConfirmButton: false
            });
            setTimeout(function () {
                window.top.location = "dashboard-tech.php"
            }, 2700);
        </script>
        <?php endif; ?>


        <!-- alert onclick -->
        <script>
        function navError() {
                   alert("Please enter back button !!");
       }
        </script>
</body>

</html>