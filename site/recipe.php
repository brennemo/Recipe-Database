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
				    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.php">Recipe Database</a>	
				</div>
			</div>
		</nav>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-8" id="recipes">
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
							
							if(!($stmt = $mysqli->prepare("select Recipes.recipe_id, Recipes.recipe_name, Ingredients.ingredient_name, RecipeIngredients.quantity_num, RecipeIngredients.quantity_denom, ifnull(Units.unit_name, '') from Recipes inner join RecipeIngredients on Recipes.recipe_id = RecipeIngredients.recipe inner join Ingredients on RecipeIngredients.ingredient = Ingredients.ingredient_id left join Units on RecipeIngredients.unit = Units.unit_id where Recipes.recipe_id = ?"))){

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
							
								/*display whole numbers or fractions*/
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
				</div>
				<div class="col-md-4" id="recipe-forms">
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
		<!--<script src="js/main.js"></script>-->
        <script src="js/recipe.js"></script>
		<script src="https://use.typekit.net/jie8zjl.js"></script>
		<script>try{Typekit.load({ async: true });}catch(e){}</script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

        <!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
        <!--
		<script>
            (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
            function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
            e=o.createElement(i);r=o.getElementsByTagName(i)[0];
            e.src='https://www.google-analytics.com/analytics.js';
            r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
            ga('create','UA-XXXXX-X','auto');ga('send','pageview');
        </script>
		-->
    </body>
</html>
