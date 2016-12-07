// write function to accept array of words/phrases and 
//   return the longest one

// look at each item in turn
// compare length to set variable (reset if greater)
// store word if length > variable

var words = ["word", "more words", "so many words", "less words"];
var insults = ["is that your nose or a frog?",
								"go away or I shall taunt you a second time",
								"ni!!"
							];
var compliments = ["jklol your nose isn't froglike at all",
										"no taunting today",
										"wiki neeeee pong"
										];
var findLongest = function(arrayOfWords) {
	var charCount = 0;
	var longest = "";

	for (i=0; i<arrayOfWords.length; i++) {
		if (arrayOfWords[i].length > charCount) {
			longest = arrayOfWords[i];
			charCount = arrayOfWords[i].length;
		}
	}
return longest;
};


// look at two objects and see if any key-value pairs are a match
// for each item in object a
//   look at each item in object b - return true if match
//   return 'match' value

var carList = {car: "blue", truck: "yellow"};
var carList2 = {car: "yellow", truck: "yellow"};
var carList3 = {car: "red", truck: "red"};


var findMatch = function(carsA, carsB) {
	var match = false;
	for (var vehicleType in carsA) {
	  for (var vehicleColor in carsB) {
	    if (vehicleType === vehicleColor && carsA[vehicleType] === carsB[vehicleColor]) {
	      match = true;
	    }
	  }
	}
	return match;
}

	
// take integer for length (x)
// x times, build/return array x items long
// items are words of random (1-10) length
function randomNumber(min, max) {
  var x = Math.random() * (max - min) + min;
  return Math.floor(x);
}

function makeWord(length) {
	var alph = "abcdefghijklmnopqrstuvwxyz";
	var newWord = "";
	for (var i=0; i<length; i++) {
		newWord+=(alph[randomNumber(0, 26)]);
	}
	return newWord;
}

function makeArray(arrayLength) {
	var newArray = [];
	for (var i=0; i<arrayLength; i++) {
		newArray.push(makeWord(randomNumber(1, 11)));
	}
	return newArray;
}
		
		//##DRIVER TESTS##
		
		// console.log(findLongest(words));
		// console.log(findLongest(i)nsults));
// console.log(findLongest(compliments));

// console.log(findMatch(carList, carList2));
// console.log(findMatch(carList, carList3));

console.log(makeArray(3));