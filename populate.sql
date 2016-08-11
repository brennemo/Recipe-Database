--	--------------------------------------------------
--	Prepopulate RecipeSources table: 
--	--------------------------------------------------

insert into RecipeSources (source_name, source_author, source_year) values ('The Food Lab', 'Lopez-Alt', 2015);
insert into RecipeSources (source_name, source_author, source_year) values ('Baking Chez Moi', 'Greenspan', 2014);
insert into RecipeSources (source_name, source_author, source_year) values ('The Baking Bible', 'Beranbaum', 2014);
insert into RecipeSources (source_name, source_author, source_year) values ('Make It Ahead', 'Garten', 2014);
insert into RecipeSources (source_name, source_author, source_year) values ('Egg', 'Ruhlman', 2014);
insert into RecipeSources (source_name, source_author, source_year) values ('Jerusalem', 'Ottolenghi', 2012);
insert into RecipeSources (source_name, source_author, source_year) values ('Ruhlmans Twenty', 'Ruhlman', 2011);
insert into RecipeSources (source_name, source_year) values ('Bon Appetit', 2016);
insert into RecipeSources (source_name, source_year) values ('Bon Appetit', 2014);
insert into RecipeSources (source_name, source_year) values ('Bon Appetit', 2013);


--	--------------------------------------------------
--	Prepopulate RecipeCategories table: 
--	--------------------------------------------------
insert into RecipeCategories (category_name) values ('breakfast');
insert into RecipeCategories (category_name) values ('soups');
insert into RecipeCategories (category_name) values ('salads');
insert into RecipeCategories (category_name) values ('sandwiches');
insert into RecipeCategories (category_name) values ('vegetables');
insert into RecipeCategories (category_name) values ('pasta');
insert into RecipeCategories (category_name) values ('beef');
insert into RecipeCategories (category_name) values ('pork');
insert into RecipeCategories (category_name) values ('poultry');
insert into RecipeCategories (category_name) values ('seafood');
insert into RecipeCategories (category_name) values ('desserts');
insert into RecipeCategories (category_name) values ('beverages');

--	--------------------------------------------------
--	Prepopulate Units table: 
--	--------------------------------------------------
insert into Units (unit_name) values ('clove');
insert into Units (unit_name) values ('cup');
insert into Units (unit_name) values ('g');
insert into Units (unit_name) values ('lb');
insert into Units (unit_name) values ('ml');
insert into Units (unit_name) values ('oz');
insert into Units (unit_name) values ('slice');
insert into Units (unit_name) values ('stalk');
insert into Units (unit_name) values ('tbsp');
insert into Units (unit_name) values ('tsp');
insert into Units (unit_name) values ('qt');

