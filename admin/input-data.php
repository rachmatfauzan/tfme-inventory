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

<body id="top">
    <!-- start header -->
    <div class="konten">
        <div class="navbar bg-dark justify-content-between">
            <div class="profile">
                <div class="wrapper-image">
                    <img src="../image/profile.png" alt="">
                </div>
                <div class="profile-name">
                    <h5>Rachmat Fauzan</h5>
                    <p>Inventory admin</p>
                </div>
                <div class="dropdown">
                    <button class="btn dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown"
                        aria-haspopup="true" aria-expanded="false"></button>
                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <a class="dropdown-item" href="index.html"><i class="fas fa-sign-out-alt"></i>Log Out</a>
                    </div>
                </div>
                <div class="nav-item">
                    <a class="nav-link" href="dashboard-admin.html"><i class="fas fa-database"></i>Data Site</a>
                    <a class="nav-link" href="dashboard-user-list.html"><i class="fas fa-users"></i>User List</a>
                </div>
            </div>
        </div>
        <div class="box">
            <div class="data-entry">
                <div class="title mb-4 text-uppercase d-flex justify-content-center">
                    <h5 class="font-weight-bold text-secondary">Input Purchase Order</h5>
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
                            <div class="form-group col-md">
                                <label for="on-pr#">On PR#</label>
                                <input type="text" class="form-control bg-light" id="on-pr#" placeholder="On PR#">
                            </div>
                            <div class="form-group col-md">
                                <label for="on-po#">On PO#</label>
                                <input type="text" class="form-control bg-light" id="on-po#" placeholder="On PO#">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col">
                                <label for="pr-date">PR Date</label>
                                <input type="date" id="datepicker" class="form-control bg-light">
                            </div>
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
        <div class="box">
            <div class="content">
                <div class="table-responsive mt-2">
                    <button type="button" class="btn" data-toggle="modal" data-target=".bd-example-modal-lg"><i
                            class="far fa-question-circle"></i></button>
                    <a class="top" href="#top">Go Top</a>
                    <!-- Large modal -->
                    <div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog"
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
                    <table class="table" id="data">
                        <thead>
                            <tr>
                                <th>Action</th>
                                <th>Part Number</th>
                                <th>Item</th>
                                <th>Supplier#</th>
                                <th>CC</th>
                                <th>Account Code</th>
                                <th>Type</th>
                                <th>Supplier</th>
                                <th>Description</th>
                                <th>moq</th>
                                <th>Cost</th>
                                <th>On Hand</th>
                                <th>In Transit</th>
                                <th>On Prep</th>
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
                            <tr>
                                <td>
                                    <a class="bg-danger text-white">Delete</a>
                                    <a class="bg-info text-white">Update</a>
                                    <a class="bg-success text-white">Detail</a>
                                </td>
                                <td>DM00000025</td>
                                <td>Magazine lead frame</td>
                                <td>N/A</td>
                                <td>30</td>
                                <td>3311801036</td>
                                <td>N/A</td>
                                <td>PT. Farsawa</td>
                                <td>N/A</td>
                                <td>N/A</td>
                                <td>N/a</td>
                                <td>0</td>
                                <td>N/A</td>
                                <td>N/A</td>
                                <td>N/A</td>
                                <td>N/A</td>
                                <td>Null</td>
                                <td>Null</td>
                                <td>00/00/0000</td>
                                <td>00/00/0000</td>
                                <td>00/00/0000</td>
                                <td>00/00/0000</td>
                                <td>00/00/0000</td>
                            </tr>
                            <tr>
                                <td>
                                    <a class="bg-danger text-white">Delete</a>
                                    <a class="bg-info text-white">Update</a>
                                    <a class="bg-success text-white">Detail</a>
                                </td>
                                <td>DM00000025</td>
                                <td>Magazine lead frame</td>
                                <td>N/A</td>
                                <td>30</td>
                                <td>3010001</td>
                                <td>N/A</td>
                                <td>PT. Farsawa</td>
                                <td>N/A</td>
                                <td>N/A</td>
                                <td>N/a</td>
                                <td>0</td>
                                <td>N/A</td>
                                <td>N/A</td>
                                <td>N/A</td>
                                <td>N/A</td>
                                <td>Null</td>
                                <td>Null</td>
                                <td>00/00/0000</td>
                                <td>00/00/0000</td>
                                <td>00/00/0000</td>
                                <td>00/00/0000</td>
                                <td>00/00/0000</td>
                            </tr>


                        </tbody>
                        <tfoot>
                            <th>Action</th>
                            <th>Part Number</th>
                            <th>Item</th>
                            <th>Supplier#</th>
                            <th>CC</th>
                            <th>Account Code</th>
                            <th>Type</th>
                            <th>Supplier</th>
                            <th>Description</th>
                            <th>moq</th>
                            <th>Cost</th>
                            <th>On Hand</th>
                            <th>In Transit</th>
                            <th>On Prep</th>
                            <th>on_pr#</th>
                            <th>on_po#</th>
                            <th>batch#</th>
                            <th>iqa</th>
                            <th>Received Date</th>
                            <th>Manufacturing Date</th>
                            <th>Expiration Date</th>
                            <th>po_date</th>
                            <th>pr_date</th>
                        </tfoot>
                    </table>
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