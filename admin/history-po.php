<?php 

session_start();
include "../config/config.php";

if(!isset($_SESSION['admin'])){
    header("location: index.php");
}
$query = mysqli_query($conn, "SELECT * FROM form_po ORDER BY id_po DESC");


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
    <link rel="stylesheet" href="../teknisi/css/dashboard-tech.css">

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
                <a class="nav-link" href="dashboard-admin.php"><i class="fas fa-database"></i>Data Site</a>
                <a class="nav-link" href="dashboard-user-list.php"><i class="fas fa-users"></i>User List</a>
                <a class="nav-link active" href="#"><i class="fas fa-list"></i>Select PR</a>
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
                            <a class="dropdown-item" href="../logout.php"><i class="fas fa-sign-out-alt"></i>Log Out</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="kepala d-flex justify-content-between align-items-center mt-2 ml-2">
                <h6 class="mt-2 list-group-item-info" style="width: 20em; padding:5px; border-radius:5px;text-indent:22px;">History PO <span style="font-style:italic; opacity:0.6;">(Purchase Order)</span></h6>
                <a href="history-pr.php"><i class="fas fa-undo-alt mr-2"></i>Back To PR</a>
            </div>
            <?php foreach ($query as $data) :?>
            <div class="box">
                <div class="content">
                    <div class="group">
                        <div class="box1 form-group col-sm">
                            <div class="tanda">
                                <label style="opacity: 0.7; font-size:14px;"><?= $data['po_code']; ?> | <b>Requestor</b>
                                    <span style="text-transform: capitalize;"> <?= $_SESSION['user']; ?>
                                    </span></label> <br>
                                <label class="title">Item Detail</label>
                                <a class="btn dropdown-toggle collapser" data-toggle="collapse" role="button"
                                    aria-expanded="false" aria-controls="collapseExample"></a>
                                <div class="form-group collapse" id="collapseExample">
                                    <div class="form-group col table-responsive">
                                        <table class="table  table-bordered table-sm data">
                                            <tr class="bg-dark text-white" style="font-size: 12px;">
                                                <th>Supplier Name</th>
                                                <th>Supplier Code</th>
                                                <th>On Hand</th>
                                                <th>In Transit</th>
                                                <th>On Prep</th>
                                                <th>MOQ</th>
                                                <th>Cost</th>
                                                <th>Batch Code</th>
                                                <th>DWG Code</th>
                                                <th>IQA Code</th>
                                                
                                            </tr>
                                            <td><?= $data['supplier_name']; ?></td>
                                            <td><?= $data['supplier_code']; ?></td>
                                            <td><?= $data['on_hand']; ?></td>
                                            <td><?= $data['in_transit']; ?></td>
                                            <td><?= $data['on_prep']; ?></td>
                                            <td><?= $data['moq']; ?></td>
                                            <td><?= $data['cost']; ?></td>
                                            <td><?= $data['batch_code']; ?></td>
                                            <td><?= $data['dwg_code']; ?></td>
                                            <td><?= $data['iqa_code']; ?></td>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tanda form-group col d-flex flex-column">
                                <label class="title">Date of Request</label>
                                <?php $date = date_create($data['po_date']); ?>
                                <p><?= date_format($date, 'j F Y'); ?></p>
                                <label class="title">Status</label>
                                <?php if ($data['status_po'] == 'approve'): ?>
                                <p class="btn btn-success btn-sm disabled" style="font-size: 11px; width:100px;">Approve
                                </p>
                                <div class="detail">
                                    <a href="#"><i class="fas fa-download mr-2"></i>Download</a>
                                </div>
                                <?php endif; ?>
                                <?php if ($data['status_po'] == 'rejected'): ?>
                                <p class="btn btn-danger btn-sm disabled" style="font-size: 11px; width:100px;">Rejected
                                </p>
                                <a href="#"><i class="far fa-trash-alt mr-2"></i>Delete</a>
                                <?php endif; ?>
                                <?php if ($data['status_po'] == 'waiting'): ?>
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