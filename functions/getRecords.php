<?php
/**
 * Created by PhpStorm.
 * User: PAVILION 15
 * Date: 2/28/2017
 * Time: 10:24 PM
 */

function getRecord($sql){
    $array=array();
    $conn=getConnection();
    $result=$conn->query($sql);
    return $result;
}

function getConnection(){
    include '../system/conn.php';
    return $conn;
}