 <?php 

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

$email_send =  "tfmeminteraktif@gmail.com";
$name_send =  "TFME Website";
$email_received =  "rachmat3311801036@students.polibatam.ac.id";
$subjek =  "New Order From Technician !!";


$mail = new PHPMailer;
$mail->isSMTP();

$mail->Host = 'smtp.gmail.com'; // domain. outlook sesuaikan dengan email penerima
$mail->Username = $email_send;
$mail->Password = 'bogglxovdlvzvtpe';
$mail->Port = 465;
$mail->SMTPAuth = true;
$mail->SMTPSecure = 'ssl';
$mail->SMTPDebug = 2;

$mail->setFrom($email_send, $name_send);
$mail->addAddress($email_received);
$mail->isHTML(true);
$mail->Subject = $subjek;
$mail->AddEmbeddedImage("image/box.png", "logo" );

$mail->AddCC("rachmatfauzan07@gmail.com");

$pesan = '




<html>

<head>
    <style>
        div.bg {
            background-color:#F2F2F2;
            width: 100%;
            margin: auto;
            padding: 0;
            height: 100%;
            position:relative;
        }

        img {
            width: 30%;
            background-size: cover;
        }

        .content {
            background-color:#FFFF;
            padding: 20px;
            border: 2px solid white;
            text-align: center;
        }

        table {
            width: 100%;
        }

        p {
            margin-top:2em;
            background-color: wheat;
            padding: 5px;
            -webkit-box-shadow: 0px 10px 7px 4px rgba(0, 0, 0, 0.06);
            -moz-box-shadow: 0px 10px 7px 4px rgba(0, 0, 0, 0.06);
            box-shadow: 0px 10px 7px 4px rgba(0, 0, 0, 0.06);
        }

        footer {
            margin-top: 2em;
        }
    </style>
</head>

<body>

    <div class="bg">

        <div class="content">
            <header>
                <img src="cid:logo">
                <h2>New Purchase Request From Technician <br> "Axel Agatha Ibrahim"</h2>
            </header>
            <section>
                <table border="1" cellspacing="0" style="text-align: left; margin-left:auto; margin-right:auto;"
                    cellpadding="2">
                    <tr>
                        <td colspan="4" style="text-align: center;background-color:wheat;">PR-00001</td>
                    </tr>
                    <tr>
                        <th>Item Description</th>
                        <th>Type</th>
                        <th>Quantity</th>
                        <th>Part Number</th>
                    </tr>
                    <tr>
                        <td>Magazine Lead Frame</td>
                        <td>MLGJ-22 JKIY</td>
                        <td>100</td>
                        <td>AKJ9800</td>
                    </tr>
                </table>
               <p>Status : Waiting</p>
            </section>
            <footer>
               <small> <strong>go to the website : <a href="http://tfme.polibatam.ac.id/inventory"
                        target="_blank">tfme.polibatam.ac.id/inventory</a></strong></small>
            </footer>
        </div>
    </div>
</body>

</html>

';
$mail->Body = $pesan;


$send = $mail->send();

if($send){
    echo "berhasil";
} else{
    echo "gagal";
}
echo "<script>alert('data terkirim')</script>";

?>



