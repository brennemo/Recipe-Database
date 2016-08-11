<?php
include_once 'config/config.php';
ini_set('display_errors', 'On');
$mysqli = new mysqli($host, $username, $password, $database);
if($mysqli->connect_errno){
	echo "Connection error " . $mysqli->connect_errno . " " . $mysqli->connect_error;
	}
?>


<!doctype html>
<html class="no-js" lang="">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

		<!-- Latest compiled and minified CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/main.css">
       <script src="js/vendor/modernizr-2.8.3.min.js"></script>
		
    </head>
    <body>
        <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->

		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="index.php">Recipe Database</a>	
				</div>
			</div>
		</nav>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8" id="database">
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
				</div>
				<div class="col-md-4" id="forms">
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
						
				</div>
			</div>
		</div> 
		<div class="container">
			<div class="row">
				<div class="text-center col-md-6 col-md-offset-3">
					<p>Morgan Brenner &middot 2016</p>
				</div>
			</div>
		</div>	
        <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.12.0.min.js"><\/script>')</script>
        <script src="js/plugins.js"></script>
        <script src="js/main.js"></script>
		<script src="https://use.typekit.net/jie8zjl.js"></script>
		<script>try{Typekit.load({ async: true });}catch(e){}</script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    </body>
</html>
