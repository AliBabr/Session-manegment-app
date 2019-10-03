class AddFieToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :view_password, :string
  end
end
