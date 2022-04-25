<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Credentials: true');
header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header("Content-Type: application/json; charset=UTF-8");

$db = mysqli_connect("localhost","root","Rootroot.2022","taktak",3306,"") or die("fail_" .mysqli_connect_error());

$numColis = ($_GET['numColis'] !== null && (int)$_GET['numColis'] > 0)? mysqli_real_escape_string($db, (int)$_GET['numColis']) : false;
if(!$numColis)
{
	return http_response_code(400);
}

$sql = "DELETE FROM `taktak`.`Colis` WHERE numColis =$numColis";
if($db->query($sql))
{
	http_response_code(204);
}
else
{
	return http_response_code(422);
}