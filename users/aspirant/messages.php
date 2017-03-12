<?php
/**
 * Created by PhpStorm.
 * User: itcyb
 * Date: 3/7/2017
 * Time: 10:19 PM
 */
@session_start();
if($_SESSION['role']!=2){
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
            <a href="../../" class="simple-text">
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
                <li class="active">
                    <a href="messages.php">
                        <i class="material-icons">forum</i>
                        <p>Messages</p>
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
                        <div class="card-header">Messages</div>
                        <style>
                            #message-content{
                                min-height: 250px;
                                max-height: 350px;
                                overflow: auto;

                            }
                            #persons-content{
                                min-height: 250px;
                                height: 350px;
                                overflow: auto;
                            }
                        </style>
                        <div class="card-content">
                            <div class="col-lg-4 col-md-3 col-2">
                                <input type="text" onkeyup="searchuser()" class="col-md-12 form-control input-sm" placeholder="Search user" id="searchuser">
                                <div class="col-md-12 col-lg-12 col-sm-12" id="persons-content"></div>
                            </div>
                            <div class="col-lg-8 col-md-9 col-10" id="chat_messages">
                                <div style="background-color:white;" class="col-lg-12 col-md-12 col-sm-12" id="message-body">
                                    <div class="col-lg-12 col-md-12 col-sm-12" id="message-content" style="height:100%;"></div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12" id="message-text">
                                    <div class="form-group  is-empty c col-md-10 col-lg-10 col-sm-10">
                                        <textarea type="text" class="form-control" placeholder="Reply" id="msg"></textarea>
                                        <span class="material-input"></span>
                                    </div>
                                    <button onclick="sendMessage()" type="submit" class="btn btn-primary btn-round btn-just-icon col-md-1 col-lg-1 col-sm-1">
                                        <i class="material-icons">send</i><div class="ripple-container"></div>
                                    </button>
                                </div>
                            </div>
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

<!-- Material Dashboard javascript methods -->
<script src="../../assets/js/material-dashboard.js"></script>
<script src="../../assets/ckeditor/ckeditor.js"></script>

<script type="text/javascript">
    var current="";
    function getmessages(id){
        current=id;
        $.ajax({
            url: '../../functions/constructor.php',
            data: {
                'getchatmessages':1,
                'id':id
            },
            type:   'post',
            beforeSend: function () {
                $('#message-content').html("Loading");
            },
            success:function(data){
                if(data!="") {
                    $('#message-content').html(data);
                    var elem = document.getElementById('message-content');
                    elem.scrollTop = elem.scrollHeight;
                }else{
                    $('#message-content').html("now chatting with "+current);
                }
            }
        });

    }/*
    function getuser(name){

    }*/
    function getusers(){
        $.ajax({
            url:        '../../functions/constructor.php',
            data:       'getchatusers',
            type:       'POST',
            beforeSend: function(){
            },
            success:    function(data){
                if(data=="No existing chats"){
                    $('#persons-content').html(data);
                }else{
                    $('#persons-content').html("<ul class='list-group'>"+data+"</ul>");
                }
            }
        });
    }
    function sendMessage(){
        var msg=$('#msg').val().trim();
        if(current!=""){
            $.ajax({
                url:    '../../functions/constructor.php',
                data:   {
                    'sendmessage':1,
                    'msg':msg,
                    'to':current
                },
                type:   'POST',
                beforeSend: function () {

                },
                success :function (data) {
                    alert(data);
                    getmessages(current);
                    $('#msg').html("");
                }
            });
        }else{
            alert("Please select the person you want to send the message to.");
        }
    }
    function searchuser(){
        var search =$('#searchuser').val().trim();
        if(search!="") {
            $.ajax({
                url: '../../functions/constructor.php',
                data: {
                    'searchuser': 1,
                    'data': search
                },
                type: 'POST',
                beforeSend: function () {

                },
                success: function (data) {
                    $('#persons-content').html(data);
                }
            });
        }else{
            getusers();
        }
    }
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
                $('#msgcount,#mscount').html(data.messages);
                $('#msgcount1').html(data.messages);
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
        getusers();
        getcounts();
    });
</script>

</html>
