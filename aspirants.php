<?php
@session_start();

include "system/conn.php";
$out = "";
if (isset($_GET['category'])) {
    $category = $_GET['category'];
    $sql = "";
    switch ($category) {
        case 'president':
            $sql = "SELECT aspirants.*,profile.* FROM aspirants JOIN profile ON aspirants.Userid=profile.UserID WHERE Position='" . $category . "'";
            break;
        case 'governor':
            $sql = "SELECT aspirants.*,profile.* FROM aspirants JOIN profile ON aspirants.Userid=profile.UserID WHERE Position='" . $category . "'";
            break;
        case 'senator':
            $sql = "SELECT aspirants.*,profile.* FROM aspirants JOIN profile ON aspirants.Userid=profile.UserID WHERE Position='" . $category . "'";
            break;
        case 'wrep':
            $sql = "SELECT aspirants.*,profile.* FROM aspirants JOIN profile ON aspirants.Userid=profile.UserID WHERE Position='" . $category . "'";
            break;
        case 'mp':
            $sql = "SELECT aspirants.*,profile.* FROM aspirants JOIN profile ON aspirants.Userid=profile.UserID WHERE Position='" . $category . "'";
            break;
        case 'mca':
            $sql = "SELECT aspirants.*,profile.* FROM aspirants JOIN profile ON aspirants.Userid=profile.UserID WHERE Position='" . $category . "'";
            break;
        case 'all' :
            $sql = "SELECT profile.*,aspirants.* FROM aspirants JOIN profile ON profile.UserID=aspirants.UserID";
            break;
        default :
            die("Wrong Category");
            break;
    }
    $result = $conn->query($sql);
    $out = "";
    if ($result->num_rows < 1) {
        $our = $category;
    } else {
        while ($row = $result->fetch_assoc()) {
            $out .= "
            <div class=\"col-md-3 to-animate listing\">
                <img style='height: 250px;padding: 0;' class=\"col-md-12\" src=\"uploads/profiles/" . $row['ProfilePic'] . "." . $row['Ext'] . "\" class=\"img-responsive img-thumbnail\"><br>
                <span style='height:120px;' class=\"col-md-12\">
                    <h3 class='text-uppercase'>" . $row['FirstName'] . " " . $row['MiddleName'] . " " . $row['LastName'] . "</h3>
                    <p>" . $row['Party'] . " <a href='aspirants.php?action=view&id=" . $row['UserID'] . "'>Know more...</a></p>
                </span>
            </div>";
        }
    }
}

if (isset($_GET['action']) && isset($_GET['id'])) {
    if ($_GET['action'] == 'view') {
        $id = $_GET['id'];
        $sql = "SELECT aspirants.*, profile.* FROM aspirants JOIN profile ON aspirants.UserID=profile.UserID WHERE aspirants.UserID='" . $id . "'";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) {
            $row = $result->fetch_assoc();
            $out .= "
            <div class=\"col-md-12 to-animate\">
                <div class='col-md-3'>
                    <img style='height: 250px;padding: 0;' class=\"col-md-12\" src=\"uploads/profiles/" . $row['ProfilePic'] . "." . $row['Ext'] . "\" class=\"img-responsive img-thumbnail\">
                    <div class='col-md-12'>
                    <hr>
                        <div class=\"col-md-12 to-animate\">
                            <h3 class=\"section-title\">Connect with Us</h3>
                                <a href=\"https://www.twitter.com/" . $row['Twitter'] . "\" target=\"_blank\" class=\"twitter\"><i
                                                class=\"icon-twitter\"></i> @" . $row['Twitter'] . "</a>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class='col-md-9'>
                    <span class=\"col-md-12\">
                        <h3 class='text-uppercase'>" . $row['FirstName'] . " " . $row['MiddleName'] . " " . $row['LastName'] . "</h3>
                        <p>" . $row['Party'] . "</p>
                        <p>" . $row['Position'] . "</p>
                        <p>" . $row['Location'] . "</p>
                        <hr>
                        <div class='col-md-12'>
                            <h2>About Me</h2>
                            <div>" . $row['About'] . "</div>
                            <hr>
                        </div>
                        <div class='col-md-12'>
                            <h2>Manifesto</h2>
                            <div>" . $row['Manifesto'] . "</div>
                        </div>
                    </span>
                </div>
            </div>";
        } else {
            $out = "Not Found";
        }
    }
}
?>

<!DOCTYPE html>
<!--[if lt IE 7]>
<html class="no-js lt-ie9 lt-ie8 lt-ie7"> <![endif]-->
<!--[if IE 7]>
<html class="no-js lt-ie9 lt-ie8"> <![endif]-->
<!--[if IE 8]>
<html class="no-js lt-ie9"> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js"> <!--<![endif]-->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msvalidate.01" content="3EA6FC87BA4A8513C359EA77AD427210"/>
    <title>Safemoon</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description"
          content="Get to know, converse and talk to your political aspirant. Know who is vying for which position at your place"/>
    <meta name="keywords" content="Safemoon,politics,kenya politics,political aspirants,aspirants"/>
    <meta name="author" content="Itcyborg Designs, http://itcyborg.webuda.com"/>

    <!-- Facebook and Twitter integration -->
    <meta property="og:title" content=""/>
    <meta property="og:image" content=""/>
    <meta property="og:url" content=""/>
    <meta property="og:site_name" content=""/>
    <meta property="og:description" content=""/>
    <meta name="twitter:title" content=""/>
    <meta name="twitter:image" content=""/>
    <meta name="twitter:url" content=""/>
    <meta name="twitter:card" content=""/>

    <!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
    <link rel="shortcut icon" href="favicon.ico">

    <link href='https://fonts.googleapis.com/css?family=PT+Sans:400,700,400italic,700italic' rel='stylesheet'
          type='text/css'>

    <!-- Animate.css -->
    <link rel="stylesheet" href="assets/css/animate.css">
    <!-- Icomoon Icon Fonts-->
    <link rel="stylesheet" href="assets/css/icomoon.css">
    <!-- Simple Line Icons -->
    <link rel="stylesheet" href="assets/css/simple-line-icons.css">
    <!-- Bootstrap  -->
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <!-- Owl Carousel  -->
    <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="assets/css/owl.theme.default.min.css">
    <!-- Style -->
    <link rel="stylesheet" href="assets/css/style.css">


    <!-- Modernizr JS -->
    <script src="assets/js/modernizr-2.6.2.min.js"></script>
    <!-- FOR IE9 below -->
    <!--[if lt IE 9]>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->

