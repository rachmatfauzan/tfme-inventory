<?php  
require '../config/config.php';
session_start();
// ambil id dari URL
$id = $_GET["id"];
// querry data mahasiswa berdasarkan id
$query = mysqli_query($conn, "SELECT * FROM form_pr WHERE id_pr = $id");
$data = mysqli_fetch_array($query);

if (isset($_POST['tombol'])){
    $status = $_POST['status'];

    $query = mysqli_query($conn, "UPDATE form_pr SET status = '$status' WHERE id_pr = '$id' ");

    if($query){
        $berhasil = true;
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
    <!--  CDN SWAL-->
    <script src="../swal2/dist/sweetalert2.min.js"></script>
    <link rel="stylesheet" href="../swal2/dist/sweetalert2.min.css">
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
                <div class="content">
                    <div class="pr-form d-flex justify-content-between kepala">
                        <h5 class="mb-4">Purchase Request Info</h5>
                        <a href="history-pr.php"><i class="fas fa-undo-alt mr-2"></i>Back to PR</a>
                    </div>
                    <section>
                        <div class="row mb-3 ">
                            <div class="col-md-4 ">
                                <label>Item Name</label>
                                <textarea type="text" class="form-control form-control-sm detail" disabled rows="5"><?= $data['item_name']; ?>
                                </textarea>
                            </div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-12 mb-4 ">
                                        <label>PR Code</label>
                                        <input type="text" class="form-control form-control-sm detail" disabled
                                            value=" <?= $data['kode_pr']; ?>">
                                    </div>
                                    <div class="col-md-12 ">
                                        <label>Type</label>
                                        <input type="text" class="form-control form-control-sm detail " disabled
                                            value=" <?= $data['type']; ?>">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-12 mb-4 ">
                                        <label>Quantity</label>
                                        <input type="text" class="form-control form-control-sm detail " disabled
                                            value=" <?= $data['quantity']; ?>">
                                    </div>
                                    <div class="col-md-12 ">
                                        <form method="post">
                                            <label>Status</label>
                                            <select class="form-control form-control-sm status mb-3" name="status"
                                                id="status">
                                                <option value="waiting" disabled selected><?= $data['status']; ?>
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
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col-md-4 ">
                                <label>Item Description</label>
                                <textarea type="text" class="form-control form-control-sm detail " disabled rows="5"><?= $data['item_description']; ?>
                                </textarea>
                            </div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-12 mb-4 ">
                                        <label>Part Number</label>
                                        <input type="text" class="form-control form-control-sm detail " disabled
                                            value=" <?= $data['part_number']; ?>">
                                    </div>
                                    <?php $date = date_create($data['pr_date']);?>
                                    <div class="col-md-12 ">
                                        <label>PR Date</label>
                                        <input type="text" class="form-control form-control-sm detail " disabled
                                            value=" <?= date_format($date, 'j F Y'); ?>">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="row">
                                    <div class="col-md-12 mb-4 ">
                                        <label>Cost Center</label>
                                        <input type="text" class="form-control form-control-sm detail " disabled
                                            value=" <?= $data['cost_center']; ?>">
                                    </div>
                                    <div class="col-md-12 ">
                                        <label>Account Code</label>
                                        <input type="text" class="form-control form-control-sm detail " disabled
                                            value=" <?= $data['account_code']?>">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row d-flex justify-content-between">
                            <div class="col-md">
                                <a href="#">
                                    <i class="far fa-file-pdf mr-2"></i>Download PR.pdf</a>
                            </div>
                            <div class="col-md">
                                <p class="d-flex flex-row-reverse">
                                    <button class="btn btn-sm btn-info" type="button" data-toggle="collapse"
                                        data-target="#collapseExample" aria-expanded="false"
                                        aria-controls="collapseExample">
                                        Update P.O
                                    </button>
                                </p>
                            </div>
                        </div>
                    </section>

                    <section>
                        <div class="collapse" id="collapseExample">
                            <div class="data-entry">
                                <div class="title mb-4 text-uppercase d-flex justify-content-center">
                                    <h5 class="font-weight-bold text-secondary">Input Purchase Order</h5>
                                </div>
                            </div>
                            <form>
                                <div class="group">
                                    
                                </div>
                                <div class="group mt-3">
                                    <h5 class="font-weight-bold">SUPPLIER</h5>
                                    <hr class="my-4">
                                    <div class="row">
                                        <div class="form-group col">
                                            <label for="supplier-name">Supplier Name</label>
                                            <input type="text" class="form-control bg-light" id="supplier-name"
                                                placeholder="Supplier Name">
                                        </div>
                                        <div class="form-group col">
                                            <label for="supplier#">Supplier#</label>
                                            <input type="text" class="form-control bg-light" id="supplier#"
                                                placeholder="Supplier#">
                                        </div>
                                    </div>
                                </div>
                                <div class="group mt-3">
                                    <h5 class="font-weight-bold">STOCK</h5>
                                    <hr class="my-4">
                                    <div class="row">
                                        <div class="form-group col">
                                            <label for="on-hand">On Hand</label>
                                            <input type="text" class="form-control bg-light" id="on-hand"
                                                placeholder="On Hand">
                                        </div>
                                        <div class="form-group col">
                                            <label for="in-transit">In Transit</label>
                                            <input type="text" class="form-control bg-light" id="in-transit"
                                                placeholder="In Transit">
                                        </div>
                                        <div class="form-group col">
                                            <label for="on-prep">On Prep</label>
                                            <input type="text" class="form-control bg-light" id="on-prep"
                                                placeholder="On Prep">
                                        </div>
                                    </div>
                                </div>
                                <div class="group mt-3">
                                    <h5 class="font-weight-bold">ORDER</h5>
                                    <hr class="my-4">
                                    <div class="row">
                                        <div class="form-group col">
                                            <label for="moq">MOQ</label>
                                            <input type="text" class="form-control bg-light" id="moq" placeholder="MOQ">
                                        </div>
                                        <div class="form-group col">
                                            <label for="cost">Cost</label>
                                            <input type="text" class="form-control bg-light" id="cost"
                                                placeholder="Cost">
                                        </div>
                                        <div class="form-group col-md">
                                            <label for="on-po#">On PO#</label>
                                            <input type="text" class="form-control bg-light" id="on-po#"
                                                placeholder="On PO#">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col">
                                            <label for="po-date">PO Date</label>
                                            <input type="date" id="datepicker" class="form-control bg-light">
                                        </div>
                                    </div>
                                </div>
                                <div class="group mt-3">
                                    <h5 class="font-weight-bold">CHECKING</h5>
                                    <hr class="my-4">
                                    <div class="row">
                                        <div class="form-group col">
                                            <label for="batch#">Batch#</label>
                                            <input type="text" class="form-control bg-light" id="batch#"
                                                placeholder="Batch#">
                                        </div>
                                        <div class="form-group col">
                                            <label for="dwg#">DWG#</label>
                                            <input type="text" class="form-control bg-light" id="dwg#"
                                                placeholder="DWG#">
                                        </div>
                                        <div class="form-group col">
                                            <label for="iqa#">IQA#</label>
                                            <input type="text" class="form-control bg-light" id="iqa#"
                                                placeholder="IQA#">
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="d-flex justify-content-end entry">
                                    <button type="submit" class="btn bg-dark text-white">Input Data PO</button>
                                </div>
                            </form>
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
        })
    </script>
    <?php endif; ?>
</body>

</html>