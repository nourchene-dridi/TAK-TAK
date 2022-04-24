<?php
	// Connect to database
	$conn = mysqli_connect("localhost","root","Rootroot.2022","taktak",3306,"") or die("fail_" .mysqli_connect_error());
	$request_method = $_SERVER["REQUEST_METHOD"];

	function getProfiles()
	{
		global $conn;
		$query = "SELECT * FROM `taktak`.`Client`";
		$response = array();
		$result = mysqli_query($conn, $query);
		while($row = mysqli_fetch_array($result))
		{
			$response[] = $row;
		}
		header('Content-Type: application/json');
		echo json_encode($response, JSON_PRETTY_PRINT);
	}
	function getProfile($emailClient)
	{
		global $conn;
		$emailClient = $_GET["emailClient"];
		$nom_prenom = $_GET["nom_prenom"];
		$tel = $_GET["tel"];
		$adresse = $_GET["adresse"];
		$dateNaiss = $_GET["dateNaiss"];
		$gouvernorat = $_GET["gouvernorat"];
		$codePostal = $_GET["codePostal"];
		echo $query="UPDATE `taktak`.`Client` SET  ` nom_prenom`='".$nom_prenom."',tel='".$tel."', adresse='".$adresse."', emailClient='".$emailClient."', dateNaiss='".$dateNaiss."', gouvernorat='".$gouvernorat."', codePostal='".$codePostal."' WHERE emailClient='".$emailClient."'";
		if(mysqli_query($conn, $query))
		{
			$response=array(
				'status' => 1,
				'status_message' =>'Profil modifie avec succes.'
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
	
	switch($request_method)
	{
		
		case 'GET':
			if(!empty($_GET['emailClient']))
			{
				$emailClient=intval($_GET['emailClient']);
				getProfile($emailClient);
			}
			else
			{
				getProfiles();
			}
			break;
		default:
			// Invalid Request Method
			header("HTTP/1.0 405 Method Not Allowed");
			break;
		

	}
?>