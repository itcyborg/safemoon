<?php
session_start();
/**
 * Created by PhpStorm.
 * User: PAVILION 15
 * Date: 2/28/2017
 * Time: 6:19 PM
 */
/**
 * TODO create 4 accounts: @admin,@user
 * @admin   - create/delete pages for aspirants.php
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
            $role=$rows['Role'];
            $_SESSION['role']=$role;
            if($role==1){
                header("location:../users/adm/dashboard.php");
            }elseif ($role==2){
                header("location:../users/aspirant/dashboard.php");
            }elseif ($role==3){
                header("location:../users/public/dashboard.php");
            }else{
                header("location:../views/error.php?error=true&code=A1&message=unexpected servererror.Contact admin.");
            }
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

function upgrade($array){
    $position=$array['position'];
    $party=$array['party'];
    $about=$array['about'];
    $manifesto=$array['manifesto'];
    $userid=$_SESSION['userid'];
    $sql="INSERT INTO aspirants(UserID,About,Party,Position,Manifesto) VALUES ('".$userid."','".$about."','".$party."','".$position."','".$manifesto."')";
    include "putRecords.php";
    $result=put($sql);
    return $result;
}

function viewAspirant($id){
    $sql  = 'SELECT aspirants.php.*,profile.*,aspirants.php.* FROM aspirants.php JOIN profile ON aspirants.php.UserID=profile.UserID JOIN aspirants.php ON aspirants.php.UserID=aspirants.php.UserID WHERE aspirants.php.UserID="'.$id.'"';
    include "getRecords.php";
    $result=getRecord($sql);
    return $result;
}

function getParties(){
    $sql="SELECT PartyName FROM parties";
    include 'getRecords.php';
    $result=getRecord($sql);
    $output= array();
    while($rows=$result->fetch_assoc()){
        $output=array_merge_recursive($output,array('output'=>$rows['PartyName']));
    }
    return json_encode($output);
}

function getCounties(){
    $sql="SELECT * FROM counties";
    include 'getRecords.php';
    $result=getRecord($sql);
    $output= "";
    while($rows=$result->fetch_assoc()){
        $output.="<option value='".$rows['id']."'>".$rows['county_name']."</option>";
    }
    return $output;
}
function getConstituencies($id){
    $sql="SELECT DISTINCT name FROM subcounties WHERE county_id='".$id."'";
    include 'getRecords.php';
    $result=getRecord($sql);
    $output= "";
    while($rows=$result->fetch_assoc()){
        $output.="<option value='".$rows['name']."'>".$rows['name']."</option>";
    }
    return $output;
}
function getWards($id){
    $sql="SELECT * FROM subcounties WHERE name='".$id."'";
    include 'getRecords.php';
    $result=getRecord($sql);
    $output= "";
    while($rows=$result->fetch_assoc()){
        $output.="<option value='".$rows['ward']."'>".$rows['ward']."</option>";
    }
    return $output;
}

function getAspirants($id){
    if($id!=""){
        $sql="SELECT * FROM aspirants WHERE Status='".$id."'";
    }
    $sql="SELECT * FROM aspirants";
    include "getRecords.php";
    $result=getRecord($sql);
    return $result;
}

function change_acc_status($id,$action){
    $sql="UPDATE aspirants SET Status='".$action."' WHERE UserID='".$id."'";
    include "putRecords.php";
    return put($sql)['status'];
}
