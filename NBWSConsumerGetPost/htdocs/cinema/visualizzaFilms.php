<?php
include("connect.php");
session_start();

?>
<?php
$sqlQuery = "SELECT Titolo,AnnoProduzione,Nazionalita,Regista,Genere,Durata,CodFilm FROM film";
$result = $conn->query($sqlQuery);
if($result->num_rows > 0) {
	echo "<films>";
	while($row = $result->fetch_assoc()) {
		echo "<film>";
		echo "<codFilm>".$row["CodFilm"]."</codFilm>";
		echo "<Titolo>".$row["Titolo"]."</Titolo>";
		echo "<AnnoProduzione>".$row["AnnoProduzione"]."</AnnoProduzione>";
		echo "<Nazionalita>".$row["Nazionalita"]."</Nazionalita>";
		echo "<Regista>".$row["Regista"]."</Regista>";
		echo "<Genere>".$row["Genere"]."</Genere>";
		echo "<Durata>".$row["Durata"]."</Durata>";
		echo "</film>";   	
	}
	echo "</films>";
}
	
   
?>