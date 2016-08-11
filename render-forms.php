<?php
	include_once 'config/config.php';
	ini_set('display_errors', 'On');
	$mysqli = new mysqli($host, $username, $password, $database);
?>	

	<form name="add-item" id="add-item">
		<div class="form-group">
			<h3>Add Recipe</h3>
			<label for="name">Name</label>
			<input type="text" class="form-control" id="name" name="name">
			<label for="category">Category</label>
			<select name="category" id="category" class="form-control">
			<?php
			if(!($stmt = $mysqli->prepare("SELECT category_id, category_name FROM RecipeCategories order by category_name asc"))){
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
			<label for="source">Source</label>
			<select name="source" id="source" class="form-control">
			<?php
			if(!($stmt = $mysqli->prepare("SELECT source_id, source_name, source_year FROM RecipeSources order by source_name asc, source_year desc"))){
				echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
			}

			if(!$stmt->execute()){
				echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
			}
			if(!$stmt->bind_result($id, $name, $year)){
				echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
			}
			while($stmt->fetch()){
				echo '<option value=" '. $id . ' "> ' . $name . ', '. $year . '</option>\n';
			}
			$stmt->close();
			?>
			</select>
		</div>
		<p><input class="btn btn-default" type="submit" id="add-button"/></p>
	</form>
	<form name="add-ingredient" id="add-ingredient">
		<div class="form-group">
			<h3>Add Ingredient</h3>
			<label for="ing_name">Name</label>
			<input type="text" class="form-control" id="ing_name" name="name">
		</div>
		<p><input class="btn btn-default" type="submit" id="add-ingredient-button"/></p>
	</form>

	<form name="add-source" id="add-source">
		<div class="form-group">
			<h3>Add Source</h3>
			<label for="ing_name">Publication Name</label>
			<input type="text" class="form-control" id="pub_name" name="pub_name">
			<label for="ing_name">Author</label>
			<input type="text" class="form-control" id="author" name="author">
			<label for="ing_name">Year</label>
			<input type="number" class="form-control" id="year" name="year" min="1900" max="2016">
		</div>
		<p><input class="btn btn-default" type="submit" id="add-source-button"/></p>
	</form>
	<form name="search" id="search" method="get" action="search.php">
		<div class="form-group">
			<h3>Search for Recipes by Ingredient</h3>
			<label for="ing_name">Ingredient</label>
			<select name="id" id="id" class="form-control">
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
				echo '<option value="'. $id . '"> ' . $name . '</option>\n';
			}
			$stmt->close();
			?>
			</select>
		</div>
		<p><input class="btn btn-default" type="submit" id="search-button"/></p>
	</form>

<script src="js/main.js"></script>