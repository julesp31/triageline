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

Message.destroy_all
Chatroom.destroy_all
AppointmentSymptom.destroy_all
Appointment.destroy_all
Symptom.destroy_all
User.destroy_all

clinician1 = User.new(
  email: 'clinician@gmail.com',
  password: 'test12345',
  title: 'Doctor',
  first_name: 'Marie',
  last_name: 'Cure',
  date_of_birth: '10/07/1961',
  gender_at_birth: 'Woman',
  phone_number: '07283467783',
  nhs_number: '6283928374',
  home_address: '8 Steen Way',
  home_town: 'London',
  home_postcode: 'SE22 8TH',
  clinician: true,
  job_title: 'Doctor',
  specialty: 'General Practitioner',
  years_of_experience: '28',
  work_gpname: 'Silverlock Medical Centre',
  work_gpaddress: '2 Verney Way',
  work_gptown: 'London',
  work_gppostcode: 'SE16 3HA',
  practice_doctorname: 'Doctor Alexander Fleming',
  practice_name: 'Silverlock Medical Centre',
  practice_address: '2 Verney Way',
  practice_town: 'London',
  practice_postcode: 'SE16 3HA'
)
clinician1.save!

clinician2 = User.new(
  email: 'ajohnson@gmail.com',
  password: 'test12345',
  title: 'Doctor',
  first_name: 'Albert',
  last_name: 'Johnson',
  date_of_birth: '15/03/1970',
  gender_at_birth: 'Man',
  phone_number: '07283467784',
  nhs_number: '6283928375',
  home_address: '12 Hill Street',
  home_town: 'London',
  home_postcode: 'SW11 5EH',
  clinician: true,
  job_title: 'Doctor',
  specialty: 'General Practitioner',
  years_of_experience: '19',
  work_gpname: 'Battersea Fields Practice',
  work_gpaddress: '159 Battersea Park Road',
  work_gptown: 'London',
  work_gppostcode: 'SW8 4BU',
  practice_doctorname: 'Doctor Dorothy Hodgkin',
  practice_name: 'Battersea Fields Practice',
  practice_address: '159 Battersea Park Road',
  practice_town: 'London',
  practice_postcode: 'SW8 4BU'
)
clinician2.save!

clinician3 = User.new(
  email: 'jdoe@gmail.com',
  password: 'test12345',
  title: 'Miss',
  first_name: 'Jane',
  last_name: 'Doe',
  date_of_birth: '25/12/1980',
  gender_at_birth: 'Woman',
  phone_number: '07283467785',
  nhs_number: '6283928376',
  home_address: '22 Oak Lane',
  home_town: 'London',
  home_postcode: 'NW3 2HE',
  clinician: true,
  job_title: 'Nurse',
  specialty: 'Senior Nurse',
  years_of_experience: '9',
  work_gpname: 'Hampstead Group Practice',
  work_gpaddress: '75 Fleet Road',
  work_gptown: 'London',
  work_gppostcode: 'NW3 2QU',
  practice_doctorname: 'Doctor Rosalind Franklin',
  practice_name: 'Hampstead Group Practice',
  practice_address: '75 Fleet Road',
  practice_town: 'London',
  practice_postcode: 'NW3 2QU'
)
clinician3.save!

clinician4 = User.new(
  email: 'bwilliams@gmail.com',
  password: 'test12345',
  title: 'Doctor',
  first_name: 'Ben',
  last_name: 'Williams',
  date_of_birth: '09/08/1985',
  gender_at_birth: 'Man',
  phone_number: '07283467786',
  nhs_number: '6283928377',
  home_address: '34 Maple Avenue',
  home_town: 'London',
  home_postcode: 'N1 2TW',
  clinician: true,
  job_title: 'Doctor',
  specialty: 'General Practitioner',
  years_of_experience: '4',
  work_gpname: 'Islington Central Medical Centre',
  work_gpaddress: '28 Laycock Street',
  work_gptown: 'London',
  work_gppostcode: 'N1 1SW',
  practice_doctorname: 'Doctor James Watson',
  practice_name: 'Islington Central Medical Centre',
  practice_address: '28 Laycock Street',
  practice_town: 'London',
  practice_postcode: 'N1 1SW'
)
clinician4.save!

