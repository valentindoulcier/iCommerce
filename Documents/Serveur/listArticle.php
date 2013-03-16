<?php
	$mysqli = new mysqli("127.0.0.1", "admin", "", "iCommerce", 3306);
	if ($mysqli->connect_errno) {
    	echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
    	exit();
	}
	
	$query = "SELECT * FROM Article NATURAL JOIN Categorie NATURAL JOIN SousCategorie NATURAL JOIN Marque";
	$queryCommentaire = "SELECT * FROM Article NATURAL JOIN Commentaire NATURAL JOIN Client";
	
	if (isset($_GET['idArticle'])) {
		$query .= " WHERE idArticle = '" . $_GET['idArticle'] . "'";
		$queryCommentaire .= " WHERE idArticle = '" . $_GET['idArticle'] . "'";
	}

	$res = $mysqli->query($query);
	$resCommentaire = $mysqli->query($queryCommentaire);
	
	$xml = new SimpleXMLElement('<xml encoding="UTF-8"/>');
	
	if ($res) {
		while ($row = $res->fetch_assoc()) {
    		$doc = $xml->addChild('article');
	    	$doc->addChild('idArticle', utf8_encode($row['idArticle']));
    		$doc->addChild('refArticle', utf8_encode($row['refArticle']));
    		$doc->addChild('nomArticle', utf8_encode($row['nomArticle']));
    		$doc->addChild('description', utf8_encode($row['description']));
    		$doc->addChild('photo', utf8_encode($row['photo']));
    		$doc->addChild('idCategorie', utf8_encode($row['idCategorie']));
    		$doc->addChild('nomCategorie', utf8_encode($row['nomCategorie']));
    		$doc->addChild('idSousCategorie', utf8_encode($row['idSousCategorie']));
    		$doc->addChild('nomSousCategorie', utf8_encode($row['nomSousCategorie']));
    		$doc->addChild('idMarque', utf8_encode($row['idMarque']));
    		$doc->addChild('nomMarque', utf8_encode($row['nomMarque']));
    		$doc->addChild('prixHT', utf8_encode($row['prixHT']));
    		$doc->addChild('tauxTVA', utf8_encode($row['tauxTVA']));
    		
    		$commentaires = $doc->addChild('commentaires');
    		if ($resCommentaire) {
    			$resCommentaire->data_seek(0);
    			while ($rowCommentaire = $resCommentaire->fetch_assoc()) {
    				if ($rowCommentaire['idArticle'] == $row['idArticle']) {
    					$commentaire = $commentaires->addChild('commentaire');
    					$commentaire->addChild('idCommentaire', utf8_encode($rowCommentaire['idCommentaire']));
    					$commentaire->addChild('commantaireArticle', utf8_encode($rowCommentaire['commantaireArticle']));
    					$commentaire->addChild('noteArticle', utf8_encode($rowCommentaire['noteArticle']));
    					
    					$client = $commentaire->addChild('client');
    					$client->addChild('idClient', utf8_encode($rowCommentaire['idClient']));
    					$client->addChild('nomClient', utf8_encode($rowCommentaire['nomClient']));
    					$client->addChild('emailClient', utf8_encode($rowCommentaire['emailClient']));
    					$client->addChild('loginClient', utf8_encode($rowCommentaire['loginClient']));
    				}
    			}
    		}
		}
		$res->close();
		if ($resCommentaire) { $resCommentaire->close(); }
	}
	
	Header('Content-type: text/xml');
	print($xml->asXML());
	
	//file_put_contents("/var/www/iCommerce/xml/articleList.xml", $xml);
	
	$mysqli->close();

?>