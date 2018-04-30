<?php
//Funcio llegir dades
function leer_datos($select)
{
	
	$db=conectaDb();
	//print "<br> Connected!!<br>";

    
//read the file that contains the value (country_id) selected in the first page    
 
$myfile = fopen("../country.txt", "r") or die("Unable to open file!");

//echo fread($myfile,filesize("../country.txt"));

$ID_Country=implode(" ",file("../country.txt"));// reads text as array so I turn it to string
    
// echo "select es: $select<br>";
    
    
fclose($myfile);
    
    
//read the file that contains the value (country_name) selected in the first page    
 
$myfile_name = fopen("../country_name.txt", "r") or die("Unable to open file!");

$COUNTRY_NAME=implode(" ",file("../country_name.txt"));// reads text as array so I turn it to string
    
fclose($myfile_name);
        
     
    
    
    //query to get data and fields name's
    // be really carefull with the blank spaces in the querys
    
   //$query = "SELECT * from "."$select". "WHERE ID_COUNTRY ="."'".$ID_Country."'";
   
    $query = "SELECT * from "." $select ". " WHERE ID_COUNTRY ="."'".$ID_Country."'";
    
    $query_sql = "DESCRIBE "."$select";
    
  print "<p><h3> The Coeficient $select from $COUNTRY_NAME has the following values: </h3><br>";
       

$result = mysql_query($query_sql);
$retval = mysql_query( $query);
    
if(!$result ) {die('Could not get data: ' . mysql_error());}
       
    while($row = mysql_fetch_array($result))
                {
                $fields[] =$row[0];
                }

if(!$retval ) {die('Could not get data: ' . mysql_error());}
   
    
   while($row = mysql_fetch_array($retval, MYSQL_NUM)) 
   {
        echo "<h2>Field : $fields[1] - Value : {$row[1]} <br> ".
                 "Field : $fields[2] - Value : {$row[2]} <br> ".
                 "Field : $fields[3] - Value : {$row[3]} <br> ".
                 "Field : $fields[4] - Value : {$row[4]} <br> ".
                 "Field : $fields[6] - Value : {$row[6]} <br> ".
                 "--------------------------------<br></h2>";
   }
   
  // echo "Fetched data successfully\n";
   
   mysql_close($db);
    
   	
}


?>

