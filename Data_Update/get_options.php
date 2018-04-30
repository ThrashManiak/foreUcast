<?php
function get_options($select)
{
   $db=conectaDb();
   $query = "select ID_COUNTRY, COUNTRY_NAME from Countries;";
   $consulta = mysql_query($query);
    while($resultados = mysql_fetch_array($consulta)) { 
		        
        $ID_COUNTRY = $resultados['ID_COUNTRY']; 
        $COUNTRY_NAME = $resultados['COUNTRY_NAME']; 
		
		$options = '';

    if($select == $ID_COUNTRY)
        {
            $options.='<option value="'.$ID_COUNTRY.'" selected>'.$COUNTRY_NAME.'</option>';
			echo $options;
        }
    else
        {
            $options.='<option value="'.$ID_COUNTRY.'">'.$COUNTRY_NAME.'</option>';
			echo $options;
        }
    }
	
	$db= null;
	return $options;
	
	      
}
?>