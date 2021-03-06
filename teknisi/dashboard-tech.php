<?php 

session_start();
include "../config/config.php";


use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require '../PHPMailer/src/Exception.php';
require '../PHPMailer/src/PHPMailer.php';
require '../PHPMailer/src/SMTP.php';

if(!isset($_SESSION['technician'])){
    header("location: ../index");
}

$user = mysqli_query($conn, "SELECT * FROM user WHERE position = 'admin'");
$admin = mysqli_fetch_assoc($user);
$admin = $admin['email'];

$name = $_SESSION['user'];



// pagination and select data
$jumlahDataperHalaman = 4; 
$rows = mysqli_query($conn, "SELECT * FROM form_pr WHERE requestor = '$name' GROUP BY kode_pr ");
$jumlahRows = mysqli_num_rows($rows);

// Jumlah halaman yang tampil
$jumlahHalaman = ceil($jumlahRows/ $jumlahDataperHalaman);

// ternary logic
$halamanAktif = ( isset($_GET['page']) ) ? $_GET['page'] : 1;
$awalData = ($jumlahDataperHalaman * $halamanAktif) - $jumlahDataperHalaman;

// var_dump($awalData);

// menampilkan group data keseluruhan 
$query = mysqli_query($conn, "SELECT * FROM form_pr WHERE requestor = '$name' GROUP BY kode_pr ORDER BY kode_pr DESC LIMIT $awalData, $jumlahDataperHalaman");
$list = mysqli_fetch_all($query);
$kodelist = $list;

$show = mysqli_query($conn, "SELECT * FROM form_pr WHERE requestor = '$name' GROUP BY kode_pr ORDER BY kode_pr DESC");


