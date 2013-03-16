<?php
	$xml = new SimpleXMLElement('<xml encoding="UTF-8"/>');
	
	$mysqli = new mysqli("127.0.0.1", "admin", "", "iCommerce", 3306);
	
	
	if ($mysqli->connect_errno) {
		$doc = $xml->addChild('statut');
		$doc->addChild('error', "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error);
		Header('Content-type: text/xml');
		print($xml->asXML());
	} else {
	
		if (!($stmt = $mysqli->prepare("INSERT INTO Article(refArticle, nomArticle, description, photo, idCategorie, idSousCategorie, idMarque, prixHT, tauxTVA) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"))) {
			$doc = $xml->addChild('statut');
			$doc->addChild('error', "Echec de la préparation : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error);
		}
	
		if (isset($_GET['refArticle']) && isset($_GET['nomArticle']) && isset($_GET['description']) && isset($_GET['photo']) && isset($_GET['idCategorie']) && isset($_GET['idSousCategorie']) && isset($_GET['idMarque']) && isset($_GET['prixHT']) && isset($_GET['tauxTVA'])) {
			if (!$stmt->bind_param("sssbiiidd", $_GET['refArticle'], $_GET['nomArticle'], $_GET['description'], $_GET['photo'], $_GET['idCategorie'], $_GET['idSousCategorie'], $_GET['idMarque'], $_GET['prixHT'], $_GET['tauxTVA'])) {
				$doc = $xml->addChild('statut');
				$doc->addChild('error', "Echec lors du liage des paramètres : (" . $stmt->errno . ") " . $stmt->error);
			}
			if (!$stmt->execute()) {
				$doc = $xml->addChild('statut');
				$doc->addChild('error', "Echec lors de l'exécution : (" . $stmt->errno . ") " . $stmt->error);
			} else {
				$doc = $xml->addChild('statut');
				$doc->addChild('ok', "Article `" . $_GET['nomArticle'] . "` ajoutée");
			}
		} else {
			$doc = $xml->addChild('statut');
			$doc->addChild('error', "Paramètre(s) manquant !");
		}
	}
	
	Header('Content-type: text/xml');
	print($xml->asXML());

	$mysqli->close();

?>