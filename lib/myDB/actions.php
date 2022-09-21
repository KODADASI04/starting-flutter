<?php

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "Denemesql";
    $table = "Deneme";
    $action = $_POST["action"];
    $conn = new mysqli($servername,$username,$password,$dbname);
    if($conn->connect_error){
        die("Connection Failed: ".$conn->connect_error);
        return;
    }
    if("tabloyarat" == $action){
        $sql = "CREATE TABLE IF NOT EXISTS $table (id INT,username TEXT NOT NULL,pass TEXT NOT NULL,about TEXT NOT NULL)";
        if($conn->query($sql) === TRUE){
            echo "success";

        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
    if("verial" == $action){
        $db_data = array();
        $sql = "SELECT id,username,pass,about from $table ORDER BY id DESC";
        $result = $conn->query($sql);
        if($result->num_rows > 0){
            while($row = $result->fetch_assoc()){
                $db_data[] = $row;
            }
            echo json_encode($db_data);
        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
    if("veriekle" == $action){
        $id = $_POST["id"];
        $username = $_POST["username"];
        $pass = $_POST["pass"];
        $about = $_POST["about"];
        $sql = "INSERT INTO $table (username,pass,about) VALUES ('$username','$pass','$about')";
        $result = $conn->query($sql);
        echo "success";
        $conn->close();
        return;
    }
    if("veridüzenle" == $action){
        $id = $_POST['id'];
        $username = $_POST["username"];
        $pass = $_POST["pass"];
        $about = $_POST["about"];
        $sql = "UPDATE $table SET username = '$username',pass = '$pass',about = '$about' WHERE id = '$id'";
        if($conn->query($sql) === TRUE){
            echo "success";

        }else{
            echo "error";
        }
        $conn->close();
        return;
    }
    if("verisil" == $action){
        $id = $_POST['id'];
        $sql = "DELETE FROM $table WHERE id = $id";
        if($conn->query($sql) === TRUE){
            echo "success";

        }else{
            echo "error";
        }
        $conn->close();
        return;
    }

?>