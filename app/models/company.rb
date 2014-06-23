class Company < ActiveRecord::Base
	belongs_to :user

	attr_accessible :address, :latitude, :longitude
	geocoded_by :location
	after_validation :geocodem :if => :location_changed?
end
