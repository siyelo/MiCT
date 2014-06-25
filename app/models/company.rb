class Company < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :size, presence: true

	# attr_accessor :location, :latitude, :longitude
	geocoded_by :location
	after_validation :geocode

	has_attached_file :avatar, :style => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage/
	validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]
end