clinician5 = User.new(
  email: 'csmith@gmail.com',
  password: 'test12345',
  title: 'Mrs',
  first_name: 'Carol',
  last_name: 'Smith',
  date_of_birth: '12/11/1975',
  gender_at_birth: 'Woman',
  phone_number: '07283467787',
  nhs_number: '6283928378',
  home_address: '56 Birch Road',
  home_town: 'London',
  home_postcode: 'E1 4QT',
  clinician: true,
  job_title: 'Physician Associate',
  specialty: 'Senior Physician Associate',
  years_of_experience: '14',
  work_gpname: 'The Spitalfields Practice',
  work_gpaddress: '20 Old Montague Street',
  work_gptown: 'London',
  work_gppostcode: 'E1 5SU',
  practice_doctorname: 'Doctor Frederick Banting',
  practice_name: 'The Spitalfields Practice',
  practice_address: '20 Old Montague Street',
  practice_town: 'London',
  practice_postcode: 'E1 5SU'
)
clinician5.save!

clinician6 = User.new(
  email: 'lsanders@gmail.com',
  password: 'test12345',
  title: 'Doctor',
  first_name: 'Liam',
  last_name: 'Sanders',
  date_of_birth: '04/02/1978',
  gender_at_birth: 'Man',
  phone_number: '07283467798',
  nhs_number: '6283928380',
  home_address: '80 Grove Street',
  home_town: 'London',
  home_postcode: 'SE15 3GW',
  clinician: true,
  job_title: 'Doctor',
  specialty: 'General Practitioner',
  years_of_experience: '7',
  work_gpname: 'Peckham Family Practice',
  work_gpaddress: '5 Peckham Park Road',
  work_gptown: 'London',
  work_gppostcode: 'SE15 6TR',
  practice_doctorname: 'Doctor Helen Taussig',
  practice_name: 'Peckham Family Practice',
  practice_address: '5 Peckham Park Road',
  practice_town: 'London',
  practice_postcode: 'SE15 6TR'
)
clinician6.save!

clinician7 = User.new(
  email: 'anewton@gmail.com',
  password: 'test12345',
  title: 'Doctor',
  first_name: 'Alice',
  last_name: 'Newton',
  date_of_birth: '29/08/1982',
  gender_at_birth: 'Woman',
  phone_number: '07283467899',
  nhs_number: '6283928381',
  home_address: '15 River Road',
  home_town: 'London',
  home_postcode: 'NW4 3SG',
  clinician: true,
  job_title: 'Doctor',
  specialty: 'General Practitioner',
  years_of_experience: '12',
  work_gpname: 'Hendon Heart Centre',
  work_gpaddress: '22 Queen Road',
  work_gptown: 'London',
  work_gppostcode: 'NW4 2TN',
  practice_doctorname: 'Doctor Christiaan Barnard',
  practice_name: 'Hendon Heart Centre',
  practice_address: '22 Queen Road',
  practice_town: 'London',
  practice_postcode: 'NW4 2TN'
)
clinician7.save!


patient1 = User.new(
  email: 'patient@gmail.com',
  password: 'test12345',
  title: 'Miss',
  first_name: 'Basia',
  last_name: 'Brzeziecka',
  date_of_birth: '10/07/1961',
  gender_at_birth: 'Woman',
  phone_number: '07283467783',
  nhs_number: '6283928387',
  home_address: '8 Steen Way',
  home_town: 'London',
  home_postcode: 'SE22 8TH',
  clinician: false,
  practice_doctorname: 'Doctor Alexander Fleming',
  practice_name: 'Silverlock Medical Centre',
  practice_address: '2 Verney Way',
  practice_town: 'London',
  practice_postcode: 'SE16 3HA'
)
patient1.save!

patient2 = User.new(
  email: 'sarahjane@example.com',
  password: 'test12345',
  title: 'Ms',
  first_name: 'Sarah',
  last_name: 'Jane',
  date_of_birth: '12/04/1982',
  gender_at_birth: 'Woman',
  phone_number: '07283467901',
  nhs_number: '7283918347',
  home_address: '12 Oak Street',
  home_town: 'London',
  home_postcode: 'SE25 4EQ',
  clinician: false,
  practice_doctorname: 'Doctor Alexander Fleming',
  practice_name: 'Silverlock Medical Centre',
  practice_address: '2 Verney Way',
  practice_town: 'London',
  practice_postcode: 'SE16 3HA'
)
patient2.save!