if (isset($_SESSION['email'])){

    $code = $_SESSION["email"];
    $kodeOtomatis = sprintf("%05s", $code);

    $dt_pr = mysqli_query($conn, "SELECT * FROM form_pr WHERE kode_pr = '$code'");

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
                            '; foreach ($dt_pr as $dt) : $pesan .= '
                            <tr>
                                <td>'.$dt["item_description"].'</td>
                                <td>'.$dt["type"].'</td>
                                <td>'.$dt["part_number"].'</td>
                                <td>'.$dt["quantity"].'</td>
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

?>

<!doctype html>
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

    <!--  CDN SWAL-->
    <script src="../swal2/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="../swal2/dist/sweetalert2.min.css">

    <!-- Bootstrap Ordered Datatables  -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
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
                <a class="nav-link active" href="#"><i class="fas fa-history"></i>History
                    (PR)</a>
                <a class="nav-link" href="formulir-tech"><i class="fas fa-edit"></i>New Form</a>
                <a class="nav-link" href="withdraw"><i class="fas fa-edit"></i>With Draw Item</a>
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
                        <h5 style="text-transform: capitalize;"><?= $_SESSION["user"]; ?></h5>
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

            <!-- cek History PR -->
            <?php  
                $cek = mysqli_num_rows($query);
                if ($cek == 0){
                    echo '
                    <script>
                    swal.fire({
                                title: "Please Make Your Purchase",
                                text: "Your history is empty !!",
                                width: 600,
                                icon: "info",
                                showCancelButton: false,
                                showConfirmButton: false
                            });
                            setTimeout(function () {
                                window.top.location = "formulir-tech"
                            }, 2700);
                    </script>
                    ';
                    exit;
                }
                ?>
            <div class=" mt-2 d-flex flex-column align-items-center justify-content-center">
                <h5 class="mt-2 teknisi" style="width: 90%;"><i class="fas fa-history mr-2"></i>History PR <span
                        style="font-style:italic; opacity:0.6;">(Purchase Request)</span></h5>
                <a class="mt-2 btn btn-sm bg-white  rounded-0 p-1" data-toggle="modal" data-target="#search"><i
                        class="fa fa-table mr-2"></i>Search Table</a>
            </div>
            <div class="modal fade" id="search" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
                aria-hidden="true">
                <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLongTitle"><i class="fa fa-table"></i> Search Table
                            </h5>
                        </div>
                        <div class="modal-body">
                            <div class="table-responsive">
                                <table class="table table-sm inventory table-striped" id="data"
                                    style="font-size: 12px;">
                                    <thead style="width: fit-content;">
                                        <tr class="bg-dark text-white">
                                            <th>PR Code</th>
                                            <th width=30%>Item Description</th>
                                            <th>Part Number</th>
                                            <th>Date</th>
                                            <th>Detail PO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <?php foreach ($show as $data) : ?>
                                        <tr>
                                            <td><?php $code = sprintf("%05s", $data["kode_pr"]) ?>
                                                <?= "PR-". $code; ?></td>
                                            <td><?= $data['item_description']; ?></td>
                                            <td><?= $data['part_number']; ?></td>
                                            <td>
                                                <?php $date = date_create($data['pr_date']); ?>
                                                <?= date_format($date, 'j F Y'); ?>
                                            </td>
                                            <td><a href="invoice-pr?id=<?= $data['kode_pr']?>" class="btn"><i
                                                        class="fa fa-search"></i> <span class="text-sm text-dark"
                                                        style="font-size: 12px;">See</span></a></td>
                                        </tr>
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

            <?php foreach ($query as $data) :?>
            <div class="box">
                <div class="content">
                    <div class="group">
                        <div class="box1 form-group col-sm">
                            <div class="tanda">
                                <label style="opacity: 0.7; font-size:14px;">
                                    <?php $code = sprintf("%05s", $data['kode_pr']) ?>
                                    <?= "PR-".$code; ?> | <b>Requestor</b>
                                    <span style="text-transform: capitalize;"> <?= $data['requestor']; ?>
                                    </span></label> <br>
                                <label class="title">Item Detail</label>
                                <div class="table-responsive">
                                    <table class="table  table-bordered table-sm data">
                                        <tr class="bg-dark text-white">
                                            <!-- <th>Item Name</th> -->
                                            <th>Item Description</th>
                                            <th>Type</th>
                                            <th>Quantity</th>
                                            <th>Part Number</th>
                                            <th>Cost Center</th>
                                            <th>Specification</th>
                                        </tr>
                                        <tr>
                                            <!-- <td><?= $data['item_name']; ?></td> -->
                                            <td><?= $data['item_description']; ?></td>
                                            <td><?= $data['type']; ?></td>
                                            <td><?= $data['quantity']; ?></td>
                                            <td><?= $data['part_number']; ?></td>
                                            <td><?= $data['cost_center']; ?></td>
                                            <td><?= $data['spesifikasi']; ?></td>
                                        </tr>
                                    </table>
                                </div>
                                <a class="btn dropdown-toggle collapser" data-toggle="collapse" role="button"
                                    aria-controls="collapseExample">See Detail <i
                                        class="far fa-hand-point-down"></i></a>
                                <div class="form-group collapse" id="collapseExample">
                                    <div class="form-group col table-responsive">

                                        <a class="btn list-group-item-info btn-sm list-group-item-action"
                                            style="font-size: 11px; width:100px;"
                                            href="invoice-pr?id=<?= $data['kode_pr']?>">Detail P.R <i
                                                class="fas fa-file-invoice ml-2"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="tanda form-group col d-flex flex-column">
                                <label class="title">Date of Request</label>
                                <?php $date = date_create($data['pr_date']); ?>
                                <p><i class="far fa-calendar-alt mr-2"></i><?= date_format($date, 'j F Y'); ?></p>
                                <label class="title">Status</label>
                                <?php if ($data['status'] == 'approve'): ?>
                                <p class="btn btn-success btn-sm disabled" style="font-size: 11px; width:100px;">Approve
                                </p>
                                <!-- <div class="detail">
                                        <a href="#"><i class="fas fa-download mr-2"></i>Download</a>
                                    </div> -->
                                <?php endif; ?>
                                <?php if ($data['status'] == 'rejected'): ?>
                                <div class="d-flex">
                                    <p class="btn btn-danger btn-sm disabled" style="font-size: 11px; width:100px;">
                                        Rejected<?php endif; ?>
                                    </p> <?php if ($data['hod_status'] == '1') : ?> <small class="ml-2"><i>| Rejected by Head Of
                                            Division</i></small>
                                </div>
                                <!-- <a href="#"><i class="far fa-trash-alt mr-2"></i>Delete</a> -->
                                <?php endif; ?>
                                <?php if ($data['status'] == 'waiting'): ?>
                                <p class="btn btn-sm btn-secondary disabled" style="font-size: 11px; width:100px;">
                                    Waiting</p>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
            <!-- navigasi -->
            <div class="pagination ml-3 d-flex justify-content-between align-items-end">
                <div class="align-self-end">
                    <p style="opacity: 0.6; font-size:13px;">Page <?= $halamanAktif; ?> of <?= $jumlahHalaman; ?> </p>
                </div>
                <div class="page-nav p-3">
                    <?php if($halamanAktif > 1) :?>
                    <a href="?page=<?= $halamanAktif- 1;?>" class="ml-2 bg-dark text-white p-2"><i
                            class="fas fa-chevron-left mr-2"></i>Prev</a>
                    <?php if($halamanAktif < $jumlahHalaman ) : ?>
                    <a href="?page=<?= $halamanAktif-1;?>"
                        class="ml-2 bg-secondary p-2 text-white"><?= $halamanAktif-1; ?></a>
                    <?php endif; ?>
                    <?php endif; ?>

                    <a href="?page=<?= $halamanAktif;?>" class="ml-2 bg-dark p-2 text-white"><?= $halamanAktif; ?></a>
                    <?php if($halamanAktif < $jumlahHalaman) : ?>
                    <?php if($halamanAktif > 1 ) : ?>
                    <a href="?page=<?= $halamanAktif+1;?>"
                        class="ml-2 bg-secondary p-2 text-white"><?= $halamanAktif+1; ?></a>
                    <?php endif; ?>
                    <a href="?page=<?= $halamanAktif+1;?>" class="ml-2 bg-dark text-white p-2">Next<i
                            class="fas fa-chevron-right ml-2"></i></a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    </div>


    <!-- script data tables -->
    <script>
        $(document).ready(function () {
            $('#data').DataTable({
                scrollX: true,
                lengthChange: false,
                "order": [
                    [0, "desc"]
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


    <!-- Collapse  -->
    <script>
        $('.collapser').click(function () {
            $(this).next().collapse('toggle');
        });
    </script>
</body>

</html>