<?php 

session_start();
include "../config/config.php";

// Query memanggil posisi teknisi 
$queryTech = mysqli_query($conn, "SELECT * FROM user WHERE position = 'technician'");


// Query memanggil posisi admin 
$queryAdmin = mysqli_query($conn, "SELECT * FROM user WHERE position = 'admin'");


// Query memanggil posisi head
$queryHead = mysqli_query($conn, "SELECT * FROM user WHERE position = 'head'");


// Query memanggil posisi iqa
$queryIqa = mysqli_query($conn, "SELECT * FROM user WHERE position = 'iqa'");



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
    <link rel="stylesheet" href="../css/dashboard-user-list.css">

    <!-- Link CDN font-awesome  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

    <!-- Link Font Style Montserrat -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;900&display=swap" rel="stylesheet">

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
                <a class="nav-link active" href="#"><i class="fas fa-users"></i>User List</a>
                <a class="nav-link" href="history-pr.php"><i class="fas fa-list"></i>Select PR</a>
            </div>

            <div class="copyright">
                <small class="text-white text-muted">&copy;Copyright TFME polibatam 2020 &bull; All reserved</small>
            </div>
        </nav>
        <!-- End navigasi -->

        <!-- Content Table -->
        <div class="konten">
            <div class="atap"><span> </span></div>

            <div class="box">
                <div class="content">
                    <div class="kepala">
                        <h1><i class="fas fa-users"></i>List of Technician Accounts (TECHNICIAN)</h1>
                        <a href="add-user.php"><i class="fas fa-user-plus"></i>Add New user</a>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Handphone</th>
                                    <th style="width: 300px;">Address</th>
                                    <th>Email</th>
                                    <th>Position</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($queryTech as $teknisi) : ?>
                                <tr>
                                    <td><?= $teknisi["id_user"]; ?></td>
                                    <td style="text-transform: capitalize;"><?= $teknisi['name']; ?></td>
                                    <td><?= $teknisi['handphone']; ?></td>
                                    <td><?= $teknisi['address']; ?></td>
                                    <td><?= $teknisi['email']; ?></td>
                                    <td><?= $teknisi['position']; ?></td>
                                </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="content">
                    <div class="kepala">
                        <h1><i class="fas fa-users"></i>Internal Quality Audit Administrator (IQA)</h1>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Handphone</th>
                                    <th style="width: 300px;">Address</th>
                                    <th>Email</th>
                                    <th>Position</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach( $queryIqa as $iqa ) :?>
                                <tr>
                                    <td><?= $iqa["id_user"]; ?></td>
                                    <td style="text-transform: capitalize;"><?= $iqa['name']; ?></td>
                                    <td><?= $iqa['handphone']; ?></td>
                                    <td><?= $iqa['address']; ?></td>
                                    <td><?= $iqa['email']; ?></td>
                                    <td><?= $iqa['position']; ?></td>
                                </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="content">
                    <div class="kepala">
                        <h1><i class="fas fa-users"></i>Head Division Administrator (HD)</h1>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Handphone</th>
                                    <th style="width: 300px;">Address</th>
                                    <th>Email</th>
                                    <th>Position</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach( $queryHead as $head ) :?>
                                <tr>
                                    <td><?= $head["id_user"]; ?></td>
                                    <td style="text-transform: capitalize;"><?= $head['name']; ?></td>
                                    <td><?= $head['handphone']; ?></td>
                                    <td><?= $head['address']; ?></td>
                                    <td><?= $head['email']; ?></td>
                                    <td><?= $head['position']; ?></td>
                                </tr>
                                <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="content">
                    <div class="kepala">
                        <h1><i class="fas fa-users"></i>List of Admin Inventory Account (ADMIN)</h1>
                    </div>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Handphone</th>
                                    <th style="width: 300px;">Address</th>
                                    <th>Email</th>
                                    <th>Position</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php foreach ($queryAdmin as $admin ) : ?>
                                <tr>
                                    <td><?= $admin["id_user"]; ?></td>
                                    <td style="text-transform: capitalize;"><?= $admin['name']; ?></td>
                                    <td><?= $admin['handphone']; ?></td>
                                    <td><?= $admin['address']; ?></td>
                                    <td><?= $admin['email']; ?></td>
                                    <td><?= $admin['position']; ?></td>
                                </tr>
                            <?php endforeach; ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>

</body>

</html>