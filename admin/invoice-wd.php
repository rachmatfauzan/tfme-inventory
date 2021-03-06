<?php 
session_start();

require "../config/config.php";

if(!isset($_SESSION['admin'])){
    header("location: ../index");
}

$dt_inventory = mysqli_query($conn, "SELECT * FROM dt_inventory");

$id = $_GET['id'];
$query = mysqli_query($conn, "SELECT * FROM form_wd WHERE kode_wd = '$id'");
$fetch = mysqli_fetch_assoc($query);
$rows = mysqli_num_rows($query);

$join = mysqli_query($conn, "SELECT fwd.nip_req, fwd.part_number,fwd.purpose,fwd.qty,fwd.uom,fwd.requestor,
        dt.description,dt.cc, dt.on_hand  
            FROM form_wd AS fwd JOIN dt_inventory AS dt ON fwd.part_number=dt.part_number WHERE kode_wd = '$id'");
$tangkap = mysqli_fetch_assoc($join);
$rowsTangkap = mysqli_num_rows($join);
if (isset($_POST['tombol'])) {

    $status = $_POST['status'];
    $comment = $_POST['comment'];

    
    if ($status == "approve"){
        $total = $_POST['total'] - 1;
        // echo "berhasil";
        for ($i=1; $i<= $total; $i++){
            $nip = $fetch['nip_req'];
            $date = $fetch['tanggal'];
            $no_bukti = $fetch['no_bukti'];
            $cc = $_POST['cc-'.$i];
            $in_volume = "-";
            $giver = $fetch['receiver'];
            $requestor = $fetch['requestor'];
            $uom = $_POST['uom-'.$i];
            $purpose = $_POST['purpose-'.$i];
            $description = $_POST['description-'.$i];
            $on_hand = (int) $_POST['on_hand-'.$i];
            $part_number = $_POST['part_number-'.$i];
            $qty = (int) $_POST['qty-'.$i];

            $crease = $on_hand - $qty;



            // $query  = mysqli_query($conn, "INSERT INTO wd VALUES ('', '$qty', '$part_number')");
            $query = mysqli_query($conn, "UPDATE dt_inventory SET 
                on_hand = $crease
                WHERE part_number = '$part_number'
            ");
            
            $mtl = mysqli_query($conn, "INSERT INTO mtl VALUES (null, '$date', '$no_bukti', '$description', '$cc', '$part_number', '$purpose', '$in_volume', '$qty', '$uom', '$giver', '$requestor', '$nip')") or die(mysqli_error($conn));

            
        }
        if($query){
            $update = mysqli_query($conn, "UPDATE form_wd SET 
                status ='$status',
                comment = '$comment' WHERE kode_wd = '$id'");


              $send = true;
              $_SESSION['email'] = $fetch['no_bukti'];
              $_SESSION['nip'] = $fetch['nip_req'];
        }else{
            echo "gagal";
        }
    } else{
        $update = mysqli_query($conn, "UPDATE form_wd SET 
                status ='$status',
                comment = '$comment' WHERE kode_wd = '$id'");

        if ($update){
           $send =true;
           $_SESSION['email'] = $fetch['no_bukti'];
           $_SESSION['nip'] = $fetch['nip_req'];
        }
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
    <link rel="stylesheet" href="../teknisi/css/profile-tech.css">


    <!-- Link CDN font-awesome  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">

    <!-- Link Font Style Montserrat -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700;900&display=swap" rel="stylesheet">

    <!-- link script datatable -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.22/js/dataTables.bootstrap4.min.js"></script>

    <!-- Bootstrap Ordered Datatables  -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.22/css/dataTables.bootstrap4.min.css">
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
    <div class="grid">
        <!-- start navigasi -->
        <nav class="nav flex-column navbar-expand-lg bg-dark">
            <a class="brand" href="#">Inventory.</a>
            <hr>
            <div class="nav-item">
                <a class="nav-link" href="dashboard-admin"><i class="fas fa-database"></i>Data Site</a>
                <a class="nav-link" href="dashboard-user-list"><i class="fas fa-users"></i>User List</a>
                <a class="nav-link" href="history-pr"><i class="fas fa-list"></i>Select PR</a>
                <a class="nav-link active" href="#"><i class="fas fa-edit"></i>With Draw Item</a>
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
            <div class="box" style="position:relative;font-family:'Times New Roman', Times, serif;">
                <div class="content">
                    <div class="row">
                        <a href="history-wd" class="btn text-danger container"><i
                                class="fas fa-long-arrow-alt-left"></i> Back</a>
                    </div>
                    <header style="transform: scale(0.9);">
                        <div class="row" style=" border-bottom:double;">
                            <div class="col-3 title">
                                <img src="../image/poltek.png" style="width: 200px; height:150px;">
                            </div>
                            <div class="col-lg-6 text-center">
                                <label>
                                    <p>POLITEKNIK NEGERI BATAM</p>
                                    <h5><strong>TEACHING FACTORY MANUFACTURING OF ELECTRONICS</strong></h5>
                                    <p class="m-0">Jalan Ahmad Yani, Batam Centre, Kecamatan Batam Kota, Batam 29461</p>
                                    <p class="m-0">Telepon +62 778 469856 - 469860 Faksimile +62 778 463620</p>
                                    <p class="m-0">Laman: www.tfme.polibatam.ac.id/inventory Surel:
                                        tfmeminteractive@gmail.com</p>
                                </label>
                            </div>
                            <div class="col-3 d-flex justify-content-end title">
                                <img src="../image/black-tfme.png" style="width: 250px; height:150px;">
                            </div>
                        </div>
                    </header>
                    <section>
                        <div class="row mt-2">
                            <h5 class="text-center w-100"><b>BUKTI PENGELUARAN INVENTORY</b></h5>
                        </div>
                        <div class="row">
                            <div class="col-8">
                                <div class="indent ml-5">
                                    <label style="width:150px;"><b>Ditujukan Kepada</b></label>
                                    <label class="text-capitalize">: <?= $fetch['requestor']; ?></label>
                                    <br>
                                    <label style="width:150px;"><b>NIP</b></label>
                                    <label>: <?= $fetch['nip_req'] ?></label>
                                </div>
                            </div>
                            <div class="col-4">
                                <div class="indent ">
                                    <label style="width:150px;" class="text-left"><b>No. Bukti</b></label>
                                    <label>: <?= $fetch['no_bukti']; ?></label>
                                    <br>
                                    <label style="width:150px;" class="text-left"><b>Tanggal</b></label>
                                    <label>: <?php $date = date_create($fetch['tanggal']); ?>
                                        <?= date_format($date, 'j F Y'); ?></label>
                                </div>
                            </div>
                        </div>
                    </section>
                    <?php if ($fetch['status'] == "approve" OR $fetch['status'] == 'rejected') : ?>
                    <div class="row w-100 flex-column">
                        <span
                            class="badge <?= $status = ($fetch['status'] == 'approve') ? 'badge-success' : 'badge-danger' ;?> p-1"
                            style="opacity: 0.6;">( <?= $fetch['status']; ?>
                            )</span>
                        <p class="text-center">" You had been updated this data "</p>
                    </div>
                    <?php else : ?>
                    <div class="row">
                        <div class="status text-center w-100">
                            <a class="mt-2 btn btn-sm bg-light rounded-0 p-1" data-toggle="modal"
                                data-target="#search"><i class="fa fa-table mr-2"></i>Search Part Number</a>
                            <form method="post">
                                <label><b>Status</b></label>
                                <select class="status mb-3 ml-3" name="status" id="status">
                                    <option disabled selected><?= $fetch['status']; ?>
                                    </option>
                                    <option value="approve">Approve</option>
                                    <option value="rejected">Reject</option>
                                </select> <br>
                                <label class="list-group-item-secondary w-100 ">Give Comment for Technician</label> <br>
                                <textarea name="comment" cols="30" rows="3" placeholder="comment ..."
                                    required></textarea>
                                <?php $i=1; ?>
                                <?php foreach($join as $fil ) :?>
                                <p class="d-none"><?= $i; ?></p>
                                <input class="d-none" type="text" value="<?= $fil['description']?>"
                                    name="description-<?= $i;?>">
                                <input class="d-none" type="text" value="<?= $fil['uom']?>" name="uom-<?= $i;?>">
                                <input class="d-none" type="text" value="<?= $fil['purpose']?>"
                                    name="purpose-<?= $i;?>">
                                <input class="d-none" type="text" value="<?= $fil['cc']?>" name="cc-<?= $i;?>">
                                <input class="d-none" type="text" value="<?= $fil['part_number']?>"
                                    name="part_number-<?= $i;?>">
                                <input class="d-none" type="text" value="<?= $fil['on_hand']?> "
                                    name="on_hand-<?= $i;?>">
                                <input class="d-none" type="text" value="<?= $fil['qty']?>" name="qty-<?= $i;?>">
                                <?php $i++; ?>
                                <?php endforeach; ?> <br>
                                <input class="d-none" type="text" value="<?= $i;?>" name="total">

                                <div>
                                    <button type="submit" class="btn btn-sm btn-info" name="tombol"><i
                                            class="far fa-hand-pointer text-white p-1"></i>Update</button>
                                </div>
                            </form>
                        </div>
                    </div>

                    <?php endif; ?>

                    <div class="section mt-4">
                        <div class="table-responsive container">
                            <table class="table table-hover table-bordered table-sm">
                                <p class="bg-light">## Request Withdraw <?= $rows; ?> Item ##</p>
                                <tr>
                                    <th width="1%" rowspan="2">No</th>
                                    <th rowspan="2">ITEM</th>
                                    <th rowspan="2">CC</th>
                                    <th rowspan="2">Part Number</th>
                                    <th rowspan="2">Purpose</th>
                                    <th colspan="2">Volume</th>
                                </tr>
                                <tr>
                                    <th>QTY</th>
                                    <th>UOM</th>
                                </tr>
                                <?php $i = 1; ?>
                                <?php foreach ($join as $data) : ?>
                                <tr>
                                    <td class="text-center"><?= $i; ?></td>
                                    <td><?= $data['description']; ?></td>
                                    <td class="text-center"><?= $data['cc']; ?></td>
                                    <td><?= $data['part_number']; ?></td>
                                    <td><?= $data['purpose']; ?></td>
                                    <td><?= $data['qty']; ?></td>
                                    <td class="text-uppercase"><?= $data['uom']; ?></td>
                                </tr>
                                <?php $i++; ?>
                                <?php endforeach; ?>
                                <?php if ($rowsTangkap < $rows) :?>
                                <td colspan="7" class="w-100 text-center text-danger"><b> "Part Number Data Not
                                        Synchronize"</b>
                                </td>
                                <?php endif; ?>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <div class="modal fade" id="search" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle"
        aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle"><i class="fa fa-table"></i>
                        Search Table
                    </h5>
                </div>
                <div class="modal-body">
                    <div class="table-responsive">
                        <table class="table table-sm inventory table-striped w-100" id="data" style="font-size: 12px;">
                            <thead style="width: fit-content;">
                                <tr class="bg-dark text-white">
                                    <th width="2%">No</th>
                                    <th>Part Number</th>
                                    <th>Item Description</th>
                                    <th>Cost Center</th>
                                    <th>On Hand</th>
                                </tr>
                            </thead>

                            <tbody>
                                <?php $i = 1; ?>
                                <?php foreach ($dt_inventory as $data) : ?>
                                <tr>
                                    <td><?= $i; ?></td>
                                    <td><?= $data['part_number']; ?></td>
                                    <td><?= $data['description']; ?></td>
                                    <td><?= $data['cc']; ?></td>
                                    <td><?= $data['on_hand']; ?></td>
                                </tr>
                                <?php $i++; ?>
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

    <?php if(isset($send)) :  ?>
    <script>
        swal.fire({
            icon: "success",
            title: "Succes Updated",
            showCancelButton: false,
            showConfirmButton: false
        });
        setTimeout(function () {
            window.top.location = "history-wd"
        }, 2700);
    </script>
    <!-- <?php exit; ?> -->
    <?php endif; ?>

    <!-- script data tables -->
    <script>
        $(document).ready(function () {
            $('#data').DataTable({
                scrollX: true,
                lengthChange: false,
                "order": [
                    [0, "asc"]
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
</body>

</html>