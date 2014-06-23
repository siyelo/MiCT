class Company < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :size, presence: true

	# attr_accessor :location, :latitude, :longitude
	geocoded_by :location
	after_validation :geocode

end
