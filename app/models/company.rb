class Company < ActiveRecord::Base
	belongs_to :user

	# attr_accessor :location, :latitude, :longitude
	geocoded_by :location
	after_validation :geocode
end
