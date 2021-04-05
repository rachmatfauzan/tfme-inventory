<?php 
session_start();

require "../config/config.php";

if(!isset($_SESSION['admin'])){
    header("location: index.php");
}

$query = mysqli_query($conn, "SELECT * FROM dt_inventory ORDER BY id_item DESC");




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
    <link rel="stylesheet" href="../css/input-data.css">

    <!-- Link CDN font-awesome  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

    <!-- Link Font Style Montserrat -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;900&display=swap" rel="stylesheet">

    <!-- link script datatable -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="js/masknumber.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>

    <!-- Bootstrap Js -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>

    <!-- Bootstrap Ordered Datatables  -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
    <link rel="icon" href="../image/TFME.jpg">

    <!--  CDN SWAL-->
    <script src="../swal2/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="../swal2/dist/sweetalert2.min.css">
    <title>Dashboard Inventory</title>



</head>

<body>
    <div class="konten">
        <div class="navbar bg-dark justify-content-between">
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
                <div class="nav-item">
                    <a class="nav-link active" href="dashboard-admin.php"><i class="fas fa-database"></i>Data Site</a>
                    <a class="nav-link" href="dashboard-user-list.php"><i class="fas fa-users"></i>User List</a>
                    <a class="nav-link " href="history-pr.php"><i class="fas fa-list"></i>Select PR</a>
                </div>
            </div>

            <!-- Logic input Data -->
            <?php 
                if (isset($_POST['input'])){
                    $part_number = $_POST['part_numbering'];
                    // $item_name = htmlspecialchars($_POST['item_name']); 
                    $received_date = $_POST['received_date'];
                    $account_code = $_POST['account_code'];
                    $supplier = $_POST['supplier'];
                    $description = $_POST['description'];
                    $supplier_no = $_POST['supplier_no'];
                    $cost = $_POST['cost'];
                    $on_hand = $_POST['on_hand'];
                    $in_transit = $_POST['in_transit'];
                    $on_prep = $_POST['on_prep'];
                    $moq = $_POST['moq'];
                    $cc = $_POST['cc'];
                    $dwg_no = $_POST['dwg_no'];
                    $on_pr_no = $_POST['on_pr_no'];
                    $on_po_no = $_POST['on_po_no'];
                    $batch_no = $_POST['batch_no'];
                    $iqa = $_POST['iqa'];
                    $manufacturing_date = $_POST['manufacturing_date'];
                    $expiration_date = $_POST['expiration_date'];
                    $po_date = $_POST['po_date'];
                    $pr_date = $_POST['pr_date'];
                    $type = $_POST['type'];
                
                    // cek usernmae sudah ada atau belum
                    $result = mysqli_query($conn, "SELECT part_number FROM dt_inventory WHERE part_number = '$part_number'");
                    
                    if (mysqli_fetch_assoc($result)){
                        echo '<script>
                    swal.fire("Part Number Error", "Your part number has been input in to database", "warning");
                    
                    setTimeout(function(){window.top.location="input-data.php"},3000);
                    </script>';
                    exit;
                    }


                    $input = mysqli_query($conn, "INSERT INTO dt_inventory VALUES ('', '','$part_number','$supplier_no', '$cc','$account_code','$type','$supplier', '$dwg_no', '$description', '$moq', '$cost', '$on_hand', '$in_transit', '$on_prep', '$on_pr_no', '$on_po_no', '$batch_no', '$iqa', '$received_date', '$manufacturing_date', '$expiration_date', '$po_date', '$pr_date')");
                    
        
                    if ($input){
                        echo '<script>
                    swal.fire("Success", "Your data has been input to database", "success");
                    setTimeout(function(){window.top.location="input-data.php"},2200);
                    </script>';
                    exit;
                    }else{
                        echo "gagal";
                        mysqli_error($conn);
                    }
        
            }

            ?>
            <!-- check part_number -->
            <?php 
                if (isset($_POST['check_part'])){
                    $part_number = $_POST['part_numbering'];
                    
                    $result = mysqli_query($conn, "SELECT part_number FROM dt_inventory WHERE part_number = '$part_number'");
                    
                    if (mysqli_fetch_assoc($result)){
                        echo '<script>
                    swal.fire("Part Number Error", "Your part number has been input in to database", "warning");
                    
                    setTimeout(function(){window.top.location="input-data.php"},3000);
                    </script>';
                    exit;
                    } else {
                        $newPart = true;
                    }

                }
            
            ?>

            <!-- Logic Update -->
            <?php  
                // update
                if (isset($_POST['ubah'])){
                    $id_item = $_POST['id_item'];
                    $part_number = $_POST['part_number'];
                    // $item_name = htmlspecialchars($_POST['item_name']); 
                    $received_date = $_POST['received_date'];
                    $cc = $_POST['cc'];
                    $type = $_POST['type'];
                    $account_code = $_POST['account_code'];
                    $supplier = $_POST['supplier'];
                    $description = $_POST['description'];
                    $supplier_no = $_POST['supplier_no'];
                    $cost = $_POST['cost'];
                    $on_hand = $_POST['on_hand'];
                    $in_transit = $_POST['in_transit'];
                    $on_prep = $_POST['on_prep'];
                    $moq = $_POST['moq'];
                    $dwg_no = $_POST['dwg_no'];
                    $on_pr_no = $_POST['on_pr_no'];
                    $on_po_no = $_POST['on_po_no'];
                    $batch_no = $_POST['batch_no'];
                    $iqa = $_POST['iqa'];
                    $manufacturing_date = $_POST['manufacturing_date'];
                    $expiration_date = $_POST['expiration_date'];
                    $po_date = $_POST['po_date'];
                    $pr_date = $_POST['pr_date'];
                    
                    $update = mysqli_query($conn, "UPDATE dt_inventory SET
                    item = null,
                    supplier_no = '$supplier_no',
                    cc = '$cc',
                    account_code = '$account_code',
                    type = '$type',
                    supplier = '$supplier',
                    dwg_no = '$dwg_no',
                    description = '$description',
                    moq = '$moq',
                    cost = '$cost',
                    on_hand = '$on_hand',
                    in_transit = '$in_transit',
                    on_prep = '$on_prep',
                    on_pr_no = '$on_pr_no',
                    on_po_no = '$on_po_no',
                    batch_no = '$batch_no',
                    iqa = '$iqa',
                    received_date = '$received_date',
                    manufacturing_date = '$manufacturing_date',
                    expiration_date = '$expiration_date',
                    po_date = '$po_date',
                    pr_date = '$pr_date'
                    WHERE id_item = '$id_item' ");

                    if ($update){
                        echo '<script>
                    swal.fire("Data Updated", "Great Work :)", "success");
                    setTimeout(function(){window.top.location="input-data.php"},1500);
                    </script>';
                    exit;
                    }
                    else{
                        echo "gagal";
                    }

                }
            ?>

            <!-- logic delete -->
            <?php 
            if (isset($_POST['delete'])){
                $item = $_POST['id_item'];
                $item = (int)$item;
                $del = mysqli_query($conn, "DELETE FROM dt_inventory WHERE id_item = $item");
            
                if ($del){
                    echo '<script>
                    swal.fire("Data Deleted", "Great Work :)", "success");
                    setTimeout(function(){window.top.location="input-data.php"},1500);
                    </script>';
                    exit;
                }else{
                    echo "gagal";
                }    
            }
            ?>
        </div>
        <div class="box">
            <!-- start header -->
            <div class="title mb-4 text-uppercase d-flex justify-content-center">
                <h5 class="font-weight-bold text-secondary" id="top"><i class="fas fa-box-open mr-3"></i>Data Inventory
                </h5>
                <a type="button" data-toggle="modal" data-target=".glossary"
                    style="font-size:13px; opacity:0.6; cursor:pointer;"><i class="far fa-question-circle ml-3"></i></a>
            </div>
            <div class="table-responsive mt-2">
                <?php if (isset($newPart)) :?>
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <strong>Congratulation!</strong> You can use <?= $part_number; ?> this new part number for data
                    inventory tfme <a href="#newPart"> <strong>click here</strong></a>.
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <script>
                </script>
                <?php endif; ?>
                <table class="table table-striped" id="data">
                    <thead>
                        <tr class="bg-dark text-white">
                            <th>Action</th>
                            <th>Part Number</th>
                            <!-- <th>Item</th> -->
                            <th>Description</th>
                            <th>On Hand</th>
                            <th>Type</th>
                            <th>Expiration Date</th>
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
                            <th>po_date</th>
                            <th>pr_date</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($query as $data) : ?>
                        <tr>
                            <td>
                                <a class="bg-danger text-white" id="delete" data-target=".delete" data-toggle="modal"
                                    data-part_number="<?= $data['part_number']; ?>"
                                    data-id_item="<?= $data['id_item']; ?>"><i class="fas fa-trash-alt"></i></a>
                                |
                                <a class="bg-info text-white" id="updateData" type="button"
                                    data-target=".bd-example-modal-lg" data-toggle="modal"
                                    data-id_item="<?= $data['id_item']; ?>"
                                    data-part_number="<?= $data['part_number']; ?>"
                                    data-item_name="<?= $data['item']; ?>"
                                    data-account_code="<?= $data['account_code']; ?>" data-type="<?= $data['type']; ?>"
                                    data-supplier="<?= $data['supplier']; ?>"
                                    data-part_number="<?= $data['part_number']; ?>"
                                    data-description="<?= $data['description']; ?>"
                                    data-supplier_no="<?= $data['supplier_no']; ?>" data-cc="<?= $data['cc']; ?>"
                                    data-cost="<?= $data['cost']; ?>" data-on_hand="<?= $data['on_hand']; ?>"
                                    data-in_transit="<?= $data['in_transit']; ?>"
                                    data-on_prep="<?= $data['on_prep']; ?>" data-moq="<?= $data['moq']; ?>"
                                    data-dwg_no="<?= $data['dwg_no']; ?>" data-on_pr_no="<?= $data['on_pr_no']; ?>"
                                    data-on_po_no="<?= $data['on_po_no']; ?>" data-batch_no="<?= $data['batch_no']; ?>"
                                    data-iqa="<?= $data['iqa']; ?>" data-received_date="<?= $data['received_date']; ?>"
                                    data-manufacturing_date="<?= $data['manufacturing_date']; ?>"
                                    data-expiration_date="<?= $data['expiration_date']; ?>"
                                    data-po_date="<?= $data['po_date']; ?>"
                                    data-pr_date="<?= $data['pr_date']; ?>">Edit</a>

                            </td>
                            <td><?= $data['part_number']; ?></td>
                            <!-- <td><?= $data['item']; ?></td> -->
                            <td><?= $data['description']; ?></td>
                            <td><?= $data['on_hand']; ?></td>
                            <td><?= $data['type']; ?></td>
                            <td><?= $data['expiration_date']; ?></td>
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
                            <td><?= $data['po_date']; ?></td>
                            <td><?= $data['pr_date']; ?></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                    <tfoot>
                        <th>Action</th>
                        <th>Part Number</th>
                        <!-- <th>Item</th> -->
                        <th>Description</th>
                        <th>On Hand</th>
                        <th>Type</th>
                        <th>Expiration Date</th>
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
                        <th>po_date</th>
                        <th>pr_date</th>
                    </tfoot>
                </table>
            </div>

            <!-- Modal Delete -->
            <div class="modal fade delete" id="modalDelete">
                <div class="modal-dialog modal-md">
                    <div class="modal-content d-flex flex-column align-items-center justify-content-center">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                <h4 class="modal-title">Are You Want to Delete ?</h4>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form id="formDelete" method="post" class="d-flex justify-content-center flex-column">
                                <input type="text" class="bg-light form-control" style="text-align: center;" name="part"
                                    id="part_number" disabled>
                                <input type="text" class="bg-light form-control d-none
                                    style=" text-align: center;" name="id_item" id="id_item">
                                <div class="btn">
                                    <button name="delete" class="btn btn-danger btn-sm text-white"
                                        type="submit">Delete</button>
                                    <button class="btn btn-light btn-sm" data-dismiss="modal">No</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>


            <script>
                $(document).on('click', '#delete', function () {
                    let partNumber = $(this).data('part_number');
                    let id = $(this).data('id_item');
                    $('.modal-body #part_number').val(partNumber);
                    $('.modal-body #id_item').val(id);
                });
            </script>




            <!-- Modal -->
            <div class="modal modal-fullscreen fade bd-example-modal-lg" tabindex="-1" role="dialog" id="myModal3"
                aria-labelledby="myLargeModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-box-open mr-3"></i>Edit Data
                                Item</h5>
                        </div>
                        <div class="modal-body">
                            <form method="post" style="font-size:12px;">
                                <div class="group">
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <input type="text" name="id_item" id="id_item" class="d-none">
                                            <h5 class="font-weight-bold">ITEM</h5>
                                            <hr class="my-4">
                                            <!-- <div class="form-group">
                                                <label for="item_name">Item Name</label>
                                                <input type="text" class="form-control bg-light" id="item_name" name="item_name">
                                            </div> -->
                                            <div class="form-group">
                                                <label for="type">Type</label>
                                                <input type="text" name="type" class="form-control bg-light" id="type">
                                            </div>
                                            <div class="form-group">
                                                <label for="item_description">Item Description</label>
                                                <textarea type="text" class="form-control bg-light" id="description"
                                                    name="description"></textarea>
                                            </div>
                                            <h5 class="font-weight-bold">STOCK</h5>
                                            <hr class="my-4">
                                            <div class="form-group">
                                                <label for="on_hand">On Hand</label>
                                                <input type="text" name="on_hand" class="form-control bg-light"
                                                    id="on_hand">
                                            </div>
                                            <div class="form-group">
                                                <label for="in_transit">In Transit</label>
                                                <input type="text" name="in_transit" class="form-control bg-light"
                                                    id="in_transit">
                                            </div>
                                            <div class="form-group">
                                                <label for="on_prep">On Prep</label>
                                                <input type="text" name="on_prep" class="form-control bg-light"
                                                    id="on_prep">
                                            </div>
                                            <h5 class="font-weight-bold">CHECKING</h5>
                                            <hr class="my-4">
                                            <div class="form-group">
                                                <label for="batch_no">Batch#</label>
                                                <input type="text" name="batch_no" class="form-control bg-light"
                                                    id="batch_no">
                                            </div>
                                            <div class="form-group">
                                                <label for="dwg_no">DWG#</label>
                                                <input type="text" name="dwg_no" class="form-control bg-light"
                                                    id="dwg_no">
                                            </div>
                                            <div class="form-group">
                                                <label for="iqa_no">IQA#</label>
                                                <input type="text" name="iqa" class="form-control bg-light" id="iqa_no">
                                            </div>
                                            <h5 class="font-weight-bold">DATE</h5>
                                            <hr class="my-4">
                                            <div class="form-group">
                                                <label for="received_date">Received Date</label>
                                                <input type="date" name="received_date" id="received_date"
                                                    class="form-control bg-light">
                                            </div>
                                            <div class="form-group">
                                                <label for="expiration_date">Expiration Date</label>
                                                <input type="date" name="expiration_date" id="expiration_date"
                                                    class="form-control bg-light">
                                            </div>
                                        </div>
                                        <div class="form-group col-sm-6">
                                            <h5 class="font-weight-bold">SUPPLIER</h5>
                                            <hr class="my-4">
                                            <div class="form-group">
                                                <label for="supplier">Supplier Name</label>
                                                <input type="text" name="supplier" class="form-control bg-light"
                                                    id="supplier">
                                            </div>
                                            <div class="form-group">
                                                <label for="supplier_no">Supplier#</label>
                                                <input type="text" name="supplier_no" class="form-control bg-light"
                                                    id="supplier_no">
                                            </div>
                                            <h5 class="font-weight-bold">NUMBERING</h5>
                                            <hr class="my-4">
                                            <div class="form-group">
                                                <label for="part_number">Part Number</label>
                                                <input type="text" name="part_number"
                                                    class="form-control list-group-item-info" id="part_number">
                                            </div>
                                            <div class="form-group">
                                                <label for="cc">Cost Center</label>
                                                <select id="cc" name="cc" class="form-control custom-select  bg-light">
                                                    <option selected disabled>-- Choose CC --</option>
                                                    <option value="10">10 PCB</option>
                                                    <option value="20">20 PCBA</option>
                                                    <option value="30">30 IC PACK</option>
                                                    <option value="40">40 GENERAL</option>
                                                </select>
                                            </div>
                                            <div class="form-group">
                                                <label for="account_code">Account Code</label>
                                                <input type="text" name="account_code" class="form-control bg-light"
                                                    id="account_code">
                                            </div>
                                            <h5 class="font-weight-bold">ORDER</h5>
                                            <hr class="my-4">
                                            <div class="form-group">
                                                <label for="moq">MOQ</label>
                                                <input type="text" name="moq" class="form-control bg-light" id="moq">
                                            </div>
                                            <div class="form-group">
                                                <label for="cost">Cost</label>
                                                <input type="text" id="number" name="cost" class="form-control bg-light" id="cost">
                                            </div>
                                            <div class="form-group">
                                                <label for="on_pr_no">On PR#</label>
                                                <input type="text" name="on_pr_no" class="form-control bg-light"
                                                    id="on_pr_no">
                                            </div>
                                            <div class="form-group">
                                                <label for="on_po_no">On PO#</label>
                                                <input type="text" name="on_po_no" class="form-control bg-light"
                                                    id="on_po_no">
                                            </div>
                                            <div class="form-group">
                                                <label for="pr_date">PR Date</label>
                                                <input type="date" name="pr_date" id="pr_date"
                                                    class="form-control bg-light">
                                            </div>
                                            <div class="form-group">
                                                <label for="po_date">PO Date</label>
                                                <input type="date" name="po_date" id="po_date"
                                                    class="form-control bg-light">
                                            </div>
                                            <div class="form-group">
                                                <label for="manufacturing_date">Manufacture Date</label>
                                                <input type="date" name="manufacturing_date" id="manufacturing_date"
                                                    class="form-control bg-light">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-info btn-sm float-right" name="ubah">Edit
                                    Data</button>
                            </form>
                        </div>
                        <div class="modal-footer update mt-2">
                            <a type="button" class="text-secondary mr-4" data-dismiss="modal">Close &times;</a>
                        </div>
                    </div>
                </div>
                <script>
                    $(document).ready(function () {
                        $("#number").keyup(function () {
                            $(this).maskNumber({
                                integer: true,
                                thousands: "."
                            })
                        })
                    })
                </script>
            </div>


            <script>
                $(document).on('click', '#updateData', function () {
                    let id_item = $(this).data('id_item');
                    let partNumber = $(this).data('part_number');
                    let received_date = $(this).data('received_date');
                    let account_code = $(this).data('account_code');
                    let supplier = $(this).data('supplier');
                    let description = $(this).data('description');
                    let supplier_no = $(this).data('supplier_no');
                    let cost = $(this).data('cost');
                    let on_hand = $(this).data('on_hand');
                    let type = $(this).data('type');
                    let in_transit = $(this).data('in_transit');
                    let on_prep = $(this).data('on_prep');
                    let moq = $(this).data('moq');
                    let dwg_no = $(this).data('dwg_no');
                    let on_pr_no = $(this).data('on_pr_no');
                    let on_po_no = $(this).data('on_po_no');
                    let batch_no = $(this).data('batch_no');
                    let iqa = $(this).data('iqa');
                    let manufacturing_date = $(this).data('manufacturing_date');
                    let expiration_date = $(this).data('expiration_date');
                    let po_date = $(this).data('po_date');
                    let pr_date = $(this).data('pr_date');
                    let item_name = $(this).data('item_name');
                    let cc = $(this).data('cc');
                    $('.modal-body #id_item').val(id_item);
                    $('.modal-body #part_number').val(partNumber);
                    $('.modal-body #item_name').val(item_name);
                    $('.modal-body #received_date').val(received_date);
                    $('.modal-body #cc').val(cc);
                    $('.modal-body #type').val(type);
                    $('.modal-body #account_code').val(account_code);
                    $('.modal-body #supplier').val(supplier);
                    $('.modal-body #description').val(description);
                    $('.modal-body #supplier_no').val(supplier_no);
                    $('.modal-body #cost').val(cost);
                    $('.modal-body #on_hand').val(on_hand);
                    $('.modal-body #in_transit').val(in_transit);
                    $('.modal-body #on_prep').val(on_prep);
                    $('.modal-body #moq').val(moq);
                    $('.modal-body #dwg_no').val(dwg_no);
                    $('.modal-body #on_pr_no').val(on_pr_no);
                    $('.modal-body #on_po_no').val(on_po_no);
                    $('.modal-body #batch_no').val(batch_no);
                    $('.modal-body #iqa').val(iqa);
                    $('.modal-body #manufacturing_date').val(manufacturing_date);
                    $('.modal-body #expiration_date').val(expiration_date);
                    $('.modal-body #po_date').val(po_date);
                    $('.modal-body #pr_date').val(pr_date);
                });
                // logic autofocus
                $(document).ready(function () {
                    $('#myModal3').on('shown.bs.modal', function () {
                        $('#item_name').trigger('focus');
                    });
                })
            </script>

            <!-- logic jquery overlaynya -> mati -->
            <script>
                $(document).ready(function () {

                    $("#updateData").click(function () {
                        $("#myModal3").modal({
                            backdrop: "static"
                        });
                    });
                });
            </script>

            <!-- End Modal -->
            <!-- Strat Input Data Manual -->
            <div class="data-entry mt-4">
                <div class="title mb-4 text-uppercase d-flex justify-content-center" id="newPart">
                    <h5 class="font-weight-bold text-secondary">Input New Part Number</h5>
                </div>
                <form method="post" style="font-size:12px;">
                    <div class="group">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <h5 class="font-weight-bold">ITEM</h5>
                                <hr class="my-4">
                                <div class="form-group">
                                    <label for="type">Type</label>
                                    <input type="text" name="type" class="form-control bg-light"
                                        placeholder="Enter Item Type">
                                </div>
                                <div class="form-group">
                                    <label for="item_description">Item Description</label>
                                    <textarea type="text" class="form-control bg-light" name="description"
                                        placeholder="Enter Description"></textarea>
                                </div>
                                <h5 class="font-weight-bold">STOCK</h5>
                                <hr class="my-4">
                                <div class="form-group">
                                    <label for="on_hand">On Hand</label>
                                    <input type="text" name="on_hand" class="form-control bg-light"
                                        placeholder="Enter On Hand">
                                </div>
                                <div class="form-group">
                                    <label for="in_transit">In Transit</label>
                                    <input type="text" placeholder="Enter In Transit" name="in_transit"
                                        class="form-control bg-light">
                                </div>
                                <div class="form-group">
                                    <label for="on_prep">On Prep</label>
                                    <input type="text" name="on_prep" placeholder="EnterOn Prep"
                                        class="form-control bg-light">
                                </div>
                                <h5 class="font-weight-bold">CHECKING</h5>
                                <hr class="my-4">
                                <div class="form-group">
                                    <label for="batch_no">Batch#</label>
                                    <input type="text" name="batch_no" class="form-control bg-light"
                                        placeholder="Enter Batch Number">
                                </div>
                                <div class="form-group">
                                    <label for="dwg_no">DWG#</label>
                                    <input type="text" name="dwg_no" class="form-control bg-light"
                                        placeholder="Enter DWG Number">
                                </div>
                                <div class="form-group">
                                    <label for="iqa_no">IQA#</label>
                                    <input type="text" name="iqa" class="form-control bg-light"
                                        placeholder="Enter IQA Number">
                                </div>
                                <h5 class="font-weight-bold">DATE</h5>
                                <hr class="my-4">
                                <div class="form-group">
                                    <label for="received_date">Received Date</label>
                                    <input type="date" name="received_date" class="form-control bg-light">
                                </div>
                                <div class="form-group">
                                    <label for="expiration_date">Expiration Date</label>
                                    <input type="date" name="expiration_date" class="form-control bg-light">
                                </div>
                            </div>
                            <div class="form-group col-sm-6">
                                <h5 class="font-weight-bold">SUPPLIER</h5>
                                <hr class="my-4">
                                <div class="form-group">
                                    <label for="supplier">Supplier Name</label>
                                    <input type="text" name="supplier" class="form-control bg-light"
                                        placeholder="Enter Supplier Name">
                                </div>
                                <div class="form-group">
                                    <label for="supplier_no">Supplier#</label>
                                    <input type="text" name="supplier_no" class="form-control bg-light"
                                        placeholder="Enter Supplier Number">
                                </div>
                                <h5 class="font-weight-bold">NUMBERING</h5>
                                <hr class="my-4">
                                <div class="form-group">
                                    <label for="part_number">Part Number</label>
                                    <?php if (!isset($newPart)): ?>
                                    <form method="post">
                                        <div class="d-flex">
                                            <input type="text" name="part_numbering" class="form-control bg-light"
                                                placeholder="Enter Part Number">
                                            <button class="btn ml-2 btn-outline-warning"
                                                name="check_part">Check</button>
                                        </div>
                                    </form>
                                    <?php endif; ?>
                                    <?php if (isset($newPart)) :?>

                                    <div class="d-flex">
                                        <input type="text" name="part_numbering" class="form-control bg-light"
                                            value="<?= $part_number; ?>">
                                        <a class="btn ml-2 btn-outline-secondary" href="input-data.php">Reset</a>
                                    </div>
                                    <div class="alert alert-success alert-dismissible fade show" role="alert"
                                        style="border-radius: 0;">
                                        <strong>Congratulation!</strong> You can use the new part number for data
                                        inventory tfme.
                                    </div>
                                    <script>
                                    </script>
                                    <?php endif; ?>
                                </div>
                                <div class="form-group">
                                    <label for="cc">Cost Center Test</label>
                                    <select name="cc" class="form-control custom-select bg-light" required>
                                        <option selected disabled value="">-- Choose CC --</option>
                                        <option value="10">10 PCB</option>
                                        <option value="20">20 PCBA</option>
                                        <option value="30">30 IC PACK</option>
                                        <option value="40">40 GENERAL</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="account_code">Account Code</label>
                                    <input type="text" name="account_code" class="form-control bg-light"
                                        placeholder="Enter Account Code">
                                </div>
                                <h5 class="font-weight-bold">ORDER</h5>
                                <hr class="my-4">
                                <div class="form-group">
                                    <label for="moq">MOQ</label>
                                    <input type="text" name="moq" class="form-control bg-light" placeholder="Enter MOQ">
                                </div>
                                <div class="form-group">
                                    <label for="cost">Cost</label>
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text text-muted" id="basic-addon1">Rp</span>
                                        </div>
                                        <input type="text" name="cost" class="form-control bg-light"
                                            placeholder="Enter Cost" id="angka">
                                    </div>

                                    <script>
                                        $(document).ready(function () {
                                            $("#angka").keyup(function () {
                                                $(this).maskNumber({
                                                    integer: true,
                                                    thousands: "."
                                                })
                                            })
                                        })
                                    </script>
                                </div>
                                <div class="form-group">
                                    <label for="on_pr_no">On PR#</label>
                                    <input type="text" name="on_pr_no" class="form-control bg-light"
                                        placeholder="Enter On PR Number">
                                </div>
                                <div class="form-group">
                                    <label for="on_po_no">On PO#</label>
                                    <input type="text" name="on_po_no" class="form-control bg-light"
                                        placeholder="Enter On PO Number">
                                </div>
                                <div class="form-group">
                                    <label for="pr_date">PR Date</label>
                                    <input type="date" name="pr_date" class="form-control bg-light">
                                </div>
                                <div class="form-group">
                                    <label for="po_date">PO Date</label>
                                    <input type="date" name="po_date" class="form-control bg-light">
                                </div>
                                <div class="form-group">
                                    <label for="manufacturing_date">Manufacture Date</label>
                                    <input type="date" name="manufacturing_date" class="form-control bg-light">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <input type="submit" class="btn btn-dark btn-sm align-self-end" name="input" value="Enter Data">
                        <a class="top" href="#top">Go Top<i class="fas fa-arrow-circle-up ml-2"></i>
                    </div>
                </form>
            </div>
        </div>
        <!-- Large modal -->
        <div class="modal fade bd-example-modal-lg glossary" tabindex="-1" role="dialog"
            aria-labelledby="mySmallModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header text-center">
                        <h5 class="modal-title" id="exampleModalLabel">Glossary</h5>
                        <button type="button" class="btn close" data-dismiss="modal" aria-label="Close">
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
                                <p>THE NUMBER USED BY THE COMPANY TOWARDS INVENTORY AIMING TO SIMPLIFY AND
                                    EASY TO REFER TO THE INVENTORY</p>
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




    <!-- script data tables -->
    <script>
        $(document).ready(function () {
            $('#data').DataTable({
                scrollX: true,
            });
        });
    </script>
</body>

</html>