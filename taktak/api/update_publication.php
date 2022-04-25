<?phpheader("Access-Control-Allow-Origin: *");
header('Access-Control-Allow-Credentials: true');
header("Access-Control-Allow-Methods: PUT, GET, POST, DELETE");
header("Access-Control-Allow-Headers: Origin, X-Requested-With, Content-Type, Accept");
header("Content-Type: application/json; charset=UTF-8");

$db = mysqli_connect("localhost","root","Rootroot.2022","taktak",3306,"") or die("fail_" .mysqli_connect_error());

$postdata = file_get_contents('php://input');

if(isset($postdata) && !empty($postdata))
{
	$request = json_decode($postdata,true);
	$nomPrenomDest = mysqli_real_escape_string($db, trim($request['nomPrenomDest']));
    $telDest = mysqli_real_escape_string($db, trim($request['telDest']));
    $adresseDest = mysqli_real_escape_string($db, trim($request['adresseDest']));
    $numColis = mysqli_real_escape_string($db, (int)$request['numColis']);
    $libelleColis = mysqli_real_escape_string($db, trim($request['libelleColis']));
    $poids = mysqli_real_escape_string($db, trim($request['poids']));
    $etat = mysqli_real_escape_string($db, trim($request['etat']));
    $prixColis = mysqli_real_escape_string($db, trim($request['prixColis']));
    $fraisLivraison = mysqli_real_escape_string($db, trim($request['fraisLivraison']));
	$sql = "UPDATE `taktak`.`Colis` SET numColis=$numColis, libelleColis='$libelleColis', poids='$poids', etat='$etat', prixColis='$prixColis', fraisLivraison='$fraisLivraison', nomPrenomDest='$nomPrenomDest', telDest='$telDest', adresseDest='$adresseDest' WHERE numColis=$numColis";
	
	if($db->query($sql))
	{
		http_response_code(204);
	}
	else
	{
		return http_response_code(422);
	}
}