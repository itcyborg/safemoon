<?php
@session_start();
if ($_SESSION['role'] != 1) {
    header("location:../../views/error.php?error=true&code=A2&message=Authorisation Error. Access restricted.");
}
$sql = "SELECT payments.*,aspirants.* FROM payments INNER JOIN aspirants ON aspirants.UserID=payments.UserID";
include "../../system/conn.php";
$result = $conn->query($sql);
$output = "";
while ($row = $result->fetch_assoc()) {
    $id = $row['UserID'];
    $action = "Verify Payment";
    if ($row['Status'] == 1) {
        $action = "Verified";
    }
    $output .= "
        <tr>
        <td>0" . $row['Payer'] . "</td>
        <td>" . strtoupper($row['TransactionID']) . "</td>
        <td>" . $row['Position'] . "</td>
        <td>" . $row['TimeStamp'] . "</td>
        <td>
            <button class='btn btn-primary' onclick='verify(\"" . $id . "\")'>" . $action . "</button>
        </td>
</tr>           
        ";
}
/**
 * Created by PhpStorm.
 * User: itcyb
 * Date: 3/3/2017
 * Time: 9:12 AM
 */
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="apple-touch-icon" sizes="76x76" href="../../assets/img/apple-icon.png"/>
    <link rel="icon" type="image/png" href="../../assets/img/favicon.png"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

    <title>Safemoon</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width"/>

    <!-- Bootstrap core CSS     -->
    <link href="../../assets/css/bootstrap.min.css" rel="stylesheet"/>

    <!--  Material Dashboard CSS    -->
    <link href="../../assets/css/material-dashboard.css" rel="stylesheet"/>

    <!--  CSS for Demo Purpose, don't include it in your project     -->
    <link href="../../assets/css/demo.css" rel="stylesheet"/>

    <!--     Fonts and icons     -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Roboto:400,700,300|Material+Icons' rel='stylesheet'
          type='text/css'>
</head>

<body>

<div class="wrapper">

    <div class="sidebar" data-color="purple" data-image="../../assets/img/sidebar-1.jpg">
        <!--
Tip 1: You can change the color of the sidebar using: data-color="purple | blue | green | orange | red"

            Tip 2: you can also add an image using data-image tag
-->

        <div class="logo">
            <a href="https://www.safemoon.com" class="simple-text">
                Safemoon
            </a>
        </div>

        <div class="sidebar-wrapper">
            <ul class="nav">
                <li>
                    <a href="dashboard.php">
                        <i class="material-icons">dashboard</i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <li>
                    <a target="_blank" href="https://webmail.safemoon.com/">
                        <i class="material-icons">email</i>
                        <p>Email&nbsp; <span class="fa fa-external-link"></span></p>
                    </a>
                </li>
                <li>
                    <a href="profile.php">
                        <i class="material-icons">person</i>
                        <p>User Profile</p>
                    </a>
                </li>
                <li>
                    <a href="aspirants.php">
                        <i class="material-icons">people</i>
                        <p>Aspirants</p>
                    </a>
                </li>
                <li class="active">
                    <a href="payments.php">
                        <i class="material-icons">account_balance_wallet</i>
                        <p>Payments</p>
                    </a>
                </li>
                <li>
                    <a href="parties.php">
                        <i class="material-icons">group add</i>
                        <p> &nbsp;&nbsp;Parties</p>
                    </a>
                </li>
                <li>
                    <a href="messages.php">
                        <i class="material-icons">forum</i>
                        <p>Messages</p>
                    </a>
                </li>
                <li>
                    <a href="welcome_msg.php">
                        <i class="material-icons">sms</i>
                        <p>Welcome Message</p>
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-transparent navbar-absolute">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Material Dashboard</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="material-icons">dashboard</i>
                                <p class="hidden-lg hidden-md">Dashboard</p>
                            </a>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="material-icons">sms</i>
                                <span class="notification" id="msgcount1">0</span>
                                <p class="hidden-lg hidden-md">Notifications</p>
                            </a>
                            <ul class="dropdown-menu" id="msgbody">
                                <li class="disabled"><a href="#">No new Messages</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="material-icons">notifications</i>
                                <span class="notification">0</span>
                                <p class="hidden-lg hidden-md">Notifications</p>
                            </a>
                            <ul class="dropdown-menu" id="notifbody">
                                <li class="disabled"><a href="#"> No new Notifications</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#pablo" class="dropdown-toggle" data-toggle="dropdown">
                                <i class="material-icons">person</i>
                                <p class="hidden-lg hidden-md">Profile</p>
                            </a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="../../functions/logout.php">
                                        <i class="material-icons">directions_run</i>
                                        <p>Logout</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="card">
                        <div class="card-header">Payments</div>
                        <div class="card-content">
                            <table id="paymentstbl" class="table table-responsive table-hover">
                                <thead>
                                    <tr>
                                        <th>Payer</th>
                                        <th>TransactionID</th>
                                        <th>Position</th>
                                        <th>Time</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="payments">
                                    <?php
                                    echo $output;
                                    ?>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">
            <div class="container-fluid">
                <nav class="pull-left">
                    <ul>
                        <li>
                            <a href="#">
                                Home
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Company
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Portfolio
                            </a>
                        </li>
                        <li>
                            <a href="#">
                                Blog
                            </a>
                        </li>
                    </ul>
                </nav>
                <p class="copyright pull-right">
                    &copy;
                    <script>document.write(new Date().getFullYear())</script>
                    <a href="http://www.creative-tim.com">Creative Tim</a>, made with love for a better web
                </p>
            </div>
        </footer>
    </div>
