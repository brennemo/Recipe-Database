<?php
	include_once 'config/config.php';
	ini_set('display_errors', 'On');
	$mysqli = new mysqli($host, $username, $password, $database);
?>
<form> 
	<table class="table table-striped table-bordered">
	<?php
		if(!($stmt = $mysqli->prepare("select Recipes.recipe_name from Recipes where Recipes.recipe_id = ?"))){
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
		echo "<tr>\n<th colspan='5'><h3>\n" . $recipe . "\n</h3></th>\n</tr>\n";
		$stmt->close();
	?>

	<?php

		if(!($stmt = $mysqli->prepare("select Recipes.recipe_id, Recipes.recipe_name, Ingredients.ingredient_name, RecipeIngredients.quantity_num, RecipeIngredients.quantity_denom, Units.unit_name from Recipes inner join RecipeIngredients on Recipes.recipe_id = RecipeIngredients.recipe inner join Ingredients on RecipeIngredients.ingredient = Ingredients.ingredient_id inner join Units on RecipeIngredients.unit = Units.unit_id where Recipes.recipe_id = ?"))){
							echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
						}
		if(!($stmt->bind_param("i",$_GET['id']))){
			echo "Bind failed: "  . $stmt->errno . " " . $stmt->error;
		}
		
		if(!$stmt->execute()){
			echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
		}
		if(!$stmt->bind_result($rid, $recipe, $ingredient, $quant_num, $quant_denom, $unit)){
			echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
		}
		
		while($stmt->fetch()){
			/*handle fractions*/
			
			if ($quant_denom > 1) {
				echo "<tr>\n<td>\n" . $quant_num . "/" . $quant_denom . " " . $unit . " " . $ingredient . "\n</td>\n";
			}
			else {
				echo "<tr>\n<td>\n" . $quant_num ." " . $unit . " " . $ingredient . "\n</td>\n";
			}
			
			echo "</tr>";
		}
		$stmt->close();
	?>
	</table>
	</form>
	<script src="js/recipe.js"></script>