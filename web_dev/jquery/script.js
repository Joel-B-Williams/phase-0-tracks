

//3 functions
//2 to link buttons to appropriate shape - change shape
// 1 to change color of clicked shape on click

$(function(){
	$('.shape').click(function(){
		$(this).css("background-color", "blue")
	})
})

$(function(){
	$('div button:first-child').click(function(){
		$('#first').animate({height: "50px"})
	})
})

$(function(){
	$('div button:last-child').click(function(){
		$('#second').animate({borderRadius: "100px"})
	})
})