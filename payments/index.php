<?php
/**
 * Created by PhpStorm.
 * User: itcyb
 * Date: 3/13/2017
 * Time: 3:23 PM
 */
include "../libs/AfricasTalkingGateway.php";
$data  = json_decode(file_get_contents('php://input'), true);
print_r($data);
// Process the data...
$category = $data["category"];
if ( $category == "MobileC2B" ) {
    // We have been paid by one of our customers!!
    $phoneNumber = $data["source"];
    $value       = $data["value"];
    $account     = $data["clientAccount"];
    $id          = $data["transactionid"];
    $category    = $data["category"];
    $provider    = $data['provider'];
    // manipulate the data as required by your business logic
    // Perhaps send an SMS to confirm the payment using our APIs...
    // where are we posting to?
    $url = 'https://www.safemoon.com/functions/constructor.php';

// what post fields?
    $fields = array(
        'paymentNotification'=>true,
        'phonenumber'=>$phoneNumber,
        'value'=>$value,
        'account'=>$account
    );

// build the urlencoded data
    $postvars = http_build_query($fields);

// open connection
    $ch = curl_init();

// set the url, number of POST vars, POST data
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_POST, count($fields));
    curl_setopt($ch, CURLOPT_POSTFIELDS, $postvars);

// execute post
    $result = curl_exec($ch);
    var_dump($result);

// close connection
    curl_close($ch);

}