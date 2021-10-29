<?php
include('classes/DB.php');

if (isset($_POST['login'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];

        if (DB::query('SELECT username FROM users WHERE username=:username', array(':username'=>$username))) {

                if (password_verify($password, DB::query('SELECT password FROM users WHERE username=:username', array(':username'=>$username))[0]['password'])) {
                        echo 'Logged in!';
                        header("Location: index.php");
                        $cstrong = True;
                        $token = bin2hex(openssl_random_pseudo_bytes(64, $cstrong));
                        $user_id = DB::query('SELECT id FROM users WHERE username=:username', array(':username'=>$username))[0]['id'];
                        DB::query('INSERT INTO login_tokens VALUES (\'\', :token, :user_id)', array(':token'=>sha1($token), ':user_id'=>$user_id));

                        setcookie("SNID", $token, time() + 60 * 60 * 24 * 7, '/', NULL, NULL, TRUE);
                        setcookie("SNID_", '1', time() + 60 * 60 * 24 * 3, '/', NULL, NULL, TRUE);

                } else {
                        echo 'Incorrect Password!';
                }

        } else {
                echo 'User not registered!';
        }

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
<h1>Login to your account</h1>
<form action="login.php" method="post">
<div class="txt_field">
<label for="username">Username</label>
<br>
<input type="text" name="username" value="" placeholder="Username ..." required><p />
</div>
<div class="txt_field">
<label for="password">Password</label>
<br>
<input type="password" name="password" value="" placeholder="Password ..." required><p />
</div>


<input type="submit" name="login" value="Login">

</form>
<br>
<div class="signup_link">
<a href="forgot-password.php">Forgot password?</a>or<a href="create-account.php">create account?</a>
</div>
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

