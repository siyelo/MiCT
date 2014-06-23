class Company < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :size, presence: true

	geocoded_by :location
	after_validation :geocodem
end
