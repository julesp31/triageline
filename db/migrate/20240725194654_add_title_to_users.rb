class AddTitleToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :title, :string, null: false
  end
end
