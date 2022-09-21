<?php
require("connection.php");
$makeQuery = "SELECT * FROM loginisimler";
$statement = $connection->prepare($makeQuery);
$statement->execute();
$array = array();
while($resultsFrom = $statement ->fetch()){
    array_push(
        $myarray.array(
            "id"=>$resultsFrom["id"],
            "username"=>$resultsFrom["username"],
            "password"=>$resultsFrom["password"],
            "acıklama"=>$resultsFrom["acıklama"]

        )
    );
}



?>