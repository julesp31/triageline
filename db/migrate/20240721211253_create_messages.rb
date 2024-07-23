class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.references :appointment, null: false, foreign_key: true
      t.text :text, null: false

      t.timestamps
    end
  end
end
