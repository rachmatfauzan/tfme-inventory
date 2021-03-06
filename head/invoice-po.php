<?php 

session_start();
include "../config/config.php";


if(!isset($_SESSION['head'])){
    header("location: ../index");
}


// ambil Id
$id = $_GET['id'];

// form_po data
$sql = mysqli_query($conn, "SELECT * FROM form_po WHERE kode_po = '$id'");

$hasil = mysqli_fetch_assoc($sql);
$kode_pr = $hasil['kode_pr'];

// unit_price data
$unit_price = mysqli_query($conn, "SELECT * FROM unit_cost WHERE id_po = $id");

$fetch = mysqli_fetch_array($unit_price);



// join data
$join = mysqli_query($conn, "SELECT po.po_date, po.kode_po, pr.item_description, pr.cost_center, pr.part_number, pr.quantity,pr.spesifikasi, pr.requestor
        FROM form_po AS po JOIN form_pr AS pr ON po.kode_pr=pr.kode_pr WHERE kode_po = '$id'") or die(mysqli_error($conn));

        $dt = mysqli_fetch_array($join);
        $total = mysqli_num_rows($join);
        $code_po = "PO". sprintf("%05s", $dt['kode_po']);

// update status PO 
if(isset($_POST['update'])){
    $status = $_POST['status'];

    if ($status == "approve"){
    

        for ($i=1; $i<=$total; $i++){
            $uom = $_POST['spesifikasi-'.$i];
            $description = $_POST['item_description-'.$i];
            $requestor = $_POST['requestor'];
            $part_number = $_POST['part_number-'.$i];
            $qty = $_POST['quantity-'.$i]; 
            $cc = $_POST['cost_center-'.$i]; 
            $code_po = $_POST['code_po-'.$i]; 
            $po_date = $_POST['po_date-'.$i]; 


            $mtl = mysqli_query($conn, "INSERT INTO mtl VALUES (null, '$po_date', '$code_po', '$description', '$cc', '$part_number', '-', '$qty', '-', '$uom', '-', '$requestor', ' ')") or die(mysqli_error($conn));

        }
        if ($mtl){
            $query = mysqli_query($conn, "UPDATE form_po SET status_po = '$status' WHERE kode_po = '$id' ");

            if($query){
                $send = true;
            }
        }

        

    }
    else{
        $query = mysqli_query($conn, "UPDATE form_po SET status_po = '$status' WHERE kode_po = '$id' ");
        $formPr = mysqli_query($conn, "UPDATE form_pr SET status = '$status', hod_status = '1' WHERE kode_pr = '$kode_pr' ");

            if($query){
                $send = true;
            }
    }
    
}


$kode_pr = $hasil['kode_pr'];
$detail_pr = mysqli_query($conn,"SELECT * FROM form_pr WHERE kode_pr = '$kode_pr'");


// ++++ logik convert $cost untuk menghilangkan tanda(.) ++++

// $harga = $fetch['unit_cost'];
// $convertPrice = (int)str_replace('.','', $harga);

// $qty = (int)$fetch['quantity'];
// $total = $convertPrice * $qty;


// $cost = $hasil['cost'];
// $convert = (int)str_replace('.','', $cost);

// // $total = $convert + 1000000;

// var_dump($total);

// Logik membuat format rupiah 
function angka($angka){
    $hasilRupiah = " Rp " . number_format($angka,2,',','.');
    return $hasilRupiah;
};




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
    <link rel="stylesheet" href="../teknisi/css/dashboard-tech.css">
    <link rel="stylesheet" href="../teknisi/css/profile-tech.css">

    <!-- Link CDN font-awesome  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

    <!-- Link Font Style Montserrat -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;900&display=swap" rel="stylesheet">

    <!-- link script datatable -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>

    <!--  CDN SWAL-->
    <script src="../swal2/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="../swal2/dist/sweetalert2.min.css">

    <!-- Bootstrap Js -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
    <link rel="icon" href="../image/TFME.jpg">
    <title>TFME Detail PO</title>
</head>

<body>
    <div class="grid">

        <!-- start header -->
        <div class="invoice-po">
            <div class="navbar justify-content-between bg-dark text-white">
                <div class="profile">
                    <div class="wrapper-image">
                        <img src="../image/HOD.png" alt="">
                    </div>
                    <div class="profile-name">
                        <h5 style="text-transform:capitalize;"><?= $_SESSION['user']; ?></h5>
                        <p>Head of Division</p>
                    </div>
                    <div class="dropdown">
                        <button class="btn dropdown-toggle text-white" type="button" id="dropdownMenuButton"
                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="../logout"><i class="fas fa-sign-out-alt"></i>Log Out</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="d-flex head justify-content-between">
                <div class="box col-md-8">
                    <div class="data-entry">
                        <h5 class="tron font-weight-bold text-secondary text-center">Detail P.O</h5>
                        <div
                            class="title mb-4 text-uppercase d-flex justify-content-center flex-column align-items-center">
                            <a href="dashboard-hd" style="font-size: 11px;"
                                class="btn tron btn-light btn-sm border-0 mb-2"><i
                                    class="fas fa-backspace mr-2"></i>history p.o</a>
                        </div>
                        <div class="form-group">
                            <form method="post">
                                <div class="table-responsive-sm">
                                    <table class="table table-bordered">
                                        <tr>
                                            <td colspan="2" style="overflow-x: hidden;">
                                                <div class="row">
                                                    <div class="col-md-7">
                                                        <img src="../image/poltek.png" alt="logo poltek"> <br>
                                                    </div>
                                                    <div class="col-md-5 mt-3">
                                                        <h2 class="text-secondary font-weight-bold">PURCHASE ORDER</h2>
                                                        PO Code<br />
                                                        <?php $code = sprintf("%05s", $hasil['kode_po']) ?>
                                                        <p
                                                            class="form-control d-flex justify-content-between align-items-center list-group-item-secondary">
                                                            <?= "PO-".$code; ?><i class="fas fa-barcode mr-2"></i></p>
                                                        <?php $date = date_create($hasil['po_date']); ?>
                                                        PO Date<br />
                                                        <p
                                                            class="form-control d-flex justify-content-between align-items-center list-group-item-secondary">
                                                            <?= date_format($date, 'j F Y'); ?><i
                                                                class="far fa-calendar-alt mr-2"></i></p>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-7">
                                                        <b class="bg-secondary p-1 ">VENDOR</b><br />
                                                        <div class="detailVendor mt-2" style="font-size: 14px;">
                                                            <p class="text-capitalize">
                                                                <?= $hasil['supplier_name']; ?> <br>
                                                                <?= $hasil['name_emp']; ?> <br>
                                                                <?= $hasil['address_emp']; ?> <br>
                                                                Kota <?= $hasil['city_emp']; ?> <br>
                                                                <?= wordwrap($hasil['phone_emp'],4,'-', TRUE); ?>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-5">
                                                        <b class="bg-secondary p-1">SHIP TO</b><br />
                                                        <div class="detailVendor mt-2" style="font-size: 14px;">
                                                            <p style="text-transform:capitalization;">Politeknik Negeri
                                                                Batam <br>
                                                                <?= $hasil['head_division']; ?> <br>
                                                                <?= $hasil['head_address']; ?><br>
                                                                Kota <?= $hasil['city_head']; ?> <br>
                                                                <?= wordwrap($hasil['head_phone'], 4 ,'-', TRUE); ?><br>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                                <table class="table table-bordered mb-5 table-sm text-center">
                                                    <tr class="bg-secondary">
                                                        <th>FOB</th>
                                                        <th>TERMS</th>
                                                    </tr>
                                                    <tr>
                                                        <td>DESTINATION</td>
                                                        <td><?= $hasil['terms']; ?>/30</td>
                                                    </tr>
                                                </table>
                                                <table id="invoice-item-table"
                                                    class="table table-bordered table-sm height"
                                                    style="border-collapse: collapse;">
                                                    <tr class="bg-secondary">
                                                        <th width="2%">No</th>
                                                        <th width="30%">Item Description</th>
                                                        <th width="10%">Specification</th>
                                                        <th width="3%">Quantity</th>
                                                        <th>Unit Price</th>
                                                        <th>Total</th>
                                                    </tr>
                                                    <?php $total=0; ?>
                                                    <?php $i=1; ?>
                                                    <?php foreach($unit_price as $dt) :?>
                                                    <tr class="addForm">
                                                        <td class="text-center"><?= $i; ?></td>
                                                        <td><?= $dt['describ']; ?>
                                                        </td>
                                                        <td style="text-transform:uppercase;"><?= $dt['spesifikasi']; ?>
                                                        </td>
                                                        <td class="text-center"><?= $dt['quantity']; ?>
                                                        </td>
                                                        <td>
                                                            <?php 
                                                            $uP = $dt['unit_cost'];
                                                            $convertPrice = (int)str_replace('.','', $uP);
                                                        ?>
                                                            <?= angka($convertPrice); ?>
                                                        </td>
                                                        <td><?= angka($dt['total']); ?>
                                                        </td>
                                                        <?php $total += $dt['total']; ?>
                                                    </tr>
                                                    <?php $i++; ?>
                                                    <?php endforeach; ?>
                                                    <tr class="bg-light">
                                                        <td colspan="4" class="bg-white"></td>
                                                        <td>Total</td>
                                                        <td class="bg-white">- <?= angka($total) ?> -</td>
                                                    </tr>
                                                    <tr class="bg-light">
                                                        <td colspan="4" class="bg-white"></td>
                                                        <?php $tax = $hasil['tax'];
                                                        $total_item=(float)$total;
                                                        $div = ($tax/100) * $total_item;
                                                        $convertTax = str_replace('.',',', $tax);
                                                        ?>
                                                        <td>Tax <?= $convertTax; ?>%</td>
                                                        <td class="bg-white">- <?= angka($div) ?> -</td>
                                                    </tr>
                                                    <tr class="bg-light">
                                                        <td colspan="4" class="bg-white"></td>
                                                        <?php $paid = $hasil['paid'];
                                                        $convertPaid = (int)str_replace('.','', $paid);
                                                        ?>
                                                        <td>Freight Paid</td>
                                                        <td class="bg-white">- <?= angka($convertPaid) ?> -</td>
                                                    </tr>
                                                    <tr class="bg-light">
                                                        <td colspan="4" class="bg-white"></td>
                                                        <?php 
                                                        $sub_total = $total+(int)$div+$convertPaid;
                                                    ?>
                                                        <td><strong>Sub Total</strong></td>
                                                        <td><?= angka($sub_total) ?></td>
                                                    </tr>
                                                </table>
                                                <div class="row comment">
                                                    <div class="col-md-12">
                                                        <label class="font-weight-bold">COMMENT / SYARAT DAN KETENTUAN
                                                            :</label>
                                                        <p><?= $hasil['comment']; ?></p>
                                                    </div>
                                                </div>
                                                <div class="row" style="margin-top: 1em;">
                                                    <div class="col">
                                                        <div class="detailVendor" style="width:300px; font-size:14px;">
                                                            <p>Batam, <?= date_format($date, 'j F Y'); ?><br>
                                                                <b>Politeknik Negeri Batam</b> <br> <br> <br> <br> <br>
                                                                <br>
                                                                <b><u><?= $hasil['head_division']; ?></u></b> <br>
                                                                Penanggung Jawab Teknis <br>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="col" style="width: 300px;">
                                                        <div class="detailVendor mr-4 d-flex justify-content-end"
                                                            style="font-size:14px;">
                                                            <p class="text-capitalize">Menerima dan menyetujui : <br>
                                                                <b><?= $hasil['supplier_name']; ?></b> <br> <br> <br>
                                                                <br>
                                                                <br> <br>
                                                                <!-- <input type="file"> <br> -->
                                                                <b><u><?= $hasil['name_emp']; ?></u></b> <br>
                                                                Penyedia Barang<br>
                                                            </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </form>
                        </div>
                        </form>
                    </div>
                </div>
                <div class="box col-md-3 head" style="height: fit-content;">
                    <div class="d-flex justify-content-center align-items-center flex-column">
                        <img src="../image/TFME.jpg" class="rounded" width="40%">
                        <small class="text-capitalize m-2">Printed By: <?= $_SESSION['user']; ?></small>
                        <small class="mt-2 bg-dark w-100 text-white text-center">Change Status PO :</small>
                        <form method="POST" class="w-100">
                            <div class="input-group input-group-sm mt-1">

                                <?php if ($hasil['status_po'] == "approve" OR $hasil['status_po'] == "rejected") :?>
                                <div class="input-group-prepend">
                                    <button class="btn btn-sm btn-outline-secondary text-dark" type="submit"
                                        name="update" disabled>Update</button>
                                </div>
                                    <p class="<?= $status = ($hasil['status_po'] == 'approve') ? 'bg-success text-white' : 'bg-danger text-white' ;?> form-control">Data has been updated ( <?= $hasil['status_po']; ?> )</p>
                                <?php else : ?>
                                <div class="input-group-prepend">
                                    <button class="btn btn-sm btn-outline-secondary text-dark" type="submit"
                                        name="update">Update</button>
                                </div>
                                <select class="custom-select custom-select-sm" id="inputGroupSelect03" name="status">
                                    <option selected><?= $hasil['status_po']; ?></option>
                                    <option value="approve">Approve</option>
                                    <option value="rejected">Reject</option>
                                </select>
                                <?php endif; ?>
                            </div>
                            <section class="d-none">
                                <?php $i=1; ?>
                                <?php foreach($join as $fil ) :?>
                                <p class=""><?= $i; ?></p>
                                <input class="" type="text" value="<?= $fil['item_description']?>"
                                    name="item_description-<?= $i;?>">
                                <input class="" type="text" value="<?= $fil['po_date']?>" name="po_date-<?= $i;?>">
                                <input class="" type="text" value="<?= $code_po?>" name="code_po-<?= $i;?>">
                                <input class="" type="text" value="<?= $fil['cost_center']?>"
                                    name="cost_center-<?= $i;?>">
                                <input class="" type="text" value="<?= $fil['part_number']?>"
                                    name="part_number-<?= $i;?>">
                                <input class="" type="text" value="<?= $fil['quantity']?> " name="quantity-<?= $i;?>">
                                <input class="" type="text" value="<?= $fil['spesifikasi']?>"
                                    name="spesifikasi-<?= $i;?>">
                                <input class="" type="text" value="<?= $fil['requestor']?>" name="requestor">
                                <?php $i++; ?>
                                <?php endforeach; ?>
                            </section>

                        </form>
                    </div>
                </div>
            </div>






            <!-- SWAL action -->
            <?php if(isset($send)) :  ?>
            <script>
                swal.fire({
                    title: "PO Updated",
                    text: "Your change will be send to Admin",
                    icon: "success",
                    showCancelButton: false,
                    showConfirmButton: false
                });
                setTimeout(function () {
                    window.top.location = "dashboard-hd"
                }, 2700);
            </script>
            <?php endif; ?>
</body>

</html>