class SalesPerson

	attr_accessor :cities, :starting_point, :total_miles
	
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
	
	def log_route_distance(route_path)
	  running_total = 0
    (0..route_path.length-1).each do |index|
      unless index+1 > route_path.length-1
        distance = Map.distance_between(route_path[index], route_path[index+1])
        running_total = running_total + distance
        #puts "From #{route_path[index]} to #{route_path[index+1]} is #{distance}. Running Total: #{running_total}"
      end
    end
    @total_miles = running_total 
  end
end
