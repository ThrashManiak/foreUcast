<?php
$selected = '';
include_once '../conectaDb.php';
include_once 'leer_datos.php';
include_once 'get_options.php';
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


<?php
$myfile = fopen("../country.txt", "r") or die("Unable to open file!");

$ID_Country=implode(" ",file("../country.txt"));// reads text as array so I turn it to string
fclose($myfile);

$myfile_name = fopen("../country_name.txt", "r") or die("Unable to open file!");
$COUNTRY_NAME=implode(" ",file("../country_name.txt"));
fclose($myfile_name);


?>

    <h4>ForeUcast</h4>
    <p><h4>Please select wich coeficient would you like to see for <?php echo $COUNTRY_NAME ?></h4></p>


<div>
    <form action = "<?php $_PHP_SELF ?>" method = "POST">
        <table style=" width:650px">
            <tr>
                <td style="text-align:left">
                    
                </td>
                
                <td align=center>

                
                </td>
            </tr>

            <tr>
                <td style="vertical-align:top">

                    <select name = "coeficients" onchange="this.form.submit();">
                        <optgroup label="Coeficients List">
                            <?php 
                                 get_options($selected);
                            ?>
                        </optgroup>
                    </select>
                </td>
                 
        <div> 

            <h4>
                <td style="text-align:left">
                    <h3>
                            <?php
                            if(isset($_POST['coeficients']))
                            {
                                $selected = $_POST['coeficients'];
                                echo "<br>";
                                leer_datos($selected);
                            }
                            ?>
                    </h3>
               </td>
            </h4>
        </div>



        </tr>
    </table>
    <br><br><br>
<h2>
        <input type=submit value="Submit" name=sub>
 </h2>   
    </form>
</div>

<div class="footer"><h2>
    <?php include '../footer.php';?>
</h2>
</div>

    </body>
</html>
