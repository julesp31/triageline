# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_08_09_201619) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "appointment_symptoms", force: :cascade do |t|
    t.bigint "appointment_id", null: false
    t.bigint "symptom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["appointment_id"], name: "index_appointment_symptoms_on_appointment_id"
    t.index ["symptom_id"], name: "index_appointment_symptoms_on_symptom_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.bigint "patient_id", null: false
    t.bigint "clinician_id", null: false
    t.datetime "appointment_date", null: false
    t.string "appointment_type", null: false
    t.string "status", null: false
    t.string "severity", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinician_id"], name: "index_appointments_on_clinician_id"
    t.index ["patient_id"], name: "index_appointments_on_patient_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.bigint "appointment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["appointment_id"], name: "index_chatrooms_on_appointment_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "chatroom_id", null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "news_items", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "category", null: false
    t.text "description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.date "date_of_birth", null: false
    t.string "gender_at_birth", null: false
    t.string "phone_number", null: false
    t.string "nhs_number", null: false
    t.string "home_address", null: false
    t.string "home_town", null: false
    t.string "home_postcode", null: false
    t.boolean "clinician", default: false
    t.string "job_title"
    t.string "work_gpname"
    t.string "work_gpaddress"
    t.string "work_gptown"
    t.string "work_gppostcode"
    t.string "practice_doctorname"
    t.string "practice_name"
    t.string "practice_address"
    t.string "practice_town"
    t.string "practice_postcode"
    t.string "title", null: false
    t.string "specialty"
    t.string "years_of_experience"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "appointment_symptoms", "appointments"
  add_foreign_key "appointment_symptoms", "symptoms"
  add_foreign_key "appointments", "users", column: "clinician_id"
  add_foreign_key "appointments", "users", column: "patient_id"
  add_foreign_key "chatrooms", "appointments"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
end
