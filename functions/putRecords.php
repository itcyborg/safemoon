<?php
    /**
     * creates records from recieved queries
     */

    function put($sql){
        $conn=getconn();

        $sql=mysqli_real_escape_string($conn,$sql);
        $sql=stripslashes($sql);
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