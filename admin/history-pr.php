<?php 
session_start();

require "../config/config.php";

if(!isset($_SESSION['admin'])){
    header("location: index.php");
}

// Ambil Data PR
$query = mysqli_query($conn, "SELECT * FROM form_pr GROUP BY kode_pr ORDER BY id_pr DESC");

$po_querry = mysqli_query($conn, "SELECT * FROM form_po");
$po_data = mysqli_fetch_assoc($po_querry);



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
            <div class="box">
                <div class="content pr">
                    <table class="table table-bordered table-hover table-responsive-sm table-striped">
                        <tr class="bg-dark text-white">
                            <th>PR Code</th>
                            <th>PR Date</th>
                            <th>Requestor</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                        <?php foreach ($query as $data) :  ?>
                        <tr>
                            <td><?= $data['kode_pr']; ?></td>
                            <td>
                                <?php $date = date_create($data['pr_date']) ?>
                                <?= date_format($date, 'j F Y') ; ?></td>
                            <td style="text-transform: capitalize;"><?= $data['requestor']; ?></td>
                            <td>
                                <?php if ($data['status'] == 'approve'): ?>
                                <p class="btn btn-success btn-sm disabled"
                                    style="font-size: 11px;text-transform:uppercase;">Approve</p>
                                <?php elseif ($data['status'] == 'rejected'): ?>
                                <p class="btn btn-danger btn-sm disabled"
                                    style="font-size: 11px;text-transform:uppercase;">Rejected</p>
                                <?php elseif ($data['status'] == 'waiting'): ?>
                                <p>Waiting</p>
                                <?php endif; ?>
                            </td>

                            <!-- disablle buton logic -->
                            <?php if($data['update_po'] == 1 ) :?>
                            <td>
                                <a href="#" class="btn btn-outline-secondary p-1 disabled">P.O Updated</a>
                            </td>
                            <?php elseif ($data['update_po'] == 0) : ?>
                            <td>
                                <a href="detail-pr.php?id=<?= $data['id_pr']?>" class="btn btn-outline-info p-1 ">See
                                    Details</a>
                            </td>
                            <?php endif; ?>
                            <!-- end logic -->

                        </tr>
                        <?php endforeach; ?>
                    </table>
                    <div class="btn">
                        <a href="history-po.php" class="btn btn-sm btn-info">History PO</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>