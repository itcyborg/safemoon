<?php
/**
 * Created by PhpStorm.
 * User: PAVILION 15
 * Date: 3/1/2017
 * Time: 3:29 PM
 */

if(isset($_POST['register'])){
    $username=$_POST['username'];
    $email=$_POST['email'];
    $password=$_POST['password'];
    $contact=$_POST['contact'];

    $array=array('username'=>$username,'email'=>$email,'password'=>$password,'contact'=>$contact,'type'=>6);
    include 'function.php';
    createAccount($array);
}

if(isset($_POST['login'])){
    $email=$_POST['email'];
    $password=$_POST['password'];

    $array=array('email'=>$email,'password'=>$password);
    include 'function.php';
    login($array);
}

if(isset($_POST['gettotalusers'])){
    include 'function.php';
    echo getTotalUsers();
}

if(isset($_POST['addparty'])){
    include  'function.php';
    $name=$_POST['partyname'];
    $abbr=$_POST['abbr'];
    $patron=$_POST['patron'];
    $array=array('name'=>$name,'patron'=>$patron,'abbr'=>$abbr);
    add_party($array);
}

if(isset($_POST['updateprofile'])){
    $photo=$_FILES['pic'];
    $firstname=$_POST['firstname'];
    $middlename=$_POST['middlename'];
    $lastname=$_POST['lastname'];
    $array=array('profile'=>$photo,'first'=>$firstname,'middle'=>$middlename,'last'=>$lastname);
    include 'function.php';
    updateProfile($array);
}
if(isset($_POST['getuserprofile'])){
    include 'function.php';
    echo json_encode(getProfile());
}

if(isset($_POST['upgrade'])){
    $position=$_POST['position'];
    $about=htmlentities($_POST['aboutme']);
    $manifesto=htmlentities($_POST['manifesto']);
    $party=$_POST['party'];
    include 'function.php';
    $array=array('about'=>$about,'position'=>$position,'manifesto'=>$manifesto,'party'=>$party);
    var_dump(upgrade($array));
}