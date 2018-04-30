<?php

/*
create two arrays, one with the number of sunspots and one with the corresponding years. If we assume that the data is stored in a text file named "yearssn.txt" in the same directory as the script file the function. Reading numeric tabulated sunspot data from a filewill read the data into two arrays
*/


function readsunspotdata($aFile, &$aYears, &$aSunspots) {
    $lines = @file($aFile,FILE_IGNORE_NEW_LINES|FILE_SKIP_EMPTY_LINES);
    
    // we use @ to avoid php droping error message.We will deal with errors
    
    if( $lines === false ) {
        throw new JpGraphException('Can not read sunspot data file.');
        
        // we deal with the error and drop out a warning message
    }
    
    
    foreach( $lines as $line => $datarow ) {
        //split on any part of the string that is at least 1 whitespace charac.
        
            $split = preg_split('/[\s]+/',$datarow);
        
        // now we have a 2 dim array. split[0] is date.number,split[1] value.0
        // first we clean split[0] and assign the first 4 charac. to $ayears
        
            $aYears[] = substr(trim($split[0]),0,4);
        
        // now we assign the second dim of split to $asunsponts
        
            $aSunspots[] = trim($split[1]);
        
        /* this has been comented out becouse is used only to check out the $split array
        foreach ($split as $value) {
    echo "$value <br>";
}
*/
    }
    
    
}
?>