--	--------------------------------------------------
--	Recipe Database Schema
--	Morgan Brenner
--	CS 340 
--	08/07/2016
--	--------------------------------------------------
DROP TABLE IF EXISTS `RecipeIngredients`;
DROP TABLE IF EXISTS `Ingredients`;
DROP TABLE IF EXISTS `Recipes`;
DROP TABLE IF EXISTS `Units`;
DROP TABLE IF EXISTS `RecipeCategories`;
DROP TABLE IF EXISTS `RecipeSources`;


--	--------------------------------------------------
--	Table structure for table `RecipeSources`
--	--------------------------------------------------

CREATE TABLE `RecipeSources` (
	`source_id` int auto_increment primary key not null,
	`source_name` varchar(255) not null,
	`source_author` varchar(255),
	`source_year` int 

) ENGINE=INNODB;


--	--------------------------------------------------
--	Table structure for table `RecipeCategories`
--	--------------------------------------------------
CREATE TABLE `RecipeCategories` (
	`category_id` int auto_increment primary key not null,
	`category_name` varchar(255) not null

) ENGINE=INNODB;

--	--------------------------------------------------
--	Table structure for table `Units`
--	--------------------------------------------------
CREATE TABLE `Units` (
	`unit_id` int auto_increment primary key not null,
	`unit_name` varchar(255) not null

) ENGINE=INNODB;

--	--------------------------------------------------
--	Table structure for table `Recipes`
--	--------------------------------------------------
CREATE TABLE `Recipes` (
	`recipe_id` int auto_increment primary key not null, 
	`category` int not null, 
	`source` int,
	`recipe_name` varchar(255) not null,
	FOREIGN KEY ( category ) REFERENCES RecipeCategories( category_id )
		on delete cascade on update cascade,
	FOREIGN KEY ( source ) REFERENCES RecipeSources( source_id )
		on delete cascade on update cascade
) ENGINE=INNODB;

--	--------------------------------------------------
--	Table structure for table `Ingredients`
--	--------------------------------------------------
CREATE TABLE `Ingredients` (
	`ingredient_id` int auto_increment primary key not null,
	`ingredient_name` varchar(255) not null
) ENGINE=INNODB;

--	--------------------------------------------------
--	Table structure for table `RecipeIngredients`
--	Represents many-to-many relationship between Recipes and Ingredients 
--	Separate columns for numerator and denominator of quantity
--	--------------------------------------------------

CREATE TABLE `RecipeIngredients` (
	`recipe` int not null, 
	`ingredient` int not null,
	`quantity_num` int not null,
	`quantity_denom` int not null default 1,
	`unit` int,
	FOREIGN KEY ( recipe ) REFERENCES Recipes( recipe_id )
		on delete cascade on update cascade,
	FOREIGN KEY ( ingredient ) REFERENCES Ingredients( ingredient_id ) 
		on delete cascade on update cascade,
	FOREIGN KEY ( unit ) REFERENCES Units( unit_id ),
	PRIMARY KEY (recipe, ingredient)
) ENGINE=INNODB;