--	--------------------------------------------------
--	Prepopulate Recipes table: 
--	--------------------------------------------------
insert into Recipes (recipe_name, category, source)values('strawberry shortcake genoise',(select category_id from RecipeCategories where category_name = 'desserts'),(select source_id from RecipeSources where source_name = 'The Baking Bible'));
insert into Recipes (recipe_name, category, source)values('Texas chili con carne',(select category_id from RecipeCategories where category_name = 'soups'), (select source_id from RecipeSources where source_name = 'The Food Lab'));
insert into Recipes (recipe_name, category, source)values('linguine with fresh clams',(select category_id from RecipeCategories where category_name = 'pasta'), (select source_id from RecipeSources where source_name = 'The Food Lab'));
insert into Recipes (recipe_name, category, source)values('light and fluffy buttermilk pancakes',(select category_id from RecipeCategories where category_name = 'breakfast'), (select source_id from RecipeSources where source_name = 'The Food Lab'));
insert into Recipes (recipe_name, category, source)values('herby corn salad',(select category_id from RecipeCategories where category_name = 'salads'), (select source_id from RecipeSources where source_name = 'Bon Appetit' and source_year = 2014));
insert into Recipes (recipe_name, category, source)values('pounded lemongrass chicken',(select category_id from RecipeCategories where category_name = 'poultry'), (select source_id from RecipeSources where source_name = 'Bon Appetit' and source_year = 2016));
insert into Recipes (recipe_name, category, source)values('lobster rolls',(select category_id from RecipeCategories where category_name = 'sandwiches'), (select source_id from RecipeSources where source_name = 'Bon Appetit' and source_year = 2013));
insert into Recipes (recipe_name, category, source)values('green tea sables',(select category_id from RecipeCategories where category_name = 'desserts'), (select source_id from RecipeSources where source_name = 'Baking Chez Moi'));
insert into Recipes (recipe_name, category, source)values('lemon madeleines',(select category_id from RecipeCategories where category_name = 'desserts'), (select source_id from RecipeSources where source_name = 'Baking Chez Moi'));
insert into Recipes (recipe_name, category, source)values('speculoos',(select category_id from RecipeCategories where category_name = 'desserts'), (select source_id from RecipeSources where source_name = 'Baking Chez Moi'));
insert into Recipes (recipe_name, category, source)values('molasses sugar butter cookies',(select category_id from RecipeCategories where category_name = 'desserts'), (select source_id from RecipeSources where source_name = 'The Baking Bible'));
insert into Recipes (recipe_name, category, source)values('cauliflower and celery root soup',(select category_id from RecipeCategories where category_name = 'soups'), (select source_id from RecipeSources where source_name = 'Make It Ahead'));
insert into Recipes (recipe_name, category, source)values('grilled New York strip steaks',(select category_id from RecipeCategories where category_name = 'beef'), (select source_id from RecipeSources where source_name = 'Make It Ahead'));
insert into Recipes (recipe_name, category, source)values('asparagus and prosciutto bundles',(select category_id from RecipeCategories where category_name = 'vegetables'), (select source_id from RecipeSources where source_name = 'Make It Ahead'));
insert into Recipes (recipe_name, category, source)values('lemony leek meatballs',(select category_id from RecipeCategories where category_name = 'beef'), (select source_id from RecipeSources where source_name = 'Jerusalem'));
insert into Recipes (recipe_name, category, source)values('burnt eggplant with garlic, lemon and pomegranate seeds',(select category_id from RecipeCategories where category_name = 'vegetables'), (select source_id from RecipeSources where source_name = 'Jerusalem'));
insert into Recipes (recipe_name, category, source)values('egg salad with tarragon and chives',(select category_id from RecipeCategories where category_name = 'salads'), (select source_id from RecipeSources where source_name = 'Egg'));
insert into Recipes (recipe_name, category, source)values('braised pork belly',(select category_id from RecipeCategories where category_name = 'pork'), (select source_id from RecipeSources where source_name = 'Ruhlmans Twenty'));


