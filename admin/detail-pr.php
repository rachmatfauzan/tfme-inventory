<?php  
require '../config/config.php';
session_start();
// ambil id dari URL
$id = $_GET["id"];

$sql = mysqli_query($conn, "SELECT * FROM form_pr WHERE kode_pr = '$id'");
$hasil = mysqli_fetch_assoc($sql);
$part_number = $hasil['part_number'];
$count = mysqli_num_rows($sql);

if (isset($_POST['tombol'])){
    $status = $_POST['status'];

    $query = mysqli_query($conn, "UPDATE form_pr SET status = '$status' WHERE kode_pr = '$id' ");
    if($query){
        $berhasil = true;
    }
}


$kode = mysqli_query($conn, "SELECT max(kode_po) as pr_kode FROM form_po ORDER BY id_po ASC");
$dataKode = mysqli_fetch_assoc($kode);

$code = (int)$dataKode['pr_kode'] + 1;
$kodeOtomatis = sprintf("%05s", $code);



if(isset($_POST['send'])){
    

        $kode_po = $code;
        $kode_pr = $id;
        $supplier_name = $_POST['supplier_name'];
        $supplier_code = $_POST['supplier_code'];
        $po_date = $_POST['po_date'];
        $status_po = 'waiting';
        $paid = $_POST['paid'];
        $tax = $_POST['tax'];
        $name_emp = $_POST['name_emp'];
        $city_emp = $_POST['city_emp'];
        $address_emp = $_POST['address_emp'];
        $phone_emp = $_POST['phone_emp'];
        $head_division = $_POST['head_division'];
        $city_head = $_POST['city_head'];
        $head_address = $_POST['head_address'];
        $head_phone = $_POST['head_phone'];
        $terms = $_POST['terms'];
        $comment = $_POST['comment'];
        $requestor_po = $_SESSION['user'];

        $query = mysqli_query($conn, "INSERT INTO form_po VALUES (
            null,
            '$kode_po',
            '$kode_pr',
            '$supplier_name',
            '$supplier_code',
            '$po_date',
            '$status_po',       
            '$tax',       
            '$paid',       
            '$name_emp',       
            '$city_emp',       
            '$address_emp',       
            '$phone_emp',       
            '$head_division',       
            '$city_head',       
            '$head_address',       
            '$head_phone',    
            '$terms',    
            '$comment',
            '$requestor_po'
            )") or die (mysqli_error($conn));
            
            // logik perulangan data cost item dari pr
            if ($query){
                
                for ($i=1; $i<=$count; $i++){
                    $unit_cost = $_POST['unit_cost-'.$i];
                    $item_description = $_POST['item_description-'.$i];
                    $spesifikasi = $_POST['spesifikasi-'.$i];
                    $quantity = $_POST['quantity-'.$i];
                    $part_number = $_POST['part_number-'.$i];
                    
                    $convertPrice = (int)str_replace('.','', $unit_cost);
                    $total = $convertPrice * $quantity;

                    $update = mysqli_query($conn, "INSERT INTO unit_cost VALUES (
                        null,
                        '$code',
                        '$kode_pr',
                        '$item_description',
                        '$unit_cost',       
                        '$spesifikasi',       
                        '$quantity',       
                        '$total',
                        '$part_number'     
                        )") or die (mysqli_error($conn));
            
                }
                $update = mysqli_query($conn, "UPDATE form_pr SET update_po = '1' WHERE kode_pr = $id");
                $send = true;
            }else{
                echo "Failed";
            }
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

    <!-- Js membuat format rupiah -->
    <script type="text/javascript" src="js/masknumber.js"></script>

    <!--  CDN SWAL-->
    <script src="../swal2/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="../swal2/dist/sweetalert2.min.css">

    <!-- simditor File Js -->
    <link rel="stylesheet" type="text/css" href="../simditor-2.3.28/styles/simditor.css" />

    <!-- <script type="text/javascript" src="../simditor-2.3.28/site/assets/scripts/jquery.min.js"></script> -->
    <script type="text/javascript" src="../simditor-2.3.28/site/assets/scripts/module.js"></script>
    <script type="text/javascript" src="../simditor-2.3.28/site/assets/scripts/hotkeys.js"></script>
    <script type="text/javascript" src="../simditor-2.3.28/site/assets/scripts/simditor.js"></script>

    <title>Dashboard Inventory</title>
</head>

<body>
    <div class="grid">
        <!-- start navigasi -->
        <nav class="nav flex-column navbar-expand-lg bg-dark">
            <a class="brand" href="#">Inventory.</a>
            <hr>
            <div class="nav-item">
                <a class="nav-link" href="dashboard-admin"><i class="fas fa-database"></i>Data Site</a>
                <a class="nav-link" href="dashboard-user-list"><i class="fas fa-users"></i>User List</a>
                <a class="nav-link active" href="#"><i class="fas fa-list"></i>Select PR</a>
                <a class="nav-link" href="history-wd"><i class="fas fa-edit"></i>With Draw Item</a>
                <a class="nav-link" href="mtl"><i class="fas fa-copy"></i>Material Issues</a>
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
                            <a class="dropdown-item" href="../logout"><i class="fas fa-sign-out-alt"></i>Log Out</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="box">
                <div class="content">
                    <div class="pr-form d-flex justify-content-between kepala">
                        <h5 class="mb-4">Purchase Request Info</h5>
                        <a href="history-pr"><i class="fas fa-undo-alt mr-2"></i>Back to PR</a>
                    </div>
                    <section>
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <td colspan="2" style="overflow-x: hidden;">
                                    <div class="row">
                                        <div class="col-md-4">
                                            PR Code
                                            <?php $code = sprintf("%05s", $hasil['kode_pr']) ?>
                                            <p
                                                class="form-control d-flex justify-content-between align-items-center list-group-item-secondary">
                                                <?= "PR-".$code; ?><i class="fas fa-barcode mr-2"></i></p>
                                            <?php $date = date_create($hasil['pr_date']); ?>
                                        </div>
                                        <div class="col-md-4">
                                            PR Date
                                            <p
                                                class="form-control d-flex justify-content-between align-items-center list-group-item-secondary">
                                                <?= date_format($date, 'j F Y'); ?><i
                                                    class="far fa-calendar-alt mr-2"></i></p>
                                        </div>
                                        <div class="col-md-4 ">
                                            <form method="post">
                                                Status
                                                <select class="form-control status mb-3" name="status" id="status">
                                                    <option disabled selected><?= $hasil['status']; ?>
                                                    </option>
                                                    <option value="approve">Approve</option>
                                                    <option value="rejected">Reject</option>
                                                </select>
                                                <div class="d-flex flex-row-reverse flex-column">
                                                    <button class="btn btn-sm btn-info" name="tombol"><i
                                                            class="far fa-hand-pointer text-white p-1"></i></button>
                                                </div>
                                            </form>
                                        </div>

                                        <div class="col-md-12 detail-pr-mobile">
                                            <div class="row d-flex ">
                                                <div class="col-md-6 d-flex flex-column">
                                                    <hr>
                                                    <strong>-- ITEM --</strong>
                                                    <hr>
                                                    <b>[Item Description]</b>
                                                    <?php foreach($sql as $data) :?>
                                                    <p><?= $data['item_description']; ?></p>
                                                    <?php endforeach; ?>
                                                    <b>[Type]</b>
                                                    <?php foreach($sql as $data) :?>
                                                    <p><?= $data['type']; ?></p>
                                                    <?php endforeach; ?>
                                                    <b>[Quantity]</b>
                                                    <?php foreach($sql as $data) :?>
                                                    <p><?= $data['quantity']; ?></p>
                                                    <?php endforeach; ?>
                                                    <hr>
                                                </div>
                                                <di class="col-md-6">
                                                    <strong>-- NUMBERING --</strong>
                                                    <hr>
                                                    <b>[Part Number]</b>
                                                    <?php foreach($sql as $data) :?>
                                                    <p><?= $data['part_number'];  ?></p>
                                                    <?php endforeach; ?>
                                                    <b>[Cost Center]</b>
                                                    <?php foreach($sql as $data) :?>
                                                    <p><?= $data['cost_center']; ?></p>
                                                    <?php endforeach; ?>
                                                    <hr>
                                                </di>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12 d-flex flex-column">
                                                    <strong>-- ORDER --</strong>
                                                    <hr>
                                                    <b>[Account Code]</b>
                                                    <?php foreach($sql as $data) :?>
                                                    <p><?= $data['account_code']; ?></p>
                                                    <?php endforeach; ?>
                                                    <hr>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <table id="invoice-item-table" class="table table-bordered detail-tabel detail-pr">
                                        <tr>
                                            <th colspan="3">ITEM</th>
                                            <th colspan="2" class="">NUMBERING</th>
                                            <th colspan="2">ORDER</th>
                                        </tr>
                                        <tr class="row2">
                                            <th>Item Description</th>
                                            <th>Type</th>
                                            <th width="20">Quantity</th>
                                            <th>Part Number</th>
                                            <th width="20">Cost Center</th>
                                            <th>Account Code</th>
                                            <th>Specification</th>
                                        </tr>

                                        <?php foreach($sql as $data) :?>
                                        <tr class="addForm">
                                            <td><textarea id="item_description " rows="2" class="form-control" disabled
                                                    style="height: auto;"> <?= $data['item_description']; ?></textarea>
                                            </td>
                                            <td><textarea id="type" rows="2" class="form-control"
                                                    disabled><?= $data['type']; ?></textarea>
                                            </td>
                                            <td><textarea id="par_number" rows="2" class="form-control" disabled
                                                    style="text-align: center;"><?= $data['quantity']; ?></textarea>
                                            </td>
                                            <td><textarea id="par_number" rows="2" class="form-control"
                                                    disabled><?= $data['part_number']; ?></textarea>
                                            </td>
                                            <td>
                                                <textarea id="account-code" rows="2" class="form-control" disabled
                                                    style="text-align: center;"> <?= $data['cost_center']; ?></textarea>
                                            </td>
                                            <td><textarea id="account-code" rows="2" class="form-control"
                                                    disabled><?= $data['account_code']; ?></textarea>
                                            </td>
                                            <td><textarea id="account-code" rows="2" class="form-control"
                                                    disabled><?= $data['spesifikasi']; ?></textarea>
                                            </td>
                                        </tr>
                                        <?php endforeach; ?>

                                    </table>
                                    <div class="row d-flex justify-content-between">
                                        <!-- <div class="col-md">
                                            <a href="#">
                                                <i class="far fa-file-pdf mr-2"></i>Download PR.pdf</a>
                                        </div> -->
                                        <div class="col-md">
                                            <p class="d-flex flex-row-reverse">
                                                <?php if($data['status'] == 'approve') :?>
                                                <button class="btn btn-sm btn-info" type="button" data-toggle="collapse"
                                                    data-target="#collapseExample" aria-expanded="false"
                                                    aria-controls="collapseExample">
                                                    Update P.O <i class="fas fa-sort-down ml-2 text-white"></i>
                                                </button>
                                                <?php else :?>
                                                <button class="btn btn-sm btn-secondary disabled" type="button"
                                                    data-toggle="collapse" data-target="#collapseExample"
                                                    aria-expanded="false" aria-controls="collapseExample" disabled>
                                                    Update P.O
                                                </button>
                                                <?php endif; ?>
                                            </p>
                                        </div>
                                    </div>
                                </td>
                            </table>
                    </section>

                    <section>
                        <div class="collapse" id="collapseExample">

                            <section>
                                <div class="table-responsive">
                                    <form method="POST">
                                        <table class="table table-bordered">
                                            <td colspan="2" style="overflow-x: hidden;">
                                                <div
                                                    class="title mb-4 text-uppercase bg-light d-flex justify-content-center align-items-center">
                                                    <h5 class="font-weight-bold text-secondary p-2">Input Purchase Order
                                                    </h5>
                                                </div>
                                                <div class="data-entry">

                                                    <input required type="text" class="form-control  disabled"
                                                        id="on-po#" name="po_code" value="PO-<?= $kodeOtomatis; ?>"
                                                        disabled>
                                                    <small class="text-info">*code is generated automatically</small>


                                                    <input type="date" name="po_date" id="pr_date"
                                                        class="form-control input-sm mb-2" placeholder="Select PR Date"
                                                        required />

                                                    <div class="row mb-4 mt-2">
                                                        <div class="col-md-6">
                                                            <label>Supplier Name</label>
                                                            <input type="text" class="form-control" required
                                                                placeholder="Supplier Name" name="supplier_name">
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label>Supplier Code</label>
                                                            <input type="text" class="form-control" required
                                                                placeholder="Supplier Code" name="supplier_code">
                                                        </div>
                                                    </div>


                                                    <div class="row mb-4 mt-2">
                                                        <div class="col-md-3">
                                                            <label>Tax</label>
                                                            <div class="input-group input price">
                                                                <input type="tel" name="tax" maxlength="4"
                                                                    class="form-control text-end"
                                                                    placeholder="decimal (10.0/1.5)">
                                                                <div class="input-group-prepend">
                                                                    <span class="input-group-text text-muted"
                                                                        id="basic-addon1">%</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-3">
                                                            <label>Terms</label>
                                                            <div class="input-group input price">
                                                                <input type="tel" name="terms"
                                                                    maxlength="2" class="form-control text-end"
                                                                    placeholder="N/30">
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <label>Freight Paid</label>
                                                            <div class="input-group input price">
                                                                <div class="input-group-prepend">
                                                                    <span class="input-group-text text-muted"
                                                                        id="basic-addon1">Rp</span>
                                                                </div>

                                                                <input type="tel" name="paid" class="form-control"
                                                                    required placeholder="Price of Tax" id="number" required>
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

                                                    <table id="invoice-item-table" class="table table-bordered cost">
                                                        <tr>
                                                            <th width="2%">No</th>
                                                            <th width="68%">Item Description</th>
                                                            <th width="40%">Unit Price</th>
                                                        </tr>
                                                        <?php $i=1; ?>
                                                        <?php foreach($sql as $data) :?>
                                                        <tr class="addForm">
                                                            <td><?= $i; ?></td>
                                                            <td><textarea id="item_description " rows="2"
                                                                    class="form-control bg-light"
                                                                    name="item_description-<?= $i; ?>"
                                                                    style="height: auto;"><?= $data['item_description']; ?></textarea>
                                                            </td>
                                                            <input type="text" class="d-none"
                                                                value="<?= $data['spesifikasi']; ?>"
                                                                name="spesifikasi-<?= $i; ?>">
                                                            <input type="text" class="d-none"
                                                                value="<?= $data['quantity']; ?>"
                                                                name="quantity-<?= $i; ?>">
                                                            <input type="text" class="d-none"
                                                                value="<?= $data['part_number']; ?>"
                                                                name="part_number-<?= $i; ?>">
                                                            <td>
                                                                <div class="input-group input price">
                                                                    <div class="input-group-prepend">
                                                                        <span class="input-group-text text-muted"
                                                                            id="basic-addon1">Rp</span>
                                                                    </div>
                                                                    <input type="tel" name="unit_cost-<?= $i; ?>"
                                                                        class="form-control" placeholder="x.000.000"
                                                                        id="angka-<?= $i; ?>" required>
                                                                </div>
                                                                <script>
                                                                    $(document).ready(function () {
                                                                        $("#angka-<?= $i; ?>").keyup(
                                                                    function () {
                                                                            $(this).maskNumber({
                                                                                integer: true,
                                                                                thousands: "."
                                                                            })
                                                                        })
                                                                    })
                                                                </script>
                                                            </td>
                                                        </tr>
                                                        <?php $i++; ?>
                                                        <?php endforeach; ?>
                                                    </table>
                                                    <div class="row mb-4 p-1 m-1 d-flex justify-content-between">
                                                        <div class="col-md-5 bg-light rounded">
                                                            <h5 class="text-center bg-info p-1"
                                                                style="font-size: small;">
                                                                <strong><i
                                                                        class="fas fa-warehouse mr-2"></i>VENDOR</strong>
                                                            </h5>
                                                            <div class="form-group mt-2">
                                                                <label>Employee of vendor</label>
                                                                <input type="text" class="form-control" required
                                                                    placeholder="Name of Employee" name="name_emp">
                                                            </div>
                                                            <label>City</label>
                                                            <input type="text" class="form-control" required
                                                                placeholder="Address of Vendor (Batam)" name="city_emp">
                                                            <div class="form-group mt-2">
                                                                <label>Address</label>
                                                                <textarea type="text" class="form-control" required
                                                                    placeholder="City of Vendor"
                                                                    name="address_emp"></textarea>
                                                            </div>
                                                            <label>Phone Number</label>
                                                            <input type="number" class="form-control mb-2"
                                                                placeholder="Phone of Vendor" name="phone_emp">

                                                        </div>
                                                        <div class="col-md-5 bg-light top-ship rounded">
                                                            <h5 class="text-center bg-warning p-1"
                                                                style="font-size: small;"><strong><i
                                                                        class="fas fa-truck-moving mr-2"></i>SHIP
                                                                    TO</strong></h5>
                                                            <div class="form-group mt-2">
                                                                <label>Head Of Division</label>
                                                                <input type="text" value="Muhammad Arifin, S.Si., M.Si"
                                                                    class="form-control" required name="head_division">
                                                            </div>
                                                            <label>City</label>
                                                            <input type="text" class="form-control" required
                                                                value="Batam" name="city_head">
                                                            <div class="form-group mt-2">
                                                                <label>Address</label>
                                                                <textarea type="text" class="form-control" required
                                                                    name="head_address">Jl. Ahmad Yani, Batam Kota (Gedung TFME Politeknik Negeri Batam)</textarea>
                                                            </div>
                                                            <label>Phone Number</label>
                                                            <input type="text" class="form-control mb-2"
                                                                name="head_phone" value="08194114001">
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12 form-control mt-4 bg-light editor-web">
                                                        <label>- Comment -</label>
                                                        <textarea id="editor" rows="5" cols="6" class="form-control"
                                                            name="comment" style="font-size: 13px;"></textarea>
                                                        <small class="text-info">*fill it if needed</small>
                                                    </div>

                                                    <script>
                                                        Simditor.locale = 'en-US';
                                                        var editor = new Simditor({
                                                            textarea: $('#editor'),
                                                            toolbar: ['bold', 'italic', 'underline',
                                                                'strikethrough', 'color', '|', 'ol', 'ul',
                                                                '|', 'link', 'hr', '|', 'alignment'
                                                            ],
                                                        });
                                                    </script>
                                            </td>
                                        </table>

                                        <div class="d-flex justify-content-end entry">
                                            <button type="submit" name="send" class="btn bg-dark text-white btn-sm"><i class="fas fa-file-invoice-dollar mr-2 text-white"></i>Release
                                                PO</button>
                                        </div>
                                    </form>
                                </div>
                            </section>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>








    <?php if(isset($berhasil)) :  ?>
    <script>
        swal.fire({
            title: "Succes",
            text: "Updated <?= $data['status']; ?>",
            icon: "success",
            showCancelButton: false,
            showConfirmButton: false,
            timer: 1000
        }).then(function () {
            window.location = "history-pr";
        });
    </script>
    <?php endif; ?>

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
            window.top.location = "history-po"
        }, 2000);
    </script>
    <?php endif; ?>
</body>

</html>