patient3 = User.new(
  email: 'mikeb@example.com',
  password: 'test12345',
  title: 'Mr',
  first_name: 'Michael',
  last_name: 'Brown',
  date_of_birth: '01/05/1970',
  gender_at_birth: 'Man',
  phone_number: '07283467902',
  nhs_number: '7283918399',
  home_address: '32 Maple Drive',
  home_town: 'London',
  home_postcode: 'NW10 1AB',
  clinician: false,
  practice_doctorname: 'Doctor Alexander Fleming',
  practice_name: 'Silverlock Medical Centre',
  practice_address: '2 Verney Way',
  practice_town: 'London',
  practice_postcode: 'SE16 3HA'
)
patient3.save!

patient4 = User.new(
  email: 'linda_green@example.com',
  password: 'test12345',
  title: 'Mrs',
  first_name: 'Linda',
  last_name: 'Green',
  date_of_birth: '22/07/1988',
  gender_at_birth: 'Woman',
  phone_number: '07283467903',
  nhs_number: '6283928388',
  home_address: '14 Pine Road',
  home_town: 'London',
  home_postcode: 'E2 7LQ',
  clinician: false,
  practice_doctorname: 'Doctor Alexander Fleming',
  practice_name: 'Silverlock Medical Centre',
  practice_address: '2 Verney Way',
  practice_town: 'London',
  practice_postcode: 'SE16 3HA'
)
patient4.save!

patient5 = User.new(
  email: 'tommy_lee@example.com',
  password: 'test12345',
  title: 'Mr',
  first_name: 'Tommy',
  last_name: 'Lee',
  date_of_birth: '08/03/1975',
  gender_at_birth: 'Man',
  phone_number: '07283467904',
  nhs_number: '6283928389',
  home_address: '8 High Street',
  home_town: 'London',
  home_postcode: 'SW16 1RN',
  clinician: false,
  practice_doctorname: 'Doctor Alexander Fleming',
  practice_name: 'Silverlock Medical Centre',
  practice_address: '2 Verney Way',
  practice_town: 'London',
  practice_postcode: 'SE16 3HA'
)
patient5.save!

patient6 = User.new(
  email: 'emily_white@example.com',
  password: 'test12345',
  title: 'Ms',
  first_name: 'Emily',
  last_name: 'White',
  date_of_birth: '17/10/1993',
  gender_at_birth: 'Woman',
  phone_number: '07283467905',
  nhs_number: '6283928390',
  home_address: '24 Elm Street',
  home_town: 'London',
  home_postcode: 'NW5 3AP',
  clinician: false,
  practice_doctorname: 'Doctor Alexander Fleming',
  practice_name: 'Silverlock Medical Centre',
  practice_address: '2 Verney Way',
  practice_town: 'London',
  practice_postcode: 'SE16 3HA'
)
patient6.save!

patient7 = User.new(
  email: 'gregory_peck@example.com',
  password: 'test12345',
  title: 'Mr',
  first_name: 'Gregory',
  last_name: 'Peck',
  date_of_birth: '11/11/1981',
  gender_at_birth: 'Man',
  phone_number: '07283467906',
  nhs_number: '6283928391',
  home_address: '56 Cedar Lane',
  home_town: 'London',
  home_postcode: 'E3 2JA',
  clinician: false,
  practice_doctorname: 'Doctor Alexander Fleming',
  practice_name: 'Silverlock Medical Centre',
  practice_address: '2 Verney Way',
  practice_town: 'London',
  practice_postcode: 'SE16 3HA'
)
patient7.save!

puts "Total number of Users created: #{User.count}"

appointment1 = Appointment.create!(
  patient: patient1,
  clinician: clinician1,
  appointment_date: Time.new(2024, 5, 7, 9, 00),
  appointment_type: 'Video',
  status: 'Accepted',
  severity: 'Low'
)
Chatroom.create!(name: "Chatroom #{appointment1.id}", appointment_id: appointment1.id)

appointment2 = Appointment.create!(
  patient: patient1,
  clinician: clinician2,
  appointment_date: Time.new(2024, 1, 3, 16, 30),
  appointment_type: 'In-Person',
  status: 'Accepted',
  severity: 'Low'
)
Chatroom.create!(name: "Chatroom #{appointment2.id}", appointment_id: appointment2.id)

appointment3 = Appointment.create!(
  patient: patient1,
  clinician: clinician3,
  appointment_date: Time.new(2023, 12, 19, 10, 30),
  appointment_type: 'Video',
  status: 'Accepted',
  severity: 'Low'
)
Chatroom.create!(name: "Chatroom #{appointment3.id}", appointment_id: appointment3.id)

