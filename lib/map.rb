require 'geocoder'
class Map
  
  #works cited: https://github.com/telemachus/Episode7/commit/74f80f2b12e2a2a2d1c99f4a9a454f04503ee7c1
  Geocoder::Configuration.lookup = :yahoo 
  Geocoder::Configuration.timeout = 50

	def self.search(terms)
		Array(Geocoder.search(terms)).first
	end

	def self.distance_between(first, second)
		Geocoder::Calculations.distance_between(first, second)
	end
end
