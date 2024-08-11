class RemovePatientIdFromChatrooms < ActiveRecord::Migration[7.1]
  def change
    remove_reference :chatrooms, :patient, index: true
    remove_reference :chatrooms, :clinician, index: true
  end
end
