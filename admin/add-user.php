<?php 

    session_start();

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


    // update
    if (isset($_POST['ubah'])){
        $id = $_POST['id_user'];
        $name = $_POST['name_user'];
        $password = $_POST['password_user'];
        $handphone = $_POST['handphone_user'];
        $email = $_POST['email_user'];
        $position = $_POST['position_user'];
        $address = $_POST['address_user'];

        $update = mysqli_query($conn, "UPDATE user SET
        name = '$name',
        password = '$password',
        handphone = '$handphone',
        email = '$email',
        position = '$position',
        address = '$address'
        WHERE id_user = '$id' ");

        if ($update){
            $update = true;
        }
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
            <div class="atap"><span> </span></div>
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
                                    <label for="id_user">ID</label>
                                    <input type="number" class="form-control" id="inputEmail4" placeholder="NIK/NIP/NIM"
                                        autofocus name="id_user" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputEmail4">Full Name</label>
                                    <input type="text" class="form-control" id="name    " placeholder="Full Name"
                                        autofocus name="name" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPassword4">Password</label>
                                    <input type="password" class="form-control" id="pwd" placeholder="Password"
                                        name="password" required>
                                    <i class="fa fa-eye" id="eye"></i>
                                </div>
                            </div>
                            <div class="form-row">
                                <div class="form-group col-md-2">
                                    <label for="inputHandphone">Handphone</label>
                                    <input type="text" class="form-control" id="inputHandphone" placeholder="08xxx"
                                        name="handphone" required>
                                </div>
                                <div class="form-group col-md-4">
                                    <label for="inputemail">Email</label>
                                    <input type="email" class="form-control" id="inputemail" placeholder="Your e-mail"
                                        name="email" required>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="inputPosition">Position</label>
                                    <select id="inputPosition" class="form-control custom-select" name="position"
                                        required>
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
                                        placeholder="Specific Address You're Stay Now" name="address"
                                        required></textarea>
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
                                        <a class="bg-info text-white" id="updateData" data-toggle="modal"
                                            data-target="#update" data-id="<?= $user['id_user'];?>"
                                            data-name="<?= $user['name'];?>" data-handphone="<?= $user['handphone'];?>"
                                            data-email="<?= $user['email'];?>" data-position="<?= $user['position'];?>"
                                            data-password="<?= $user['password'];?>"
                                            data-address="<?= $user['address'];?>">Update</a>
                                        <a class="bg-success text-white" id="view" data-toggle="modal"
                                            data-target="#detail" data-id="<?= $user['id_user'];?>"
                                            data-name="<?= $user['name'];?>" data-handphone="<?= $user['handphone'];?>"
                                            data-email="<?= $user['email'];?>" data-position="<?= $user['position'];?>"
                                            data-password="<?= $user['password'];?>"
                                            data-address="<?= $user['address'];?>">Detail</a>
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
                <!-- ##################################################################### -->
                <div class="modal fade" id="detail" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-secondary text-white">
                                <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-users mr-2"></i>Detail
                                    User</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form method="POST">
                                    <div class="form-row">
                                        <div class="form-group col-6">
                                            <label for="id_user">ID</label>
                                            <input type="text" class="form-control" id="id_user" placeholder="Your ID"
                                                disabled>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="name">Full Name</label>
                                            <input type="text" class="form-control" id="name_user"
                                                placeholder="Full Name" disabled style="text-transform: capitalize;">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-6">
                                            <label for="handphone">Handphone</label>
                                            <input type="text" class="form-control" id="handphone_user"
                                                placeholder="08xxx" disabled>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="email">Email</label>
                                            <input type="email" class="form-control" id="email_user"
                                                placeholder="Your e-mail" disabled>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="position">Position</label>
                                            <input type="text" class="form-control" placeholder="Position"
                                                id="position_user" disabled>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="password">Password</label>
                                            <input type="text" class="form-control" placeholder="password"
                                                id="password_user" disabled>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label for="address">Address</label>
                                            <textarea type="text" class="form-control" id="address_user"
                                                placeholder="Specific Address You're Stay Now" disabled></textarea>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Modal update -->
                <div class="modal fade" id="update" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header bg-secondary text-white">
                                <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-users mr-2"></i>Update Data
                                    User</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body update">
                                <form method="post">
                                    <div class="form-row">
                                        <div class="form-group col-6">
                                            <label for="id_user">ID</label>
                                            <input type="text" class="form-control" id="id_user" placeholder="Your ID" name="id_user">
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="name">Full Name</label>
                                            <input type="text" class="form-control" id="name_user"
                                                placeholder="Full Name" style="text-transform: capitalize;" name="name_user">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-6">
                                            <label for="handphone">Handphone</label>
                                            <input type="text" class="form-control" id="handphone_user"
                                                placeholder="08xxx" name="handphone_user">
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="email">Email</label>
                                            <input type="email" class="form-control" id="email_user"
                                                placeholder="Your e-mail" name="email_user">
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="position">Position</label>
                                            <select class="form-control" name="position_user" id="position_user">
                                                <option value="technician">Technician</option>
                                                <option value="admin">Admin Inventory</option>
                                                <option value="iqa">Internal Quality Audit</option>
                                                <option value="head">Head of Division</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="password">Password</label>
                                            <input type="text" class="form-control" placeholder="password"
                                                id="password_user" name="password_user">
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <label for="address">Address</label>
                                            <textarea type="text" class="form-control" id="address_user" name="address_user"
                                                placeholder="Specific Address You're Stay Now"></textarea>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-12">
                                            <button type="submit" class="btn btn-success float-right" name="ubah">Update</button>
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
        swal.fire("Register Completed", "Happy Working :)", "success");
    </script>
    <?php endif; ?>

    <?php if(isset($update)) :  ?>
    <script>
        swal.fire("Success Updated", "Happy Working :)", "success");
        setTimeout(function(){window.top.location="add-user.php"},1000);
    </script>
    <?php endif; ?>

    <!-- script data tables -->
    <script>
        $(document).ready(function () {
            $('#data').DataTable({
                scrollX: true,
                lengthChange: false,
                "order": [
                    [1, 'desc']
                ],
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

    <script>
        $(document).on('click', '#view', function () {
            let id = $(this).data('id');
            let name = $(this).data('name');
            let handphone = $(this).data('handphone');
            let email = $(this).data('email');
            let position = $(this).data('position');
            let password = $(this).data('password');
            let address = $(this).data('address');
            $('.modal-body #id_user').val(id);
            $('#name_user').val(name);
            $('#handphone_user').val(handphone);
            $('#email_user').val(email);
            $('#position_user').val(position);
            $('#password_user').val(password);
            $('#address_user').val(address);
        });
    </script>

    <script>
        $(document).on('click', '#updateData', function () {
            let id = $(this).data('id');
            let name = $(this).data('name');
            let handphone = $(this).data('handphone');
            let email = $(this).data('email');
            let position = $(this).data('position');
            let password = $(this).data('password');
            let address = $(this).data('address');
            $('.modal-body #id_user').val(id);
            $('.modal-body #name_user').val(name);
            $('.modal-body #handphone_user').val(handphone);
            $('.modal-body #email_user').val(email);
            $('.modal-body #position_user').val(position);
            $('.modal-body #password_user').val(password);
            $('.modal-body #address_user').val(address);
        });
    </script>
</body>

</html>