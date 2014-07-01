class CreateUsersTagsJoinTable < ActiveRecord::Migration
  def change
  	create_join_table :companies, :tags do |t|
      t.index [:company_id, :tag_id]
      # t.index [:technology_id, :company_id]
    end
  end
end
