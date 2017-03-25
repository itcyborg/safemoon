<?php
@session_start();
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
    $color = $_POST['color'];
    $array = array('name' => $name, 'patron' => $patron, 'abbr' => $abbr, 'color' => $color);
    add_party($array);
}

if(isset($_POST['updateprofile'])){
    $photo=$_FILES['pic'];
    $firstname=$_POST['firstname'];
    $middlename=$_POST['middlename'];
    $lastname=$_POST['lastname'];
    $twitter=$_POST['twitter'];
    $userid=$_POST['userid'];
    $array=array('profile'=>$photo,'first'=>$firstname,'middle'=>$middlename,'last'=>$lastname,'twitter'=>$twitter,'userid'=>$userid);
    include 'function.php';
    updateProfile($array);
}

if(isset($_POST['getuserprofile'])){
    include 'function.php';
    echo json_encode(getProfile());
}

if(isset($_POST['upgrade'])){
    $position=$_POST['position'];
    $location = $_POST['location'];
    $about=mysql_real_escape_string($_POST['aboutme']);
    $manifesto=mysql_real_escape_string($_POST['manifesto']);
    $party=$_POST['party'];
    $county=trim($_POST['county']);
    $constituency=trim($_POST['constituency']);
    $ward=trim($_POST['ward']);
    $agent=trim($_POST['agent']);
    include 'function.php';
    $array=array(
        'about'=>$about,
        'position'=>$position,
        'manifesto'=>$manifesto,
        'party'=>$party,
        'county'=>$county,
        'constituency'=>$constituency,
        'ward'=>$ward,
        'agent' => $agent,
        'location' => $location
    );
    upgrade($array);
    header('location:../users/public/payment.php');
}

if(isset($_POST['getparty'])){
    include 'function.php';
    echo getParties();
}

if(isset($_POST['getCounties'])){
    include 'function.php';
    echo getCounties();
}

if(isset($_POST['getconstituencies'])){
    $id=$_POST['id'];
    include "function.php";
    echo getConstituencies($id);
}

if(isset($_POST['getwards'])){
    $constituency=$_POST['id'];
    include "function.php";
    echo getWards($constituency);
}

if(isset($_POST['getaspirants'])){
    include "function.php";
    $cat=$_POST['category'];
    $type="";
    if($cat=="all"){
    }elseif ($cat=="activated"){
        $type="1";
    }elseif ($cat=="deactivated"){
        $type="3";
    }elseif ($cat=="pending"){
        $type="0";
    }
    $result=getAspirants($type);
    $output="";
    while($row=$result->fetch_assoc()){
        $id=$row['UserID'];
        $cid='acc_action'.$id;
        if($row['Status']==1){
            $status="<div class='btn btn-success btn-sm disabled'>Enabled</div>";
        }elseif ($row['Status']==3){
            $status="<div class='btn btn-danger btn-sm disabled'>Deactivated</div>";
        }elseif ($row['Status']==0){
            $status="<div class='btn btn-warning btn-sm disabled'>Pending</div>";
        }
        $output.="<tr>
                    <td>".$row["UserID"]."</td>
                    <td>".$row["Party"]."</td>
                    <td>".$row['Position']."</td>
                    <td>
                        <button class='btn btn-primary btn-sm' data-toggle='collapse' data-target='#about".$row['UserID']."'>About</button>
                        <div id='about".$row["UserID"]."' class='collapse'>
                            ".$row['About']."
                        </div>
                    </td>
                    <td>
                        <button class='btn btn-primary btn-sm' data-toggle='collapse' data-target='#manifesto".$row['UserID']."'>Manifesto</button>
                        <div id='manifesto".$row['UserID']."' class='collapse'>
                            ".$row['Manifesto']."
                        </div>
                    </td>
                    <td>".$status."</td>
                    <td><select class='form-control' id='".$cid."' onchange='acc_change(\"".$id."\")'><option value='none'>Select Action</option>
                    <option value='activate'>Activate</option>
                    <option value='deactivate'>Deactivate</option>
                    <option value='message'>Send Message</option></select></td>
                   </tr>";
    }
    echo $output;
}

if(isset($_POST['modifyaccount'])){
    $action=$_POST['account'];
    $id=$_POST['id'];
    include 'function.php';
    if($action=="activate"){
        $res=change_acc_status($id,1);
        if($res){
            echo "Success";
        }else{
            echo "Failed";
        }
    }elseif ($action=="deactivate"){
        $res=change_acc_status($id,3);
        if($res){
            echo "Success";
        }else{
            echo "Failed";
        }
    }elseif ($action=="message"){

    }else{
        echo 'unknown';
    }
}

