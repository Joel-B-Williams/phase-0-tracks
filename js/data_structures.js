var colors = ["red", "green", "blue", "yellow"];
var names = ["Fred", "Dibbs", "One-piece", "Square Deal"];

colors.push("brown");
names.push("hoof-hearted");

var horses = {};

for (var i=0; i < names.length; i++) {
	horses[names[i]] = colors[i];
}

console.log(horses)

function Car(make, model, year) {
	this.make = make;
	this.model = model;
	this.year = year;
	//add "instance" functions
	this.honk = function(){
		console.log("BEEEP");
	}
}

var tesla = new Car("Tesla", "Model 3", 2018);
var truck = new Car("Ford", "Ranger", 1998);



tesla.honk();
truck.honk();