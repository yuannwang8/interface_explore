<html>
<body>
<h1>A Simple Random Integer Generator</h1>

<i>Input the number of picks and the number of runs, then click submit.</i><br>
<form action = "php.php" method = "post">

<!-- text entry input option
How many numbers to pick? : <input type = "text" name = "NPICK"> <br>
How many runs to make?  <input type = "text" name = "NRUN">
-->

How many numbers to pick? <br>
<!-- 0 : <input type = "radio" name = "NPICK[]" value ="0">, or --testing-->
6 : <input type = "radio" name = "NPICK[]" value ="6" checked>, or 
7 : <input type = "radio" name = "NPICK[]" value ="7">, or 
8 : <input type = "radio" name = "NPICK[]" value ="8">, or 
9 : <input type = "radio" name = "NPICK[]" value ="9">, or 
10 : <input type = "radio" name = "NPICK[]" value ="10"> <br>

How many runs to make?<br>
1 <input type = "range" min = "1" max = "5000" value = "100" name = "NRUN" > 5000
<input type = "submit">

<br>

<?php
    if(isset($_POST['NPICK']) && isset($_POST['NRUN'])){
        $NPICK = $_POST['NPICK'];
        $NRUN = $_POST['NRUN'];
        
        $NPICK = $NPICK[0]; // extract input from radio-button array
        
        $VAR = array($NPICK, $NRUN);
        $json = json_encode($VAR);
        
        
        if(empty($NPICK) or empty($NRUN)){
            echo "<br>Please supply non-blank/non-zero input.";
        } else {
            echo "<br> Here's your pick input:  ". $NPICK ;
            echo "<br> Here's twice your run input:  ". 2*$NRUN;
            
            exec("Rscript --verbose phpread.R $NPICK $NRUN $json");
            
?>
            <br>
            <img width="600" src = "tempsvglite.svg">
            
            <!--
              <br>
              <img src = "temp.png">
            -->
                    
<?php       }
    } else {
        echo "<br>Variables have not been set!";
    }
?>

</body>
</html>