</head>
<body>
<style>
    .listing {
        background-color: greenyellow;
        padding: 0;
        margin: 10px;
    }
</style>
<header role="banner" id="fh5co-header">
    <div class="fluid-container">
        <nav class="navbar navbar-default">
            <div class="navbar-header">
                <!-- Mobile Toggle Menu Button -->
                <a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar"
                   aria-expanded="false" aria-controls="navbar"><i></i></a>
                <a class="navbar-brand" href="login.html"><span>Safe</span>moon</a>
            </div>
            <div class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                            Aspirants &nbsp;
                            <span class="icon-caret-down"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="aspirants.php?category=presidential">Presidential</a></li>
                            <li class="nav-divider"></li>
                            <li><a href="aspirants.php?category=governor">Gubernatorial</a></li>
                            <li class="nav-divider"></li>
                            <li><a href="aspirants.php?category=senators">Senators</a></li>
                            <li class="nav-divider"></li>
                            <li><a href="aspirants.php?category=mps">Member of Parliament</a></li>
                            <li class="nav-divider"></li>
                            <li><a href="aspirants.php?category=wrep">Women Rep</a></li>
                            <li class="nav-divider"></li>
                            <li><a href="aspirants.php?category=mca">Member of County Assembly</a></li>
                            <li class="nav-divider"></li>
                            <li><a href="aspirants.php?category=search">Search</a></li>
                            <li class="nav-divider"></li>
                            <li><a href="aspirants.php?category=all">All</a></li>
                        </ul>
                    </li>
                    <li><a href="#">|</a></li>
                    <li><a href="login.php">Login</a></li>
                    <li><a href="signup.php">Sign up</a></li>
                </ul>
            </div>
        </nav>
    </div>
</header>
<hr>

<section id="fh5co-services" data-section="services">
    <div class="container">
        <div class="row">
            <?php echo $out; ?>
        </div>
    </div>
</section>

<div id="fh5co-footer" role="contentinfo">
    <div class="container">
        <div class="row">
            <div class="col-md-4 to-animate">
                <h3 class="section-title">About Us</h3>
                <p>We provide detailed information on your future leaders and leaders to be. We give you a platform
                    to interact with future and current leaders.</p>
                <p class="copy-right">&copy; 2017 Safemoon <br>All Rights Reserved. <br>
                    Designed by <a href="http://itcyborg.webuda.com/" target="_blank">Itcyborg Designs<br>
                        Credits by <a href="http://freehtml5.co/" target="_blank">FREEHTMML5</a>
                </p>
            </div>

            <div class="col-md-4 to-animate">
                <h3 class="section-title">Our Address</h3>
                <ul class="contact-info">
                    <li><i class="icon-phone"></i>+254 722 235 880</li>
                    <li><i class="icon-envelope"></i><a href="mailto:admin@safemoon.com">admin@safemoon.com</a></li>
                </ul>
                <h3 class="section-title">Connect with Us</h3>
                <ul class="social-media">
                    <li><a href="https://www.facebook.com/safemoon" class="facebook" target="_blank"><i
                                    class="icon-facebook"></i></a></li>
                    <li><a href="https://www.twitter.com/safemoonke" target="_blank" class="twitter"><i
                                    class="icon-twitter"></i></a></li>
                </ul>
            </div>
            <div class="col-md-4 to-animate">
                <h3 class="section-title">Drop us a line</h3>
                <form class="contact-form">
                    <div class="form-group">
                        <label for="name" class="sr-only">Name</label>
                        <input type="name" class="form-control" id="name" placeholder="Name">
                    </div>
                    <div class="form-group">
                        <label for="email" class="sr-only">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Email">
                    </div>
                    <div class="form-group">
                        <label for="message" class="sr-only">Message</label>
                        <textarea class="form-control" id="message" rows="7" placeholder="Message"></textarea>
                    </div>
                    <div class="form-group">
                        <input type="submit" id="btn-submit" class="btn btn-send-message btn-md" value="Send Message">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<!-- jQuery -->
<script src="assets/js/jquery.min.js"></script>
<!-- jQuery Easing -->
<script src="assets/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="assets/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="assets/js/jquery.waypoints.min.js"></script>
<!-- Stellar Parallax -->
<script src="assets/js/jquery.stellar.min.js"></script>
<!-- Owl Carousel -->
<script src="assets/js/owl.carousel.min.js"></script>
<!-- Google Map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCefOgb1ZWqYtj7raVSmN4PL2WkTrc-KyA&sensor=false"></script>
<script src="assets/js/google_map.js"></script>
<!-- Main JS (Do not remove) -->
<script src="assets/js/main.js"></script>

</body>
</html>