if(isset($_POST['welcomemsg'])){
    $file=fopen('../uploads/welcome/welcome.txt','w') or die("Failed to create file");
    $txt=$_POST['message'];
    fwrite($file,$txt);
    fclose($file);
}

if(isset($_POST['getchatusers'])){
    include "function.php";
    $res=getchatusers();
    $count=$res->num_rows;
    $output="";
    $users=array();
    if($count<1){
        echo 'No existing chats';
    }else{
        while($row=$res->fetch_assoc()){
            if(in_array($row['UserID'],$users)){

            }else {
                $output .= "<li onclick='getmessages(\"" . $row['UserID'] . "\")' class='list-group-item'><div class='media'>
                <div class='media-body'>
                <h4 class='media-heading'>" . $row['Username'] . "<small> | <i>" . $row['Email'] . "</i></small></h4></li>";
                array_push($users,$row['UserID']);
            }
        }
        echo $output;
    }
}

if(isset($_POST['getchatmessages'])){
    $sender=$_SESSION['userid'];
    $recipient=$_POST['id'];
    include "function.php";
    $res=getchatmessages($sender,$recipient);
    $output="";
    while ($row=$res->fetch_assoc()){
        if($row['Sender']===$sender){
            if($sender==$_SESSION['userid']){
                $se="You";
            }
            $output.="<div class='media col-md-10 col-md-offset-2 alert alert-default'>
                  <div class='col-md-12 text-right text-primary'>
                    <i class='text-right'>".$se."</i>
                  </div>
                  <div class='media-body text-right text-success'>
                    <p>".html_entity_decode($row['Message'])."</p>
                  </div>
                </div>";
        }else{
            $output.="<div class='media col-md-10 alert alert-warning'>
                  <div class='col-md-12 text-primary'>
                        ".$row['Username']."    
                  </div>
                  <div class='media-body'>
                    <p>".$row['Message']."</p>
                  </div>
                </div>";
        }
    }
    echo $output;
}

if(isset($_POST['sendmessage'])){
    $msg=htmlentities($_POST['msg']);
    $to=$_POST['to'];
    $from=$_SESSION['userid'];
    include "function.php";
    $res=sendMessage($msg,$to,$from);
    var_dump($res);
}

if(isset($_POST['searchuser'])){
    $term=$_POST['data'];
    include "function.php";
    $res=searchuser($term);
    $output="";
    while($row=$res->fetch_assoc()){
        if($row['UserID']!=$_SESSION['userid']) {
            $output .= "<li onclick='getmessages(\"" . $row['UserID'] . "\")' class='list-group-item'><div class='media'>
        <div class='media-body'>
          <h4 class='media-heading'>" . $row['Username'] . "<small> | <i>" . $row['Email'] . " <small>(" . $row['UserID'] . ")</small></i></small></i></h4></li>";
        }
    }
    echo $output;
}

if(isset($_POST['getcount'])){
    if(isset($_POST['messages']) && isset($_POST['notifications'])){
        include "function.php";
        $res=getcounts();
        echo json_encode($res);
    }
}

if(isset($_POST['makepayment'])){
    $amount=$_POST['amount'];
    $transactionid=$_POST['transactionid'];
    $phone=$_POST['phone'];
    include "function.php";
    $result=paymentNotification(array('phone'=>$phone,'transactionid'=>$transactionid,'amount'=>$amount));
    echo $result;
}

if(isset($_GET['getpayments'])){
    $output = "";
    if(isset($_SESSION['role'])==1) {
        include "function.php";
        $result = viewTransactions();
        while ($row = $result->fetch_assoc()) {
            $output .= "
        <tr>
        <td>" . $row['Payer'] . "</td>
        <td>" . $row['TransactionID'] . "</td>
        <td>" . $row['Position'] . "</td>
        <td>" . $row['TimeStamp'] . "</td>
</tr>           
        ";
        }
    } else {
        $output = "NOT AUTHORISED";
    }
    echo $output;
}

if (isset($_POST['viewaspirants'])) {
    include "function.php";
    $result = getAspirants("1");
    while ($row = $result->fetch_assoc) {
        echo $row['Position'];
    }
}