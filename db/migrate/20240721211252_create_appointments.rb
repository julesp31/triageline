class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :patient, null: false, foreign_key: { to_table: :users }
      t.references :clinician, null: false, foreign_key: { to_table: :users }
      t.datetime :appointment_date, null: false
      t.string :appointment_type, null: false
      t.string :status, null: false
      t.string :severity, null: false

      t.timestamps
    end
  end
end
