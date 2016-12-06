# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
#require_relative means that the file your looking for is in the same directory.
#require allows you to access modules.
require_relative 'state_data'

class VirusPredictor

  #When creating an instance we need to take an input of these 3 variables
  #And we store that those variables for later use.
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  #Print the results of predicted_results and speed_of_spread
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  #Anything below this is not accessible by the user.
  private

  #Calculating the number of deaths, based on a calculations of the 3 varaibles.
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      number_of_deaths = (@population * 0.4).floor
    elsif @population_density >= 150
      number_of_deaths = (@population * 0.3).floor
    elsif @population_density >= 100
      number_of_deaths = (@population * 0.2).floor
    elsif @population_density >= 50
      number_of_deaths = (@population * 0.1).floor
    else
      number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  #based on population density it sets the speed of spread
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if @population_density >= 200
      speed += 0.5
    elsif @population_density >= 150
      speed += 1
    elsif @population_density >= 100
      speed += 1.5
    elsif @population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end


#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


STATE_DATA.each do |state, pop_info|
  state = VirusPredictor.new(state, pop_info[:population_density], pop_info[:population])
  state.virus_effects
end




#=======================================================================
# Reflection Section

# - Functionally similar, using symbols does conserve memory, although using strings makes for more print-friendly data if necessary
# - require_relative pulls from the same local directory, while require is used to pull gems/modules
# - standard loop methods, as well as built in hash interation, can look at both key/value, only one, etc as needed
# - variables were repeats of instance variables
# - overall understanding of instance variables was helped, and seeing 'private' in action was good as well