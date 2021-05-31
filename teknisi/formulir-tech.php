<?php 

session_start();

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../PHPMailer/src/Exception.php';
require '../PHPMailer/src/PHPMailer.php';
require '../PHPMailer/src/SMTP.php';

include "../config/config.php";


if(!isset($_SESSION['technician'])){
    header("location: ../index");
}

$query = mysqli_query($conn, "SELECT * FROM dt_inventory");

// membuat logik kode_otomatis
$sql = mysqli_query($conn, "SELECT max(kode_pr) as pr_kode FROM form_pr ORDER BY kode_pr ASC");
$data = mysqli_fetch_array($sql);


$code = (int)$data['pr_kode'] + 1;
$kodeOtomatis = sprintf("%05s", $code);

// var_dump($code);


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

        $email_send =  "tfmeminteraktif@gmail.com";
        $name_send =  "TFME Website";
        $email_received =  "rachmat3311801036@students.polibatam.ac.id";
        $subjek =  "New Order From Technician !!";


        $mail = new PHPMailer;
        $mail->isSMTP();

        $mail->Host = 'smtp.gmail.com'; // domain. outlook sesuaikan dengan email penerima
        $mail->Username = $email_send;
        $mail->Password = 'bogglxovdlvzvtpe';
        $mail->Port = 465;
        $mail->SMTPAuth = true;
        $mail->SMTPSecure = 'ssl';
        // $mail->SMTPDebug = 2;

        $mail->setFrom($email_send, $name_send);
        $mail->addAddress($email_received);
        $mail->isHTML(true);
        $mail->Subject = $subjek;
        $mail->AddEmbeddedImage("../image/box.png", "logo" );

        
        $mail->AddCC("");
        $pesan = '




        <html>

        <head>
            <style>
                div.bg {
                    background-color:#F2F2F2;
                    width: 100%;
                    margin: auto;
                    height: 100%;
                    position: relative;
                }

                img {
                    width: 30%;
                    background-size: cover;
                }

                .content {
                    background-color:#FFFF;
                    padding: 20px;
                    border: 2px solid white;
                    text-align: center;
                }

                table {
                    width: 100%;
                }

                p {
                    margin-top:2em;
                    color:white;
                    background-color: #0078D4;
                    padding: 5px;
                    -webkit-box-shadow: 0px 10px 7px 4px rgba(0, 0, 0, 0.06);
                    -moz-box-shadow: 0px 10px 7px 4px rgba(0, 0, 0, 0.06);
                    box-shadow: 0px 10px 7px 4px rgba(0, 0, 0, 0.06);
                }

                footer {
                    margin-top: 2em;
                }
            </style>
        </head>

        <body>

            <div class="bg">

                <div class="content">
                    <header>
                        <img src="cid:logo">
                        <h2>New Purchase Request From Technician <br> <span style="text-transform: uppercase;">"'.$_SESSION['user'].'"</span></h2>
                    </header>
                    <section>
                        <table border="1" cellspacing="0" style="text-align: left; margin-left:auto; margin-right:auto;"
                            cellpadding="2">
                            <tr>
                                <td colspan="4" style="text-align: center;background-color:#0078D4;color:white;">PR-'.$kodeOtomatis.'</td>
                            </tr>
                            <tr>
                                <th>Item Description</th>
                                <th>Type</th>
                                <th>Part Number</th>
                                <th>Quantity</th>
                            </tr>
                            <tr>
                                <td>'.$item_description.'</td>
                                <td>'.$type.'</td>
                                <td>'.$part_number.'</td>
                                <td>'.$quantity.'</td>
                            </tr>
                        </table>
                    <p>Status : Waiting</p>
                    </section>
                    <footer><strong>follow url to change status and login : <a href="http://tfme.polibatam.ac.id/inventory"
                                target="_blank">tfme.polibatam.ac.id/inventory</a></strong>
                    </footer>
                </div>
            </div>
        </body>

        </html>

        ';
        $mail->Body = $pesan;

        $send = $mail->send();

        if($send){
            $send = true;
        } else{
            echo "gagal";
        }
        // echo "<script>alert('data terkirim')</script>";

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
    <!-- Bootstrap Ordered Datatables  -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
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
                <a class="nav-link" href="withdraw"><i class="fas fa-fax"></i>Withdraw Item</a>
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
            <div class="box">
                <div class="data-entry">
                    <div class="title mb-4 text-uppercase d-flex justify-content-center flex-column align-items-center">
                        <h5 class="font-weight-bold text-secondary">PURCHASE REQUEST</h5>
                        <a href="generateForm" style="font-size: 11px;" class="btn btn-success btn-sm"><i
                                class="fas fa-plus mr-2"></i>add more P.r</a>
                        <a class="mt-2 btn btn-sm bg-dark text-white  rounded-0 p-1" data-toggle="modal"
                            data-target="#search"><i class="fa fa-table mr-2"></i>Search Part Number</a>
                    </div>
                    <div class="modal fade" id="search" tabindex="-1" role="dialog"
                        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLongTitle"><i class="fa fa-table"></i>
                                        Search Table
                                    </h5>
                                </div>
                                <div class="modal-body">
                                    <div class="table-responsive">
                                        <table class="table table-sm inventory table-striped w-100" id="data"
                                            style="font-size: 12px;">
                                            <thead style="width: fit-content;">
                                                <tr class="bg-dark text-white">
                                                    <th width="2%">No</th>
                                                    <th>Part Number</th>
                                                    <th>Item Description</th>
                                                    <th>Cost Center</th>
                                                    <th>Account Code</th>
                                                    <th>Type</th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <?php $i = 1; ?>
                                                <?php foreach ($query as $data) : ?>
                                                <tr>
                                                    <td><?= $i; ?></td>
                                                    <td><?= $data['part_number']; ?></td>
                                                    <td><?= $data['description']; ?></td>
                                                    <td><?= $data['cc']; ?></td>
                                                    <td><?= $data['account_code']; ?></td>
                                                    <td><?= $data['type']; ?></td>
                                                </tr>
                                                <?php $i++; ?>
                                                <?php endforeach; ?>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <form method="post" autocomplete="off">
                        <div class="group">
                            <h5 class="font-weight-bold">ITEM</h5>
                            <hr class="my-4">
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <label for="tipe">PR Code</label>
                                    <input type="text" name="order_no" id="order_no" class="form-control form-control-sm input-sm"
                                        value="PR-<?= $kodeOtomatis; ?>" disabled />
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="tipe">Item Description</label>
                                    <input type="text" class="form-control form-control-sm bg-light" id="desc" placeholder="Item Name"
                                        name="item_description" required autofocus>
                                </div>
                                <div class="form-group col-md-2">
                                    <label for="tipe">Quantity</label>
                                    <input type="number" class="form-control form-control-sm bg-light" id="tipe" placeholder="0"
                                        name="quantity" required>
                                </div>

                                <div class="form-group col-md-2">
                                    <label for="tipe">Specification</label>
                                    <input type="text" class="form-control form-control-sm bg-light" id="spec" placeholder="xx kg/Bag"
                                        name="spesifikasi" required>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md">
                                    <label for="Item">Type</label>
                                    <textarea type="text" class="form-control bg-light" id="type"
                                        placeholder="Your Item Type" name="type" required></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="group mt-3">
                            <h5 class="font-weight-bold">NUMBERING</h5>
                            <hr class="my-4">
                            <div class="row">
                                <div class="form-group col">
                                    <label for="part-number">Part Number</label>
                                    <input type="text" class="form-control form-control-sm bg-light" id="part"
                                        placeholder="Part Number" name="part_number" maxlength="10" required >
                                </div>
                                <div class="form-group col">
                                    <label for="inputPosition">Cost Center</label>
                                    <select id="inputPosition" class="form-control form-control-sm custom-select  bg-light"
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
                                    <div class="date">
                                        <input type="date" id="pr-date" class="form-control form-control-sm bg-light" name="pr_date"
                                            required>
                                        <i class="fas fa-calendar-day"></i> <i class="fas fa-calender-day"></i>
                                    </div>
                                </div>

                                <div class="form-group col-md">
                                    <label for="on-pr#">Account Code</label>
                                    <input type="number" class="form-control form-control-sm bg-light" id="on-pr#"
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




            <!-- script data tables -->
            <script>
                $(document).ready(function () {
                    $('#data').DataTable({
                        scrollX: true,
                        lengthChange: false,
                        "order": [
                            [0, "asc"]
                        ],
                        "lengthMenu": [
                            [4, 10, 100, -1],
                            [4, 10, 100, "All"]
                        ],
                    });
                });
                $('#search').on('shown.bs.modal', function (e) {
                    $.fn.dataTable.tables({
                        visible: true,
                        api: true
                    }).columns.adjust();
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
                    window.top.location = "dashboard-tech"
                }, 2700);
            </script>
            <?php endif; ?>
</body>

</html>