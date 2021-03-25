<?php  
    
    // koneksi database
    $conn = mysqli_connect("localhost", "root", "", "inventory");


    if (!$conn) {
        die ("Database tidak ditemukan". mysqli_connect_error());
    }


    function hapus($id){
        global $conn;
        mysqli_query($conn, "DELETE FROM user where id_user = $id");
    
        return mysqli_affected_rows($conn);
    }


?>