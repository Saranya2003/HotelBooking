<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "HotelDB";
    $table = "User"

    $action = $_POST["action"];

    $conn = new mysqli($servername,$username,$password,$dbname);
    if($conn->connect_error){
        die("Connection Failed: " , $conn->connect_error
        );
        return;
    }

    if("CREATE_TABLE" == $action){
        $sql = "CREATE TABLE IF NOT EXIST $table(
            id INT (6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            first_name VARCHAR(30) NOT NULL,
            last_name VARCHAR(30) NOT NULL,
            )";

        if($conn->query($sql) === TRUE){
            echo "success";
        }
        else{
            echo "error";
        }
        $conn->close();
        return;
    }

    if("GET_ALL" == $action){
        $db_data = array();
        $sql = "SELECT id, first_name, last_name from $table ORDER BY id DESC";
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
?>