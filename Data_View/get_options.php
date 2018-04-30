<?php
//include_once 'conectaDb.php';
function get_options($select)
{
   $db=conectaDb();
   
   $query = "show tables WHERE Tables_in_project NOT LIKE"."'"."COUNTRIES"."'";

    // consulta que retorna totes les taules meny 'countries'
    
    $consulta = mysql_query($query);
    
    if(!$consulta ) {
      die('Could not get data: ' . mysql_error());
   }
    
    while($resultados = mysql_fetch_array($consulta)) 
    { 
            $table = $resultados['Tables_in_project']; 
        
        //de la taula tables_in_project escull el nom de cada taula

            $options = '';

                if($select == $table)
                    {
                        $options.='<option value="'.$table.'" selected>'.$table.'</option>';
                        echo $options;
                    }
                else
                    {
                        $options.='<option value="'.$table.'">'.$table.'</option>';
                        echo $options;
                    }
    }
    
    $db= null;
   // echo "la $options <br>";
	return $options;
}
/*$select = 'x';
get_options($select);*/
    
?>