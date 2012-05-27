class SalesPerson

	attr_accessor :cities, :starting_point
	
	def initialize(starting_point)
	  @starting_point = starting_point
		@cities = [@starting_point]
	end

	def schedule_city(city)
    @cities << city unless @starting_point.to_s == city.to_s || @cities.include?(city)
	end

	def route
		CalculatesRoute.calculate(cities)
	end
end
