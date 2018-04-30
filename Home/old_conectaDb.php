<?php
function conectaDb()
{
	//Funcio per a conectar amb la base de dades PROJECT 
	//Passem l'adreça de la base de datos, el login i la paraula de pass
    
	$con = mysql_connect("localhost","root",""); 
	
	//Si no hi ha  conexio es mostra un missatge d'error y finalitza el php
    
    if (!$con) 
    { 
		echo 'Could not connect: ' . mysql_error(); 
		exit();
    } 
	
	// Seleccio de la base de dades.
    mysql_select_db("project", $con);
	echo 'Connected: ';
	//retorna la conexio a la base de dades.
	return $con;
}
?>
