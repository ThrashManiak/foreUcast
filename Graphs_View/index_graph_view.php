<?php
$selected = '';


include_once '../conectaDb.php';
include_once 'leer_datos.php';
include_once 'get_options.php'
?>
<!DOCTYPE html
<html>
    <head>
        <title>foreUcast</title>
        <LINK REL="stylesheet" TYPE="text/css" HREF="../doc_style.css">
    </head>
    <body>
<div class="menu">
<?php include '../menu.php';?>
<br><br><br>
</div>

<h4>ForeUcast</h4>
<p><h2>Graph Display of the Equation Coeficients for the Selected Country<h2></p>
<div>
<form action = "" method = "POST">
<table style=" width:650px">
        
      <tr>
            <td><img src="index1.php" alt="Ups!! there is a MIME problem"></td>
            <td><img src="index2.php" alt="Ups!! there is a MIME problem"></td>
    </tr>

    <tr>
    
            <td><img src="index3.php" alt="Ups!! there is a MIME problem"></td>
            <td><img src="index4.php" alt="Ups!! there is a MIME problem"></td>
    </tr>


</table>

<br><br><br>

</form>
</div>
<div class="footer">
<?php include '../footer.php';?>
</div>
    </body>
</html>
