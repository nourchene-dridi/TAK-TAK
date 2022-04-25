<?php
header("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Credentials: true');
header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header("Content-Type: application/json; charset=UTF-8");

$db = mysqli_connect("localhost","root","Rootroot.2022","taktak",3306,"") or die("fail_" .mysqli_connect_error());

$publications = [];

$sql = "SELECT * FROM `taktak`.`Colis`";
if($result = $db->query($sql))
{
	$i = 0;
	while($row = $result->fetch_assoc())
	{
		$publications[$i]['nomPrenomDest'] = $row['nomPrenomDest'];
		$publications[$i]['telDest'] = $row['telDest'];
		$publications[$i]['adresseDest'] = $row['adresseDest'];
		$publications[$i]['numColis'] = $row['numColis'];
        $publications[$i]['libelleColis'] = $row['libelleColis'];
        $publications[$i]['poids'] = $row['poids'];
		$publications[$i]['etat'] = $row['etat'];
        $publications[$i]['prixColis'] = $row['prixColis'];
        $publications[$i]['fraisLivraison'] = $row['fraisLivraison'];
		$i++;
	}
	echo json_encode($publications);
}
else
{
	http_response_code(404);
}