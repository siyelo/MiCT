class Company < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :size, presence: true

end
