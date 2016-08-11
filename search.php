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
						<table class="table table-striped table-bordered">
							<tr>
								<?php
									if(!($stmt = $mysqli->prepare("select Ingredients.ingredient_name from Ingredients where Ingredients.ingredient_id = ?"))){
										echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
									}
									if(!($stmt->bind_param("i",$_GET['id']))){
										echo "Bind failed: "  . $stmt->errno . " " . $stmt->error;
									}
									
									if(!$stmt->execute()){
										echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
									}
									if(!$stmt->bind_result($ing)){
										echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
									}
									
									$stmt->fetch();
									echo "<tr>\n<th colspan='5'><h3>Recipes containing " . $ing . ":</h3></th>\n</tr>\n";
									$stmt->close();
								?>
							</tr>
							<tr>
								<td>
									<h4>Recipe</h4>
								</td>
							</tr>
						
						<?php
						
							if(!($stmt = $mysqli->prepare("select Recipes.recipe_id, Recipes.recipe_name from Recipes inner join RecipeIngredients on Recipes.recipe_id = RecipeIngredients.recipe 
inner join Ingredients on Ingredients.ingredient_id = RecipeIngredients.ingredient where Ingredients.ingredient_id = ?"))){
								echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
							}
							if(!($stmt->bind_param("i",$_GET['id']))){
								echo "Bind failed: "  . $stmt->errno . " " . $stmt->error;
							}
							if(!$stmt->execute()){
								echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
							}
							if(!$stmt->bind_result($id, $name)){
								echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
							}
							while($stmt->fetch()){
								echo "<tr>\n<td>\n<a href='recipe.php?id=$id'>" . $name . "</a>\n</td>\n</tr>";
							}
							$stmt->close();
						?>
						</table>
						<a href="index.php"><button type="button" class="btn btn-info">Back</button></a>
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
