<?php
include('./classes/DB.php');

if (isset($_POST['resetpassword'])) {

        $cstrong = True;
        $token = bin2hex(openssl_random_pseudo_bytes(64, $cstrong));
        $email = $_POST['email'];
        $user_id = DB::query('SELECT id FROM users WHERE email=:email', array(':email'=>$email))[0]['id'];
        DB::query('INSERT INTO password_tokens VALUES (\'\', :token, :user_id)', array(':token'=>sha1($token), ':user_id'=>$user_id));
        echo 'Email sent!';
        echo '<br />';
        echo $token;
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link rel="stylesheet" href="style.css">
</head>
<body>
<center>
<div class="center">
<h1>Forgot Password</h1>
<form action="forgot-password.php" method="post">
<div class="txt_field">
        <input type="text" name="email" value="" placeholder="Email ..."><p />
</div>
        <input type="submit" name="resetpassword" value="Reset Password">
</form>
<br>
</div>
</center>
<div class="night">
<div class="surface"></div>
        <div class="car">
                <img src="./assets/Img_06.png" alt="">
        </div>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="script.js"></script>
</body>
</html>