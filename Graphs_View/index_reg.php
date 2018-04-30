<?php // content="text/plain; charset=utf-8"
require_once ('src/jpgraph.php');
require_once ('src/jpgraph_scatter.php');
require_once ('src/jpgraph_line.php');
require_once ('src/jpgraph_utils.inc.php');
 
include_once "conectaDB.php";

include_once 'fun_read_ddbbdata.php';//includes read_ddbbdata(&$b)

$data = array();
$year = array();

read_ddbbdata($data, $year);


// Instantiate the linear regression class

$lr = new LinearRegression($data, $year);

// Get the basic statistics

list( $stderr, $corr ) = $lr->GetStat();

// Get a set of estimated y-value for x-values in range [a,b]

list( $xd, $yd ) = $lr->GetAB(0,25);



// Create the graph
$graph = new Graph(300,250);
$graph->SetScale('intint',0,0,0,0);
 

// Setup title and subtitle with the formula for standar error and correlation
$graph->title->Set("Linear regression");
$graph->title->SetFont(FF_ARIAL,FS_BOLD,14);
 
$graph->subtitle->Set('(stderr='.sprintf('%.2f',$stderr).', corr='.sprintf('%.2f',$corr).')');
$graph->subtitle->SetFont(FF_ARIAL,FS_NORMAL,12);
 

// make sure that the X-axis is always at the
// bottom at the plot and not just at Y=0 which is
// the default position
//$graph->xaxis->SetPos('min');

//$graph->xaxis->SetTickLabels(array('A','B','C','D','E','F','G'));
 
// Create the scatter plot with some nice colors

$sp1 = new ScatterPlot($year,$data);

$sp1->mark->SetType(MARK_FILLEDCIRCLE);
$sp1->mark->SetFillColor("red");
//$sp1 -> value->Show();
$sp1->SetColor("blue");
$sp1->SetWeight(3);
$sp1->mark->SetWidth(4);
 
// Create the regression line

$lplot = new LinePlot($yd);
$lplot->SetWeight(1);
$lplot->SetColor('navy');
 
// Add the pltos to the line
$graph->Add($sp1); // the dots

$graph->Add($lplot); // the curve
 
// ... and stroke
$graph->Stroke();
 
?>