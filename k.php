<?php

  function evaluate($string){
    return eval("return ($string);");
  }


// if the user pressed the button, consult the database
if(isset($_GET["s"])){
  $inputS = $_GET["s"];


  $link =  mysql_connect('localhost', 'mondovor_compcal', 'K5calc12$');
  if (!$link) {
    die('Impossible to connect the database. Try later.' . mysql_error());
  }
  
  $db_selected = mysql_select_db('mondovor_kalculator', $link);
  if (!$db_selected) {
    die ('Failed when connecting the database. ' . mysql_error());
  }


  if(!isset($_GET["d"]) || $_GET["d"] == "d5"){
    $query = sprintf("SELECT d FROM D5 WHERE s ='%s'",$inputS);
  } else {
    die("Please select a valid distribution");
  };
    
  $result = mysql_query($query);
    
  if(mysql_num_rows($result)==0){
      echo "String not found";
    } else {
    $value = mysql_result($result,0);
    
    echo $value;
  }}
?>