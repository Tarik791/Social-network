<?php
include('classes/DB.php');

if (isset($_POST['createaccount'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $email = $_POST['email'];

        if (!DB::query('SELECT username FROM users WHERE username=:username', array(':username'=>$username))) {

                if (strlen($username) >= 3 && strlen($username) <= 32) {

                        if (preg_match('/[a-zA-Z0-9_]+/', $username)) {

                                if (strlen($password) >= 6 && strlen($password) <= 60) {

                                if (filter_var($email, FILTER_VALIDATE_EMAIL)) {

                                if (!DB::query('SELECT email FROM users WHERE email=:email', array(':email'=>$email))) {

                                        DB::query('INSERT INTO users VALUES (\'\', :username, :password, :email, \'0\', \'\')', array(':username'=>$username, ':password'=>password_hash($password, PASSWORD_BCRYPT), ':email'=>$email));
                                        echo "Success!";
                                } else {
                                        echo 'Email in use!';
                                }
                        } else {
                                        echo 'Invalid email!';
                                }
                        } else {
                                echo 'Invalid password!';
                        }
                        } else {
                                echo 'Invalid username';
                        }
                } else {
                        echo 'Invalid username';
                }

        } else {
                echo 'User already exists!';
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
<div class="center">
<center>
<h1>Register</h1>
<form action="create-account.php" method="post">

<div class="txt_field">
<label for="username">Username</label>
<input type="text" name="username" value="" placeholder="Username ..." required><p />
</div>

<div class="txt_field">
<label for="username">Password</label>
<input type="password" name="password" value="" placeholder="Password ..." required><p />
</div>

<div class="txt_field">
<label for="username">Email</label>
<input type="email" name="email" value="" placeholder="" required><p />
</div>
<input type="submit" name="createaccount" value="Create Account">
</form>
<br>
<div class="signup_link">

<a href="login.php">Login to your account</a>or <a href="forgot-password.php">forgot password?</a>
</div>
</center>
</div>
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