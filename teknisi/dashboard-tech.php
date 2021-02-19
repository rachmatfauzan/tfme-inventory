<?php 

session_start();
include "../config/config.php";

if(!isset($_SESSION['technician'])){
    header("location: index.php");
}

$name = $_SESSION['user'];
$query = mysqli_query($conn, "SELECT * FROM form_pr WHERE requestor = '$name' GROUP BY kode_pr ORDER BY id_pr DESC");
$cek = mysqli_num_rows($query);
if ($cek == 0){
    header('Location:generateForm.php');
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
                <a class="nav-link active" href="#"><i class="fas fa-history"></i>History
                    (PR)</a>
                <a class="nav-link" href="formulir-tech.php"><i class="fas fa-edit"></i>New Form</a>
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
                        <h5 style="text-transform: capitalize;"><?= $_SESSION["user"]; ?></h5>
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

            <?php foreach ($query as $data) :?>
            <div class="box">
                <div class="content">
                    <div class="group">
                        <div class="box1 form-group col-sm">
                            <div class="tanda">
                                <label style="opacity: 0.7; font-size:14px;">
                                <?php $code = sprintf("%05s", $data['kode_pr']) ?>
                                <?= "PR-".$code; ?> | <b>Requestor</b>
                                    <span style="text-transform: capitalize;"> <?= $data['requestor']; ?> </span></label> <br>
                                <label class="title">Item Detail</label>
                                <a class="btn dropdown-toggle collapser" data-toggle="collapse" role="button"
                                    aria-expanded="false" aria-controls="collapseExample" ></a>
                                <div class="form-group collapse" id="collapseExample">
                                    <div class="form-group col table-responsive">
                                        <table class="table  table-bordered table-sm data">
                                            <tr class="bg-dark text-white">
                                                <!-- <th>Item Name</th> -->
                                                <th>Item Description</th>
                                                <th>Type</th>
                                                <th>Quantity</th>
                                                <th>Part Number</th>
                                                <th>Cost Center</th>
                                            </tr>
                                                <!-- <td><?= $data['item_name']; ?></td> -->
                                                <td><?= $data['item_description']; ?></td>
                                                <td><?= $data['type']; ?></td>
                                                <td><?= $data['quantity']; ?></td>
                                                <td><?= $data['part_number']; ?></td>
                                                <td><?= $data['cost_center']; ?></td>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tanda form-group col d-flex flex-column">
                                <label class="title">Date of Request</label>
                                <?php $date = date_create($data['pr_date']); ?>
                                <p><i class="far fa-calendar-alt mr-2"></i><?= date_format($date, 'j F Y'); ?></p>
                                <label class="title">Status</label>
                                <?php if ($data['status'] == 'approve'): ?>
                                    <p class="btn btn-success btn-sm disabled" style="font-size: 11px; width:100px;">Approve</p>
                                    <div class="detail">
                                        <a href="#"><i class="fas fa-download mr-2"></i>Download</a>
                                    </div>
                                <?php endif; ?>
                                <?php if ($data['status'] == 'rejected'): ?>
                                    <p class="btn btn-danger btn-sm disabled" style="font-size: 11px; width:100px;">Rejected</p>
                                    <a href="#"><i class="far fa-trash-alt mr-2"></i>Delete</a>
                                <?php endif; ?>
                                <?php if ($data['status'] == 'waiting'): ?>
                                    <p>Waiting</p>
                                <?php endif; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <?php endforeach; ?>
        </div>
    </div>







    <!-- script data tables -->
    <script>
        $(document).ready(function () {
            $('#data').DataTable({
                scrollX: true,
                lengthChange: false,
            });
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