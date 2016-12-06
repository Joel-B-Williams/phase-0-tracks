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

console.log(findLongest(words));
console.log(findLongest(insults));
console.log(findLongest(compliments));