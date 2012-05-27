Dir["./lib/*.rb"].each {|file| require file }


phil = SalesPerson.new(Place.build("Dallas, TX"))
phil.schedule_city(Place.build("El Paso, TX"))
phil.schedule_city(Place.build("Austin, TX"))
phil.schedule_city(Place.build("Lubbock, TX"))
phil.schedule_city(Place.build("San Marcos, TX"))

puts "Destinations: #{phil.cities} \n Route: #{phil.route} \n\n"
 
johnny = SalesPerson.new("HEB Highway 6 Missouri City, TX")
johnny.schedule_city(Place.build("Sky Zone 10207 S. SAM HOUSTON PKWY W. HOUSTON, TX 77071"))
johnny.schedule_city(Place.build("Alamo Drafthouse 1000 West Oaks Mall #429, Houston, TX"))
johnny.schedule_city(Place.build("Harbor Freight SUGAR LAND, TX 77478"))
johnny.schedule_city(Place.build("Lowes 3807 Fm 1092 Missouri City, TX"))

puts "Destinations: \n #{johnny.cities} \n\n Route: \n #{johnny.route} \n\n"