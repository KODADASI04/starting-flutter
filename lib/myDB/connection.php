<?php

try{
$connection = new PDO("mysql:host=localhost,dbname=id13103552_adahansql","id13103552_adahan","[Y?YEN(=^wp!M3mf");
$connection->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
echo "yes connected";
}catch(PDOException $rec){
echo $exc ->getMessage();
die("could not connect");
}


?>