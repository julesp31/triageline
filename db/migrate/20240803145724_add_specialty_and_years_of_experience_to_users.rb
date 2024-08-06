class AddSpecialtyAndYearsOfExperienceToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :specialty, :string
    add_column :users, :years_of_experience, :string
  end
end
