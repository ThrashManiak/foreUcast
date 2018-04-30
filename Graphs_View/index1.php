<?php // content="text/plain; charset=utf-8"
require_once ('src/jpgraph.php');
require_once ('src/jpgraph_line.php');
require_once ('src/jpgraph_bar.php');
include_once "conectaDB.php";

// WEALTH COEFICIENTS FOR THE SELECTED COUNTRY

include_once 'fun_read_ddbbdata1.php';//includes read_ddbbdata(&$b)

$dataddbb = array();
$yearddbb = array();

read_ddbbdata($dataddbb, $yearddbb);

$myfile = fopen("../country.txt", "r"); // read and get the country ID
$country_ID=implode(" ",file("../country.txt"));
fclose($myfile);

//read the file that contains the value (country_name) selected in the first page    
 
$myfile_name = fopen("../country_name.txt", "r") or die("Unable to open file!");
$COUNTRY_NAME=implode(" ",file("../country_name.txt"));
fclose($myfile_name);




$db= null;

$width = 300; $height = 150;
 
$graph = new Graph($width,$height);
 
$graph->SetScale('intint');

// Setup a title for the graph
$graph->title->Set("Values for $COUNTRY_NAME");

$graph->subtitle->Set('Wealth Coeficients. Graph 1');

$graph->SetShadow();
 
// Setup titles and X-axis labels
$graph->xaxis->title->Set('(year from 1701)');

$graph->SetScale('intint',0,0,0,0);

$graph->xaxis->SetTickLabels($yearddbb);
 
// Setup Y-axis title
$graph->yaxis->title->Set('(# value)');
 
// Create the linear plot
//Want to create a line graph so we must create an instance of class LinePlot

$barplot=new BarPlot($dataddbb);
$barplot->SetFillColor('orange@0.5'); //orange color half transaparent
 
// Add the plot to the graph
$graph->Add($barplot);
 
// Display the graph
$graph->Stroke();

?>