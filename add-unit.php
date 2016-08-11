<?php
	include_once 'config/config.php';
	ini_set('display_errors', 'On');
	$mysqli = new mysqli($host, $username, $password, $database);

	if($mysqli->connect_errno){
		echo "Connection error " . $mysqli->connect_errno . " " . $mysqli->connect_error;
		}
		
		if(!($stmt = $mysqli->prepare("insert into Units (unit_name) values (?)"))){
			echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
		}
		if(!($stmt->bind_param("s",$_POST['name']))){
			echo "Bind failed: "  . $stmt->errno . " " . $stmt->error;
		}
		if(!$stmt->execute()){
			echo "Execute failed: "  . $stmt->errno . " " . $stmt->error;
		} else {
			echo "Added " . $stmt->affected_rows . " rows to ingredients.";
		}
?>
	