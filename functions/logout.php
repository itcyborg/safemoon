<?php
/**
 * Created by PhpStorm.
 * User: itcyb
 * Date: 3/23/2017
 * Time: 12:16 PM
 */

session_unset();
session_destroy();
header('location:../login.php');
?>