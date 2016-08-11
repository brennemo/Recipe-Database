<?php
	include_once 'config/config.php';
	ini_set('display_errors', 'On');
	$mysqli = new mysqli($host, $username, $password, $database);
?>	
<form name="add-to-recipe" id="add-to-recipe" method="post" action="add-recipe-ing.php">
	<div class="form-group">
		<h3>Add Ingredient to Recipe</h3>
		<?php
			if(!($stmt = $mysqli->prepare("select Recipes.recipe_id from Recipes where Recipes.recipe_id = ?"))){
				echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
			}
			if(!($stmt->bind_param("i",$_GET['id']))){
				echo "Bind failed: "  . $stmt->errno . " " . $stmt->error;
			}
			
			if(!$stmt->execute()){
				echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
			}
			if(!$stmt->bind_result($recipe)){
				echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
			}
			
			$stmt->fetch();
			echo "<input type='hidden' name='recipe' id='recipe' value='" . $recipe . "'/>\n";
			$stmt->close();
		?>
		<label for="category">Name</label>
		<select name="name" id="name" class="form-control">
		<?php
		if(!($stmt = $mysqli->prepare("SELECT ingredient_id, ingredient_name FROM Ingredients order by ingredient_name asc"))){
			echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
		}

		if(!$stmt->execute()){
			echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
		}
		if(!$stmt->bind_result($id, $name)){
			echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
		}
		while($stmt->fetch()){
			echo '<option value=" '. $id . ' "> ' . $name . '</option>\n';
		}
		$stmt->close();
		?>
		</select>
		
		<label class="form-check-inline">Quantity
			<input type="number" class="form-control" id="num" name="num" min="1">
		</label>
		<label class="form-check-inline">/</label>
		<label class="form-check-inline">
			<input type="number" class="form-control" id="denom" name="denom" min="1">
		</label><br/>
		<label class="form-check">Unit</label>
		<select name="unit" id="unit" class="form-control">
		<?php
		if(!($stmt = $mysqli->prepare("SELECT unit_id, unit_name FROM Units order by unit_name asc"))){
			echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
		}

		if(!$stmt->execute()){
			echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
		}
		if(!$stmt->bind_result($id, $name)){
			echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
		}
		while($stmt->fetch()){
			echo '<option value=" '. $id . ' "> ' . $name . '</option>\n';
		}
		$stmt->close();
		?>
		</select>
		
	</div>
	<p><input class="btn btn-default" type="submit" id="add-to-recipe-button"/></p>
</form>
<form name="add-unit" id="add-unit" method="post" action="add-unit.php">
<div class="form-group">
	<h3>Add Unit</h3>
	<label for="new_unit">Name</label>
	<input type="text" class="form-control" id="new_unit" name="name">
</div>
<p><input class="btn btn-default" type="submit" id="add-unit-button"/></p>
</form>


<script src="js/recipe.js"></script>