</div>

</body>

<!--   Core JS Files   -->
<script src="../../assets/js/jquery-3.1.0.min.js" type="text/javascript"></script>
<script src="../../assets/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../../assets/js/material.min.js" type="text/javascript"></script>

<!--  Charts Plugin -->
<script src="../../assets/js/chartist.min.js"></script>

<!--  Notifications Plugin    -->
<script src="../../assets/js/bootstrap-notify.js"></script>

<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js"></script>

<!-- Material Dashboard javascript methods -->
<script src="../../assets/js/material-dashboard.js"></script>

<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="../../assets/js/demo.js"></script>

<script src="../../assets/DataTables/datatables.js"></script>

<script type="text/javascript">
    function getcounts(){
        $.ajax({
            url     :   '../../functions/constructor.php',
            data    :   {
                'getcount':1,
                'messages':1,
                'notifications':1
            },
            dataType:   'JSON',
            type    :   'POST',
            beforeSend: function () {

            },
            success :   function (data) {
                $('#msgcount,#mscount,#messagecount,#msgcount1').html(data.messages);
                $('#notificationcount').html(data.notifications);
                $('#msgbody').html(data.msg);
                if(data.notif.trim()==""){
                    $('#notifbody').html("<li><a href='#'>No new notifications</a> </li>");
                }else {
                    $('#notifbody').html(data.notif);
                }
            }
        });
    }

    function verify(id) {
        $.ajax({
            url: '../../functions/constructor.php',
            data: {
                'modifyaccount': 1,
                'account': 'activate',
                'id': id
            },
            type: 'POST',
            beforeSend: function () {
            },
            success: function (data) {
                if (data == "Success") {
                } else {
                    alert(data);
                }
                getaspirantslist();
            }
        });
    }
    $(document).ready(function () {
        $('#paymentstbl').DataTable();
        getcounts();
        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();

        $.ajax({
            url: '../../functions/constructor.php',
            data: 'getuserprofile',
            type: 'POST',
            dataType:'JSON',
            beforeSend: function () {
            },
            success: function (data) {
                console.log(data);
                $('#pich').html('<img class="img-rounded img-responsive" src="'+data.photo+'">');
                $('#firstname').val(data.first);
                $('#middlename').val(data.middle);
                $('#lastname').val(data.last);
            }
        });

    });
</script>

</html>
