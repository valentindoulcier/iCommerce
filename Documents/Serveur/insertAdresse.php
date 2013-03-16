<?php
	function isValueExist ($table, $column, $value, $idColumn, $idColumnSearch, $idValueSearch) {
	
		$mysqli = new mysqli("127.0.0.1", "admin", "", "iCommerce", 3306);
	
		$query = "SELECT " . $idColumn . " FROM " . $table . " WHERE " . $column . "=" . $value;
		
		if ($idColumnSearch && $idValueSearch) {
			$query .= " AND " . $idColumnSearch . "=" . $idValueSearch;
		}

		$res = $mysqli->query($query);

		if ($res) {
			$row = $res->fetch_assoc();
			return $row[$idColumn];
    	}
	
		return 0;
	}
	
	function make_seed() {
  		list($usec, $sec) = explode(' ', microtime());
  		return (float) $sec + ((float) $usec * 100000);
	}
	srand(make_seed());
	
	$xml = new SimpleXMLElement('<xml encoding="UTF-8"/>');
	
	$mysqli = new mysqli("127.0.0.1", "admin", "", "iCommerce", 3306);
	
	if ($mysqli->connect_errno) {
		$doc = $xml->addChild('statut');
		$doc->addChild('error', "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error);
	} else {
		if (isset($_GET['numCodePostal']) && isset($_GET['nomVille']) && isset($_GET['nomClient']) && isset($_GET['emailClient']) && isset($_GET['loginClient']) && isset($_GET['passwordClient']) && isset($_GET['numRue']) && isset($_GET['nomRue'])) {
			$idCodePostal = isValueExist("CodePostal", "numCodePostal", "'" . $_GET['numCodePostal'] . "'", "idCodePostal");
			if (!$idCodePostal) {
				if (!($stmt = $mysqli->prepare("INSERT INTO CodePostal(numCodePostal) VALUES (?)"))) {
					$doc = $xml->addChild('statut');
					$doc->addChild('error', "Echec de la préparation (CodePostal) : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error);
				}
				if (!$stmt->bind_param("i", $_GET['numCodePostal'])) {
					$doc = $xml->addChild('statut');
					$doc->addChild('error', "Echec lors du liage des paramètres (CodePostal) : (" . $stmt->errno . ") " . $stmt->error);
				}
				if (!$stmt->execute()) {
					$doc = $xml->addChild('statut');
					$doc->addChild('error', "Echec lors de l'exécution (CodePostal) : (" . $stmt->errno . ") " . $stmt->error);
				} else {
					$doc = $xml->addChild('statut');
					$doc->addChild('ok', "CodePostal `" . $_GET['numCodePostal'] . "` ajouté");
					$idCodePostal = $mysqli->insert_id;
				}
			} else {
				$doc = $xml->addChild('codePostal');
				$doc->addChild('id', $idCodePostal);
			}
			
			$idVille = isValueExist("Ville", "nomVille", "'" . strtoupper($_GET['nomVille']) . "'", "idVille", "idCodePostal", $idCodePostal);

			if (!$idVille) {
				if (!($stmt = $mysqli->prepare("INSERT INTO Ville(idCodePostal, nomVille) VALUES (?, ?)"))) {
					$doc = $xml->addChild('statut');
					$doc->addChild('error', "Echec de la préparation (Ville) : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error);
				}
				if (!$stmt->bind_param("is", $idCodePostal, strtoupper($_GET['nomVille']))) {
					$doc = $xml->addChild('statut');
					$doc->addChild('error', "Echec lors du liage des paramètres (Ville) : (" . $stmt->errno . ") " . $stmt->error);
				}
				if (!$stmt->execute()) {
					$doc = $xml->addChild('statut');
					$doc->addChild('error', "Echec lors de l'exécution (Ville) : (" . $stmt->errno . ") " . $stmt->error);
				} else {
					$doc = $xml->addChild('statut');
					$doc->addChild('ok', "Ville `" . strtoupper($_GET['nomVille']) . "` ajouté");
					$idCodePostal = $mysqli->insert_id;
				}
			} else {
				$doc = $xml->addChild('ville');
				$doc->addChild('id', $idVille);
			}
			
			if (!($stmt = $mysqli->prepare("INSERT INTO AdresseClient(appartement, numRue, nomRue, idVille) VALUES (?, ?, ?, ?)"))) {
				$doc = $xml->addChild('adresseClient');
				$doc->addChild('error', "Echec de la préparation (AdresseClient) : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error);
			}
			if (!$stmt->bind_param("sssi", $_GET['appartement'], $_GET['numRue'], $_GET['nomRue'], $idVille)) {
				$doc = $xml->addChild('adresseClient');
				$doc->addChild('error', "Echec lors du liage des paramètres (AdresseClient) : (" . $stmt->errno . ") " . $stmt->error);
			}
			if (!$stmt->execute()) {
				$doc = $xml->addChild('adresseClient');
				$doc->addChild('error', "Echec lors de l'exécution (AdresseClient) : (" . $stmt->errno . ") " . $stmt->error);
			} else {
				$doc = $xml->addChild('adresseClient');
				$idAdresseClient = $mysqli->insert_id;
				$doc->addChild('ok', "AdresseClient `" . $idAdresseClient . "` ajouté");
			}
			
			
			$refClient = strtoupper(substr($_GET['nomClient'], 0, 3)) . rand();
			
			if (!($stmt = $mysqli->prepare("INSERT INTO Client(refClient, nomClient, emailClient, loginClient, passwordClient, idAdressePrincipale, telephonePortable, telephoneDomicile) VALUES (?, ?, ?, ?, ?, ?, ?, ?)"))) {
				$doc = $xml->addChild('client');
				$doc->addChild('error', "Echec de la préparation (Client) : (" . $mysqli->connect_errno . ") " . $mysqli->connect_error);
			}
			if (!$stmt->bind_param("sssssiss", $refClient, $_GET['nomClient'], $_GET['emailClient'], $_GET['loginClient'], $_GET['passwordClient'], $idAdresseClient, $_GET['telephonePortable'], $_GET['telephoneDomicile'])) {
				$doc = $xml->addChild('client');
				$doc->addChild('error', "Echec lors du liage des paramètres (Client) : (" . $stmt->errno . ") " . $stmt->error);
			}
			if (!$stmt->execute()) {
				$doc = $xml->addChild('client');
				$doc->addChild('error', "Echec lors de l'exécution (Client) : (" . $stmt->errno . ") " . $stmt->error);
			} else {
				$doc = $xml->addChild('client');
				$doc->addChild('ok', "Client `" . $refClient . "` ajouté");
				$idCodePostal = $mysqli->insert_id;
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