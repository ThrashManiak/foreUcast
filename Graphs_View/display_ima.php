<?php
function display_ima()
{
$db=conectaDb();
    echo "<br>";
   $query = "select ID_EDU, TOTAL_UNIV from EDUCATION;";
   $consulta = mysql_query($query);
    
    
    while($resultados = mysql_fetch_array($consulta)) { 
		    
        
        // agafa els primers valors i els assigna a les variables
        
        $ID_EDU = $resultados['ID_EDU']; 
        echo "$ID_EDU - ";
        
        $TOTAL_UNIV = $resultados['TOTAL_UNIV']; 
		echo $TOTAL_UNIV;
        
		//$options = '';
        // si el numero es positiu mostra una imatge sino l'altre
        
        if($TOTAL_UNIV >0)
            {
                echo '<img src="/projecte/img1/image/ohno.png"/>';
            }
        else
            {
                echo '<img src="/projecte/img1/image/cool.png"/>';
            }
        }
	
	$db= null;
}
//$imm = display_ima();
?>