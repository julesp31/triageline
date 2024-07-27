# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "date"
require "open-uri"

puts "Purging database..."

Symptom.destroy_all
Appointment_symptom.destroy_all
Message.destroy_all
Appointment.destroy_all
User.destroy_all

puts "Creating users..."

johns = User.create!(
  email: 'jsmith@gmail.com'
  encrypted_password: 'test12345'
  title: Mr
  first_name: John
  last_name: Smith
  date_of_birth: 14/10/1995
  gender_at_birth: Male
  phone_number: 07577123123
  nhs_number: 8392839201
  home_address: 2 Broomfield Place
  home_town: London
  home_postcode: W13 9LB
  gp_name: Doctor Andrew Baldwin
  practice_name: Soho Square General Practice
  practice_address: 1 Frith Street
  practice_town: London
  practice_postcode: W1D 3HZ
  clinician: false
)

puts "User #{johns.id} is created"

mariec = User.create!(
  email: 'mcure@gmail.com'
  encrypted_password: 'test12345'
  title: Doctor
  first_name: Marie
  last_name: Cure
  date_of_birth: 10/07/1961
  gender_at_birth: Woman
  phone_number: 07283467783
  nhs_number: 6283928374
  home_address: 8 Steen Way
  home_town: London
  home_postcode: SE22 8TH
  clinician: true
  job_title: Doctor
  work_name: Silverlock Medical Centre
  work_address: 2 Verney Way
  work_town: London
  work_postcode: SE16 3HA
  gp_name: Doctor Alexander Fleming
  practice_name: Silverlock Medical Centre
  practice_address: 2 Verney Way
  practice_town: London
  practice_postcode: SE16 3HA
)
