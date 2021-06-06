<?php 
session_start();

require "../config/config.php";

if(!isset($_SESSION['admin'])){
    header("location: ../index");
}

$query = mysqli_query($conn, "SELECT * FROM mtl ORDER BY id_mtl DESC");




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
    <link rel="stylesheet" href="../teknisi/css/profile-tech.css">

    <!-- Link CSS -->
    <link rel="stylesheet" href="../css/dashboard-adm.css">
    <link rel="stylesheet" href="../css/history-pr.css">

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
                <a class="nav-link" href="dashboard-admin"><i class="fas fa-database"></i>Data Site</a>
                <a class="nav-link" href="dashboard-user-list"><i class="fas fa-users"></i>User List</a>
                <a class="nav-link" href="history-pr"><i class="fas fa-list"></i>Select PR</a>
                <a class="nav-link" href="history-wd"><i class="fas fa-edit"></i>With Draw Item</a>
                <a class="nav-link active" href="#"><i class="fas fa-copy"></i>Material Issues</a>
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
                        <img src="../image/profile.png" alt="">
                    </div>
                    <div class="profile-name">
                        <h5 style="text-transform: capitalize;"><?= $_SESSION["user"]; ?></h5>
                        <p>Inventory admin</p>
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
                    <header style="transform: scale(0.9);">
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
                                    <p class="m-0">Laman: www.tfme.polibatam.ac.id/inventory Surel:
                                        tfmeminteractive@gmail.com</p>
                                </label>
                            </div>
                            <div class="col-3 d-flex justify-content-end title">
                                <img src="../image/black-tfme.png" style="width: 250px; height:150px;">
                            </div>
                        </div>
                    </header>

                    <div class="row container mt-5">
                        <div class="status text-center w-100">
                            <label><b>RECEIVED AND RETRIEVED/BORROWED INVENTORY IN</b></label>
                        </div>
                    </div>
                    <div class="section container mt-4">
                        <div class="table-responsive">
                            <table class="table table-sm table-hover table-bordered" id="data">
                                <thead>
                                    <tr class="pivot">
                                        <th width="1%" rowspan="2">No</th>
                                        <th rowspan="2" width="10%">DATE</th>
                                        <th rowspan="2">CODE</th>
                                        <th rowspan="2">ITEM</th>
                                        <th rowspan="2">CC</th>
                                        <th rowspan="2">Part Number</th>
                                        <th rowspan="2">USED FOR</th>
                                        <th colspan="3">VOLUME</th>
                                        <th rowspan="2">GIVER</th>
                                        <th colspan="1">RECEIVER</th>
                                    </tr>
                                    <tr class="pivot">
                                        <th>IN</th>
                                        <th>OUT</th>
                                        <th>UOM</th>
                                        <th>NAME</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <?php $i = 1;  ?>
                                    <?php foreach ($query as $data) : ?>
                                    <tr>
                                        <td class="text-center"><?= $i; ?></td>
                                        <td><?= $data['date']; ?></td>
                                        <td><?= $data['code']; ?></td>
                                        <td><?= $data['description']; ?></td>
                                        <td><?= $data['cc']; ?></td>
                                        <td><?= $data['part_number']; ?></td>
                                        <td><?= $data['purpose']; ?></td>
                                        <td><?= $data['in_volume']; ?></td>
                                        <td><?= $data['out_volume']; ?></td>
                                        <td class="text-uppercase"><?= $data['uom_volume']; ?></td>
                                        <td><?= $data['giver']; ?></td>
                                        <td class="text-lowercase"><?= $data['name_receiver']; ?></td>
                                        <!-- <td><?= $data['nip']; ?></td> -->
                                    </tr>
                                    <?php $i++ ?>
                                    <?php endforeach; ?>
                                </tbody>

                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- script data tables -->
        <script>
            $(document).ready(function () {
                $('#data').DataTable({

                    "ordering": true,
                    "lengthMenu": [
                        [10, 50, 100, -1],
                        [10, 50, 100, "All"]
                    ]
                });
            });
        </script>
</body>

</html>