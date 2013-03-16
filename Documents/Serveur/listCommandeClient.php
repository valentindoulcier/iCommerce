<?php
	$mysqli = new mysqli("127.0.0.1", "admin", "", "iCommerce", 3306);
	if ($mysqli->connect_errno) {
    	echo "Failed to connect to MySQL: (" . $mysqli->connect_errno . ") " . $mysqli->connect_error;
    	exit();
	}
	
	$query = "SELECT * FROM Client";
	$queryCommande = "SELECT * FROM Commande NATURAL JOIN TypeLivraison NATURAL JOIN EtatCommande";
	$queryAdresse = "SELECT * FROM AdresseClient NATURAL JOIN Ville NATURAL JOIN CodePostal";
	$queryArticle = "SELECT * FROM Commande C, ArticleCommande AC, Article A NATURAL JOIN Categorie NATURAL JOIN SousCategorie NATURAL JOIN Marque WHERE A.idArticle = AC.idArticle AND AC.idCommande = C.idCommande";
	
	if (isset($_GET['idClient'])) {
		$query .= " WHERE idClient = '" . $_GET['idClient'] . "'";
		$queryCommande .= " WHERE idClient = '" . $_GET['idClient'] . "'";
		$queryAdresse .= " WHERE idClient = '" . $_GET['idClient'] . "'";
		$queryArticle .= " WHERE idClient = '" . $_GET['idClient'] . "'";
	}
	
	$res = $mysqli->query($query);
	$resCommande = $mysqli->query($queryCommande);
	$resAdresse = $mysqli->query($queryAdresse);
	$resArticle = $mysqli->query($queryArticle);
	
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
    		
    		$commandes = $doc->addChild('commandes');
    		if ($resCommande) {
    			$resCommande->data_seek(0);
    			while ($rowCommande = $resCommande->fetch_assoc()) {
    				if ($rowCommande['idClient'] == $row['idClient']) {
    					$commande = $commandes->addChild('commande');
    					$commande->addChild('idCommande', utf8_encode($rowCommande['idCommande']));
    					$commande->addChild('dateCommande', utf8_encode($rowCommande['dateCommande']));
    					$commande->addChild('dateEstimeeLivraison', utf8_encode($rowCommande['dateEstimeeLivraison']));
    					$commande->addChild('dateExpedition', utf8_encode($rowCommande['dateExpedition']));
    					$commande->addChild('numColis', utf8_encode($rowCommande['numColis']));
    					$commande->addChild('prixLivraison', utf8_encode($rowCommande['prixLivraison']));
    					
    					$expedition = $commande->addChild('expedition');
    					$expedition->addChild('idTypeLivraison', utf8_encode($rowCommande['idTypeLivraison']));
    					$expedition->addChild('nomTypeLivraison', utf8_encode($rowCommande['nomTypeLivraison']));
    					
    					$etatCommande = $commande->addChild('etat_commande');
    					$etatCommande->addChild('idEtatCommande', utf8_encode($rowCommande['idEtatCommande']));
    					$etatCommande->addChild('nomEtatComande', utf8_encode($rowCommande['nomEtatComande']));
    					
    					if ($resAdresse) {
    						$resAdresse->data_seek(0);
    						while ($rowAdresse = $resAdresse->fetch_assoc()) {
    							if ($rowCommande['adresseLivraison'] == $rowAdresse['idAdresseClient']) {
    								$adresseLivraison = $commande->addChild('adresseLivraison');
    								$adresseLivraison->addChild('idAdresseLivraison', utf8_encode($rowAdresse['idAdresseClient']));;
    								$adresseLivraison->addChild('appartement', utf8_encode($rowAdresse['appartement']));
    								$adresseLivraison->addChild('numRue', utf8_encode($rowAdresse['numRue']));
    								$adresseLivraison->addChild('nomRue', utf8_encode($rowAdresse['nomRue']));
    								$adresseLivraison->addChild('idVille', utf8_encode($rowAdresse['idVille']));
    								$adresseLivraison->addChild('idCodePostal', utf8_encode($rowAdresse['idCodePostal']));
    								$adresseLivraison->addChild('numCodePostal', utf8_encode($rowAdresse['numCodePostal']));
    								$adresseLivraison->addChild('nomVille', utf8_encode($rowAdresse['nomVille']));
    							}
    						}
    					}
    					
    					if ($resAdresse) {
    						$resAdresse->data_seek(0);
    						while ($rowAdresse = $resAdresse->fetch_assoc()) {
    							if ($rowCommande['adresseFacturation'] == $rowAdresse['idAdresseClient']) {
    								$adresseFacturation = $commande->addChild('adresseFacturation');
    								$adresseFacturation->addChild('idAdresseLivraison', utf8_encode($rowAdresse['idAdresseClient']));;
    								$adresseFacturation->addChild('appartement', utf8_encode($rowAdresse['appartement']));
    								$adresseFacturation->addChild('numRue', utf8_encode($rowAdresse['numRue']));
    								$adresseFacturation->addChild('nomRue', utf8_encode($rowAdresse['nomRue']));
    								$adresseFacturation->addChild('idVille', utf8_encode($rowAdresse['idVille']));
    								$adresseFacturation->addChild('idCodePostal', utf8_encode($rowAdresse['idCodePostal']));
    								$adresseFacturation->addChild('numCodePostal', utf8_encode($rowAdresse['numCodePostal']));
    								$adresseFacturation->addChild('nomVille', utf8_encode($rowAdresse['nomVille']));
    							}
    						}
    					}
    					
    					if ($resArticle) {
    						$resArticle->data_seek(0);
    						while ($rowArticle = $resArticle->fetch_assoc()) {
    							if ($rowArticle['idCommande'] == $rowCommande['idCommande']) {
    								$articleCommande = $commande->addChild('articleCommande');
	    							$articleCommande->addChild('idArticle', utf8_encode($rowArticle['idArticle']));
	    							$articleCommande->addChild('refArticle', utf8_encode($rowArticle['refArticle']));
	    							$articleCommande->addChild('nomArticle', utf8_encode($rowArticle['nomArticle']));
	    							$articleCommande->addChild('description', utf8_encode($rowArticle['description']));
	    							$articleCommande->addChild('photo', utf8_encode($rowArticle['photo']));
	    							$articleCommande->addChild('idCategorie', utf8_encode($rowArticle['idCategorie']));
	    							$articleCommande->addChild('nomCategorie', utf8_encode($rowArticle['nomCategorie']));
	    							$articleCommande->addChild('idSousCategorie', utf8_encode($rowArticle['idSousCategorie']));
	    							$articleCommande->addChild('nomSousCategorie', utf8_encode($rowArticle['nomSousCategorie']));
	    							$articleCommande->addChild('idMarque', utf8_encode($rowArticle['idMarque']));
	    							$articleCommande->addChild('nomMarque', utf8_encode($rowArticle['nomMarque']));
	    							$articleCommande->addChild('prixHT', utf8_encode($rowArticle['prixHT']));
	    							$articleCommande->addChild('tauxTVA', utf8_encode($rowArticle['tauxTVA']));
	    							$articleCommande->addChild('quantite', utf8_encode($rowArticle['quantite']));
	    						}
    						}
    					}
    				}
    			}
    		}
		}
		$res->close();
		if ($resCommande) { $resCommande->close(); }
		if ($resAdresse)  { $resAdresse->close(); }
		if ($resArticle)  { $resArticle->close(); }
	}
	
	Header('Content-type: text/xml');
	print($xml->asXML());

	$mysqli->close();

?>