Dir["./lib/*.rb"].each {|file| require file }
require 'benchmark'
require 'nokogiri'
require 'open-uri'

texas_cities = []
doc = Nokogiri::HTML(open('http://www.texas.gov/en/discover/Pages/topic.aspx?topicid=/government/localgov'))
doc.css(".TGOV_SCRD_Header a").map do |node|
  texas_cities << "#{node.content}, TX"
end

Benchmark.bm do |x|
  x.report do 
    salesperson = SalesPerson.new(Place.build("Houston, TX"))
    texas_cities.shuffle.take(1).each do |city|
      salesperson.schedule_city(Place.build(city))
    end
    salesperson.route
  end
  
  x.report do 
    salesperson = SalesPerson.new(Place.build("Houston, TX"))
    texas_cities.shuffle.take(9).each do |city|
      salesperson.schedule_city(Place.build(city))
    end
    salesperson.route
  end
    
  x.report do 
    salesperson = SalesPerson.new(Place.build("Houston, TX"))
    texas_cities.shuffle.take(49).each do |city|
      salesperson.schedule_city(Place.build(city))
    end
    salesperson.route
  end
  
  x.report do 
    salesperson = SalesPerson.new(Place.build("Houston, TX"))
    texas_cities.shuffle.take(199).each do |city|
      salesperson.schedule_city(Place.build(city))
    end
    salesperson.route
  end
      
end