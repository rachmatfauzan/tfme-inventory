<?php  

    require "../config/config.php";

    // registrasi
    if (isset($_POST['register'])){
        $id = $_POST['id_user'];
        $username = $_POST['name'];
        $password = $_POST['password'];
        $hp = $_POST['handphone'];
        $email = $_POST['email'];
        $position = $_POST['position'];
        $address = $_POST['address'];

        $query = mysqli_query($conn, "INSERT INTO user VALUES ('$id','$username','$password','$hp','$email','$position','$address')");


        if ($query){
            $berhasil = true;
        }else{
            echo "gagal";
        }

    }

    // Menampilkan user ke dalama data table
    $query = mysqli_query($conn, "SELECT * FROM user");

    



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
    <link rel="stylesheet" href="../css/add-user.css">

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
                <a class="nav-link" href="dashboard-admin.php"><i class="fas fa-database"></i>Data Site</a>
                <a class="nav-link active" href="#"><i class="fas fa-users"></i>User List</a>
            </div>

            <div class="copyright">
                <small class="text-white text-muted">&copy;Copyright TFME polibatam 2020 &bull; All reserved</small>
            </div>
        </nav>
        <!-- End navigasi -->
        <!-- start header -->
        <div class="konten">
            <div class="box">
                <div class="content">
                    <div class="kepala">
                        <h1>Add New User Form</h1>
                        <a href="dashboard-user-list.php"><i class="fas fa-undo-alt"></i>Back To Dashboard</a>
                    </div>
                    <div class="formulir mt-5">
                        <form method="post">
                            <div class="form-row">
                                <div class="form-group col-md-2">
                                    <label for="inputEmail4">ID</label>
                                    <input type="number" class="form-control" id="inputEmail4" placeholder="NIK/NIP/NIM"
                                        autofocus name="id_user">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputEmail4">Full Name</label>
                                    <input type="text" class="form-control" id="inputEmail4" placeholder="Full Name"
                                        autofocus name="name">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Password</label>
                                    <input type="password" class="form-control" id="pwd" placeholder="Password" name="password">
                                    <i class="fa fa-eye" id="eye"></i>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-2">
                                    <label for="inputHandphone">Handphone</label>
                                    <input type="text" class="form-control" id="inputHandphone" placeholder="08xxx" name="handphone">
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputemail">Email</label>
                                    <input type="email" class="form-control" id="inputemail" placeholder="Your e-mail" name="email">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPosition">Position</label>
                                    <select id="inputPosition" class="form-control custom-select" name="position">
                                        <option selected value="technician">Technician</option>
                                        <option value="admin">Inventory Admin</option>
                                        <option value="head">Head Division</option>
                                        <option value="iqa">Internal Quality Audit</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-12">
                                    <label for="inputAddress2">Address</label>
                                    <textarea type="text" class="form-control" id="inputAddress2"
                                        placeholder="Specific Address You're Stay Now" name="address"></textarea>
                                    </div>
                            </div>
                            <div class="d-flex justify-content-center">
                                <button type="submit" class="btn bg-dark" name="register">Registered</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="content content-bottom">
                    <div class="kepala">
                        <h1>Table all User</h1>
                    </div>
                    <div class="table-responsive mt-2">
                        <table class="table" id="data">
                            <thead>
                                <tr>
                                    <th>Action</th>
                                    <th style="display: none;">no</th>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Address</th>
                                    <th>Position</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php $no = 1; ?>
                                <?php foreach ($query as $user ) : ?>
                                <tr>
                                    <td>
                                        <a class="bg-danger text-white">Delete</a>
                                        <a class="bg-info text-white">Update</a>
                                        <a class="bg-success text-white" href="detail-user-list.php"
                                        data-toggle="modal" data-target="#detail">Detail</a>
                                    </td>
                                    <td style="display: none;"><?= $no; ?></td>
                                    <td><?= $user['id_user']; ?></td>
                                    <td><?= $user['name']; ?></td>
                                    <td><?= $user['address']; ?></td>
                                    <td><?= $user['position']; ?></td>
                                </tr>
                                <?php $no++; ?>
                                <?php endforeach; ?>
                            </tbody>
                            <tfoot>
                                <th>Action</th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Position</th>
                            </tfoot>
                        </table>
                    </div>

                </div>
                <!-- Modal -->
                <div class="modal fade" id="detail" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-dark text-white">
                                <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-users mr-2"></i>Detail User</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form>
                                    <div class="form-row">
                                        <div class="form-group col-6">
                                            <label for="inputEmail4">ID</label>
                                            <input type="text" class="form-control" id="inputEmail4"
                                            placeholder="Your ID" disabled>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="inputEmail4">Full Name</label>
                                            <input type="text" class="form-control" id="inputEmail4"
                                            placeholder="Full Name" disabled>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-6">
                                            <label for="inputHandphone">Handphone</label>
                                            <input type="text" class="form-control" id="inputHandphone"
                                            placeholder="08xxx" disabled>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="inputemail">Email</label>
                                            <input type="email" class="form-control" id="inputemail"
                                            placeholder="Your e-mail" disabled>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="inputPosition">Position</label>
                                            <input type="text" class="form-control" placeholder="Position" disabled>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="inputPosition">Password</label>
                                            <input type="text" class="form-control" placeholder="password" disabled>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label for="inputAddress2">Address</label>
                                            <textarea type="text" class="form-control" id="inputAddress2"
                                                placeholder="Specific Address You're Stay Now" disabled></textarea>
                                            </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    

    
    
    <!-- SWAL action -->
    <?php if(isset($berhasil)) :  ?>
        <script>
            swal.fire ("Register Completed", "Happy Working :)", "success");
        </script>
    <?php endif; ?>

    <!-- script data tables -->
    <script>
        $(document).ready(function () {
            $('#data').DataTable({
                scrollX: true,
                lengthChange: false,
                "order": [[1, 'desc']],
                "lengthMenu": [
                    [4, 25, 50, -1],
                    [3, 25, 50, "All"]
                ]
            });
        });
        </script>


    <!-- Start script show Eye -->
    <script>
        var pwd = document.getElementById('pwd');
        var eye = document.getElementById('eye');

        eye.addEventListener('click', togglePass);

        function togglePass() {
            eye.classList.toggle('active');
            (pwd.type == 'password') ? pwd.type = 'text':
                pwd.type = 'password';
        }
    </script>
    <!-- End cript show eye -->
</body>

</html>