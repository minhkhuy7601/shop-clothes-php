<?php
    require_once '../model/db.php';
    if(isset($_GET['id'])){
        $id = $_GET['id'];
        $sql = "UPDATE users SET activity = 0 where user_id =$id ";
        $query = mysqli_query($conn, $sql);
        echo '<script> location.href = "index.php?menu=2"  </script>';

    }
?>