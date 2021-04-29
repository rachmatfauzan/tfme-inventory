<?php 
session_start();

require "../config/config.php";

if(!isset($_SESSION['head'])){
    header("location: ../index.php");
}



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
    <link rel="stylesheet" href="css/dashboard-hd.css">

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
                <a class="nav-link active" href="dashboard-iqa.php"><i class="fas fa-box-open"></i>Purchase Order</a>
                <a class="nav-link " href="profile-hd.php"><i class="fas fa-user"></i>Profile</a>
            </div>

            <div class="copyright">
                <small class="text-white text-muted">&copy;Copyright TFME polibatam 2020 &bull; All reserved</small>
            </div>

        </nav>
        <div class="konten">
            <div class="atap"><span> </span></div>
            <div class="navbar justify-content-between">
                <div class="profile">
                    <div class="wrapper-image">
                        <img src="../image/HOD.png" alt="">
                    </div>
                    <div class="profile-name">
                        <h5 style="text-transform:capitalize;"><?= $_SESSION['user']; ?></h5>
                        <p>Head of Division</p>
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
                    <div class="title mb-4 text-uppercase d-flex justify-content-center">
                        <h5 class="font-weight-bold text-secondary">List of Purchase Order</h5>
                    </div>
                    <div class="group">
                        <div class="form-group row d-flex justify-content-between">
                            <div class="tanda col-md-6">
                                <label class="title">Item Detail</label>
                                <a class="btn dropdown-toggle collapser" data-toggle="collapse" role="button"
                                    aria-expanded="false" aria-controls="collapseExample"></a>
                                <div class="form-group collapse" id="collapseExample">
                                    <div class="form-group col table-responsive">
                                        <table class="table">
                                            <tr>
                                                <th>Item Name</th>
                                                <th>Specification</th>
                                                <th>Quantity</th>
                                                <th>Unit Price</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Cooper Sulfat Pentahydrate
                                                </td>
                                                <td>
                                                    20kg/bag
                                                </td>
                                                <td>
                                                    1
                                                </td>
                                                <td>
                                                    Rp2.600.000
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Cooper Sulfat Pentahydrate
                                                </td>
                                                <td>
                                                    20kg/bag
                                                </td>
                                                <td>
                                                    1
                                                </td>
                                                <td>
                                                    Rp2.600.000
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tanda form-group col-md-6 d-flex flex-column align-items-end ">
                                <label class="title">Date of Request</label>
                                <p>19 November 2020</p>

                                <label class="title">Status</label>
                                <select name="status" id="status" class="custom-select col-sm-3 mb-2 form-control">
                                    <option value="waiting" selected disabled>Waiting</option> //sesuaikan dengan data yang ada di dalam database
                                    <option value="approve">Approve</option>
                                    <option value="rejected">Rejected</option>
                                </select>
                                <button class="btn-primary mb-2">Update</button>

                                <div class="detail">
                                    <a href="#"><i class="fas fa-download mr-2"></i>Download</a>
                                </div>
                            </div>
                        </div>
                        <hr style="border-color: black; width: 80%; opacity: 0.3;">
                    </div>
                    <div class="group">
                        <div class="form-group row d-flex justify-content-between">
                            <div class="tanda col-md-6">
                                <label class="title">Item Detail</label>
                                <a class="btn dropdown-toggle collapser" data-toggle="collapse" role="button"
                                    aria-expanded="false" aria-controls="collapseExample"></a>
                                <div class="form-group collapse" id="collapseExample">
                                    <div class="form-group col table-responsive">
                                        <table class="table">
                                            <tr>
                                                <th>Item Name</th>
                                                <th>Specification</th>
                                                <th>Quantity</th>
                                                <th>Unit Price</th>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Cooper Sulfat Pentahydrate
                                                </td>
                                                <td>
                                                    20kg/bag
                                                </td>
                                                <td>
                                                    1
                                                </td>
                                                <td>
                                                    Rp2.600.000
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    Cooper Sulfat Pentahydrate
                                                </td>
                                                <td>
                                                    20kg/bag
                                                </td>
                                                <td>
                                                    1
                                                </td>
                                                <td>
                                                    Rp2.600.000
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tanda form-group col-md-6 d-flex flex-column align-items-end ">
                                <label class="title">Date of Request</label>
                                <p>19 November 2020</p>
                                
                                <label class="title">Status</label>
                                <select name="status" id="status" class="custom-select col-sm-3 mb-2">
                                    <option value="waiting" selected disabled>Waiting</option> //sesuaikan dengan data yang ada di dalam database
                                    <option value="approve">Approve</option>
                                    <option value="rejected">Rejected</option>
                                </select>
                                <button class="btn-primary mb-2">Update</button>
                                
                                <div class="detail">
                                    <a href="#"><i class="fas fa-download mr-2"></i>Download</a>
                                </div>
                            </div>
                        </div>
                        <hr style="border-color: black; width: 80%; opacity: 0.3;">
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- Collapse  -->
    <script>
        $('.collapser').click(function () {
            $(this).next().collapse('toggle');
        });
    </script>
</body>

</html>