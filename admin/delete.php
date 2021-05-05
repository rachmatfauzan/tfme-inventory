<?php 

session_start();
include '../config/config.php';

$id = $_GET["id"];

if ( hapus($id) > 0 ){
    $berhasil = true;
} else {
    echo "
    <script>
         alert('Data gagal di Hapus !');
         document.location.href = 'add-user';
    </script>";
}


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
<?php if(isset($berhasil)) :  ?>
    <script>
        swal.fire("Data Deleted", "Great Work :)", "success");
        setTimeout(function(){window.top.location="add-user"},1000);
    </script>
    <?php endif; ?>
</body>
</html>
