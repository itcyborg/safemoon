<?php
    /**
     * creates records from recieved queries
     */

    function put($sql){
        $conn=getconn();
        if($conn->query($sql)===TRUE){
            return array('status'=>true,'id'=>$conn->insert_id);
        }else{
            return array('status'=>false,'error'=>$conn->error);
        }
    }

    function getconn(){
        include '../system/conn.php';
        return $conn;
    }