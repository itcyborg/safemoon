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
    $about=mysql_real_escape_string($_POST['aboutme']);
    $manifesto=mysql_real_escape_string($_POST['manifesto']);
    $party=$_POST['party'];
    include 'function.php';
    $array=array('about'=>$about,'position'=>$position,'manifesto'=>$manifesto,'party'=>$party);
    var_dump(upgrade($array));
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
        if($row['Status']==1){
            $status="<div class='btn btn-success btn-sm disabled'>Enabled</div>";
        }elseif ($row['Status']==3){
            $status="<div class='btn btn-danger disabled btn-sm'>Deactivated</div>";
        }elseif ($row['Status']==0){
            $status="<div class='btn btn-warning disabled btn-sm'>Pending</div>";
        }
        $output.="<tr>
                    <td>".$row['UserID']."</td>
                    <td>".$row['Party']."</td>
                    <td>".$row['Position']."</td>
                    <td>
                        <button class='btn btn-primary btn-sm' data-toggle=\"collapse\" data-target='#about".$row['UserID']."'>About</button>
                        <div id='about".$row['UserID']."' class=\"collapse\">
                            ".$row['About']."
                        </div>
                    </td>
                    <td>
                        <button class='btn btn-primary btn-sm' data-toggle=\"collapse\" data-target='#manifesto".$row['UserID']."'>Manifesto</button>
                        <div id='manifesto".$row['UserID']."' class=\"collapse\">
                            ".$row['Manifesto']."
                        </div>
                    </td>
                    <td>".$status."</td>
                   </tr>";
    }
    echo $output;
}