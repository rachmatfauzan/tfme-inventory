 <?php 

use PHPMailer\PHPMailer\PHPMailer;
use PHPMailer\PHPMailer\Exception;

require 'PHPMailer/src/Exception.php';
require 'PHPMailer/src/PHPMailer.php';
require 'PHPMailer/src/SMTP.php';

$email_send =  "rachmatfauzan87@gmail.com";
$name_send =  "Teknisi TFME";
$email_received =  "rachmatfauzan07@gmail.com";
$subjek =  "Halo!!, Ada Pesanan Baru !!";

$pesan = '


<html>

<head>
    <style>
        div.bg {
            background-color: #1B2B34;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100%;
            margin: 0;
            padding: 0;
            height: 100%;
        }

        .content{
            padding:20px;
            border: 2px solid white;
            text-align: center;
        }
    </style>
</head>

<body>

    <div class="bg">

        <div class="content">
            <header>
                <img src="https://cdns.klimg.com/merdeka.com/i/w/news/2021/04/13/1295746/540x270/30-ucapan-selamat-berbuka-puasa-ramadan-bijak-dan-penuh-makna.jpg">
                <h2>Selamat Berbuka Puasa</h2>
            </header>
            <section>
                <p> <strong>Membaca doa buka puasa sebelum menyantap hidangan berbuka puasa merupakan amalan yang
                        disunahkan
                        untuk menambah pahala muslim yang berpuasa. </strong>

                    Ada beberapa macam bacaan doa buka puasa Ramadan yang diriwayatkan oleh Abu Dawud sesuai sunah
                    Rasulullah SAW, secara lengkap berbunyi sebagai berikut:

                    "Kami mendapat riwayat dari Abdullah bin Muhammad bin Yahya, yaitu Abu Muhammad, kami mendapat
                    riwayat
                    dari Ali bin Hasan, kami mendapat riwayat dari Husein bin Waqid. Kami mendapat riwayat dari Marwan,
                    yaitu Bin Salim Al-Muqaffa", ia berkata bahwa aku melihat Ibnu Umar menggenggam jenggotnya, lalu
                    memangkas sisanya. Ia berkata, Rasulullah bila berbuka puasa membaca, "Dzahabaz zhama"u wabtallatil
                    "urûqu wa tsabatal ajru, insya Allah." (H.R. Abu Dawud).</p>

            </section>
        </div>
    </div>
</body>

</html>

';

$mail = new PHPMailer;
$mail->isSMTP();

$mail->Host = 'smtp.gmail.com'; // domain. outlook sesuaikan dengan email penerima
$mail->Username = $email_send;
$mail->Password = 'hmcffwegcedvdjrs';
$mail->Port = 465;
$mail->SMTPAuth = true;
$mail->SMTPSecure = 'ssl';
$mail->SMTPDebug = 2;

$mail->setFrom($email_send, $name_send);
$mail->addAddress($email_received);
$mail->isHTML(true);
$mail->Subject = $subjek;
$mail->Body = $pesan;

$send = $mail->send();

if($send){
    echo "berhasil";
} else{
    echo "gagal";
}
echo "<script>alert('data terkirim')</script>";

?>
