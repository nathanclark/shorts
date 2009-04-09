$(document).ready(function(){
	// Notification Close Links 
	$('a.close').show();
	$('a.close').click(function(){ //Waits for a link with the class of close to be clicked
		$(this).parent().slideUp(); //Slides up the link's parent element
		return false;  
	});
	
	// Initializes validation of any forms that have a class of .validate 
	$("form.validate").validate(); //validates any forms with validate as their class
	
	//Initializes Syntax Highlighter
	$(function () { 
		$('.code').jush(); 
	});
	
	//We activate the datepicker here. We also specify the earliest date they can choose.
	$('.date-picker').datePicker({startDate:'01/01/1900'});
	
	// Clears the Search... text from the search form 
	$("#search-form").focus(function() {
		if( this.value == this.defaultValue ) {
			this.value = "";
		}
	}).blur(function() {
		if( !this.value.length ) {
			this.value = this.defaultValue;
		}
	});
	
	// Collapse Side Menu Items 
	$("#collapse-side-menu").click(function(){
		var stateTest = $('#content-container').css('width');
		var valueState = parseFloat(stateTest);
			if (valueState < 850) {
				$("#content-container").animate({
					width: "1000px",
					left: "50px"				
				})
				$("li.side-main").animate({
					left: "40px"
				});	
			}
			else{
				$("#content-container").animate({
					width: "800px",
					left: "200px"
				})
				$("li.side-main").animate({
					left: "0px"				
				});	
			}
	});
	
 // Top Tabs Collapser 
	$("#collapse-top-menu").click(function(){
		var topStateTest = $('#content').css('top');
		var valueState = parseFloat(topStateTest);
			if (valueState > -10) {
				$('#content').animate({
		    		 top: "-40px"
				});
			}
			else{
				$('#content').animate({
		    		 top: "0px"
				});
			}
	});
	



});
