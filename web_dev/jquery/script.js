

//3 functions
//2 to link buttons to appropriate shape - change shape
// 1 to change color of clicked shape on click

$(document).ready(function(){
	$('.shape').click(function(){
		$(this).css("background-color", "blue")
	})
})

$(document).ready(function(){
	$('#one').click(function(){
		$('#first').animate({height: "50px"})
	})
})

$(document).ready(function(){
	$('#two').click(function(){
		$('#second').animate({width: "50px"})
	})
})