/*make asynchronous requests; prevent error message*/ 
$.ajaxPrefilter(function( options, originalOptions, jqXHR ) {
    options.async = true;
});


function unitSuccessMessage() {
	$('#recipes').append('<p>Unit added to database.</p>');		
}

function bindAddToRecipeButton() {
	$('#add-to-recipe-button').click(function (event) {
        event.preventDefault();
		
        var payload = {};  
		payload['recipe']= $('#recipe').val();
        payload['name']= $('#name').val();
		payload['num']= $('#num').val();
		payload['denom']= $('#denom').val();
		payload['unit']= $('#unit').val();
		
        $.ajax({
            type: 'POST',
            url: 'add-recipe-ing.php',
            data: payload,
			success:  function(data){
				var recId = $('#recipe').val();
				$('#recipes').load('render-recipe.php?id='+recId);
				$('#recipe-forms').load('render-recipe-forms.php?id='+recId);
			  }			
        });
    });
}

function bindAddUnitButton() {
    $('#add-unit-button').click(function (event) {
        event.preventDefault();
		
        var payload = {};  
        payload['name']= $('#new_unit').val();
		
        $.ajax({
            type: 'POST',
            url: 'add-unit.php',
            data: payload,   
			success:  function(data){
				$('#recipes').append('<p>Unit added to database.</p>');	
				var recId = $('#recipe').val();
				$('#recipe-forms').load('render-recipe-forms.php?id='+recId);
			  }		
        });
    });
}


$(document).ready(function(){   
	bindAddToRecipeButton();
	bindAddUnitButton();
});