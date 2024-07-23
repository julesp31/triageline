class AddNotNullConstraintToSymptoms < ActiveRecord::Migration[7.1]
  def change
    change_column_null :symptoms, :category, false
    change_column_null :symptoms, :description, false
  end
end
