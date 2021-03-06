require_relative "../lib/sales_person"
require_relative "../lib/calculates_route"
require_relative "../lib/place"

describe SalesPerson do

  subject = SalesPerson.new(Place.build("Houston, TX"))
  
  it "salesperson should log the total miles" do
    salesperson = SalesPerson.new(Place.build("Houston, TX"))
    salesperson.log_route_distance(salesperson.route).should eq(salesperson.total_miles)
  end  
    
  it "should have a defined starting point" do
    subject.cities[0].to_s.should eq(Place.build("Houston, TX").to_s)
  end
  
	it "should have many cities" do
		city = stub
		subject.schedule_city(city)
		subject.cities.should include(city)
	end

	it "should keep the cities only scheduled once" do	
		city = stub
		expect{
			subject.schedule_city(city)
			subject.schedule_city(city)
		}.to change(subject.cities,:count).by(1) 			
	end

	it "should calculate a route via the CalculatesRoute" do
		cities = [stub, stub, stub]
		subject.stub(:cities) { cities } 
		CalculatesRoute.should_receive(:calculate).with(cities)
		subject.route
	end
	it "should returns the route from CalculatesRoute" do
		route_stub = [stub, stub]
		CalculatesRoute.stub(:calculate) { route_stub }
		subject.route.should eq(route_stub)
	end
end
