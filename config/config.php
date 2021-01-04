<?php  
    
    // koneksi database
    $conn = mysqli_connect("localhost", "root", "", "inventory");


    if (!$conn) {
        die ("Database tidak ditemukan". mysqli_connect_error());
    }


    function updateData($data){
        global $conn;
    
        $id = $data['id_user'];
        $name = $data['name_user'];
        $password = $data['password_user'];
        $handphone = $data['handphone_user'];
        $email = $data['email_user'];
        $position = $data['position_user'];
        $address = $data['address_user'];
        
        mysqli_query($conn, "UPDATE user SET
                        id_user = '$id',
                        name = '$name',
                        password = '$password,
                        handphone = '$handphone',
                        email = '$email',
                        position = '$position',
                        address = '$address'
        ");
    
        return mysqli_affected_rows($conn);
    
    
    }

?>