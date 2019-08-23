class CreateJoinTableUsersSites < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :sites do |t|
      # t.index [:user_id, :site_id]
      # t.index [:site_id, :user_id]
    end
  end
end
