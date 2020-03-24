<?php

include("connect.php");
session_start();

	$sqlQuery = "SELECT Titolo, AnnoProduzione, Nazionalita, Regista, Genere, Durata, CodFilm, url FROM film";
	
	$idFilmSelezionato = ""	;
	
	if(isset($_POST["codFilm"]) && $_POST["codFilm"] != "") {
		$idFilmSelezionato = $_POST["codFilm"];
		$sqlQuery = $sqlQuery . " WHERE CodFilm = '".$idFilmSelezionato."'";
	}
	
	if(isset($_POST["durata"]) && $_POST["durata"]) {
		$durata = $_POST["durata"];
		if ($idFilmSelezionato != "")
			$sqlQuery = $sqlQuery . " OR durata = '".$durata."'";
		else
			$sqlQuery = $sqlQuery . " WHERE durata = '".$durata."'";
	}

	echo "Query = $sqlQuery\n";
	
	$result = $conn->query($sqlQuery);
	if($result->num_rows > 0) {
		echo "<films>\n";
		while($row = $result->fetch_assoc()) {			
			echo "<film>\n";
			echo "<codFilm>".$row["CodFilm"]."</codFilm>";
			echo "<Titolo>".$row["Titolo"]."</Titolo>";
			echo "<AnnoProduzione>".$row["AnnoProduzione"]."</AnnoProduzione>";
			echo "<Nazionalita>".$row["Nazionalita"]."</Nazionalita>";
			echo "<Regista>".$row["Regista"]."</Regista>";
			echo "<Genere>".$row["Genere"]."</Genere>";
			echo "<Durata>".$row["Durata"]."</Durata>\n";
			echo "</film>\n";  
		}
		echo "</films>\n";	
	}  
?>