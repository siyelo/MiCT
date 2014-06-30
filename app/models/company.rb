class Company < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :technologies

	# def self.search(search)
	#   if search
	#     q = "%#{search}%"
	# 	Company.where("name like ? or status like ?", q, q)
	#   else
	#   	Company.all
	#   end
	# end

	def get_techs
		arr = ""
		self.technologies.each do |t|
			arr + t.name
		end
		arr
	end

	validates :name, presence: true
	validates :size, presence: true

	# validates_format_of :phone,
 #      :with => /[0-9]{3}-[0-9]{3}-[0-9]{4}/,
 #      :message => "Phone numbers must be in 123-456-6789 format."

	# attr_accessor :location, :latitude, :longitude
	geocoded_by :location
	after_validation :geocode

	has_attached_file :avatar, :style => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	validates_attachment_content_type :avatar, :content_type => /\Aimage/
	validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]

end
