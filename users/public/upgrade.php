<?php
@session_start();
if($_SESSION['role']!=3){
    header("location:../../views/error.php?error=true&code=A2&message=Authorisation Error. Access restricted.");
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
    <link rel="icon" type="image/png" href="....//assets/img/favicon.png"/>
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
            <a href="http://www.creative-tim.com" class="simple-text">
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
                    <a href="profile.php">
                        <i class="material-icons">person</i>
                        <p>User Profile</p>
                    </a>
                </li>
                <li>
                    <a href="messages.php">
                        <i class="material-icons">forum</i>
                        <p>Messages</p>
                    </a>
                </li>
                <li class="active">
                    <a href="upgrade.php">
                        <i class="material-icons">unarchive</i>
                        <p>Upgrade to Aspirant</p>
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
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="card">
                        <div class="card-header card-profile">Add Info</div>
                        <div class="card-description" id="status"></div>
                        <div class="card-content">
                            <form action="../../functions/constructor.php" method="post">
                                <div class="col-md-12">
                                    <div class="col-md-6">
                                        <select class="form-control" name="party" id="party">
                                            <option>Select Party</option>
                                            <div id="party"></div>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <select class="form-control" name="position" id="position">
                                            <option>Select Position</option>
                                            <option value="president">President</option>
                                            <option value="senator">Senator</option>
                                            <option value="governor">Governor</option>
                                            <option value="wrep">Women Representative</option>
                                            <option value="mp">Member of Parliament</option>
                                            <option value="ward">Ward Representative</option>2
                                        </select>
                                    </div>
                                </div>
                                <div id="countyinfo" class="col-md-12">
                                    <div class="col-md-4 col-lg-4 col-sm-12">
                                        <select class="form-control" name="county" id="county">
                                            <option>Select County</option>
                                        </select>
                                    </div>

                                    <div class="col-md-4 col-lg-4 col-sm-12">
                                        <select class="form-control" name="constituency" id="constituency">
                                            <option>Select Constituency</option>
                                        </select>
                                    </div>

                                    <div class="col-md-4 col-lg-4 col-sm-12">
                                        <select class="form-control" name="ward" id="ward">
                                            <option>Select Ward</option>
                                        </select>
                                    </div>
                                    <div class="col-md-12 col-lg-12 col-sm-12">
                                        <input type="text" class="form-control" name="agent" id="agent" placeholder="Name of Referring agent if any.">
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12 col-lg-6">
                                    <div class="card">
                                        <div class="card-header">About</div>
                                        <div class="card-content">
                                            <textarea id="aboutme" name="aboutme"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12 col-lg-6">
                                    <div class="card">
                                        <div class="card-header">Manifesto</div>
                                        <div class="card-content">
                                            <textarea id="manifesto" name="manifesto"></textarea>
                                        </div>
                                    </div>
                                </div>
                                <button name="upgrade" class="btn btn-primary pull-right">Submit</button>
                            </form>
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

<!-- Add CKEditor-->
<script src="../../assets/ckeditor/ckeditor.js"></script>

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
    $(document).ready(function () {
        getcounts();

        CKEDITOR.replace('manifesto');
        CKEDITOR.replace('aboutme');

        // Javascript method's body can be found in assets/js/demos.js
        demo.initDashboardPageCharts();
        $('#county,#constituency,#ward').hide();

        $.ajax({
            url: '../../functions/constructor.php',
            data: 'getparty',
            type: 'POST',
            dataType: 'JSON',
            beforeSend: function () {
                $('#status').html("Loading");
            },
            success: function (data) {
                $('#status').html("");
                var output=JSON.stringify(data.output).replace("[","").replace("]","").replace(/"/g,"");
                var d=output.split(",");
                var len=d.length;
                for(var i=0;i<len;i++){
                    $('#party').append("<option>"+d[i]+"</option>")
                }
            }
        });

        $('#position').change(function(){
            var position=$('#position').val();
            if(position=="governor" || position=="senator" || position=="wrep" || position=="mca" || position=="mp" || position=="ward"){
                $.ajax({
                    url:    '../../functions/constructor.php',
                    data:   'getCounties',
                    type:   'POST',
                    beforeSend:function(){
                        $('#status').html("Fetching counties");
                    },
                    success:function(data){
                        $('#status').html("done");
                        $('#county').show();
                        $('#county').append(data);
                    }
                });
            }else if(position=="president"){
                $('#county,#constituency,#ward').html("<option>Select County</option>").hide();
            }
        });

        $('#county').change(function(){
            var position=$('#position').val();
            var county=$('#county').val();
            if(position=="mp" || position=="ward"){
                $('#constituency').show();
                $.ajax({
                    url:    '../../functions/constructor.php',
                    data:   {
                        'getconstituencies':1,
                        'id': county
                    },
                    type:   'POST',
                    beforeSend:function(){
                        $('#status').html("Fetching consituencies");
                    },
                    success:function(data){
                        $('#status').html("done");
                        $('#constituency').html("<option>Select Constituency</option>"+data);
                    }
                });
            }
        });
        $('#constituency').change(function(){
           var consituency=$('#constituency').val();
           if(position="ward") {
               $('#ward').show();
               $.ajax({
                   url: '../../functions/constructor.php',
                   data: {
                       'getwards': 1,
                       'id': consituency
                   },
                   type: 'POST',
                   beforeSend: function () {
                       $('#status').html("Fetching wards");
                   },
                   success: function (data) {
                       $('#status').html("done");
                       $('#ward').html("<option>Select Ward</option>" + data);
                   }
               });
           }
        });
    });
</script>

</html>
