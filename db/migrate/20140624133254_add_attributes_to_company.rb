class AddAttributesToCompany < ActiveRecord::Migration
  def change
  	add_column :companies, :info, :text
  	add_column :companies, :website, :string
  	add_column :companies, :email, :string
  	add_column :companies, :phone, :string
  	add_column :companies, :hours, :string
  end
end
