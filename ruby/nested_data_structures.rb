spaceship = {
	bridge: {
		navigation: ["FTL", "Subspace", "Blink Drive"],
		communications: ["Internal", "Radio", "Broad Spectrum"],
		weapons_control: ["Anti-matter Torpedoes", "Pew-pew Lasers", "Shields"],
		command_console: "Big boss"
	},
	mess: ["nutrient bars", "coffee", "dining table"],
	medbay: ["op table", "med cabinets"],
	crew_quarters: {
		Kaylee: ["flowers", "floofy dress", "tools"],
		Wash: ["leaves on the wind", "dinosaurs"],
		Jayne: "lots of guns"
		},
	storage_bay: ["def-not-stolen goods", "spare parts", "mule rover"]
}

puts spaceship[:bridge][:navigation]
puts spaceship[:bridge][:weapons_control][1]
puts spaceship[:medbay]
puts spaceship[:mess][0]
puts spaceship[:crew_quarters][:Jayne]
puts spaceship[:crew_quarters][:Wash][1]
puts spaceship[:storage_bay]