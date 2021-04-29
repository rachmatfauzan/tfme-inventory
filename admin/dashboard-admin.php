<?php 
session_start();

require "../config/config.php";

if(!isset($_SESSION['admin'])){
    header("location: ../index.php");
}

$query = mysqli_query($conn, "SELECT * FROM dt_inventory");


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
    <link rel="stylesheet" href="../css/dashboard-adm.css">

    <!-- Link CDN font-awesome  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

    <!-- Link Font Style Montserrat -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;900&display=swap" rel="stylesheet">

    <!-- link script datatable -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
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
                <a class="nav-link active" href="#"><i class="fas fa-database"></i>Data Site</a>
                <a class="nav-link" href="dashboard-user-list.php"><i class="fas fa-users"></i>User List</a>
                <a class="nav-link" href="history-pr.php"><i class="fas fa-list"></i>Select PR</a>
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
            <div class="box mt-2">
                <div class="content">
                    <div class="kepala">
                        <h1>Data Inventory</h1>
                        <div class="kepala-kanan">
                            <button type="button" class="btn" data-toggle="modal" data-target=".bd-example-modal-lg"><i
                                    class="far fa-question-circle"></i></button>
                            <a href="input-data.php"><i class="fas fa-box-open" style="margin-right: 10px;"></i>Get
                                Action</a>
                            <!-- Large modal -->
                            <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
                                aria-labelledby="mySmallModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                        <div class="modal-header text-center">
                                            <h5 class="modal-title" id="exampleModalLabel">Glossary</h5>
                                            <button type="button" class="btn close" data-dismiss="modal"
                                                aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>ITEM</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>NAME OF THE PRODUCT OR MATERIAL</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>PART NUMBER</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>THE NUMBER USED BY THE COMPANY TOWARDS INVENTORY AIMING TO
                                                        SIMPLIFY AND EASY TO REFER TO THE INVENTORY</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>SUPPLIER#</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>BUYING NUMBER OF BUYERS PROVIDED BY THE COMPANY</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>COST CENTER</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>AREA USED TO DETERMINE TYPES OF INVENTORY</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>IQA</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>Internal Quality Audit</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>TYPE</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>MODEL OR INVENTORY TYPE</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>SUPPLIER</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>COMPANY'S NAME TO BUY INVENTORY</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>DWG#</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>INVENTORY NUMBER GIVEN BY SUPPLIER</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>DESCRIPTION</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>DESCRIPTION OF INVENTORY IN DETAIL</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>MOQ (MINIMUM ORDER QUANTITY)</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>THE LOWEST AMOUNT OF STOCK AVAILABLE IS SOLD BY THE SUPPLIER</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>COST</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>INVENTORY PRICE</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>ON HAND</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>NUMBER OF GOODS ARE THERE NOW</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>IN TRANSIT</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>GOODS ARE ON THE WAY TOWARDS TO THE DESTINATION</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>IN PREPARATION</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>GOODS ARE IN PREPARATION BY THE SUPPLIER</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>ON PR#</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>NUMBER OF GOODS ARE IN PREPARATION BY THE SUPPLIER</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>ON PO#</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>NUMBER OF PURCHASE ORDER</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>RECEIVED DATE</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>DATE INVENTORY UNTIL THE DESTINATION</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>MANUFACTURING DATE</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>THE DATE WHEN THE PRODUCT WAS MADE</p>
                                                </div>
                                            </div>
                                            <div class="form-row">
                                                <div class="col-sm">
                                                    <b>EXPIRE DATE</b>
                                                </div>
                                                <div class="col-sm">
                                                    <p>MAXIMUM TIME LIMITS A PRODUCT CAN BE USED</p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive mt-2">
                        <table class="table inventory table-striped" id="data">
                            <thead>
                                <tr class="bg-dark text-white">
                                    <th>Part Number</th>
                                    <!-- <th>Item</th> -->
                                    <th>Description</th>
                                    <th>On Hand</th>
                                    <th>Type</th>
                                    <th>Cost</th>
                                    <th>Account Code</th>
                                    <th>Supplier</th>
                                    <th>Supplier#</th>
                                    <th>CC</th>
                                    <th>In Transit</th>
                                    <th>On Prep</th>
                                    <th>moq</th>
                                    <th>DWG#</th>
                                    <th>on_pr#</th>
                                    <th>on_po#</th>
                                    <th>batch#</th>
                                    <th>iqa</th>
                                    <th>Received Date</th>
                                    <th>Manufacturing Date</th>
                                    <th>Expiration Date</th>
                                    <th>po_date</th>
                                    <th>pr_date</th>
                                </tr>
                            </thead>
                            
                            <tbody>
                                <?php foreach ($query as $data) : ?>
                                <tr>
                                    <td><?= $data['part_number']; ?></td>
                                    <!-- <td><?= $data['item']; ?></td> -->
                                    <td><?= $data['description']; ?></td>
                                    <td><?= $data['on_hand']; ?></td>
                                    <td><?= $data['type']; ?></td>
                                    <td><?= $data['cost']; ?></td>
                                    <td><?= $data['account_code']; ?></td>
                                    <td><?= $data['supplier']; ?></td>
                                    <td><?= $data['supplier_no']; ?></td>
                                    <td><?= $data['cc']; ?></td>
                                    <td><?= $data['in_transit']; ?></td>
                                    <td><?= $data['on_prep']; ?></td>
                                    <td><?= $data['moq']; ?></td>
                                    <td><?= $data['dwg_no']; ?></td>
                                    <td><?= $data['on_pr_no']; ?></td>
                                    <td><?= $data['on_po_no']; ?></td>
                                    <td><?= $data['batch_no']; ?></td>
                                    <td><?= $data['iqa']; ?></td>
                                    <td><?= $data['received_date']; ?></td>
                                    <td><?= $data['manufacturing_date']; ?></td>
                                    <td><?= $data['expiration_date']; ?></td>
                                    <td><?= $data['po_date']; ?></td>
                                    <td><?= $data['pr_date']; ?></td>
                                </tr>
                                <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <th>Part Number</th>
                                    <!-- <th>Item</th> -->
                                    <th>Description</th>
                                    <th>On Hand</th>
                                    <th>Type</th>
                                    <th>Cost</th>
                                    <th>Account Code</th>
                                    <th>Supplier</th>
                                    <th>Supplier#</th>
                                    <th>CC</th>
                                    <th>In Transit</th>
                                    <th>On Prep</th>
                                    <th>moq</th>
                                    <th>DWG#</th>
                                    <th>on_pr#</th>
                                    <th>on_po#</th>
                                    <th>batch#</th>
                                    <th>iqa</th>
                                    <th>Received Date</th>
                                    <th>Manufacturing Date</th>
                                    <th>Expiration Date</th>
                                    <th>po_date</th>
                                    <th>pr_date</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- script data tables -->
    <script>
        $(document).ready(function () {
            $('#data').DataTable({
                scrollX: true,
                "lengthMenu": [
                    [15, 50, 100, -1],
                    [15, 50, 100, "All"]
                ],
            });
        });
    </script>
</body>

</html>