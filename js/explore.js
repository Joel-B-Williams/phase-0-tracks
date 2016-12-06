// we are building a .reverse method!  but not in ruby.  :C
// for each letter in given word (henceforth "word")
// add last index into new variable (henceforth "newWord")
// return newWord (because JS doesn't do it on its own)

function reverseWord(word) {
	var newWord = "";
	for (i=word.length-1; i >= 0; i--) {
		newWord += word[i];
	}
	return newWord;
}

var newWord = reverseWord("pants");

if (1>0) {
	console.log(newWord);
	}