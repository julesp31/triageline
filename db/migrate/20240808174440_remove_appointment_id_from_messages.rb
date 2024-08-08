class RemoveAppointmentIdFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_reference :messages, :appointment, index: true, foreign_key: true
  end
end
