<?php // content="text/plain; charset=utf-8"
require_once ('src/jpgraph.php');
require_once ('src/jpgraph_line.php');
require_once ('src/jpgraph_bar.php');
include_once "conectaDB.php";

include_once 'fun_readsunspotdata.php';//includes readsunspotdata($a,&$b,&$c)
include_once 'fun_read_ddbbdata.php';//includes read_ddbbdata(&$b)

// EDUCATION COEFICCIENTS FOR THE SELECTED CONTRY

$dataddbb = array();
$yearddbb = array();
read_ddbbdata($dataddbb, $yearddbb);

$myfile = fopen("../country.txt", "r"); // read and get the country ID
$country_ID=implode(" ",file("../country.txt"));
fclose($myfile);

$myfile_name = fopen("../country_name.txt", "r") or die("Unable to open file!");
$COUNTRY_NAME=implode(" ",file("../country_name.txt"));
fclose($myfile_name);

/* print_r ($fem_array);

$consulta = mysql_query($query);
echo "<br>";
while($row = mysql_fetch_assoc($consulta)){
     $new_array[] = $row; // Inside while loop
     print_r($row);
		    echo "<br>";
    $ID_EDU_ =  $row['ID_EDU'];
    echo "$ID_EDU_ + ";
    
    $results[] = $row['ID_EDU'];
}
echo "<br>";

// print_r ($results);

foreach ($results as $value) {
    echo "$value <br>";
}
*/

$db= null;

/*
$year = array_slice($year);
$ydata = array_slice($ydata);
*/

$width = 300; $height = 150;
 
$graph = new Graph($width,$height);
 
$graph->SetScale('intint');

// Setup a title for the graph
$graph->title->Set("Values for $COUNTRY_NAME");

$graph->subtitle->Set('Education Coeficients. Graph 2');

$graph->SetShadow();
 
// Setup titles and X-axis labels
$graph->xaxis->title->Set('(year from 1701)');

$graph->SetScale('intint',0,0,0,0);

$graph->xaxis->SetTickLabels($yearddbb);
 
// Setup Y-axis title
$graph->yaxis->title->Set('(# values)');
 
// Create the linear plot
//Want to create a line graph so we must create an instance of class LinePlot

$barplot=new BarPlot($dataddbb);
$barplot->SetFillColor('orange@0.5'); //orange color half transaparent
 
// Add the plot to the graph
$graph->Add($barplot);
 
// Display the graph
$graph->Stroke();

?>