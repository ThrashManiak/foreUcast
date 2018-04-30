<?php

function display_ima($avera, $value)
{
    /*
    echo "$avera<br>";
        echo "$value<br>";
        */
    
    switch ($avera) 
            {
            case ($avera < $value):
              //  echo "Your favorite color is red!";
                echo '<img src="/projecte\Home\image/ohno.png"/>';
                break;
            case ($avera == $value):
               // echo "Your favorite color is blue!";
                echo '<img src="/projecte\Home\image/cool.png"/>';
                break;
            
            case ($avera > $value):
               // echo "Your favorite color is green!";
                echo '<img src="/projecte\Home\image/neutral.png"/>';
                break;
            
            default:
               // echo "Your favorite color is neither red, blue, nor green!";
                echo '<img src="/projecte\Home\image/awesome.png"/>';
            }
}
//$imm = display_ima(7,7);
?>