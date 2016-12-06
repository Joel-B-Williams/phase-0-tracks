var colors = ["red", "green", "blue", "yellow"];
var names = ["Fred", "Dibbs", "One-piece", "Square Deal"];

colors.push("brown");
names.push("hoof-hearted");

var horses = {};

for (var i=0; i < names.length; i++) {
	horses[names[i]] = colors[i];
}

console.log(horses)