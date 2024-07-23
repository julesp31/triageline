class CreateSymptoms < ActiveRecord::Migration[7.1]
  def change
    create_table :symptoms do |t|
      t.string :category, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
