<?php 

session_start();
include "../config/config.php";


if(!isset($_SESSION['admin'])){
    header("location: index.php");
}


// ambil Id
$id = $_GET['id'];

$sql = mysqli_query($conn, "SELECT * FROM form_po WHERE id_po = '$id'");

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
    <link rel="stylesheet" href="../teknisi/css/dashboard-tech.css">
    <link rel="stylesheet" href="../teknisi/css/profile-tech.css">

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

        <!-- start header -->
        <div class="invoice-po">
            <div class="atap"><span> </span></div>

            <div class="navbar justify-content-between bg-dark text-white">
                <div class="profile">
                    <div class="wrapper-image">
                        <img src="../image/profile.png" alt="">
                    </div>
                    <div class="profile-name">
                        <h5 style="text-transform:capitalize;"><?= $_SESSION['user']; ?></h5>
                        <p>Inventory admin</p>
                    </div>
                    <div class="dropdown">
                        <button class="btn dropdown-toggle text-white" type="button" id="dropdownMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="../logout.php"><i class="fas fa-sign-out-alt"></i>Log Out</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box">
                <div class="data-entry">
                    <div class="title mb-4 text-uppercase d-flex justify-content-center flex-column align-items-center">
                        <h5 class="font-weight-bold text-secondary">Invoice</h5>
                        <a href="history-po.php" style="font-size: 11px;" class="btn invoice "><i
                                class="fas fa-backspace mr-2"></i>history p.o</a>
                    </div>
                    <div class="form-group">
                        <form method="post">
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <!-- <tr>
                                        <td colspan="2" align="center" class="text-primary">
                                            <h2 style="margin-top:10.5px">PURCHASE ORDER</h2>
                                        </td>
                                    </tr> -->
                                    <tr>
                                        <td colspan="2">
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <img src="../image/poltek.png" alt="logo poltek"> <br>
                                                </div>
                                                <div class="col-md-5 mt-3">
                                                    <h2 class="text-info font-weight-bold">PURCHASE ORDER</h2>
                                                    PO Code<br />
                                                    <?php $code = sprintf("%05s", $hasil['id_po']) ?>
                                                    <p
                                                        class="form-control d-flex justify-content-between align-items-center list-group-item-secondary">
                                                        <?= "PR-".$code; ?><i class="fas fa-barcode mr-2"></i></p>
                                                    <?php $date = date_create($hasil['po_date']); ?>
                                                    PO Date<br />
                                                    <p
                                                        class="form-control d-flex justify-content-between align-items-center list-group-item-secondary">
                                                        <?= date_format($date, 'j F Y'); ?><i
                                                            class="far fa-calendar-alt mr-2"></i></p>
                                                </div>
                                            </div>

                                            <div class="row">
                                                <div class="col-md-7">
                                                    <b class="bg-info p-1 ">VENDOR</b><br />
                                                    <div class="detailVendor mt-2" style="font-size: 14px;">
                                                        <p>PT. Prochem Tritama <br>
                                                            Mrs. Ratni, penyedia barang <br>
                                                            Komp. Limindo Trade Centre Blok B No. 04 Batam Centre <br>
                                                            Kota Batam <br>
                                                            0778-945565 <br>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <b class="bg-info p-1">SHIP TO</b><br />
                                                    <div class="detailVendor mt-2" style="font-size: 14px;">
                                                        <p>Polibatam <br>
                                                            Nur Sakinah Asaad, MT, Kepala Unit TFME <br>
                                                            Jl. Ahmad Yani, Batam Kota<br>
                                                            Kota Batam <br>
                                                            08194114001<br>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <br />
                                            <table id="invoice-item-table" class="table table-bordered">
                                                <tr>
                                                    <th width="40%" colspan="3">ITEM</th>
                                                    <th width="15%" colspan="2">NUMBERING</th>
                                                    <th width="15%">ORDER</th>
                                                </tr>
                                                <tr>
                                                    <th>Item Description</th>
                                                    <th>Type</th>
                                                    <th width="3%">Quantity</th>
                                                    <th width="20%">Part Number</th>
                                                    <th width="3%" style="text-align: center;">Cost Center</th>
                                                    <th>Account Code</th>
                                                </tr>

                                                <?php foreach($sql as $data) :?>
                                                <tr class="addForm">
                                                    <td><textarea id="item_description " rows="2" class="form-control"
                                                            disabled
                                                            style="height: auto;"> <?= $data['item_description']; ?></textarea>
                                                    </td>
                                                    <td><textarea id="type" rows="2" class="form-control"
                                                            disabled><?= $data['type']; ?></textarea>
                                                    </td>
                                                    <td><textarea id="par_number" rows="2" class="form-control" disabled
                                                            style="text-align: center;"><?= $data['quantity']; ?></textarea>
                                                    </td>
                                                    <td><textarea id="par_number" rows="2" class="form-control"
                                                            disabled><?= $data['part_number']; ?></textarea>
                                                    </td>
                                                    <td>
                                                        <textarea id="account-code" rows="2" class="form-control"
                                                            disabled> <?= $data['cost_center']; ?></textarea>
                                                    </td>
                                                    <td><textarea id="account-code" rows="2" class="form-control"
                                                            disabled><?= $data['account_code']; ?></textarea>
                                                    </td>
                                                </tr>
                                                <?php endforeach; ?>
                                            </table>
                                            <div class="row">
                                                <div class="col-md-7">
                                                    <div class="detailVendor mt-4" style="font-size: 14px;">
                                                        <p>Batam, <?= date_format($date, 'j F Y'); ?><br>
                                                            <b>Politeknik Negeri Batam</b> <br> <br> <br> <br> <br> <br>
                                                            <b><u>Nur Sakinah Asaad, MT</u></b> <br>
                                                            Penanggung Jawab Teknis <br>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="col-md-5">
                                                    <div class="detailVendor mt-4" style="font-size: 14px;">
                                                        <p>Menerima dan menyetujui : <br>
                                                            <b>PT. Prochem Tritama</b> <br> <br> <br> <br> <br> <br>
                                                            <!-- <input type="file"> <br> -->
                                                            <b><u>Ratni</u></b> <br>
                                                            Penyedia Barang<br>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
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
</body>

</html>