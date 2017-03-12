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
        include "../libs/PHPMailer/PHPMailerAutoload.php";


        //Create a new PHPMailer instance

        $mail = new PHPMailer;

        // Set PHPMailer to use the sendmail transport
        $mail->isSendmail();

        //Set who the message is to be sent from

        $mail->setFrom('admin@safemoon.com', 'Admin');

        //Set an alternative reply-to address

        $mail->addReplyTo('admin@safemoon.com', 'Admin');

        //Set who the message is to be sent to

        $mail->addAddress($email, $username);

        //Set the subject line

        $mail->Subject = 'Welcome';

        //Read an HTML message body from an external file, convert referenced images to embedded,

        //convert HTML into a basic plain-text alternative body
        $file=fopen("../uploads/welcome/welcome.txt",'r');
        $txt=fread($file,filesize("../uploads/welcome/welcome.txt"));

        //add the params to the msg
        $msg=strtr ($txt, array ('[logo]'=>'<img src="../uploads/logo.jpg">','[sitename]' => 'Safemoon.com','[username]'=>$username,'[email]'=>$email,'[contact]'=>$contact,'[admin]'=>'Admin','[aemail]'=>'admin@safemoon.com'));

        //$mail->msgHTML(file_get_contents('contents.html'), dirname(__FILE__));
        $mail->msgHTML($msg);
        //Replace the plain text body with one created manually

        $mail->AltBody =html_entity_decode(strip_tags($msg)) ;

        //$mail->addAttachment('images/phpmailer_mini.png');


        //send the message, check for errors

        if (!$mail->send()) {

            //echo "Mailer Error: " . $mail->ErrorInfo;

        } else {

            //echo "Message sent!";

        }
        $_SESSION['firsttime']=true;
        login(array('email'=>$email,'password'=>$array['password']));
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
            $_SESSION['userid'] = $rows['UserID'];
            $role = $rows['Role'];
            $_SESSION['role'] = $role;
            if ($role == 1) {
                header("location:../users/adm/dashboard.php");
            } elseif ($role == 2) {
                $twitter=twitter();
                $_SESSION['twitter']=$twitter;
                header("location:../users/aspirant/dashboard.php");
            } elseif ($role == 3) {
                header("location:../users/public/dashboard.php");
            } else {
                header("location:../views/error.php?error=true&code=A1&message=unexpected servererror.Contact admin.");
            }
            getTotalUsers();
        } else {
            header("location:../views/error.php?error=true&code=Error&message=Wrong credentials");
        }
    }else{
        header("location:../views/error.php?error=true&code=Error&message=Wrong credentials");
    }
}

