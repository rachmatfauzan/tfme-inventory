<?php 

session_start();
include "../config/config.php";


if(!isset($_SESSION['technician'])){
    header("location: ../index");
}


use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../PHPMailer/src/Exception.php';
require '../PHPMailer/src/PHPMailer.php';
require '../PHPMailer/src/SMTP.php';

$user = mysqli_query($conn, "SELECT * FROM user WHERE position = 'admin'");
$admin = mysqli_fetch_assoc($user);
$admin = $admin['email'];

$name = $_SESSION['user'];

if (isset($_SESSION['email'])){

    $code = $_SESSION["email"];
    $kodeOtomatis = sprintf("%05s", $code);

    $dt_pr = mysqli_query($conn, "SELECT * FROM form_wd WHERE kode_wd = '$code'");

    $email_send =  "tfmeminteraktif@gmail.com";
        $name_send =  "TFME Website";
        $email_received =  $admin;
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

        
        // $mail->AddCC("rachmat3311801036@students.polibatam.ac.id");
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
                        <h2>New Withdraw From Technician <br> <span style="text-transform: uppercase;">"'.$name.'"</span></h2>
                    </header>
                    <section>
                        <table border="1" cellspacing="0" style="text-align: left; margin-left:auto; margin-right:auto;"
                            cellpadding="2">
                            <tr>
                                <td colspan="4" style="text-align: center;background-color:#0078D4;color:white;">BP'.$kodeOtomatis.'</td>
                            </tr>
                            <tr>
                                <th>Part Number</th>
                                <th>Purpose</th>
                                <th>Qty</th>
                                <th>Giver</th>
                            </tr>
                            '; foreach ($dt_pr as $dt) : $pesan .= '
                            <tr>
                                <td>'.$dt["part_number"].'</td>
                                <td>'.$dt["purpose"].'</td>
                                <td>'.$dt["qty"].'</td>
                                <td>'.$dt["receiver"].'</td>
                            </tr>
                            '; endforeach; $pesan .='
                            
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
            $alert = true;
            unset($_SESSION['email']);
        } else{
            echo "gagal";
        }
}

$query = mysqli_query($conn, "SELECT * FROM form_wd WHERE requestor = '$name' GROUP BY kode_wd ORDER BY kode_wd DESC");


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
    <?php if (isset($alert)) : ?>
    <div class="alert alert-success alert-dismissible fade show rounded-0" role="alert"
        style=" font-size:13px; max-width: 18rem; position: absolute; top:2em;z-index:9999; right:4em">
        <strong>Success!</strong> Your request sended to admin TFME.
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
        </button>
    </div>
    <script>
        window.setTimeout(function () {
            $(".alert").fadeTo(200, 0).slideUp(200, function () {
                $(this).remove();
            });
        }, 5000);
    </script>
    <?php endif; ?>
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
                            <hr>
                            <label href="history-wd" class=" bg-secondary text-white p-1 w-100 rounded-top text-center"
                                disabled>See
                                History<i class="fa fa-search ml-2"></i></label>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-sm table-bordered w-100" id="data" style="font-size: 13px;">
                                <thead>
                                    <tr class="text-center list-group-item-secondary">
                                        <th>Withdraw Code</th>
                                        <th>Purpose</th>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <?php foreach ($query as $data) : ?>
                                    <tr>
                                        <td><?= $data['no_bukti']; ?></td>
                                        <td><?= $data['purpose']; ?></td>
                                        <td><?= $data['tanggal']; ?></td>
                                        <td class="text-center">
                                            <?php if ($data['status'] == 'approve'): ?>
                                            <span class="badge badge-success"><?= $data['status']; ?></span>
                                            <?php elseif ($data['status'] == 'rejected'): ?>
                                            <span class="badge badge-danger"><?= $data['status']; ?></span>
                                            <?php elseif ($data['status'] == 'waiting'): ?>
                                            <span class="badge badge-light"><?= $data['status']; ?></span>
                                            <?php endif; ?>

                                        </td>
                                        <td class="text-center">
                                            <a href="invoice-wd?id=<?= $data['kode_wd']; ?>"
                                                class="btn btn-sm text-success">See Detail <i
                                                    class="fas fa-long-arrow-alt-right mr-2"></i></a>
                                        </td>
                                    </tr>
                                    <?php endforeach; ?>

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