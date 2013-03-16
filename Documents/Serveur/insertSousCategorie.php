<?php
	$xml = new SimpleXMLElement('<xml encoding="UTF-8"/>');
	
	$mysqli = new mysqli("127.0.0.1", "admin", "", "iCommerce", 3306);
	
	
	if ($mysqli->connect_errno) {
		$doc = $xml->addChild('statut');
		$doc->addChild('error', "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error);
		Header('Content-type: text/xml');
		print($xml->asXML());
	} else {
	
		if (!($stmt = $mysqli->prepare("INSERT INTO SousCategorie(idCategorie, nomSousCategorie) VALUES (?, ?)"))) {
			$doc = $xml->addChild('statut');
			$doc->addChild('error', "Echec de la préparation : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error);
		}
	
		if (isset($_GET['idCategorie']) && isset($_GET['nomSousCategorie'])) {
			if (!$stmt->bind_param("is", $_GET['idCategorie'], $_GET['nomSousCategorie'])) {
				$doc = $xml->addChild('statut');
				$doc->addChild('error', "Echec lors du liage des paramètres : (" . $stmt->errno . ") " . $stmt->error);
			}
			if (!$stmt->execute()) {
				$doc = $xml->addChild('statut');
				$doc->addChild('error', "Echec lors de l'exécution : (" . $stmt->errno . ") " . $stmt->error);
			} else {
				$doc = $xml->addChild('statut');
				$doc->addChild('ok', "SousCatégorie `" . $_GET['nomSousCategorie'] . "` ajoutée");
			}
		} else {
			$doc = $xml->addChild('statut');
			$doc->addChild('error', "Paramètre `idCategorie` et/ou `nomSousCategorie` manquant !");
		}
	}
	
	Header('Content-type: text/xml');
	print($xml->asXML());

	$mysqli->close();

?>