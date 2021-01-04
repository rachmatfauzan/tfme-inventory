<?php 

session_start();
include "../config/config.php";

if(!isset($_SESSION['iqa'])){
    header("location: index.php");
}

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
    <link rel="stylesheet" href="css/dashboard-iqa.css">

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
                <a class="nav-link active" href="dashboard-iqa.html"><i class="fas fa-box-open"></i>Input Data</a>
                <a class="nav-link " href="po-return.html"><i class="fas fa-truck-moving"></i>PO Return</a>
                <a class="nav-link" href="history-po.html"><i class="fas fa-history"></i>History (PO)</a>
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
                        <img src="../image/IQA.png" alt="">
                    </div>
                    <div class="profile-name">
                    <h5 style="text-transform: capitalize;"><?= $_SESSION["user"]; ?></h5>                        
                    <p>Internal Quality Audit</p>
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
                <div class="title mb-4 text-uppercase d-flex justify-content-center">
                    <h5 class="font-weight-bold text-secondary">INPUT DATA INVENTORY</h5>
                </div>
                <form>
                    <div class="group">
                        <h5 class="font-weight-bold">ITEM</h5>
                        <hr class="my-4">
                        <div class="row">
                            <div class="form-group col">
                                <label for="item-name">Item Name</label>
                                <input type="text" class="form-control bg-light" id="item-name" placeholder="Item Name"
                                    autofocus>
                            </div>
                            <div class="form-group col">
                                <label for="tipe">Type</label>
                                <input type="text" class="form-control bg-light" id="tipe" placeholder="Type">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col">
                                <label for="Item">Item Description</label>
                                <textarea type="text" class="form-control bg-light" id="Item"
                                    placeholder="Your Name Item"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="group mt-3">
                        <h5 class="font-weight-bold">NUMBERING</h5>
                        <hr class="my-4">
                        <div class="row">
                            <div class="form-group col">
                                <label for="part-number">Part Number</label>
                                <input type="text" class="form-control bg-light" id="part-number"
                                    placeholder="Part Number">
                            </div>
                            <div class="form-group col">
                                <label for="inputPosition">Cost Center</label>
                                <select id="inputPosition" class="form-control custom-select  bg-light">
                                    <option selected disabled>-- Choose CC --</option>
                                    <option value="10">10 PCB</option>
                                    <option value="20">20 PCBA</option>
                                    <option value="30">30 IC PACK</option>
                                    <option value="40">40 GENERAL</option>
                                </select>
                            </div>
                            <div class="form-group col-md">
                                <label for="account-code">Account Code</label>
                                <input type="text" class="form-control bg-light" id="account-code"
                                    placeholder="Account Code">
                            </div>
                        </div>
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
                                <input type="text" class="form-control bg-light" id="supplier#" placeholder="Supplier#">
                            </div>
                        </div>
                    </div>
                    <div class="group mt-3">
                        <h5 class="font-weight-bold">STOCK</h5>
                        <hr class="my-4">
                        <div class="row">
                            <div class="form-group col">
                                <label for="on-hand">On Hand</label>
                                <input type="text" class="form-control bg-light" id="on-hand" placeholder="On Hand">
                            </div>
                            <div class="form-group col">
                                <label for="in-transit">In Transit</label>
                                <input type="text" class="form-control bg-light" id="in-transit"
                                    placeholder="In Transit">
                            </div>
                            <div class="form-group col">
                                <label for="on-prep">On Prep</label>
                                <input type="text" class="form-control bg-light" id="on-prep" placeholder="On Prep">
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
                                <input type="text" class="form-control bg-light" id="cost" placeholder="Cost">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col">
                                <label for="po-date">PO Date</label>
                                <input type="date" id="datepicker" class="form-control bg-light">
                            </div>
                            <div class="form-group col-md">
                                <label for="on-po#">On PO#</label>
                                <input type="text" class="form-control bg-light" id="on-po#" placeholder="On PO#">
                            </div>
                        </div>
                    </div>
                    <div class="group mt-3">
                        <h5 class="font-weight-bold">CHECKING</h5>
                        <hr class="my-4">
                        <div class="row">
                            <div class="form-group col">
                                <label for="batch#">Batch#</label>
                                <input type="text" class="form-control bg-light" id="batch#" placeholder="Batch#">
                            </div>
                            <div class="form-group col">
                                <label for="dwg#">DWG#</label>
                                <input type="text" class="form-control bg-light" id="dwg#" placeholder="DWG#">
                            </div>
                            <div class="form-group col">
                                <label for="iqa#">IQA#</label>
                                <input type="text" class="form-control bg-light" id="iqa#" placeholder="IQA#">
                            </div>
                        </div>
                    </div>
                    <div class="group mt-3">
                        <h5 class="font-weight-bold">DATE</h5>
                        <hr class="my-4">
                        <div class="row">
                            <div class="form-group col-md">
                                <label for="receive-date">Receive Date</label>
                                <input type="date" id="datepicker" class="form-control bg-light">
                            </div>
                            <div class="form-group col-md">
                                <label for="manufacture-date">Manufacture Date</label>
                                <input type="date" id="datepicker" class="form-control bg-light">
                            </div>
                            <div class="form-group col-md">
                                <label for="expiration-date">Expiration Date</label>
                                <input type="date" id="datepicker" class="form-control bg-light">
                            </div>
                        </div>
                    </div>
                    <div class="d-flex justify-content-end entry">
                        <button type="submit" class="btn bg-dark text-white">Input New Data</button>
                    </div>
                </form>
            </div>
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
</body>

</html>