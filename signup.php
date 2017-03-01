<?php
?>
<!DOCTYPE html>
<html>
    <head>
        <title>Safemoon</title>
    </head>

    <body>
        <div>
        <form action="functions/constructor.php" method="post">
            email:<input type="email" required placeholder="Email" name="email"><br>
            username:<input type="text" placeholder="username" required name="username"><br>
            contact:<input type="tel" required name="contact"><br>
            password: <input type="password" required name="password" placeholder="password"><br>
            <input type="submit" name="register" value="Sign up">
        </form>
        </div>
    </body>
</html>
