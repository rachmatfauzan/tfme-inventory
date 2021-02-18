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
    $kode_pr = $kodeAuto;
    $item_name = $_POST['item_name'];
    $type = $_POST['type'];
    $quantity = $_POST['quantity'];
    $item_description = $_POST['item_description'];
    $part_number = $_POST['part_number'];
    $cost_center = $_POST['cost_center'];
    $pr_date = $_POST['pr_date'];
    $account_code = $_POST['account_code'];
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
                <div class="form-group">
                    <form name="add_name" id="add_name">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <tr>
                                    <td colspan="2" align="center">
                                        <h2 style="margin-top:10.5px">Purchase Request</h2>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <div class="row">
                                            <div class="col-md-8">
                                                To,<br />
                                                <b>RECEIVER (BILL TO)</b><br />
                                                <input type="text" name="order_receiver_name" id="order_receiver_name"
                                                    class="form-control input-sm" placeholder="Admin Inventory"
                                                    disabled>
                                                <textarea name="order_receiver_address" id="order_receiver_address"
                                                    class="form-control" rows="4"
                                                    disabled>Teaching Factory Manufacturing of Electrnoics Politeknik Negeri Batam Jalan Ahmad Yani, Batam Kota, Batam, Kepulauan Riau 29461</textarea>
                                            </div>
                                            <div class="col-md-4">
                                                PR Code<br />
                                                <input type="text" name="order_no" id="order_no"
                                                    class="form-control input-sm" placeholder="Enter Invoice No." />
                                                <input type="date" name="order_date" id="order_date"
                                                    class="form-control input-sm" placeholder="Select PR Date" />
                                            </div>
                                        </div>
                                        <br />
                                        <table id="invoice-item-table"                  class="table table-bordered">
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
                                                <th>Cost Center</th>
                                                <th>Account Code</th>
                                            </tr>
                                            <tr>
                                                <td><textarea name="" id="" rows="2" class="form-control"
                                                        autofocus></textarea></td>
                                                <td><textarea name="" id="" rows="2" class="form-control"></textarea>
                                                </td>
                                                <td><textarea name="" id="" rows="2" class="form-control"></textarea>
                                                </td>
                                                <td><textarea name="" id="" rows="2" class="form-control"></textarea>
                                                </td>
                                                <td>
                                                    <select id="inputPosition"
                                                        class="form-control custom-select bg-light"
                                                        name="cost_center-<?= $i; ?>" required >
                                                        <option selected disabled>-- Choose CC --</option>
                                                        <option value="10">10 PCB</option>
                                                        <option value="20">20 PCBA</option>
                                                        <option value="30">30 IC PACK</option>
                                                        <option value="40">40 GENERAL</option>
                                                    </select>
                                                </div>
                                                </td>
                                                <td><textarea name="" id="" rows="2" class="form-control"></textarea>
                                                </td>
                                            </tr>
                                    </td>
                                </tr>
                                </table>
                        </div>
                    </form>
                </div>
            </div>

            <script>
                $(document).ready(function () {
                    var i = 1;
                    $('#add').click(function () {
                        i++;
                        $('#dynamic_field').append(
                            '<tr id="row' + i +
                            '"><td><input type="text" name="name[]" placeholder="Enter your Name" class="form-control name_list"/></td><td><input type="number" name="type[]" placeholder="Type" class="form-control"/></td> <td><button type="button" name="remove" id="' +
                            i + '" class="btn btn-danger btn_remove">X</button></td></tr>');
                    });
                    $(document).on('click', '.btn_remove', function () {
                        var button_id = $(this).attr("id");
                        $('#row' + button_id + '').remove();
                    });
                    $('#submit').click(function () {
                        $.ajax({
                            url: "name.php",
                            method: "POST",
                            data: $('#add_name').serialize(),
                            success: function (data) {
                                alert(data);
                                $('#add_name')[0].reset();
                            }
                        });
                    });
                });
            </script>



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