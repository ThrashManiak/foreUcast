<?php
//Funcio llegir dades
function leer_datos($select)
{
	//Conexio amb Base de Dades
	$db=conectaDb();
	print "<br> Connected!!<br>";

//Monte'm la Query per a consultar dades
//fem servir la variable $select per filtrar el resultat que volem 
    
    

//seleccionem les universitats del pais   
    $query = "SELECT * from UNIVERSITY WHERE ID_COUNTRY ="."'".$select."'";
//seleccionem coeficient taula Educacio
    $query_edu = "SELECT EDU_COEFICIENT from EDUCATION WHERE ID_COUNTRY ="."'".$select."'";
//seleccionem coeficient taula SocioDemo
    $query_socio = "SELECT SOCIO_COEFICIENT from SOCIODEMO WHERE ID_COUNTRY ="."'".$select."'";
//seleccionem coeficient taula Wealth
    $query_wealth = "SELECT WEALTH_COEFICIENT from WEALTH WHERE ID_COUNTRY ="."'".$select."'";
    
//S'envien les Query a la Base de dades
    $consulta = mysql_query($query);
	$consulta_edu = mysql_query($query_edu);
    $consulta_socio = mysql_query($query_socio);
    $consulta_wealth = mysql_query($query_wealth);
	
//$resultados en una matriu que conte les dades d'un registre.
//El bucle es repeteix tantes vegades com registres tenim.

    print "<p> El pais seleccionat es: $select";
	while($resultados = mysql_fetch_array($consulta)) { 

		//Se recupera la informacion del registro
		//El indice de la matriz es el nombre de la columna.
        
        $total = $resultados['TOTAL']; 
        $nombre = $resultados['UNI_NAME']; 
		
		//Visualiza el registro
        print "<p>La Universitat es $nombre i la seva puntuacio es $total</p>\n";
    } 
    
    //IDENTIFICACIO DELS COEFICIENTS
    //Nomes retornen un valor per tant no necessiten loop
    
    $resultados_edu = mysql_fetch_array($consulta_edu); 
    $EDU_COEFICIENT = $resultados_edu['EDU_COEFICIENT']; 
    print "<p>El coeficient per la variable Educacio es: $EDU_COEFICIENT</p>\n";
    
    $resultados_socio = mysql_fetch_array($consulta_socio);
    $SOCIO_COEFICIENT = $resultados_socio['SOCIO_COEFICIENT']; 
    print "<p>El coeficient per la variable Sociodemografic es: $SOCIO_COEFICIENT</p>\n";
    
    $resultados_wealth = mysql_fetch_array($consulta_wealth);
    $WEALTH_COEFICIENT = $resultados_wealth['WEALTH_COEFICIENT']; 
    print "<p>El coeficient per la variable Riquessa es: $WEALTH_COEFICIENT</p>\n";
    
    //IDENTIFICACIO DELS PARAMETRES
    
    $query_avg = "SELECT AVG(PIB) as PIB from WEALTH WHERE ID_COUNTRY ="."'".$select."'";
    $consulta_avg = mysql_query($query_avg);
    $resultados_avg = mysql_fetch_array($consulta_avg);
	$PIB_avg = $resultados_avg['PIB']; 
    print "<p>El parametre promitg es:$PIB_avg</p>\n";
    
  /* a testejar
  $query_avg = "SELECT AVG(LIFE_EXP) as LIFE_EXP from WEALTH WHERE ID_COUNTRY ="."'".$select."'" .group by "."'".$select."'" ;
    $consulta_avg = mysql_query($query_avg);
    $resultados_avg = mysql_fetch_array($consulta_avg);
	$PIB_avg = $resultados_avg['PIB']; 
    print "<p>El parametre promitg es:$PIB_avg</p>\n";*/
    
    print "<p><h2>Equació de Regressio Multivariant per la Prosperitat</h2></p>\n";
    print "<p><h2>Prosperitat $select= k + $EDU_COEFICIENT * Educació + $WEALTH_COEFICIENT * $PIB_avg + $SOCIO_COEFICIENT * Cultura + Error </h2></p>\n";
	
	//desconexio de la base de dades
	$db= null;
}


?>