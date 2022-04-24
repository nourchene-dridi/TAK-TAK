<?php
	// Connect to database
	/*$server = "localhost";
	$username = "root";
	$password = "root";
	$db = "taktak";*/
	/*$conn = new mysqli("localhost","root","Rootroot.2022","taktak",3306,"") or die("fail" .mysqli_connect_error());*/
	$conn = mysqli_connect("localhost","root","Rootroot.2022","taktak",3306,"") or die("fail_" .mysqli_connect_error());
	$idPub='123';
	$request_method = $_SERVER["REQUEST_METHOD"];

	function getPublications()
	{
		global $conn;
		$query = "SELECT numColis, libelleColis,poids, etat, prixColis, fraisLivraison FROM `taktak`.`Colis`";
		$response = array();
		$result = mysqli_query($conn, $query);
		while($row = mysqli_fetch_array($result))
		{
			$response[] = $row;
		}
		header('Content-Type: application/json');
		echo json_encode($response, JSON_PRETTY_PRINT);
	}
	
	/*function getPublication($idPub=0)
	{
		global $conn;
		$query = "SELECT numColis, libelleColis, prixColis, fraisLivraison FROM `taktak`.`Publication`,`taktak`.`Colis`";
		if($idPub != 0)
		{
			$query .= " WHERE idPub=".$idPub." LIMIT 1";
		}
		$response = array();
		$result = mysqli_query($conn, $query);
		while($row = mysqli_fetch_array($result))
		{
			$response[] = $row;
		}
		header('Content-Type: application/json');
		echo json_encode($response, JSON_PRETTY_PRINT);
	}*/
	
	function addPublication()
	{
		global $conn;
		global $idPub;
		$numColis = $_POST["numColis"];
		$libelleColis = $_POST["libelleColis"];
		$poids = $_POST["poids"];
		$etat = $_POST["etat"];
		$prixColis = $_POST["prixColis"];
		$fraisLivraison = $_POST["fraisLivraison"];
		echo $query="INSERT INTO `taktak`.`Colis`(numColis, libelleColis, poids, etat, prixColis, fraisLivraison, Publication_idPub) VALUES('".$numColis."', '".$libelleColis."','".$poids."', '".$etat."', '".$prixColis."','".$fraisLivraison."', '".$idPub."')";
		if(mysqli_query($conn, $query))
		{
			$response=array(
				'status' => 1,
				'status_message' =>'Publication ajoutee avec succes.'
			);
		}
		else
		{
			$response=array(
				'status' => 0,
				'status_message' =>'ERREUR!.'. mysqli_error($conn)
			);
		}
		header('Content-Type: application/json');
		echo json_encode($response);
	}
	
	function updatePublication($numColis)
	{
		global $conn;
		$_PUT = array();
		parse_str(file_get_contents('php://input'), $_PUT);
		$libelleColis = $_PUT["libelleColis"];
		$poids = $_PUT["poids"];
		$etat = $_PUT["etat"];
		$prixColis = $_PUT["prixColis"];
		$fraisLivraison = $_PUT["fraisLivraison"];
		$Client_emailClient = $_PUT["Client_emailClient"];
		$query="UPDATE `taktak`.`Colis` SET libelleColis='".$libelleColis."', poids='".$poids."', etat='".$etat."', prixColis='".$prixColis."', fraisLivraison='".$fraisLivraison."', Client_emailClient='".$Client_emailClient."' WHERE numColis=".$numColis;
		
		if(mysqli_query($conn, $query))
		{
			$response=array(
				'status' => 1,
				'status_message' =>'Publication mise à jour avec succès.'
			);
		}
		else
		{
			$response=array(
				'status' => 0,
				'status_message' =>'Echec de la mise à jour de la publication. '. mysqli_error($conn)
			);
			
		}
		
		header('Content-Type: application/json');
		echo json_encode($response);
	}
	
	function deletePublication($numColis)
	{
		global $conn;
		$query = "DELETE FROM `taktak`.`Colis` WHERE numColis=".$numColis;
		//$query2 = "DELETE FROM `taktak`.`Publication` WHERE idPub=(SELECT idPub FROM `taktak`.`Colis` WHERE numColis=".$numColis.")";
		if(mysqli_query($conn, $query))
		{
			$response=array(
				'status' => 1,
				'status_message' =>'Publication supprimée avec succès.'
			);
		}
		else
		{
			$response=array(
				'status' => 0,
				'status_message' =>'La suppression de la publication a échoué. '. mysqli_error($conn)
			);
		}
		header('Content-Type: application/json');
		echo json_encode($response);
	}
	
	switch($request_method)
	{
		
		case 'GET':
			// Retrive Products
			/*if(!empty($_GET["idPub"]))
			{
				$idPub=intval($_GET["idPub"]);
				getPublication($idPub);
			}
			else
			{*/
				getPublications();
			//}
			break;
		default:
			// Invalid Request Method
			header("HTTP/1.0 405 Method Not Allowed");
			break;
			
		case 'POST':
			// Ajouter une Publication
			addPublication();
			break;
			
		case 'PUT':
			// Modifier une Publication
			$numColis = intval($_GET["numColis"]);
			updatePublication($numColis);
			break;
			
		case 'DELETE':
			// Supprimer un Publication
			$numColis = intval($_GET["numColis"]);
			deletePublication($numColis);
			break;

	}
?>