function updateProfile($array)
{
    $path = $array['profile']['name'];
    $file = $array['profile']["tmp_name"];
    $ext = pathinfo($path, PATHINFO_EXTENSION);

    $target_dir = "../uploads/profiles/";
    $filename = "F" . $_SESSION['userid'];
    $userid = $array['userid'];
    $target_file = $target_dir . $filename . "." . $ext;
    $sql = "INSERT INTO profile (FirstName, MiddleName, LastName, UserID, ProfilePic,Ext,Twitter) VALUES ('" . $array['first'] . "','" . $array['middle'] . "','" . $array['last'] . "','" . $userid . "','" . $filename . "','" . $ext . "','".$array['twitter']."')";
    include 'putRecords.php';
    $results = put($sql);
    if(!$results['status']){
        $sql="UPDATE profile SET FirstName='".$array['first']."', MiddleName='".$array['middle']."',LastName='".$array['last']."',Twitter='".$array['twitter']."' WHERE UserID='".$userid."'";
        $res=put($sql);
    }
    if (move_uploaded_file($file, $target_file)) {
        if (file_exists($target_file)) {
            $msg = "The file has been uploaded";
            $success = true;
        } else {
            $msg = "The file has not been uploaded";
            $success = false;
        }
    } else {
        $success = false;
        $msg = "the file has not been uploaded";
    }
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

function getProfile()
{
    $userid = $_SESSION['userid'];
    $sql = "SELECT * FROM profile WHERE UserID='" . $userid . "'";
    include 'getRecords.php';
    $result = getRecord($sql);
    $path = "../../uploads/profiles/";
    $row = $result->fetch_assoc();
    $response = array('photo' => $path . $row['ProfilePic'] . "." . $row['Ext'], 'first' => $row['FirstName'], 'middle' => $row['MiddleName'], 'last' => $row['LastName'],'twitter'=>$row['Twitter']);
    return $response;
}

/**
 * @param $array
 * @return array
 */
function upgrade($array)
{
    $position = $array['position'];
    $party = $array['party'];
    $about = $array['about'];
    $manifesto = $array['manifesto'];
    $userid = $_SESSION['userid'];
    $sql = "INSERT INTO aspirants(UserID,About,Party,Position,Manifesto) VALUES ('" . $userid . "','" . $about . "','" . $party . "','" . $position . "','" . $manifesto . "')";
    include "putRecords.php";
    $result = put($sql);

    //get other relevant fields
    $sql="";
    switch ($position){
        case "president":
            $sql="INSERT INTO presidential(UserID) VALUES ('".$userid."')";
            break;
        case "governor":
            $county=$array['county'];
            $sql="INSERT INTO governor(UserID,County) VALUES ('".$userid."','".$county."') ";
            break;
        case "senator":
            $county=$array['county'];
            $sql="INSERT INTO  senator(UserId,County) VALUES ('".$userid."','".$county."')";
            break;
        case "wrep":
            $county=$array['county'];
            $sql="INSERT INTO  wrep(UserID,County) VALUES ('".$userid."','".$county."')";
            break;
        case "mp":
            $county=$array['county'];
            $constituency=$array['constituency'];
            $sql="INSERT INTO  mps(UserID,County,Constituency) VALUES ('".$userid."','".$county."','".$constituency."')";
            break;
        case "mca":
            $county=$array['county'];
            $constituency=$array['constituency'];
            $ward=$array['ward'];
            $sql="INSERT INTO  mca(UserID,County,Constituency,Ward) VALUES ('".$userid."','".$county."','".$constituency."','".$ward."')";
            break;
    }
    var_dump(put($sql));
    return $result;
}

function viewAspirant($id)
{
    $sql = 'SELECT users.*,profile.*,aspirants.* FROM aspirants JOIN profile ON aspirants.UserID=profile.UserID JOIN users ON users.UserID=aspirants.UserID WHERE aspirants.UserID="' . $id . '"';
    include "getRecords.php";
    $result = getRecord($sql);
    return $result;
}

function getParties()
{
    $sql = "SELECT PartyName FROM parties";
    include 'getRecords.php';
    $result = getRecord($sql);
    $output = array();
    while ($rows = $result->fetch_assoc()) {
        $output = array_merge_recursive($output, array('output' => $rows['PartyName']));
    }
    return json_encode($output);
}

function getCounties()
{
    $sql = "SELECT * FROM counties";
    include 'getRecords.php';
    $result = getRecord($sql);
    $output = "";
    while ($rows = $result->fetch_assoc()) {
        $output .= "<option value='" . $rows['id'] . "'>" . $rows['county_name'] . "</option>";
    }
    return $output;
}

function getConstituencies($id)
{
    $sql = "SELECT DISTINCT name FROM subcounties WHERE county_id='" . $id . "'";
    include 'getRecords.php';
    $result = getRecord($sql);
    $output = "";
    while ($rows = $result->fetch_assoc()) {
        $output .= "<option value='" . $rows['name'] . "'>" . $rows['name'] . "</option>";
    }
    return $output;
}

function getWards($id)
{
    $sql = "SELECT * FROM subcounties WHERE name='" . $id . "'";
    include 'getRecords.php';
    $result = getRecord($sql);
    $output = "";
    while ($rows = $result->fetch_assoc()) {
        $output .= "<option value='" . $rows['ward'] . "'>" . $rows['ward'] . "</option>";
    }
    return $output;
}

function getAspirants($id)
{
    if ($id != "") {
        $sql = "SELECT * FROM aspirants WHERE Status='" . $id . "'";
    }else {
        $sql = "SELECT * FROM aspirants";
    }
    include "getRecords.php";
    $result = getRecord($sql);
    return $result;
}

function change_acc_status($id, $action)
{
    $sql = "UPDATE aspirants SET Status='" . $action . "' WHERE UserID='" . $id . "'";
    if($_SESSION['role']==1){
        $initiator="Admin";
    }else{
        $initiator=$_SESSION['userid'];
    }
    if($action==1){
        $ac="activated";
    }elseif($action==3){
        $ac="deactivated";
    }
    $sql1="INSERT INTO notifications(Initiator,Intended,Notification) VALUES ('".$initiator."','".$id."','Your account has been ".$ac." ')";
    include "putRecords.php";
    if($_SESSION['userid']!=$id) {
        put($sql1);
    }
    return put($sql)['status'];
}

function getchatusers(){
    $sender=$_SESSION['userid'];
    $sql="SELECT DISTINCT users.*,messages.* FROM messages INNER JOIN users ON users.UserID=messages.Sender WHERE messages.Recepient='".$sender."'";
    include "getRecords.php";
    $result=getRecord($sql);
    return $result;
}

function getchatmessages($sender,$recipient){
    $sql="SELECT messages.*,users.* FROM messages INNER JOIN users ON users.UserID=messages.Sender WHERE Sender='".$sender."' && Recepient='".$recipient."' || Sender='".$recipient."' && Recepient='".$sender."'";
    include "getRecords.php";
    $result=getRecord($sql);
    $sql="UPDATE messages SET MessageRead='1' WHERE Recepient='".$recipient."'";
    include "putRecords.php";
    put($sql);
    return $result;
}

function sendMessage($msg,$to,$from){
    include "putRecords.php";
    $sql="INSERT INTO messages (Sender,Recepient,Message) VALUES ('".$from."','".$to."','".$msg."')";
    $result=put($sql);
    return $result;
}

function searchuser($term){
    $sql="SELECT * FROM users WHERE Username LIKE '%".$term."%' || Email LIKE '%".$term."%' || Contact LIKE '%".$term."%'";
    include "getRecords.php";
    $result=getRecord($sql);
    return $result;
}

function getcounts(){
    include "getRecords.php";
    $user=$_SESSION['userid'];
    $sql="SELECT messages.*,users.* FROM messages JOIN users ON users.UserID=messages.Recepient WHERE Recepient='".$user."' && MessageRead='0'";
    $result=getRecord($sql);
    $msgoutput="";
    while($row=$result->fetch_assoc()){
        $msgoutput.="<li><a href='messages.php'><p>".$row['Message']."</p><small>".$row['Email']."</small></a></li>
        <hr>";
    }
    $msgcount=$result->num_rows;
    $sql="SELECT * FROM notifications WHERE Intended='".$user."' && Seen='0'";
    $res=getRecord($sql);
    $ntfcount=$res->num_rows;
    $notifout="";
    if($ntfcount>0) {
        while ($rows = $res->fetch_assoc()) {
            $notifout .= "<li><a href='#'><p>" . $row['Notification'] . "</p></a></li>";
        }
    }
    return array('messages'=>$msgcount,'notifications'=>$ntfcount,'msg'=>$msgoutput,'notif'=>$notifout);
}

function twitter(){
    $userid=$_SESSION['userid'];
    $sql="SELECT Twitter from profile WHERE UserID='".$userid."'";
    $res=getRecord($sql);
    return $res->fetch_assoc()['Twitter'];
}