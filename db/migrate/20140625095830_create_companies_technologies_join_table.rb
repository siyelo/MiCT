class CreateCompaniesTechnologiesJoinTable < ActiveRecord::Migration
  def change
    create_join_table :companies, :technologies do |t|
      t.index [:company_id, :technology_id]
      # t.index [:technology_id, :company_id]
    end
  end
end
