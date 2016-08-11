<?php
	$host = "oniddb.cws.oregonstate.edu";
	$username = "brennemo-db";
	$password = "Hz9b4XIXL3XMpjHv";
	$database = "brennemo-db";
//Turn on error reporting
ini_set('display_errors', 'On');
//Connects to the database
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

        <!--<link rel="apple-touch-icon" href="apple-touch-icon.png">-->
        <!-- Place favicon.ico in the root directory -->

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
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				  <ul class="nav navbar-nav">
					<!--<li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
					<li><a href="#">Link</a></li>
					<li class="dropdown">
					  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
					  <ul class="dropdown-menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">Separated link</a></li>
						<li role="separator" class="divider"></li>
						<li><a href="#">One more separated link</a></li>
					  </ul>
					</li>-->
				  </ul>
				</div>
			</div>
		</nav>
		<div class="container-fluid">
			<div class="row">
				<!--<div class="col-md-6 col-md-offset-3">-->
				<div class="col-md-8" id="database">
					<!--php here-->
					<form> <!--for deleting rows-->
						<table class="table table-striped table-bordered">
							<tr>
								<th colspan='5'><h3>Recipe Database</h3></th>
							</tr>
							<tr>
								<td><h4>Recipe</h4></td>
								<td><h4>Category</h4></td>
								<td></td>
							</tr>
						
						<?php
						
							if(!($stmt = $mysqli->prepare("select Recipes.recipe_id, Recipes.recipe_name, RecipeCategories.category_id, RecipeCategories.category_name from Recipes
inner join RecipeCategories on Recipes.category = RecipeCategories.category_id where RecipeCategories.category_id = ? order by RecipeCategories.category_name asc,Recipes.recipe_name asc"))){
								echo "Prepare failed: "  . $stmt->errno . " " . $stmt->error;
							}
							
							if(!($stmt->bind_param("i",$_POST['filter_category']))){
								echo "Bind failed: "  . $stmt->errno . " " . $stmt->error;
							}
							
							if(!$stmt->execute()){
								echo "Execute failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
							}
							if(!$stmt->bind_result($rid, $name, $cid, $category)){
								echo "Bind failed: "  . $mysqli->connect_errno . " " . $mysqli->connect_error;
							}
							while($stmt->fetch()){
								echo "<tr>\n<td>\n<a href='recipe.php?id=$rid'>" . $name . "</a>\n</td>\n<td>\n" . $category . "\n</td>\n";
								echo  "<td><a class='btn btn-default delete-button' href='remove.php?id=$rid value=$rid'>Delete</a></td>\n";
								echo "</tr>";
							}
							$stmt->close();
						?>
						</table>
					</form>
				</div>
				<div class="col-md-4">
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
						</div>
						<p><input class="btn btn-default" type="submit" id="add-button"/></p>
					</form>
					<form method="post" action="filter.php">
					<div class="form-group">
							<h3>Filter By Category</h3>
								<select class="form-control" name="filter_category" id="filter_category">
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
								</div>
							<input type="submit" class="btn btn-default" value="Filter" id="filter-button" />
							
					</form>
				</div>
			</div>
		</div> 
		<div class="container">
			<div class="row">
				<div class="text-center col-md-6 col-md-offset-3">
					
					<!--<h4>Footer </h4>-->
					<p>Copyright &copy; 2016 &middot; All Rights Reserved &middot; <a href="#" >My Website</a></p>
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
