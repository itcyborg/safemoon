<?php
    session_start();
    if(isset($_GET['action'])=="view"){
        if(isset($_GET['category'])=="aspirant"){
            if(isset($_GET['id'])){
                $id=$_GET['id'];
                include "../functions/function.php";
                $result=viewAspirant($id);
                $row=$result->fetch_assoc();
                $first=$row['FirstName'];
                $middle=$row['MiddleName'];
                $last=$row['LastName'];
                $email=$row['Email'];
                $position=$row['Position'];
                $about=html_entity_decode($row['About']);
                $manifesto=html_entity_decode($row['Manifesto']);
                $manifesto=htmlspecialchars_decode($manifesto);
                $profilepic=$row['ProfilePic'].".".$row['Ext'];
                $shared=$row['Shared'];
                $contact=$row['Contact'];
                $party=$row['Party'];
                $twitter=$row['Twitter'];
                $color = $row['Color'];
                $fullname=strtoupper($first." ".$middle." ".$last);
                $img="../uploads/profiles/".$profilepic;
            }
        }
    }
?>
<!DOCTYPE HTML>
<!--
	Strata by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title><?php echo $fullname; ?></title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="../assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="../assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="../assets/css/ie8.css" /><![endif]-->
	</head>
    <body id="top" style="background-color: <?php echo $color; ?>; color:black;">

		<!-- Header -->
			<header id="header">
                <img class="image" src="<?php echo $img; ?>">
				<div class="inner">
					<h1><strong><?php echo $fullname; ?></strong></h1>
				</div>
			</header>

		<!-- Main -->
			<div id="main">

				<!-- One -->
					<section id="one">
						<header class="major">
							<h2>About Me</h2>
						</header>
						<p><?php echo $about; ?></p>
					</section>

				<!-- Two -->
					<section id="two">
						<h1>Manifesto</h1>
						<div class="row">
							<article class="6u 12u$(xsmall) work-item">
                                <?php echo $manifesto; ?>
							</article>
						</div>
					</section>

				<!-- Three -->
					<section id="three">
						<h2>Get In Touch</h2>
						<p>Get in touch with the aspirant directly or via private message. Please note that the personal information may be made private by the aspirant.</p>
						<div class="row">
							<div class="8u 12u$(small)">
								<form method="post" action="#">
									<div class="row uniform 50%">
										<div class="6u 12u$(xsmall)"><input type="text" name="name" id="name" placeholder="Name" /></div>
										<div class="6u$ 12u$(xsmall)"><input type="email" name="email" id="email" placeholder="Email" /></div>
										<div class="12u$"><textarea name="message" id="message" placeholder="Message" rows="4"></textarea></div>
									</div>
								</form>
								<ul class="actions">
									<li><input type="submit" value="Send Message" /></li>
								</ul>
							</div>
							<div class="4u$ 12u$(small)">
								<ul class="labeled-icons">
									<li>
										<h3 class="icon fa-mobile"><span class="label">Phone</span></h3>
										+254<?php echo $contact; ?>
									</li>
									<li>
										<h3 class="icon fa-envelope-o"><span class="label">Email</span></h3>
										<a href="#"><?php echo $email; ?></a>
									</li>
                                    <li>
                                        <h3 class="icon fa-twitter"><span class="label">Twitter</span></h3>
                                        <a href="https://twitter.com/<?php echo $twitter; ?>" target="_blank"><?php echo $twitter;?></a>
                                    </li>
								</ul>
							</div>
						</div>
					</section>

				<!-- Four -->
					<section id="four">
						<h2>Comments</h2>

                        <div id="disqus_thread"></div>
                        <script>

                            /**
                             *  RECOMMENDED CONFIGURATION VARIABLES: EDIT AND UNCOMMENT THE SECTION BELOW TO INSERT DYNAMIC VALUES FROM YOUR PLATFORM OR CMS.
                             *  LEARN WHY DEFINING THESE VARIABLES IS IMPORTANT: https://disqus.com/admin/universalcode/#configuration-variables*/

                             var disqus_config = function () {
                             this.page.url = PAGE_URL;  // Replace PAGE_URL with your page's canonical URL variable
                             this.page.identifier = <?php echo id; ?>; // Replace PAGE_IDENTIFIER with your page's unique identifier variable
                             };
                            (function() { // DON'T EDIT BELOW THIS LINE
                                var d = document, s = d.createElement('script');
                                s.src = 'https://safemoon.disqus.com/embed.js';
                                s.setAttribute('data-timestamp', +new Date());
                                (d.head || d.body).appendChild(s);
                            })();
                        </script>
                        <noscript>Please enable JavaScript to view the <a href="https://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>

					</section>

			</div>

		<!-- Footer -->
			<footer id="footer" class="container">
				<div class="inner">
					<ul class="icons">
						<li><a href="https://twitter.com/<?php echo $twitter; ?>" target="_blank" class="icon fa-twitter"><span class="label" >Twitter</span></a></li>
					</ul>
					<ul class="copyright">
						<li>&copy; Untitled</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</div>
			</footer>

		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/jquery.poptrox.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="../assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="../assets/js/main.js"></script>
    <script>alert(<?php echo $twitter;?>);</script>

	</body>
</html>