class AddFieldsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string, null: false
    add_column :users, :last_name, :string, null: false
    add_column :users, :date_of_birth, :date, null: false
    add_column :users, :gender_at_birth, :string, null: false
    add_column :users, :phone_number, :string, null: false
    add_column :users, :nhs_number, :integer, null: false
    add_column :users, :home_address, :string, null: false
    add_column :users, :home_town, :string, null: false
    add_column :users, :home_postcode, :string, null: false
    add_column :users, :clinician, :boolean, default: false
    add_column :users, :job_title, :string
    add_column :users, :work_gpname, :string
    add_column :users, :work_gpaddress, :string
    add_column :users, :work_gptown, :string
    add_column :users, :work_gppostcode, :string
    add_column :users, :practice_doctorname, :string
    add_column :users, :practice_name, :string
    add_column :users, :practice_address, :string
    add_column :users, :practice_town, :string
    add_column :users, :practice_postcode, :string
  end
end
