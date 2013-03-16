<?php
	$mysqli = new mysqli("127.0.0.1", "admin", "", "iCommerce", 3306);
	if ($mysqli->connect_errno) {
    	echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
    	exit();
	}
	
	$query = "SELECT * FROM Article NATURAL JOIN Categorie NATURAL JOIN SousCategorie NATURAL JOIN Marque";
	$querySouhait = "SELECT * FROM Article NATURAL JOIN ListeSouhait NATURAL JOIN Client";
	
	if (isset($_GET['idClient'])) {
		$query .= " WHERE idClient = '" . $_GET['idClient'] . "'";
		$querySouhait .= " WHERE idClient = '" . $_GET['idClient'] . "'";
	}
	
	$res = $mysqli->query($query);
	$resSouhait= $mysqli->query($querySouhait);
	
	$xml = new SimpleXMLElement('<xml encoding="UTF-8"/>');
	
	if ($resSouhait) {
		while ($rowSouhait = $resSouhait->fetch_assoc()) {
    		$doc = $xml->addChild('client');
	    	$doc->addChild('idClient', utf8_encode($rowSouhait['idClient']));
    		$doc->addChild('refClient', utf8_encode($rowSouhait['refClient']));
    		$doc->addChild('nomClient', utf8_encode($rowSouhait['nomClient']));
    		$doc->addChild('emailClient', utf8_encode($rowSouhait['emailClient']));
    		$doc->addChild('loginClient', utf8_encode($rowSouhait['loginClient']));
    		
    		$souhait = $doc->addChild('souhait');
    		
    		if ($res) {
    			$res->data_seek(0);
    			while ($row = $res->fetch_assoc()) {
    				if ($rowSouhait['idArticle'] == $row['idArticle']) {
    					$article = $souhait->addChild('article');
    		
	    				$article->addChild('idArticle', utf8_encode($row['idArticle']));
    					$article->addChild('refArticle', utf8_encode($row['refArticle']));
    					$article->addChild('nomArticle', utf8_encode($row['nomArticle']));
    					$article->addChild('description', utf8_encode($row['description']));
    					$article->addChild('photo', utf8_encode($row['photo']));
    					$article->addChild('idCategorie', utf8_encode($row['idCategorie']));
    					$article->addChild('nomCategorie', utf8_encode($row['nomCategorie']));
    					$article->addChild('idSousCategorie', utf8_encode($row['idSousCategorie']));
    					$article->addChild('nomSousCategorie', utf8_encode($row['nomSousCategorie']));
    					$article->addChild('idMarque', utf8_encode($row['idMarque']));
    					$article->addChild('nomMarque', utf8_encode($row['nomMarque']));
    					$article->addChild('prixHT', utf8_encode($row['prixHT']));
    					$article->addChild('tauxTVA', utf8_encode($row['tauxTVA']));
    				}
    			}
    		}
		}
		if ($res) { $res->close(); }
		$resSouhait->close();
	}
	
	Header('Content-type: text/xml');
	print($xml->asXML());

	$mysqli->close();

?>