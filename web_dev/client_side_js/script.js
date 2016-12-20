var paragraph = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras ligula quam, semper consectetur maximus posuere, vestibulum vel nulla. Sed non venenatis erat, et luctus turpis. Nam semper lacus a maximus ullamcorper. Curabitur rhoncus quis nibh quis auctor. Fusce maximus ut tellus id viverra. Nunc vel dapibus odio, quis iaculis risus. Maecenas auctor ligula vitae efficitur auctor. Quisque vitae tincidunt erat. Nunc rutrum velit erat, eu efficitur tellus consectetur at. Integer purus nisl, pellentesque placerat eros nec, sagittis lobortis tortor. Fusce faucibus, purus et condimentum aliquet, leo tortor aliquam dui, non suscipit purus dolor nec ipsum. Nullam in neque pellentesque enim eleifend ultrices quis a nunc. Aenean ut nibh gravida, facilisis sapien vitae, maximus est. Aliquam finibus, tortor a volutpat pretium, ante est mattis turpis, sed pulvinar quam orci vitae urna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris venenatis tincidunt dapibus."


var paraDiv = document.getElementById('paragraphs');
var buttDiv = document.getElementById('buttons');
var addButton = buttDiv.children[0];
var remButton = buttDiv.children[1];

// Event listner to Add button for 'click'
addButton.addEventListener('click', addParagraph);
remButton.addEventListener('click', remParagraph);

// Create new paragraph element
// Add text to ^^
// Append to appropriate Div
function addParagraph(){
	var newP = document.createElement("p");
	newP.innerText = paragraph;
	paraDiv.appendChild(newP);
}


// Function to remove last child of the div that holds the paragraphs
function remParagraph(){
	var lastP = paraDiv.lastElementChild;
	paraDiv.removeChild(lastP);
}