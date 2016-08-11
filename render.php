<?php
	include_once 'config/config.php';
	ini_set('display_errors', 'On');
	$mysqli = new mysqli($host, $username, $password, $database);
?>
<form> 
	<table class="table table-striped table-bordered">
		<tr>
			<th colspan='5'><h3>Recipe Database</h3></th>
		</tr>
		<tr>
			<td>
				<h4>Recipe
					<button type="button" class="btn btn-default btn-xs pull-right" id="rcp-up">
						<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-default btn-xs pull-right" id="rcp-dwn">
						<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
					</button>
				</h4>
			</td>
			<td>
				<h4>Category
					<button type="button" class="btn btn-default btn-xs pull-right" id="cat-up">
						<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-default btn-xs pull-right" id="cat-dwn">
						<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
					</button>
				</h4>
			</td>
			<td>
				<h4>Source
					<button type="button" class="btn btn-default btn-xs pull-right" id="src-up">
						<span class="glyphicon glyphicon-menu-up" aria-hidden="true"></span>
					</button>
					<button type="button" class="btn btn-default btn-xs pull-right" id="src-dwn">
						<span class="glyphicon glyphicon-menu-down" aria-hidden="true"></span>
					</button>
				</h4>
			</td>
			<td></td>
		</tr>
	
	<?php
	
		if(!($stmt = $mysqli->prepare("select Recipes.recipe_id, Recipes.recipe_name, RecipeCategories.category_id, RecipeCategories.category_name, RecipeSources.source_id, RecipeSources.source_name, RecipeSources.source_year from Recipes
inner join RecipeCategories on Recipes.category = RecipeCategories.category_id inner join RecipeSources on Recipes.source = RecipeSources.source_id order by RecipeCategories.category_name asc,Recipes.recipe_name asc"))){
			echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
		}
		if(!$stmt->execute()){
			echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
		}
		if(!$stmt->bind_result($rid, $name, $cid, $category, $sid, $sname, $syear)){
			echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
		}
		while($stmt->fetch()){
			echo "<tr>\n<td>\n<a href='recipe.php?id=$rid'>" . $name . "</a>\n</td>\n<td>\n" . $category . "\n</td>\n";
			echo "<td>".$sname. ", ".$syear."</td>";
			echo  "<td><a class='btn btn-default delete-button' id ='".$rid."' value='".$rid."'>Delete</a></td>\n";
			echo "</tr>";
		}
		$stmt->close();
	?>
	</table>
</form>
	
<script src="js/main.js"></script>