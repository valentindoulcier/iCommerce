<?php
	$mysqli = new mysqli("127.0.0.1", "admin", "", "iCommerce", 3306);
	if ($mysqli->connect_errno) {
    	echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
    	exit();
	}
	
	$query = "SELECT * FROM Client C, AdresseClient A, Ville V, CodePostal CP WHERE C.idAdressePrincipale = A.idAdresseClient AND A.idVille = V.idVille AND V.idCodePostal = CP.idCodePostal";
	$queryAdresse = "SELECT * FROM Client C, AutreAdresse AA, AdresseClient A, Ville V, CodePostal CP WHERE C.idClient = AA.idClient AND AA.idAdresseClient = A.idAdresseClient AND A.idVille = V.idVille AND V.idCodePostal = CP.idCodePostal";
	
	if (isset($_GET['idClient'])) {
		$query .= " WHERE idClient = '" . $_GET['idClient'] . "'";
		$queryAdresse .= " WHERE idClient = '" . $_GET['idClient'] . "'";
	}
	
	$res = $mysqli->query($query);
	$resAdresse = $mysqli->query($queryAdresse);
	
	$xml = new SimpleXMLElement('<xml encoding="UTF-8"/>');
	
	if ($res) {
		while ($row = $res->fetch_assoc()) {
    		$doc = $xml->addChild('client');
	    	$doc->addChild('idClient', utf8_encode($row['idClient']));
    		$doc->addChild('refClient', utf8_encode($row['refClient']));
    		$doc->addChild('nomClient', utf8_encode($row['nomClient']));
    		$doc->addChild('emailClient', utf8_encode($row['emailClient']));
    		$doc->addChild('loginClient', utf8_encode($row['loginClient']));
    		$doc->addChild('passwordClient', utf8_encode($row['passwordClient']));
    		$doc->addChild('telephonePortable', utf8_encode($row['telephonePortable']));
    		$doc->addChild('telephoneDomicile', utf8_encode($row['telephoneDomicile']));
    		$doc->addChild('idAdressePrincipale', utf8_encode($row['idAdressePrincipale']));
    		
    		$adresses = $doc->addChild('adresses');
    		$adresse = $adresses->addChild('adresse');
    		$adresse->addAttribute('type', 'principale');
    		
    		$adresse->addChild('idAdresseClient', utf8_encode($row['idAdresseClient']));
    		$adresse->addChild('appartement', utf8_encode($row['appartement']));
    		$adresse->addChild('numRue', utf8_encode($row['numRue']));
    		$adresse->addChild('nomRue', utf8_encode($row['nomRue']));
    		$adresse->addChild('idVille', utf8_encode($row['idVille']));
    		$adresse->addChild('idCodePostal', utf8_encode($row['idCodePostal']));
    		$adresse->addChild('numCodePostal', utf8_encode($row['numCodePostal']));
    		$adresse->addChild('nomVille', utf8_encode($row['nomVille']));
    		
    		if ($resAdresse) {
    			$resAdresse->data_seek(0);
    			while ($rowAdresse = $resAdresse->fetch_assoc()) {
    				if ($rowAdresse['idClient'] == $row['idClient']) {
    					$otherAdresse = $doc->addChild('adresse');
    					$otherAdresse->addAttribute('type', 'other');
    				
    					$otherAdresse->addChild('idAutreAdresse', utf8_encode($rowAdresse['idAutreAdresse']));
    					$otherAdresse->addChild('idAdresseClient', utf8_encode($rowAdresse['idAdresseClient']));
    					$otherAdresse->addChild('appartement', utf8_encode($rowAdresse['appartement']));
    					$otherAdresse->addChild('numRue', utf8_encode($rowAdresse['numRue']));
    					$otherAdresse->addChild('nomRue', utf8_encode($rowAdresse['nomRue']));
    					$otherAdresse->addChild('idVille', utf8_encode($rowAdresse['idVille']));
    					$otherAdresse->addChild('idCodePostal', utf8_encode($rowAdresse['idCodePostal']));
    					$otherAdresse->addChild('numCodePostal', utf8_encode($rowAdresse['numCodePostal']));
    					$otherAdresse->addChild('nomVille', utf8_encode($rowAdresse['nomVille']));
    				}
    			}
    		}
		}
		$res->close();
		if ($resAdresse) { $resAdresse->close(); }
	}
	
	Header('Content-type: text/xml');
	print($xml->asXML());

	$mysqli->close();

?>