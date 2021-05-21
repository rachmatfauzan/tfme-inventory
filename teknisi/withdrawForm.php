<?php 

session_start();
include "../config/config.php";

if(!isset($_SESSION['technician'])){
    header("location: ../index");
}


// Panutan membuat logik kode_otomatis
// $sql = mysqli_query($conn, "SELECT max(id_pr) as maxID FROM form_pr");
// $data = mysqli_fetch_array($sql);

// $kode = $data['maxID'];
// $kode++;

// $ket = "PR";
// $kodeAuto = $ket . sprintf("%05s", $kode);

// echo $kodeAuto;

$kode = mysqli_query($conn, "SELECT max(kode_pr) as pr_kode FROM form_pr ORDER BY kode_pr ASC");
$dataKode = mysqli_fetch_assoc($kode);
$code = (int)$dataKode['pr_kode'] + 1;
$kodeOtomatis = sprintf("%05s", $code);


if(isset($_POST['send'])){
    

    for ($i=1; $i<=$_POST['total']; $i++){
        $kode_pr = $code;
        // $item_name = $_POST['item_name-'.$i];
        $type = $_POST['type-'.$i]; 
        $quantity = $_POST['quantity-'.$i];
        $item_description = $_POST['item_description-'.$i];
        $part_number = $_POST['part_number-'.$i];
        $cost_center = $_POST['cost_center-'.$i];
        $pr_date = $_POST['pr_date'];
        $spesifikasi = $_POST['spesifikasi-'.$i];
        $account_code = $_POST['account_code-'.$i];
        $status = 'waiting';
        $requestor = $_SESSION['user'];
        $update_po = 0; 


        $query = mysqli_query($conn, "INSERT INTO form_pr VALUES (
            null,
            '$kode_pr',
            '$type',
            '$quantity',
            '$item_description',
            '$part_number',
            '$cost_center',
            '$pr_date',
            '$account_code',
            '$status',
            '$requestor',
            '$spesifikasi',
            '$update_po'
        )") or die (mysqli_error($conn));
    }
        if ($query){
            $send = true;
            $_SESSION['email'] = $code;
        
        } else {
            echo "Failed !";
        }
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
                <a class="nav-link active" href="#"><i class="fas fa-edit"></i>New Form</a>
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
            <div class="box">
                <div class="data-entry">
                    <div class="title mb-4 text-uppercase d-flex justify-content-center flex-column align-items-center">
                        <span class="font-weight-bold text-secondary">PURCHASE REQUEST</span>
                        <a href="withdraw" style="font-size: 11px;" class="btn btn-primary btn-sm"><i
                                class="fas fa-backspace mr-2"></i>Generate Again</a>
                    </div>
                    <div class="form-group">
                        <form method="post">
                            <div class="table-responsive">
                                <table class="table table-bordered title">
                                    <tr>
                                        <td colspan="2" align="center">
                                            <h3 style="margin-top:10.5px"><i class="fas fa-fax mr-2"></i>proof of
                                                inventory release</h3>
                                            </h2>
                                        </td>
                                    </tr>
                                    <div class="error">
                                        <img src="../image/404.png">
                                        <p class="w-100 text-center bg-warning text" style="opacity: 0.8;"><strong>Erorr !! </strong>Please Use a PC</p>
                                    </div>
                                    <tr>
                                        <td colspan="2" style="overflow-x: hidden;">

                                            <table id="invoice-item-table" class="table table-bordered withdraw"
                                                style="font-size: 13px;">
                                                <tr>
                                                <td colspan="7">
                                                <div class="row m-2 p-3 top  rounded">
                                                    <div class="col-md-6 ">
                                                        <label>Diterima dari :</label>
                                                        <input type="text" class="form-control form-control-sm" placeholder="Name of Staff" autofocus> <br />
                                                        <label>NIP :</label>
                                                        <input type="text" class="form-control form-control-sm" placeholder="Nip">
                                                    </div>
                                                    <div class="col-md-6 ">
                                                        <label>No Bukti :</label>
                                                        <input type="text" class="form-control form-control-sm" placeholder="BPI000001" disabled> <br />
                                                        <label>Tanggal :</label>
                                                        <div class="date">
                                                            <input type="date" id="pr-date" class="form-control form-control-sm bg-light" name="pr_date" required>
                                                            <i class="fas fa-calendar-day"></i> <i class="fas fa-calender-day"></i>
                                                        </div>
                                                    </div>

                                                </div>
                                                </td>
                                                </tr>
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
                                                <input type="hidden" name="total" value="<?=@$_POST['count_add']?>">

                                                <!-- alert for form -->
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
                                                        window.top.location = "dashboard-tech"
                                                    }, 2700);
                                                </script>
                                                <!-- <?php exit; ?> -->
                                                <?php endif; ?>
                                                <!-- end alert for form -->

                                                <?php if(!isset($_POST['count_add'])) :?>
                                                <script>
                                                    swal.fire({
                                                        title: "Please Generate Again",
                                                        text: "don't refresh your page directly",
                                                        icon: "info",
                                                        showCancelButton: false,
                                                        showConfirmButton: false
                                                    });
                                                    setTimeout(function () {
                                                        window.top.location = "withdraw"
                                                    }, 1500);
                                                </script>

                                                <?php exit; ?>
                                                <?php endif; ?>

                                                <?php for ($i=1; $i<=$_POST['count_add']; $i++) : ?>
                                                <tr class="addForm">
                                                    <td><?= $i; ?></td>
                                                    <td><input type="text" class="form-control"></td>
                                                    <td><input type="text" class="form-control"></td>
                                                    <td><input type="text" class="form-control"></td>
                                                    <td><input type="text" class="form-control"></td>
                                                    <td><input type="text" class="form-control"></td>
                                                    <td><input type="text" class="form-control"></td>
                                                </tr>
                                                <?php endfor; ?>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </form>
                    </div>


                    <div class="d-flex justify-content-end entry">
                        <button type="submit" class="btn bg-dark text-white send" name="send"><i
                                class="fas fa-paper-plane mr-3"></i>Send</button>
                    </div>
                    </form>
                </div>
            </div>

</body>

</html>