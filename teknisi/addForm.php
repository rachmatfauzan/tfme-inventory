<?php 

session_start();
include "../config/config.php";


if(!isset($_SESSION['technician'])){
    header("location: index.php");
}


// membuat logik kode_otomatis
$sql = mysqli_query($conn, "SELECT max(id_pr) as maxID FROM form_pr");
$data = mysqli_fetch_array($sql);

$kode = $data['maxID'];
$kode++;

$ket = "PR";
$kodeAuto = $ket . sprintf("%05s", $kode);

// echo $kodeAuto;


if(isset($_POST['send'])){
    

    for ($i=1; $i<=$_POST['total']; $i++){
        $kode_pr = $kodeAuto;
        $item_name = $_POST['item_name-'.$i];
        $type = $_POST['type-'.$i]; 
        $quantity = $_POST['quantity-'.$i];
        $item_description = $_POST['item_description-'.$i];
        $part_number = $_POST['part_number-'.$i];
        $cost_center = $_POST['cost_center-'.$i];
        $pr_date = $_POST['pr_date-'.$i];
        $account_code = $_POST['account_code-'.$i];
        $status = 'waiting';
        $requestor = $_SESSION['user'];
        $update_po = 0; 


        $query = mysqli_query($conn, "INSERT INTO form_pr VALUES (
            '',
            '$kode_pr',
            '$item_name',
            '$type',
            '$quantity',
            '$item_description',
            '$part_number',
            '$cost_center',
            '$pr_date',
            '$account_code',
            '$status',
            '$requestor',
            '$update_po'
        )");

        if ($query){
            $send = true;
        } else {
            echo "Failed !";
        }
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
                        <a href="formulir-tech.php" style="font-size: 11px;" class="btn btn-primary btn-sm"><i
                                class="fas fa-backspace mr-2"></i>back to 1 pr</a>
                    </div>
                    <form method="post" autocomplete="off">
                        <input type="hidden" name="total" value="<?=@$_POST['count_add']?>">

                        <?php for ($i=1; $i<=$_POST['count_add']; $i++) : ?>
                        <div class="container">
                                <h5 class="font-weight-bold bg-dark disabled p-2 text-white">ITEM <?= $i; ?></h5>
                                <hr>
                            <div class="group">
                                <div class="row">
                                    <div class="form-group col">
                                        <label for="item-name">Item Name</label>
                                        <input type="text" class="form-control bg-light" id="item-name"
                                            placeholder="Item Name" name="item_name-<?= $i; ?>"  autofocus required>
                                    </div>
                                    <div class="form-group col">
                                        <label for="tipe">Type</label>
                                        <input type="text" class="form-control bg-light" id="tipe" placeholder="Type"
                                            name="type-<?= $i; ?>" required>
                                    </div>
                                    <div class="form-group col-md-2">
                                        <label for="tipe">Quantity</label>
                                        <input type="number" class="form-control bg-light" id="tipe" placeholder="0"
                                            name="quantity-<?= $i; ?>" required>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="form-group col">
                                        <label for="Item">Item Description</label>
                                        <textarea type="text" class="form-control bg-light" id="Item"
                                            placeholder="Your Name Item" name="item_description-<?= $i; ?>" required></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="group mt-3">
                                <div class="row">
                                    <div class="form-group col">
                                        <label for="part-number">Part Number</label>
                                        <input type="text" class="form-control bg-light" id="part-number"
                                            placeholder="Part Number" name="part_number-<?= $i; ?>" required>
                                    </div>
                                    <div class="form-group col">
                                        <label for="inputPosition">Cost Center</label>
                                        <select id="inputPosition" class="form-control custom-select  bg-light"
                                            name="cost_center-<?= $i; ?>" required>
                                            <option selected disabled>-- Choose CC --</option>
                                            <option value="10">10 PCB</option>
                                            <option value="20">20 PCBA</option>
                                            <option value="30">30 IC PACK</option>
                                            <option value="40">40 GENERAL</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="group mt-3 mb-4">
                                <div class="row">
                                    <div class="form-group col-md">
                                        <label for="pr-date">PR Date</label>
                                        <input type="date" id="pr-date" class="form-control bg-light" name="pr_date-<?= $i; ?>"
                                            required>
                                    </div>

                                    <div class="form-group col-md">
                                        <label for="on-pr#">Account Code</label>
                                        <input type="text" class="form-control bg-light" id="on-pr#"
                                            placeholder="Account Code" name="account_code-<?= $i; ?>" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <?php endfor; ?>
                            <div class="d-flex justify-content-end entry">
                                <button type="submit" class="btn bg-dark text-white" name="send"><i
                                        class="fas fa-paper-plane mr-3"></i>Send</button>
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