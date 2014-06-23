class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :size
      t.string :location
      t.string :status

      t.timestamps
    end
  end
end
