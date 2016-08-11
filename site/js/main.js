/*prevent error message*/ 
$.ajaxPrefilter(function( options, originalOptions, jqXHR ) {
    options.async = true;
});

function successMessage() {
	$('#database').load('render.php');	
	$('#forms').load('render-forms.php');	
}

function ingredientSuccessMessage() {	
	$('#forms').load('render-forms.php');		
	$('#database').append('<p>Ingredient added to database.</p>');
}

function sourceSuccessMessage() {		
	$('#forms').load('render-forms.php');
	$('#database').append('<p>Source added to database.</p>');
}



function bindAddButton() {
    $('#add-button').click(function (event) {
        event.preventDefault();
		
        var payload = {};  
        payload['name']= $('#name').val();
        payload['category']= $('#category').val();
		payload['source']= $('#source').val();
		
        $.ajax({
            type: 'POST',
            url: 'add.php',
            data: payload,   
            success: successMessage  
        });
    });
}

function bindAddIngredientButton() {
    $('#add-ingredient-button').click(function (event) {
        event.preventDefault();
		
        var payload = {};  
        payload['name']= $('#ing_name').val();
		
        $.ajax({
            type: 'POST',
            url: 'add-ingredient.php',
            data: payload,   
            success: ingredientSuccessMessage  
        });
    });
}

function bindAddSourceButton() {
    $('#add-source-button').click(function (event) {
        event.preventDefault();
		
        var payload = {};  
        payload['name']= $('#pub_name').val();
		payload['author']= $('#author').val();
		payload['year']= $('#year').val();
		
        $.ajax({
            type: 'POST',
            url: 'add-source.php',
            data: payload,   
            success: sourceSuccessMessage  
        });
    });
}

function bindSortCatDwn() {
	 $('#cat-dwn').click(function (event) {
        event.preventDefault();
		$('#database').load('sort-cat-desc.php');
	});
}

function bindSortCatUp() {
	 $('#cat-up').click(function (event) {
        event.preventDefault();
		$('#database').load('render.php');
	});
}

function bindSortRcpDwn() {
	 $('#rcp-dwn').click(function (event) {
        event.preventDefault();
		$('#database').load('sort-rcp-desc.php');
	});
}

function bindSortRcpUp() {
	 $('#rcp-up').click(function (event) {
        event.preventDefault();
		$('#database').load('sort-rcp-asc.php');
	});
}

function bindSortSrcDwn() {
	 $('#src-dwn').click(function (event) {
        event.preventDefault();
		$('#database').load('sort-src-desc.php');
	});
}

function bindSortSrcUp() {
	 $('#src-up').click(function (event) {
        event.preventDefault();
		$('#database').load('sort-src-asc.php');
	});
}

function bindDeleteButtons() {
	$('.delete-button').click(function (event) {
		event.preventDefault();

		var payload = {};  
		payload['id'] = $(this).attr('id');

		$.ajax({
            type: 'GET',
            url: 'remove.php',
            data: payload,   
            success: successMessage  
        });
	});

}


$(document).ready(function(){   
    bindAddButton();
	bindAddIngredientButton();
	
	bindSortCatDwn();
	bindSortCatUp();
	bindSortRcpDwn();
	bindSortRcpUp();
	bindSortSrcDwn();
	bindSortSrcUp();
	
	bindDeleteButtons();
	bindAddSourceButton();
});