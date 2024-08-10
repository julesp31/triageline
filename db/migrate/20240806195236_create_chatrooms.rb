class CreateChatrooms < ActiveRecord::Migration[7.1]
  def change
    create_table :chatrooms do |t|
      t.references :patient, null: false, foreign_key: { to_table: :users }
      t.references :clinician, null: false, foreign_key: { to_table: :users }
      t.references :appointment, null: false, foreign_key: true
      t.timestamps
    end
  end
end
