<?php

$selected = ''; // use it to move data to the functions
include_once '../conectaDb.php';
include_once 'leer_datos.php';
include_once 'get_options.php'
?>
<!DOCTYPE html
<html>
    <head>
        <title>foreUcast</title>
        <LINK REL="stylesheet" TYPE="text/css" HREF="CSS/doc_style.css">
    </head>
    <body>
<div class="menu">
<?php include '../menu.php';?>
<br><br><br>
</div>

<p><h4>ForeUcast</h4></p>


<div>

<table style="float:none" width:"650px" CELLPADDING="5">
<tr>
    <TD> &nbsp;</TD>
    <TH COLSPAN="8">
    <p><h2>In this page you have the equation for a linear multivariate regression from a selected country.<br> The equation displays a country's prosperity and has the following parameters: </h2><h1><br> Y = A + B* Education + C * Wealth + D * Society + Error </h2></p>
    </TD>
<TD> &nbsp;</TD>
</tr>
<tr>
    <TD> &nbsp;</TD>
    <TH COLSPAN="8"><h2>Besides you have some Smileys to show you how well does a country compare with the average of all the other ones for each parameter. </h2></TH>
    <TD> &nbsp;</TD>
</tr>
<tr><h2>
<TD> &nbsp;</TD>
    <td align=center><img src="./image/awesome.png"/></td>
    <td align=center><img src="./image/cool.png"/></td>
    <td align=center><img src="./image/neutral.png"/></td>
    <td align=center><img src="./image/sad.png"/></td>
    <td align=center><img src="./image/ohno.png"/></td>
    <td align=center><img src="./image/blush.png"/></td>
<TD> &nbsp;</TD>
</tr></h2>
<tr><h2>
<TD> &nbsp;</TD>
    <td><p><h2>Top Country Value</h2></p></td>
    <td><p><h2>Country Value Above Average</h2></p></td>
    <td><p><h2>Country Value Average</h2></p></td>
    <td><p><h2>Country Value Below Average</h2></p></td>
    <td><p><h2>Very Lower Country Value</h2></p></td>
    <td><p><h2>Sorry no data or outliner data</h2></p></td>
<TD> &nbsp;</TD>
</tr></h2>
</TABLE>
</div>



<div>

<form action = "<?php $_PHP_SELF ?>" method = "POST">
<table style=" width:650px">
        <tr>
            <td style="text-align:left">
Select a Country
            </td>
            <td align=center>
                            
            </td>
        </tr>

        <tr>
            <td style="vertical-align:top">

                <select name = "countries" onchange="this.form.submit();">
                    <optgroup label="Countries List">
                        <?php 
                             get_options($selected);
                        ?>
                    </optgroup>
                </select>
            </td>
                 
<div><h4>
            <td style="text-align:left">

                <?php
                if(isset($_POST['countries']))
                {

                    $selected = $_POST['countries'];
                    //echo "El Codi que s'envia es: ";
                    //echo $selected;
                    //echo "<br>";
                    
                    
                    
$myfile = fopen("../country.txt", "w")or die("Unable to open file!");
$txt = $selected;
fwrite($myfile, $txt);
fclose($myfile);
 
                    
                    
                    
                    
                    
                    leer_datos($selected);

                }
                ?>

            </td>
</h4></div>
        </tr>
    </table>
<br><br><br>
<h2>
<input type=submit value="Submit" name=sub>
</form>
</h2></div>
<div class="footer"><h2>
<?php include '../footer.php';?>
</h2></div>
    </body>
</html>