--	--------------------------------------------------
--	Prepopulate Ingredients table: 
--	--------------------------------------------------
insert into Ingredients (ingredient_name)values('eggs');
insert into Ingredients (ingredient_name)values('unsalted butter');
insert into Ingredients (ingredient_name)values('vanilla extract');
insert into Ingredients (ingredient_name)values('all-purpose flour');
insert into Ingredients (ingredient_name)values('cornstarch');
insert into Ingredients (ingredient_name)values('superfine sugar');
insert into Ingredients (ingredient_name)values('granulated sugar');
insert into Ingredients (ingredient_name)values('lemon juice');
insert into Ingredients (ingredient_name)values('frozen strawberries');
insert into Ingredients (ingredient_name)values('Grand Marnier');
insert into Ingredients (ingredient_name)values('boneless beef chuck');
insert into Ingredients (ingredient_name)values('Kosher salt');
insert into Ingredients (ingredient_name)values('black pepper');
insert into Ingredients (ingredient_name)values('vegetable oil');
insert into Ingredients (ingredient_name)values('onion');
insert into Ingredients (ingredient_name)values('garlic');
insert into Ingredients (ingredient_name)values('ground cumin');
insert into Ingredients (ingredient_name)values('ground cinnamon');
insert into Ingredients (ingredient_name)values('ground allspice');
insert into Ingredients (ingredient_name)values('dried oregano');
insert into Ingredients (ingredient_name)values('chile paste');
insert into Ingredients (ingredient_name)values('chicken stock');
insert into Ingredients (ingredient_name)values('instant cornmeal');
insert into Ingredients (ingredient_name)values('extra-virgin olive oil');
insert into Ingredients (ingredient_name)values('red pepper flakes');
insert into Ingredients (ingredient_name)values('white wine');
insert into Ingredients (ingredient_name)values('littleneck clams');
insert into Ingredients (ingredient_name)values('butter');
insert into Ingredients (ingredient_name)values('linguine');
insert into Ingredients (ingredient_name)values('fresh parsley');
insert into Ingredients (ingredient_name)values('lemon zest');
insert into Ingredients (ingredient_name)values('baking powder');
insert into Ingredients (ingredient_name)values('baking soda');
insert into Ingredients (ingredient_name)values('buttermilk');
insert into Ingredients (ingredient_name)values('sour cream');
insert into Ingredients (ingredient_name)values('sugar');
insert into Ingredients (ingredient_name)values('Sherry vinegar');
insert into Ingredients (ingredient_name)values('shallot');
insert into Ingredients (ingredient_name)values('fresh dill');
insert into Ingredients (ingredient_name)values('corn');
insert into Ingredients (ingredient_name)values('lemongrass');
insert into Ingredients (ingredient_name)values('lime juice');
insert into Ingredients (ingredient_name)values('fish sauce');
insert into Ingredients (ingredient_name)values('light brown sugar');
insert into Ingredients (ingredient_name)values('chicken breasts');
insert into Ingredients (ingredient_name)values('lobsters');
insert into Ingredients (ingredient_name)values('celery');
insert into Ingredients (ingredient_name)values('chives');
insert into Ingredients (ingredient_name)values('mayonnaise');
insert into Ingredients (ingredient_name)values('New England-style hot dog buns');
insert into Ingredients (ingredient_name)values('green tea');
insert into Ingredients (ingredient_name)values('sea salt');
insert into Ingredients (ingredient_name)values('honey');
insert into Ingredients (ingredient_name)values('whole milk');
insert into Ingredients (ingredient_name)values('ground ginger');
insert into Ingredients (ingredient_name)values('grated nutmeg');
insert into Ingredients (ingredient_name)values('ground cloves');
insert into Ingredients (ingredient_name)values('molasses');
insert into Ingredients (ingredient_name)values('cauliflower');
insert into Ingredients (ingredient_name)values('celery root');
insert into Ingredients (ingredient_name)values('fennel');
insert into Ingredients (ingredient_name)values('heavy cream');
insert into Ingredients (ingredient_name)values('ground coffee');
insert into Ingredients (ingredient_name)values('granulated garlic');
insert into Ingredients (ingredient_name)values('chipotle chile powder');
insert into Ingredients (ingredient_name)values('New York strip steaks');
insert into Ingredients (ingredient_name)values('olive oil');
insert into Ingredients (ingredient_name)values('asparagus');
insert into Ingredients (ingredient_name)values('prosciutto');
insert into Ingredients (ingredient_name)values('white truffle butter');
insert into Ingredients (ingredient_name)values('Gruyere cheese');
insert into Ingredients (ingredient_name)values('leeks');
insert into Ingredients (ingredient_name)values('ground beef');
insert into Ingredients (ingredient_name)values('bread crumbs');
insert into Ingredients (ingredient_name)values('sunflower oil');
insert into Ingredients (ingredient_name)values('Greek yogurt');
insert into Ingredients (ingredient_name)values('eggplants');
insert into Ingredients (ingredient_name)values('pomegranate seeds');
insert into Ingredients (ingredient_name)values('fresh mint');
insert into Ingredients (ingredient_name)values('hard-cooked eggs');
insert into Ingredients (ingredient_name)values('red onion');
insert into Ingredients (ingredient_name)values('fresh tarragon');
insert into Ingredients (ingredient_name)values('coriander seeds');
insert into Ingredients (ingredient_name)values('black peppercorns');
insert into Ingredients (ingredient_name)values('pork belly');
insert into Ingredients (ingredient_name)values('bay leaves');
insert into Ingredients (ingredient_name)values('orange juice');
insert into Ingredients (ingredient_name)values('scallions');
--	--------------------------------------------------
--	Prepopulate RecipeIngredients table: 
--	--------------------------------------------------

insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'strawberry shortcake genoise'), 
	(select ingredient_id from Ingredients where ingredient_name = 'eggs'), 5
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'strawberry shortcake genoise'), 
	(select ingredient_id from Ingredients where ingredient_name = 'unsalted butter'), 6, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'strawberry shortcake genoise'), 
	(select ingredient_id from Ingredients where ingredient_name = 'vanilla extract'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'strawberry shortcake genoise'), 
	(select ingredient_id from Ingredients where ingredient_name = 'superfine sugar'), 1, 2, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'strawberry shortcake genoise'), 
	(select ingredient_id from Ingredients where ingredient_name = 'all-purpose flour'), 2, 3, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'strawberry shortcake genoise'), 
	(select ingredient_id from Ingredients where ingredient_name = 'cornstarch'), 1, 2, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'strawberry shortcake genoise'), 
	(select ingredient_id from Ingredients where ingredient_name = 'frozen strawberries'), 10, 
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'strawberry shortcake genoise'), 
	(select ingredient_id from Ingredients where ingredient_name = 'granulated sugar'), 2, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'strawberry shortcake genoise'), 
	(select ingredient_id from Ingredients where ingredient_name = 'Grand Marnier'), 1, 4, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'Texas chili con carne'), 
	(select ingredient_id from Ingredients where ingredient_name = 'boneless beef chuck'), 4, 
	(select unit_id from Units where unit_name = 'lb')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'Texas chili con carne'), 
	(select ingredient_id from Ingredients where ingredient_name = 'Kosher salt'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'Texas chili con carne'), 
	(select ingredient_id from Ingredients where ingredient_name = 'black pepper'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'Texas chili con carne'), 
	(select ingredient_id from Ingredients where ingredient_name = 'vegetable oil'), 2, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'Texas chili con carne'), 
	(select ingredient_id from Ingredients where ingredient_name = 'onion'), 1
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'Texas chili con carne'), 
	(select ingredient_id from Ingredients where ingredient_name = 'garlic'), 4, 
	(select unit_id from Units where unit_name = 'clove')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'Texas chili con carne'), 
	(select ingredient_id from Ingredients where ingredient_name = 'ground cumin'), 1, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'Texas chili con carne'), 
	(select ingredient_id from Ingredients where ingredient_name = 'ground cinnamon'), 1, 2, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'Texas chili con carne'), 
	(select ingredient_id from Ingredients where ingredient_name = 'ground allspice'), 1, 4, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'Texas chili con carne'), 
	(select ingredient_id from Ingredients where ingredient_name = 'dried oregano'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'Texas chili con carne'), 
	(select ingredient_id from Ingredients where ingredient_name = 'chile paste'), 1, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'Texas chili con carne'), 
	(select ingredient_id from Ingredients where ingredient_name = 'chicken stock'), 2, 
	(select unit_id from Units where unit_name = 'quarts')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'Texas chili con carne'), 
	(select ingredient_id from Ingredients where ingredient_name = 'instant cornmeal'), 2, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'linguine with fresh clams'), 
	(select ingredient_id from Ingredients where ingredient_name = 'extra-virgin olive oil'), 6, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'linguine with fresh clams'), 
	(select ingredient_id from Ingredients where ingredient_name = 'red pepper flakes'), 1, 2, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'linguine with fresh clams'), 
	(select ingredient_id from Ingredients where ingredient_name = 'garlic'), 12, 
	(select unit_id from Units where unit_name = 'clove')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'linguine with fresh clams'), 
	(select ingredient_id from Ingredients where ingredient_name = 'white wine'), 1, 2, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'linguine with fresh clams'), 
	(select ingredient_id from Ingredients where ingredient_name = 'butter'), 2, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'linguine with fresh clams'), 
	(select ingredient_id from Ingredients where ingredient_name = 'littleneck clams'), 2, 
	(select unit_id from Units where unit_name = 'lb')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'linguine with fresh clams'), 
	(select ingredient_id from Ingredients where ingredient_name = 'fresh parsley'), 1, 4, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'linguine with fresh clams'), 
	(select ingredient_id from Ingredients where ingredient_name = 'lemon zest'), 2, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'linguine with fresh clams'), 
	(select ingredient_id from Ingredients where ingredient_name = 'lemon juice'), 1, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'linguine with fresh clams'), 
	(select ingredient_id from Ingredients where ingredient_name = 'Kosher salt'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'linguine with fresh clams'), 
	(select ingredient_id from Ingredients where ingredient_name = 'black pepper'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'light and fluffy buttermilk pancakes'), 
	(select ingredient_id from Ingredients where ingredient_name = 'all-purpose flour'), 2, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'light and fluffy buttermilk pancakes'), 
	(select ingredient_id from Ingredients where ingredient_name = 'baking powder'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'light and fluffy buttermilk pancakes'), 
	(select ingredient_id from Ingredients where ingredient_name = 'baking soda'), 1, 2, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'light and fluffy buttermilk pancakes'), 
	(select ingredient_id from Ingredients where ingredient_name = 'Kosher salt'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'light and fluffy buttermilk pancakes'), 
	(select ingredient_id from Ingredients where ingredient_name = 'sugar'), 1, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'light and fluffy buttermilk pancakes'), 
	(select ingredient_id from Ingredients where ingredient_name = 'eggs'), 2
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'light and fluffy buttermilk pancakes'), 
	(select ingredient_id from Ingredients where ingredient_name = 'sour cream'), 1, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'light and fluffy buttermilk pancakes'), 
	(select ingredient_id from Ingredients where ingredient_name = 'buttermilk'), 3, 2, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'light and fluffy buttermilk pancakes'), 
	(select ingredient_id from Ingredients where ingredient_name = 'unsalted butter'), 4, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'herby corn salad'), 
	(select ingredient_id from Ingredients where ingredient_name = 'extra-virgin olive oil'), 1, 4, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'herby corn salad'), 
	(select ingredient_id from Ingredients where ingredient_name = 'Sherry vinegar'), 2, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'herby corn salad'), 
	(select ingredient_id from Ingredients where ingredient_name = 'Kosher salt'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'herby corn salad'), 
	(select ingredient_id from Ingredients where ingredient_name = 'black pepper'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'herby corn salad'), 
	(select ingredient_id from Ingredients where ingredient_name = 'shallot'), 1
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'herby corn salad'), 
	(select ingredient_id from Ingredients where ingredient_name = 'fresh dill'), 1, 2, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'herby corn salad'), 
	(select ingredient_id from Ingredients where ingredient_name = 'corn'), 3, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'pounded lemongrass chicken'), 
	(select ingredient_id from Ingredients where ingredient_name = 'lemongrass'), 1, 
	(select unit_id from Units where unit_name = 'stalk')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'pounded lemongrass chicken'), 
	(select ingredient_id from Ingredients where ingredient_name = 'shallot'), 1
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'pounded lemongrass chicken'), 
	(select ingredient_id from Ingredients where ingredient_name = 'garlic'), 2, 
	(select unit_id from Units where unit_name = 'clove')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'pounded lemongrass chicken'), 
	(select ingredient_id from Ingredients where ingredient_name = 'lime juice'), 1, 4, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'pounded lemongrass chicken'), 
	(select ingredient_id from Ingredients where ingredient_name = 'fish sauce'), 2, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'pounded lemongrass chicken'), 
	(select ingredient_id from Ingredients where ingredient_name = 'light brown sugar'), 2, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'pounded lemongrass chicken'), 
	(select ingredient_id from Ingredients where ingredient_name = 'chicken breasts'), 4
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'pounded lemongrass chicken'), 
	(select ingredient_id from Ingredients where ingredient_name = 'Kosher salt'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'pounded lemongrass chicken'), 
	(select ingredient_id from Ingredients where ingredient_name = 'vegetable oil'), 2, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'lobster rolls'), 
	(select ingredient_id from Ingredients where ingredient_name = 'lobsters'), 3
);
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lobster rolls'), 
	(select ingredient_id from Ingredients where ingredient_name = 'Kosher salt'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
);
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lobster rolls'), 
	(select ingredient_id from Ingredients where ingredient_name = 'celery'), 1, 
	(select unit_id from Units where unit_name = 'stalk')
);
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lobster rolls'), 
	(select ingredient_id from Ingredients where ingredient_name = 'lemon juice'), 2, 
	(select unit_id from Units where unit_name = 'tbsp')
);
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lobster rolls'), 
	(select ingredient_id from Ingredients where ingredient_name = 'chives'), 1, 
	(select unit_id from Units where unit_name = 'tbsp')
);
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lobster rolls'), 
	(select ingredient_id from Ingredients where ingredient_name = 'mayonnaise'), 2, 
	(select unit_id from Units where unit_name = 'tbsp')
);
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lobster rolls'), 
	(select ingredient_id from Ingredients where ingredient_name = 'black pepper'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
);
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'lobster rolls'), 
	(select ingredient_id from Ingredients where ingredient_name = 'New England-style hot dog buns'), 6
);

insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lobster rolls'), 
	(select ingredient_id from Ingredients where ingredient_name = 'unsalted butter'), 2, 
	(select unit_id from Units where unit_name = 'tbsp')
);
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'green tea sables'), 
	(select ingredient_id from Ingredients where ingredient_name = 'unsalted butter'), 113, 
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'green tea sables'), 
	(select ingredient_id from Ingredients where ingredient_name = 'green tea'), 2, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'green tea sables'), 
	(select ingredient_id from Ingredients where ingredient_name = 'sugar'), 50, 
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'green tea sables'), 
	(select ingredient_id from Ingredients where ingredient_name = 'sea salt'), 1, 4, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'green tea sables'), 
	(select ingredient_id from Ingredients where ingredient_name = 'all-purpose flour'), 170,  
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemon madeleines'), 
	(select ingredient_id from Ingredients where ingredient_name = 'all-purpose flour'), 90, 
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemon madeleines'), 
	(select ingredient_id from Ingredients where ingredient_name = 'baking powder'), 1,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemon madeleines'), 
	(select ingredient_id from Ingredients where ingredient_name = 'sea salt'), 1, 4, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemon madeleines'), 
	(select ingredient_id from Ingredients where ingredient_name = 'lemon zest'), 1, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num,  unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemon madeleines'), 
	(select ingredient_id from Ingredients where ingredient_name = 'sugar'), 67, 
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'lemon madeleines'), 
	(select ingredient_id from Ingredients where ingredient_name = 'eggs'), 2
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemon madeleines'), 
	(select ingredient_id from Ingredients where ingredient_name = 'honey'), 1, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemon madeleines'), 
	(select ingredient_id from Ingredients where ingredient_name = 'vanilla extract'), 1,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemon madeleines'), 
	(select ingredient_id from Ingredients where ingredient_name = 'butter'), 113, 
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemon madeleines'), 
	(select ingredient_id from Ingredients where ingredient_name = 'whole milk'), 1, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'speculoos'), 
	(select ingredient_id from Ingredients where ingredient_name = 'all-purpose flour'), 272, 
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'speculoos'), 
	(select ingredient_id from Ingredients where ingredient_name = 'ground cinnamon'), 1, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'speculoos'), 
	(select ingredient_id from Ingredients where ingredient_name = 'ground ginger'), 3, 4,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'speculoos'), 
	(select ingredient_id from Ingredients where ingredient_name = 'grated nutmeg'), 1, 2,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'speculoos'), 
	(select ingredient_id from Ingredients where ingredient_name = 'ground cloves'), 1, 8,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'speculoos'), 
	(select ingredient_id from Ingredients where ingredient_name = 'sea salt'), 1, 2,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'speculoos'), 
	(select ingredient_id from Ingredients where ingredient_name = 'unsalted butter'), 113, 
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'speculoos'), 
	(select ingredient_id from Ingredients where ingredient_name = 'light brown sugar'), 100, 
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'speculoos'), 
	(select ingredient_id from Ingredients where ingredient_name = 'sugar'), 50, 
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'speculoos'), 
	(select ingredient_id from Ingredients where ingredient_name = 'molasses'), 2, 
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'speculoos'), 
	(select ingredient_id from Ingredients where ingredient_name = 'eggs'), 1
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'speculoos'), 
	(select ingredient_id from Ingredients where ingredient_name = 'vanilla extract'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'molasses sugar butter cookies'), 
	(select ingredient_id from Ingredients where ingredient_name = 'unsalted butter'), 227, 
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'molasses sugar butter cookies'), 
	(select ingredient_id from Ingredients where ingredient_name = 'all-purpose flour'), 272, 
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'molasses sugar butter cookies'), 
	(select ingredient_id from Ingredients where ingredient_name = 'baking soda'), 2, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'molasses sugar butter cookies'), 
	(select ingredient_id from Ingredients where ingredient_name = 'sea salt'), 1, 4, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'molasses sugar butter cookies'), 
	(select ingredient_id from Ingredients where ingredient_name = 'ground cinnamon'), 1, 
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'molasses sugar butter cookies'), 
	(select ingredient_id from Ingredients where ingredient_name = 'ground cloves'), 1, 2,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'molasses sugar butter cookies'), 
	(select ingredient_id from Ingredients where ingredient_name = 'ground ginger'), 1, 2,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'molasses sugar butter cookies'), 
	(select ingredient_id from Ingredients where ingredient_name = 'superfine sugar'), 170, 
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'molasses sugar butter cookies'), 
	(select ingredient_id from Ingredients where ingredient_name = 'eggs'), 1
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'cauliflower and celery root soup'), 
	(select ingredient_id from Ingredients where ingredient_name = 'olive oil'), 1, 4,
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'cauliflower and celery root soup'), 
	(select ingredient_id from Ingredients where ingredient_name = 'onion'), 2,
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'cauliflower and celery root soup'), 
	(select ingredient_id from Ingredients where ingredient_name = 'celery root'), 2,
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'cauliflower and celery root soup'), 
	(select ingredient_id from Ingredients where ingredient_name = 'fennel'), 2,
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'cauliflower and celery root soup'), 
	(select ingredient_id from Ingredients where ingredient_name = 'cauliflower'), 2,
	(select unit_id from Units where unit_name = 'lb')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'cauliflower and celery root soup'), 
	(select ingredient_id from Ingredients where ingredient_name = 'chicken stock'), 2,
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'cauliflower and celery root soup'), 
	(select ingredient_id from Ingredients where ingredient_name = 'heavy cream'), 2,
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'grilled New York strip steaks'), 
	(select ingredient_id from Ingredients where ingredient_name = 'light brown sugar'), 2,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'grilled New York strip steaks'), 
	(select ingredient_id from Ingredients where ingredient_name = 'ground coffee'), 2,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'grilled New York strip steaks'), 
	(select ingredient_id from Ingredients where ingredient_name = 'granulated garlic'), 1,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'grilled New York strip steaks'), 
	(select ingredient_id from Ingredients where ingredient_name = 'chipotle chile powder'), 1,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'grilled New York strip steaks'), 
	(select ingredient_id from Ingredients where ingredient_name = 'red pepper flakes'), 1,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'grilled New York strip steaks'), 
	(select ingredient_id from Ingredients where ingredient_name = 'New York strip steaks'), 3
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'grilled New York strip steaks'), 
	(select ingredient_id from Ingredients where ingredient_name = 'olive oil'), 1,
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'asparagus and prosciutto bundles'), 
	(select ingredient_id from Ingredients where ingredient_name = 'asparagus'), 2,
	(select unit_id from Units where unit_name = 'lb')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'asparagus and prosciutto bundles'), 
	(select ingredient_id from Ingredients where ingredient_name = 'prosciutto'), 1,
	(select unit_id from Units where unit_name = 'slice')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'asparagus and prosciutto bundles'), 
	(select ingredient_id from Ingredients where ingredient_name = 'white truffle butter'), 2,
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'asparagus and prosciutto bundles'), 
	(select ingredient_id from Ingredients where ingredient_name = 'Gruyere cheese'), 2,
	(select unit_id from Units where unit_name = 'oz')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'lemony leek meatballs'), 
	(select ingredient_id from Ingredients where ingredient_name = 'leeks'), 6
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemony leek meatballs'), 
	(select ingredient_id from Ingredients where ingredient_name = 'ground beef'), 250,
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemony leek meatballs'), 
	(select ingredient_id from Ingredients where ingredient_name = 'bread crumbs'), 90,
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'lemony leek meatballs'), 
	(select ingredient_id from Ingredients where ingredient_name = 'eggs'), 2
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemony leek meatballs'), 
	(select ingredient_id from Ingredients where ingredient_name = 'sunflower oil'), 2,
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemony leek meatballs'), 
	(select ingredient_id from Ingredients where ingredient_name = 'chicken stock'), 200,
	(select unit_id from Units where unit_name = 'ml')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemony leek meatballs'), 
	(select ingredient_id from Ingredients where ingredient_name = 'lemon juice'), 80,
	(select unit_id from Units where unit_name = 'ml')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemony leek meatballs'), 
	(select ingredient_id from Ingredients where ingredient_name = 'Greek yogurt'), 80,
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'lemony leek meatballs'), 
	(select ingredient_id from Ingredients where ingredient_name = 'fresh parsley'), 1,
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'burnt eggplant with garlic, lemon and pomegranate seeds'), 
	(select ingredient_id from Ingredients where ingredient_name = 'eggplants'), 4
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'burnt eggplant with garlic, lemon and pomegranate seeds'), 
	(select ingredient_id from Ingredients where ingredient_name = 'garlic'), 2,
	(select unit_id from Units where unit_name = 'clove')
); 

insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'burnt eggplant with garlic, lemon and pomegranate seeds'), 
	(select ingredient_id from Ingredients where ingredient_name = 'lemon juice'), 2,
	(select unit_id from Units where unit_name = 'tbsp')
); 

insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'burnt eggplant with garlic, lemon and pomegranate seeds'), 
	(select ingredient_id from Ingredients where ingredient_name = 'fresh parsley'), 2,
	(select unit_id from Units where unit_name = 'tbsp')
); 

insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'burnt eggplant with garlic, lemon and pomegranate seeds'), 
	(select ingredient_id from Ingredients where ingredient_name = 'olive oil'), 5,
	(select unit_id from Units where unit_name = 'tbsp')
); 

insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'burnt eggplant with garlic, lemon and pomegranate seeds'), 
	(select ingredient_id from Ingredients where ingredient_name = 'fresh mint'), 2,
	(select unit_id from Units where unit_name = 'tbsp')
); 

insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'burnt eggplant with garlic, lemon and pomegranate seeds'), 
	(select ingredient_id from Ingredients where ingredient_name = 'pomegranate seeds'), 80,
	(select unit_id from Units where unit_name = 'g')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'egg salad with tarragon and chives'), 
	(select ingredient_id from Ingredients where ingredient_name = 'red onion'), 3,
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'egg salad with tarragon and chives'), 
	(select ingredient_id from Ingredients where ingredient_name = 'hard-cooked eggs'), 8
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'egg salad with tarragon and chives'), 
	(select ingredient_id from Ingredients where ingredient_name = 'mayonnaise'), 1, 2,
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'egg salad with tarragon and chives'), 
	(select ingredient_id from Ingredients where ingredient_name = 'fresh tarragon'), 2,
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'egg salad with tarragon and chives'), 
	(select ingredient_id from Ingredients where ingredient_name = 'chives'), 2,
	(select unit_id from Units where unit_name = 'tbsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'braised pork belly'), 
	(select ingredient_id from Ingredients where ingredient_name = 'coriander seeds'), 3, 2,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, quantity_denom, unit) values (
	(select recipe_id from Recipes where recipe_name = 'braised pork belly'), 
	(select ingredient_id from Ingredients where ingredient_name = 'black peppercorns'), 3, 2,
	(select unit_id from Units where unit_name = 'tsp')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'braised pork belly'), 
	(select ingredient_id from Ingredients where ingredient_name = 'pork belly'), 3,
	(select unit_id from Units where unit_name = 'lb')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'braised pork belly'), 
	(select ingredient_id from Ingredients where ingredient_name = 'bay leaves'), 2
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'braised pork belly'), 
	(select ingredient_id from Ingredients where ingredient_name = 'onion'), 1
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'braised pork belly'), 
	(select ingredient_id from Ingredients where ingredient_name = 'garlic'), 5,
	(select unit_id from Units where unit_name = 'cloves')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'braised pork belly'), 
	(select ingredient_id from Ingredients where ingredient_name = 'orange juice'), 1,
	(select unit_id from Units where unit_name = 'cup')
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num) values (
	(select recipe_id from Recipes where recipe_name = 'braised pork belly'), 
	(select ingredient_id from Ingredients where ingredient_name = 'scallions'), 2
); 
insert into RecipeIngredients (recipe, ingredient, quantity_num, unit) values (
	(select recipe_id from Recipes where recipe_name = 'braised pork belly'), 
	(select ingredient_id from Ingredients where ingredient_name = 'red pepper flakes'), 2,
	(select unit_id from Units where unit_name = 'tbsp')
); 