appointment4 = Appointment.create!(
  patient: patient1,
  clinician: clinician4,
  appointment_date: Time.new(2023, 6, 11, 15, 00),
  appointment_type: 'Phone',
  status: 'Accepted',
  severity: 'High'
)
Chatroom.create!(name: "Chatroom #{appointment4.id}", appointment_id: appointment4.id)

appointment5 = Appointment.create!(
  patient: patient1,
  clinician: clinician5,
  appointment_date: Time.new(2023, 3, 24, 11, 00),
  appointment_type: 'In-Person',
  status: 'Closed',
  severity: 'Low'
)
Chatroom.create!(name: "Chatroom #{appointment5.id}", appointment_id: appointment5.id)

appointment6 = Appointment.create!(
  patient: patient1,
  clinician: clinician6,
  appointment_date: Time.new(2022, 9, 5, 13, 30),
  appointment_type: 'In-Person',
  status: 'Accepted',
  severity: 'High'
)
Chatroom.create!(name: "Chatroom #{appointment6.id}", appointment_id: appointment6.id)

appointment7 = Appointment.create!(
  patient: patient1,
  clinician: clinician7,
  appointment_date: Time.new(2022, 5, 30, 14, 30),
  appointment_type: 'Video',
  status: 'Closed',
  severity: 'Low'
)
Chatroom.create!(name: "Chatroom #{appointment7.id}", appointment_id: appointment7.id)

puts "Total number of Appointments created: #{Appointment.count}"

symptom1 = Symptom.create!(
  category: 'Muscle and Joints',
  description: "I've been experiencing some mild discomfort and stiffness in my joints, especially when I wake up. The stiffness seems worse when it's cold, and there's a bit of swelling sometimes. I've been trying to stay active, which seems to help a little."
)

symptom2 = Symptom.create!(
  category: 'Cold, Cough, Flu, Sore Throat and Earaches',
  description: "I have a mild sore throat and a dry cough that's been bothering me for over a week now. I don't have a fever, but the discomfort is annoying. I've been using some over-the-counter remedies, which provide temporary relief."
)

symptom3 = Symptom.create!(
  category: 'Skin Problems',
  description: "I noticed a rash on my arms and neck that's sometimes itchy but not painful. I think it might be from the new laundry detergent I started using. I've switched back to the old one and am taking antihistamines to help with the itching."
)

symptom4 = Symptom.create!(
  category: 'Stomach Issues',
  description: "I've been experiencing severe stomach pains and frequent nausea, especially after meals. The pain sometimes becomes unbearable, affecting my daily activities. I suspect it might be related to something I'm eating, but I can't pinpoint the cause. The discomfort has started to impact my sleep and overall well-being significantly."
)

symptom5 = Symptom.create!(
  category: 'Prescriptions',
  description: "I'm here to get a refill on my blood pressure medication. There haven't been any changes in my condition or the medication dosage, and my blood pressure has been stable whenever I check it at home."
)

symptom6 = Symptom.create!(
  category: 'Breathing Conditions & Allergies',
  description: "I've been having a really tough time breathing lately, especially when the pollen count is high. My wheezing has gotten worse, and sometimes I feel like I can't catch my breath. It seems like my usual medication isn't working as well anymore."
)

symptom7 = Symptom.create!(
  category: 'Cold, Cough, Flu, Sore Throat and Earaches',
  description: "I've had a persistent cough and sore throat for a few weeks now, along with some headaches and occasional earaches. Over-the-counter meds help a bit, but the symptoms keep coming back. I'm wondering if I might need something stronger."
)

puts "Total number of Symptoms created: #{Symptom.count}"

AppointmentSymptom.create!(
  appointment_id: appointment1.id,
  symptom_id: symptom1.id
)

AppointmentSymptom.create!(
  appointment_id: appointment2.id,
  symptom_id: symptom2.id
)

AppointmentSymptom.create!(
  appointment_id: appointment3.id,
  symptom_id: symptom3.id
)

AppointmentSymptom.create!(
  appointment_id: appointment4.id,
  symptom_id: symptom4.id
)

AppointmentSymptom.create!(
  appointment_id: appointment5.id,
  symptom_id: symptom5.id
)

AppointmentSymptom.create!(
  appointment_id: appointment6.id,
  symptom_id: symptom6.id
)

AppointmentSymptom.create!(
  appointment_id: appointment7.id,
  symptom_id: symptom7.id
)

puts "Total number of linked Appointments Symptoms created: #{AppointmentSymptom.count}"
