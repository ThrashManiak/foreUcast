<?php
//Funcio llegir dades
include "display_ima.php";
function leer_datos($select)
{
	//Conexio amb Base de Dades
	$db=conectaDb();
	print "<h1> Connected!!</h1>";

//Monte'm la Query per a consultar dades
//fem servir la variable $select per filtrar el resultat que volem 
    
    
    //seleccionem el pais   
    $query_pais = "SELECT COUNTRY_NAME from COUNTRIES WHERE ID_COUNTRY ="."'".$select."'";
//seleccionem les universitats del pais   
    $query = "SELECT * from UNIVERSITY WHERE ID_COUNTRY ="."'".$select."'";
//seleccionem coeficient taula Educacio
    $query_edu = "SELECT EDU_COEFICIENT from EDUCATION WHERE ID_COUNTRY ="."'".$select."'";
//seleccionem coeficient taula SocioDemo
    $query_socio = "SELECT SOCIO_COEFICIENT from SOCIODEMO WHERE ID_COUNTRY ="."'".$select."'";
//seleccionem coeficient taula Wealth
    $query_wealth = "SELECT WEALTH_COEFICIENT from WEALTH WHERE ID_COUNTRY ="."'".$select."'";
    
//S'envien les Query a la Base de dades
    $consulta_pais = mysql_query($query_pais);
    $consulta = mysql_query($query);
	$consulta_edu = mysql_query($query_edu);
    $consulta_socio = mysql_query($query_socio);
    $consulta_wealth = mysql_query($query_wealth);
	
//$resultados en una matriu que conte les dades d'un registre.
//El bucle es repeteix tantes vegades com registres tenim.

    
    $resultados_pais = mysql_fetch_array($consulta_pais); 
    $country_name = $resultados_pais['COUNTRY_NAME'];
    
	
$myfile = fopen("../country_name.txt", "w")or die("Unable to open file!");
$txt = $country_name;
fwrite($myfile, $txt);
fclose($myfile);
	
	
    print "<p><h4> The country selected is: $country_name </h4>";
	
    
    //IDENTIFICACIO DELS COEFICIENTS
    //Nomes retornen un valor per tant no necessiten loop
    
    $resultados_edu = mysql_fetch_array($consulta_edu); 
    $EDU_COEFICIENT = $resultados_edu['EDU_COEFICIENT']; 
    print "<h2><p>El coeficient per la variable Educacio es: $EDU_COEFICIENT</h2></p>\n";
    
    $resultados_socio = mysql_fetch_array($consulta_socio);
    $SOCIO_COEFICIENT = $resultados_socio['SOCIO_COEFICIENT']; 
    print "<p><h2>El coeficient per la variable Sociodemografic es: $SOCIO_COEFICIENT</h2></p>\n";
    
    $resultados_wealth = mysql_fetch_array($consulta_wealth);
    $WEALTH_COEFICIENT = $resultados_wealth['WEALTH_COEFICIENT']; 
    print "<p><h2>El coeficient per la variable Riquessa es: $WEALTH_COEFICIENT</h2></p>\n";
    
    echo "<h3>-</h3>";
    
    //IDENTIFICACIO DELS PARAMETRES
    
    // LOCAL AND GLOBAL AVERAGE, HOW WELL DOES THIS COUNTRY IN EDUCATION
    
     $query_avg_edu = "SELECT AVG(EDU_COEFICIENT) as EDU_COEFICIENT from EDUCATION WHERE ID_COUNTRY ="."'".$select."'";
    $consulta_avg_edu = mysql_query($query_avg_edu);
    $resultados_avg_edu = mysql_fetch_array($consulta_avg_edu);
	$EDU_COEFICIENT_avg = $resultados_avg_edu['EDU_COEFICIENT']; 
    print "<h2>El parametre promitg d'Educacio dels ultims anys de $country_name es: $EDU_COEFICIENT_avg</h2>";
    
    
    $query_avg_edu_glob = "SELECT AVG(EDU_COEFICIENT) as EDU_COEFICIENT from EDUCATION";
    $consulta_avg_edu_glo = mysql_query($query_avg_edu_glob);
    $resultados_avg_edu_glo = mysql_fetch_array($consulta_avg_edu_glo);
	$EDU_COEFICIENT_avg_glo = $resultados_avg_edu_glo['EDU_COEFICIENT']; 
    print "<h2>El parametre promitg dels altres païssos en Educacio dels ultims anys es: $EDU_COEFICIENT_avg_glo</h2>";
    
    //display_ima($EDU_COEFICIENT_avg,$EDU_COEFICIENT_avg_glo);
    
    echo "<h3>-</h3>";
    
    // LOCAL AND GLOBAL AVERAGE, HOW WELL DOES THIS COUNTRY IN WEALTH
    
    $query_avg = "SELECT AVG(WEALTH_COEFICIENT) as WEALTH from WEALTH WHERE ID_COUNTRY ="."'".$select."'";
    $consulta_avg = mysql_query($query_avg);
    $resultados_avg = mysql_fetch_array($consulta_avg);
	$WEALTH_avg = $resultados_avg['WEALTH']; 
    print "<p><h2>El parametre promitg de Riquessa de $country_name dels ultims anys es: $WEALTH_avg</h2></p>\n";
    
    
    $query_avg_glob = "SELECT AVG(WEALTH_COEFICIENT) as WEALTH_GLOB from WEALTH";
    $consulta_avg_glob = mysql_query($query_avg_glob);
    $resultados_avg_glob = mysql_fetch_array($consulta_avg_glob);
	$WEALTH_GLOB = $resultados_avg_glob['WEALTH_GLOB']; 
    print "<p><h2>El parametre promitg de Riquessa dels altres païssos els ultims anys es: $WEALTH_GLOB</h2></p>\n";
    
   // display_ima($WEALTH_GLOB,$WEALTH_avg);
    
    echo "<h3>-</h3>";
    
    // LOCAL AND GLOBAL AVERAGE, HOW WELL DOES THIS COUNTRY IN SOCIODEMOGRAPHICS
    
    $query_avg_socio = "SELECT AVG(SOCIO_COEFICIENT) as SOCIAL from SOCIODEMO WHERE ID_COUNTRY ="."'".$select."'";
    $consulta_avg_socio = mysql_query($query_avg_socio);
    $resultados_avg_socio = mysql_fetch_array($consulta_avg_socio);
	$SOCIAL = $resultados_avg_socio['SOCIAL']; 
    print "<p><h2>El parametre promitg de Societat de $country_name dels ultims anys es: $SOCIAL</h2></p>\n";
    
    $query_avg_socio_glob = "SELECT AVG(SOCIO_COEFICIENT) as SOCIAL_GLOB from SOCIODEMO";
    $consulta_avg_socio_glob = mysql_query($query_avg_socio_glob);
    $resultados_avg_socio_glob = mysql_fetch_array($consulta_avg_socio_glob);
	$SOCIAL_glob = $resultados_avg_socio_glob['SOCIAL_GLOB']; 
    print "<p><h2>El parametre promitg dels altres païssos en Societat els ultims anys es: $SOCIAL_glob</h2></p>\n";
    
   // display_ima($SOCIAL_glob,$SOCIAL);
  
   echo "<h3>-</h3>";
   
    
 /*   print "<p><h1>L'equació de Regressio Multivariant per la Prosperitat de $country_name</h1></p>\n";
    print "<p>Prosperitat $country_name= 0.83 + $EDU_COEFICIENT * $EDU_COEFICIENT_avg + $WEALTH_COEFICIENT * $WEALTH_avg + $SOCIO_COEFICIENT * $SOCIAL + Error </p>\n";
*/ 


echo '<TABLE CELLPADDING="5">';
    echo "<tr>";
    echo '<TH COLSPAN="12"><h1>Multiple linear regression equation for Happines </h1></TH>';
    echo "</tr>";
        echo "<th><h2>Happines $country_name</th>";
        echo "<th><h2>=</h1></td>";
        echo "<td><h2>Base Value</h1></td>";
        echo "<th><h2>+</h1></td>";   
        echo "<th><h2>Education</h1></td>";
        echo "<th><h2>+</h1></td>";
        echo "<th><h2>Wealth</h1></td>";
        echo "<th><h2>+</h1></td>";
        echo "<th><h2>Society</h1></td>";
        echo "<th><h2>+</h1></td>";
        echo "<th><h2>Error</h1></td>";
        echo '<TD> &nbsp;</TD>';
    echo "</tr>";
    
echo "<tr>";
    echo "<tr>";
        echo "<td><h2>Smilies for $country_name</h2></td>";
        echo "<th><h1>=</h1></td>";
        echo '<TD> &nbsp;</TD>';
        echo "<th><h1>+</h1></td>";   
            echo "<th>";
            display_ima($SOCIAL_glob,$SOCIAL);
            echo "</td>";
        echo "<th><h1>+</h1></td>";
            echo "<th>";
            display_ima($WEALTH_GLOB,$WEALTH_avg);
            echo "</td>";
        echo "<td><h1>+</h1></td>";
            echo "<th>";
            display_ima($EDU_COEFICIENT_avg,$EDU_COEFICIENT_avg_glo);
            echo "</td>";
        echo "<td><h1>+</h1></td>";
        echo '<TD> &nbsp;</TD>';
        echo '<TD> &nbsp;</TD>';
    echo "</tr>";
echo "<tr>";
    echo '<TD COLSPAN="12"><h3>-</h3></TD>';
echo "</tr>";    
echo "<tr>";
echo "<TD><h2>XXxXXX $country_name</h2></TD>";
    echo "<td><h2>=</h2></td>";
    echo "<td><h2>0.83</h2></td>";
    echo "<td><h2>+</h2></td>";      
    echo "<td><h2>$EDU_COEFICIENT * $EDU_COEFICIENT_avg</h2></td>";
    echo "<td><h2>+</h2></td>";
    echo "<td><h2>$WEALTH_COEFICIENT * $WEALTH_avg</h2></td>";
    echo "<td><h2>+</h2></td>";
    echo "<td><h2>$SOCIO_COEFICIENT * $SOCIAL</h2></td>";
    echo "<td><h2>+</h2></td>";
    echo "<td><h2>Error</h2></td>";
    echo '<TD> &nbsp;</TD>';
echo "</tr>";
   
echo "</TABLE>";



    
	
	//desconexio de la base de dades
	$db= null;
}


?>