<!-- DATA INSERT -->
<html>
<head>
    <LINK REL="stylesheet" TYPE="text/css" HREF="../doc_style.css">
</head>
<body style="">
<div class="menu">
<?php include '../menu.php';?>
<br><br><br>
</div>
<?php

//Funcion que Inserta un registro de la base de datos prueba.



//Funcion para Conectar a la BD
function conectaDb()
{
	try {
		$db = new PDO('mysql:host=localhost;dbname=project', "root", "");
		$db->setAttribute(PDO::MYSQL_ATTR_USE_BUFFERED_QUERY, true);
		return ($db);
	} catch (PDOException $e) {
		
    print "¡Error!: " . $e->getMessage() . "<br/>";
    
	exit();
	}
}


$db=conectaDb();
//print "<br> Connected!<br>";

//Realizamos la escritura
	 if(@$_POST["COUNTRY"]!= NULL)
    {
        $country = $_POST["COUNTRY"];
         
         
    }
    else{
        $country = "NULL (enter a country)";
    }
    
    
    
    
    if(@$_POST["year"]!= NULL)
    {
        $year = $_POST["year"];
         
         
    }
    else{
        $year = "NULL (You must enter a Year)";
    }
    
    
    
   // $year = $_POST["year"];
    $resources = $_POST["resources"];
	$depende = $_POST["depende"];
    $index_uni_1 = $_POST["index_uni_1"];
    $index_uni_2 = $_POST["index_uni_2"];
    $index_freedom = $_POST["index_freedom"];
	$index_civil_risks = $_POST["index_civil_risks"];
    $index_religion = $_POST["index_religion"];
    
    
    print "<p><h4>Country Code is $country .The year is $year</h4></p>\n";
        
    // WE BEGIN THE CONSULTS FOR THE UPDATE
    
    // UPDATE FOR THE WEALTH TABLE
    
	$consulta0 = "UPDATE WEALTH SET RESOURCES = $resources WHERE YEAR_DATA = $year AND ID_COUNTRY = "."'".$country."'";
    
    $actualitza0= "call pr_update_total_wealth()";// PREPARE SQL PROCEDURE
    
    if ($resources) print "<p><h2>New value for Resources : $resources <br></h2></p>\n";
	
    
    $consulta1 = "UPDATE WEALTH SET DEPENDENCY = $depende WHERE YEAR_DATA = $year AND ID_COUNTRY = "."'".$country."'";
	
    $actualitza0= "call pr_update_total_wealth()";// PREPARE SQL PROCEDURE
    
    if ($depende) print "<p><h2>New value for Dependency : $depende <br></h2></p>\n";
	
     // UPDATE FOR THE UNIVERSITY TABLE
    
    $consulta2 = "UPDATE UNIVERSITY SET INDEX1 = $index_uni_1 WHERE YEAR_DATA = $year AND ID_COUNTRY = "."'".$country."'";
    
    $actualitza1= "call pr_update_total_university()";
    
    
    if ($index_uni_1) print "<p><h2>New value for University Index 1: $index_uni_1 <br></h2></p>\n";
    
    $consulta3 = "UPDATE UNIVERSITY SET INDEX2 = $index_uni_2 WHERE YEAR_DATA = $year AND ID_COUNTRY = "."'".$country."'";
    
    $actualitza1= "call pr_update_total_university()";
    
    if ($index_uni_2)
    {print "<p><h2>New value for University Index 2 : $index_uni_2 <br></h2></p>\n";}
    
    
    
    // UPDATE FOR THE SOCIODEMOGRAPHICS TABLE
    
    
    $consulta4 = "UPDATE SOCIODEMO SET FREEDOM = $index_freedom WHERE YEAR_DATA = $year AND ID_COUNTRY = "."'".$country."'";
    
       
    $actualitza2= "CALL pr_update_total_socio()";
    
    if ($index_freedom){ print "<p><h2>New value for Freedom : $index_freedom <br></h2></p>\n";}else{echo "no data $index_freedom";}
	
    
    $consulta5 = "UPDATE SOCIODEMO SET CIVIL_RISKS = $index_civil_risks WHERE YEAR_DATA = $year AND ID_COUNTRY = "."'".$country."'";
    
    $actualitza2= "CALL pr_update_total_socio()";
	
    if($index_civil_risks) print "<p><h2>New value for Civil Risks : $index_civil_risks <br></h2></p>\n";
	
    
    $consulta6 = "UPDATE SOCIODEMO SET RELIGION = $index_religion WHERE YEAR_DATA = $year AND ID_COUNTRY = "."'".$country."'";
    
    $actualitza2= "CALL pr_update_total_socio()";
    
    if($index_religion) print "<p><h2>New value for Religion : $index_religion <br></h2></p>\n";
	
    echo "<h3>";
    
    // QUERY AND UPDATE OR ERROR MESSAGE
    
    
    // TABLE WEALTH LAUNCH QUERY AND UPDATE VIA PROCESS
    
	$result = $db->query($consulta0);
	if (!$result) {
	print "<h2>Resources Data not updated</h2>";
	} else {
        $result_act = $db->query($actualitza0);
        
        
	print "<h3> Change in Resources done!  New register = $resources</h3>";
	}
    
    $result1 = $db->query($consulta1);
    if (!$result1) {
	print "<h2>Dependency Data not updated</h2>";
	} else {
        
        $result_act = $db->query($actualitza0);
	print "<h3> Change in Dependency done!  New register = $depende </h3>";
	}
    
    
    // TABLE UNIVERSITY LAUNCH QUERY AND UPDATE VIA PROCESS
    
    
    $result2 = $db->query($consulta2);
    if (!$result2) {
	print "<h2>University Index 1 Data not updated </h2>";
	} else {
        $result_act1= $db->query($actualitza1);
	print "<h3> Change in University Index 1 done!  New register = $index_uni_1</h3>";
	}
    
    $result3 = $db->query($consulta3);
	if (!$result3) {
	print "<h2>University Index 2 Data not updated</h2>";
	} else {
        $result_act1= $db->query($actualitza1);
	print "<h3> Change in University Index 2 done!  New register = $index_uni_2</h3>";
	}
    
    
    
    // TABLE SOCIODEMO LAUNCH QUERY AND UPDATE VIA PROCESS
    
    
    $result4 = $db->query($consulta4);
    if (!$result4) {
	print "<h2>Freedom Data not updated</h2>";
	} else {
        $result_act2 = $db->query($actualitza2);        
        
	print "<h3> Change in Freedom done!  New register = $index_freedom </h3>";
	}
    
    $result5 = $db->query($consulta5);
    if (!$result5) {
	print "<h2>Civil Risks Data not updated </h2>";
	} else {
        $result_act2 = $db->query($actualitza2);
	print "<h3> Change in Civil Risks Index done!  New register = $index_civil_risks</h3>";
	}
    
    $result6 = $db->query($consulta6);
    if (!$result6) {
	print "<h2>Religion Data not updated </h2>";
	} else {
       $result_act2 = $db->query($actualitza2);
	print "<h3> Change in Religion Index done!  New register = $index_religion</h3>";
	}
    
$db= null;

?>
<h2>
    <br><br><a href="index_data_update.php">Return to the Update Data Page</a></h2>
<div class="footer"><h2>
<?php include '../footer.php';?>
</h2></div>  
</body>
</html>