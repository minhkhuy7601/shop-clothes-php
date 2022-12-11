<?php
require_once '../model/db.php';
session_start();
if(isset($_GET['logout'])){
    session_destroy();
    unset($_SESSION['id']);
    unset($_SESSION['staff_id']);       
    header('location: login.php');
    exit();
}

// echo $_SESSION['id'];
if(isset($_SESSION['id']) && isset($_SESSION['staff_id'])){
    $staff_id =  $_SESSION['staff_id'];
    $staff_name = $_SESSION['staff_name'];
       
    function addLog($conn, $staff_id, $message){
    date_default_timezone_set('Asia/Ho_Chi_Minh');
        $getDay= date("Y-m-d H:i:s");
    $sql_get_staff = "SELECT * FROM staff, power WHERE staff.power_id = power.power_id AND staff_id = $staff_id";
    $result_get_staff = mysqli_query($conn, $sql_get_staff);
    $itemStaff = mysqli_fetch_assoc($result_get_staff);
    $email = $itemStaff['email'];
    $power = $itemStaff['power_name'];
    $activity = 'Tài khoản '.$email.' ('.$power.')'.$message;
    $sqlLog = "INSERT INTO log(time, activity) VALUES('$getDay', '$activity')";
    $resultLog = mysqli_query($conn, $sqlLog);
    }
}
else{
    header('location: login.php');
}
?>
