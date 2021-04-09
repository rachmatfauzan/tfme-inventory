<?php 

session_start();
include "../config/config.php";


if(!isset($_SESSION['technician'])){
    header("location: index.php");
}


// membuat logik kode_otomatis
$sql = mysqli_query($conn, "SELECT max(kode_pr) as pr_kode FROM form_pr ORDER BY kode_pr ASC");
$data = mysqli_fetch_array($sql);


$code = (int)$data['pr_kode'] + 1;
$kodeOtomatis = sprintf("%05s", $code);

// echo $kodeAuto;


if(isset($_POST['send'])){
    $kode_pr = $code;
    // $item_name = null;
    $type = $_POST['type'];
    $quantity = $_POST['quantity'];
    $item_description = $_POST['item_description'];
    $part_number = $_POST['part_number'];
    $spesifikasi = $_POST['spesifikasi'];
    $cost_center = $_POST['cost_center'];
    $pr_date = $_POST['pr_date'];
    $account_code = $_POST['account_code'];
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
    )");

    if ($query){
        $send = true;
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
                <a class="nav-link" href="dashboard-tech.php"><i class="fas fa-history"></i>History
                    (PR)</a>
                <a class="nav-link active" href="#"><i class="fas fa-edit"></i>New Form</a>
                <a class="nav-link" href="profile-tech.php"><i class="fas fa-user"></i>Profile</a>
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
                        <a href="generateForm.php" style="font-size: 11px;" class="btn btn-success btn-sm"><i
                                class="fas fa-plus mr-2"></i>add more P.r</a>
                    </div>
                    <form method="post" autocomplete="off">
                        <div class="group">
                            <h5 class="font-weight-bold">ITEM</h5>
                            <hr class="my-4">
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label for="tipe">PR Code</label>
                                    <input type="text" name="order_no" id="order_no" class="form-control input-sm"
                                        value="PR-<?= $kodeOtomatis; ?>" disabled />
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="tipe">Type</label>
                                    <input type="text" class="form-control bg-light" id="tipe" placeholder="Type"
                                        name="type" required autofocus>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="tipe">Quantity</label>
                                    <input type="number" class="form-control bg-light" id="tipe" placeholder="0"
                                        name="quantity" required>
                                </div>

                                <div class="form-group col-md-2">
                                    <label for="tipe">Specification</label>
                                    <input type="text" class="form-control bg-light" id="tipe" placeholder="xx kg/Bag"
                                        name="spesifikasi" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md">
                                    <label for="Item">Item Description</label>
                                    <textarea type="text" class="form-control bg-light" id="Item"
                                        placeholder="Your Name Item" name="item_description" required></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="group mt-3">
                            <h5 class="font-weight-bold">NUMBERING</h5>
                            <hr class="my-4">
                            <div class="row">
                                <div class="form-group col">
                                    <label for="part-number">Part Number</label>
                                    <input type="text" class="form-control bg-light" id="part-number"
                                        placeholder="Part Number" name="part_number" required>
                                </div>
                                <div class="form-group col">
                                    <label for="inputPosition">Cost Center</label>
                                    <select id="inputPosition" class="form-control custom-select  bg-light"
                                        name="cost_center" required>
                                        <option selected disabled value="">-- Choose CC --</option>
                                        <option value="10">10 PCB</option>
                                        <option value="20">20 PCBA</option>
                                        <option value="30">30 IC PACK</option>
                                        <option value="40">40 GENERAL</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="group mt-3">
                            <h5 class="font-weight-bold">ORDER</h5>
                            <hr class="my-4">
                            <div class="row">
                                <div class="form-group col-md">
                                    <label for="pr-date">PR Date</label>
                                    <input type="date" id="pr-date" class="form-control bg-light" name="pr_date"
                                        required>
                                </div>

                                <div class="form-group col-md">
                                    <label for="on-pr#">Account Code</label>
                                    <input type="number" class="form-control bg-light" id="on-pr#"
                                        placeholder="Account Code" name="account_code" pattern="/^-?\d+\.?\d*$/"
                                        onKeyPress="if(this.value.length==7) return false;" required>
                                </div>
                            </div>

                            <div class="d-flex justify-content-end entry">
                                <button type="submit" class="btn bg-dark text-white" name="send"><i
                                        class="fas fa-paper-plane mr-3"></i>Send</button>
                            </div>
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