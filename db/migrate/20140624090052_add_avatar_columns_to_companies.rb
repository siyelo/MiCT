class AddAvatarColumnsToCompanies < ActiveRecord::Migration
  def self.up
    add_attachment :companies, :avatar
  end

  def self.down
    remove_attachment :companies, :avatar
  end
end
