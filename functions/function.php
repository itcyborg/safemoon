<?php
@session_start();
/**
 * Created by PhpStorm.
 * User: PAVILION 15
 * Date: 2/28/2017
 * Time: 6:19 PM
 */
/**
 * TODO create 4 accounts: @admin,@user
 * @admin   - create/delete pages for aspirants
 *          - view/approve transactions
 *
 * @user    - view aspirant's profile
 *          - comment
 *          - vote
 *          - views(no of views)
 */


/**
 * @param $array
 * role type    1: admin
 *              2: aspirant
 *              3: user
 */
function createAccount($array)
{
    $type = $array['type'];
    $role = null;
    if ($type == "admin") {
        $role = 1;
    } elseif ($type == "aspirant") {
        $role = 2;
    } else {
        $role = 3;
    }
    $email = $array['email'];
    $username = $array['username'];
    $userid = generateID();
    $password = passHash($array['password']);
    $contact = $array['contact'];
    include "putRecords.php";
    $sql = "INSERT INTO users(UserID,Email,Username,Password,Contact,Role,Shared) VALUES ('" . $userid . "','" . $email . "','" . $username . "','" . $password . "','" . $contact . "','" . $role . "','1')";
    if (put($sql)) {

    }
}

function add_party($array)
{
    $partyid = "P" . generateID();
    $sql = "INSERT INTO parties(PartyID,PartyName,PartyABR,Patron) VALUES ('" . $partyid . "','" . $array['name'] . "','" . $array['abbr'] . "','" . $array['patron'] . "')";
    include 'putRecords.php';
    $result = put($sql);
    var_dump($result);
}

function generateID()
{
    $idKkeyspace = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ123456789';
    $length = 6;
    $idstr = array();
    $max = strlen($idKkeyspace) - 1;
    for ($i = 0; $i < $length; ++$i) {
        $n = rand(0, $max);
        $idstr[] = $idKkeyspace[$n];
    }

    return implode($idstr);
}

function login($array)
{
    $email = $array['email'];
    $password = $array['password'];
    $sql = "SELECT * FROM users WHERE Email='" . $email . "'";
    include 'getRecords.php';
    $result = getRecord($sql);

    if ($result->num_rows > 0) {
        $rows = $result->fetch_assoc();
        $hash = $rows['Password'];
        if (passVerify($password, $hash)) {
            $_SESSION['userid']=$rows['UserID'];
            header("location:../users/adm/dashboard.php");
            getTotalUsers();
        } else {
            echo "failed";
        }
    }
}

function updateProfile($array)
{
    $path = $array['profile']['name'];
    $file=$array['profile']["tmp_name"];
    $ext = pathinfo($path, PATHINFO_EXTENSION);

    $target_dir="../uploads/profiles/";
    $filename="F".$_SESSION['userid'];
    $userid=$_SESSION['userid'];
    $target_file=$target_dir.$filename.".".$ext;
    $sql = "INSERT INTO profile (FirstName, MiddleName, LastName, UserID, ProfilePic,Ext) VALUES ('".$array['first']."','".$array['middle']."','".$array['last']."','".$userid."','".$filename."','".$ext."')";
    include 'putRecords.php';
    $results=put($sql);
    var_dump($results);
    if(move_uploaded_file($file,$target_file)){
        if(file_exists($target_file)){
            $msg="The file has been uploaded";
            $success=true;
        }else{
            $msg="The file has not been uploaded";
            $success=false;
        }
    }else{
        $success=false;
        $msg="the file has not been uploaded";
    }
    echo $msg;
}

function viewProfile($userid)
{
    $sql = "SELECT * FROM pages where id='" . $userid . "'";
    include 'getRecords.php';
    $result = getRecord($sql);
    $array = array();
}

function passHash($password)
{
    $options = [
        'cost' => 12
    ];
    return password_hash($password, PASSWORD_DEFAULT, $options);
}

function passVerify($pass, $hash)
{
    if (password_verify($pass, $hash)) {
        return true;
    } else {
        return false;
    }
}

function getTotalUsers()
{
    $sql = "SELECT * FROM users WHERE Role!=1";
    include 'getRecords.php';
    $result = getRecord($sql);
    return $result->num_rows;
}

function getProfile(){
    $userid=$_SESSION['userid'];
    $sql="SELECT * FROM profile WHERE UserID='".$userid."'";
    include 'getRecords.php';
    $result=getRecord($sql);
    $path="../../uploads/profiles/";
    $row=$result->fetch_assoc();
    $response=array('photo'=>$path.$row['ProfilePic'].".".$row['Ext'],'first'=>$row['FirstName'],'middle'=>$row['MiddleName'],'last'=>$row['LastName']);
    return $response;
}