<?php

/* 
this function reads data from the DDBB and creates an array with its values
*/

include_once "conectaDB.php";

function read_ddbbdata(&$data_DDBB, &$year_DDBB) 

{
    
$db=conectaDb();
    
//read the file that contains the value (country_id) selected in the first page    
 
$myfile = fopen("../country.txt", "r") or die("Unable to open file!");

//echo fread($myfile,filesize("../country.txt"));

$select=implode(" ",file("../country.txt"));// reads text as array so I turn it to string
    
// echo "select es: $select<br>";
    
    
fclose($myfile);    
 
    
$query = "select YEAR_DATA, EDU_COEFICIENT from EDUCATION WHERE ID_COUNTRY ="."'".$select."'";

$consulta = mysql_query($query);
	
while($row = mysql_fetch_array($consulta)) 
{ 
      $data_DDBB[] = $row['EDU_COEFICIENT'];
      $year_DDBB[] = $row['YEAR_DATA']; 
      
}
    

/*foreach ($data_DDBB as $value) 
            {
            echo "$value <br>";
            }
            
foreach ($year_DDBB as $value) 
            {
            echo "$value <br>";
            }          

$new_array[ $row['id']] = $row;
Using the second ways you would be able to address rows directly by their id, such as: $new_array[ 5]
*/
     
    
}

/*
$dataddbb = array();
$yearddbb = array();
read_ddbbdata($dataddbb, $yearddbb);
*/

?>