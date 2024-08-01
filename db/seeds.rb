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
# Appointment_symptom.destroy_all
Message.destroy_all
Appointment.destroy_all
User.destroy_all

puts "Creating users..."

clinician1 = User.new(
  email: 'mcure@gmail.com',
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
  title: 'Nurse',
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
  title: 'Nurse',
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
  job_title: 'Nurse',
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
  email: 'djones@gmail.com',
  password: 'test12345',
  title: 'Doctor',
  first_name: 'David',
  last_name: 'Jones',
  date_of_birth: '20/02/1982',
  gender_at_birth: 'Man',
  phone_number: '07283467788',
  nhs_number: '6283928379',
  home_address: '78 Cedar Road',
  home_town: 'London',
  home_postcode: 'W12 8TH',
  clinician: true,
  job_title: 'Doctor',
  work_gpname: 'Brook Green Medical Centre',
  work_gpaddress: '12 Shepherds Bush Road',
  work_gptown: 'London',
  work_gppostcode: 'W6 7PJ',
  practice_doctorname: 'Doctor Robert Koch',
  practice_name: 'Brook Green Medical Centre',
  practice_address: '12 Shepherds Bush Road',
  practice_town: 'London',
  practice_postcode: 'W6 7PJ'
)
clinician6.save!

clinician7 = User.new(
  email: 'ewilson@gmail.com',
  password: 'test12345',
  title: 'Nurse',
  first_name: 'Emily',
  last_name: 'Wilson',
  date_of_birth: '05/06/1990',
  gender_at_birth: 'Woman',
  phone_number: '07283467789',
  nhs_number: '6283928380',
  home_address: '90 Elm Street',
  home_town: 'London',
  home_postcode: 'N19 5TH',
  clinician: true,
  job_title: 'Nurse',
  work_gpname: 'Archway Medical Centre',
  work_gpaddress: '652 Holloway Road',
  work_gptown: 'London',
  work_gppostcode: 'N19 3NU',
  practice_doctorname: 'Doctor Louis Pasteur',
  practice_name: 'Archway Medical Centre',
  practice_address: '652 Holloway Road',
  practice_town: 'London',
  practice_postcode: 'N19 3NU'
)
clinician7.save!

clinician8 = User.new(
  email: 'fmiller@gmail.com',
  password: 'test12345',
  title: 'Doctor',
  first_name: 'Frank',
  last_name: 'Miller',
  date_of_birth: '14/07/1978',
  gender_at_birth: 'Man',
  phone_number: '07283467790',
  nhs_number: '6283928381',
  home_address: '102 Pine Road',
  home_town: 'London',
  home_postcode: 'SE10 9LB',
  clinician: true,
  job_title: 'Doctor',
  work_gpname: 'Greenwich Peninsula Practice',
  work_gpaddress: '4 Horn Lane',
  work_gptown: 'London',
  work_gppostcode: 'SE10 0RT',
  practice_doctorname: 'Doctor Edward Jenner',
  practice_name: 'Greenwich Peninsula Practice',
  practice_address: '4 Horn Lane',
  practice_town: 'London',
  practice_postcode: 'SE10 0RT'
)
clinician8.save!

clinician9 = User.new(
  email: 'gsmith@gmail.com',
  password: 'test12345',
  title: 'Nurse',
  first_name: 'Grace',
  last_name: 'Smith',
  date_of_birth: '30/01/1984',
  gender_at_birth: 'Woman',
  phone_number: '07283467791',
  nhs_number: '6283928382',
  home_address: '23 Spruce Road',
  home_town: 'London',
  home_postcode: 'SW3 4TH',
  clinician: true,
  job_title: 'Nurse',
  work_gpname: 'Chelsea Practice',
  work_gpaddress: '10 Sydney Street',
  work_gptown: 'London',
  work_gppostcode: 'SW3 6NP',
  practice_doctorname: 'Doctor Florence Nightingale',
  practice_name: 'Chelsea Practice',
  practice_address: '10 Sydney Street',
  practice_town: 'London',
  practice_postcode: 'SW3 6NP'
)
clinician9.save!

clinician10 = User.new(
  email: 'hjohnson@gmail.com',
  password: 'test12345',
  title: 'Doctor',
  first_name: 'Henry',
  last_name: 'Johnson',
  date_of_birth: '07/09/1973',
  gender_at_birth: 'Man',
  phone_number: '07283467792',
  nhs_number: '6283928383',
  home_address: '55 Cherry Lane',
  home_town: 'London',
  home_postcode: 'NW1 3HS',
  clinician: true,
  job_title: 'Doctor',
  work_gpname: 'Camden Medical Centre',
  work_gpaddress: '10 Pratt Street',
  work_gptown: 'London',
  work_gppostcode: 'NW1 0UP',
  practice_doctorname: 'Doctor Ignaz Semmelweis',
  practice_name: 'Camden Medical Centre',
  practice_address: '10 Pratt Street',
  practice_town: 'London',
  practice_postcode: 'NW1 0UP'
)
clinician10.save!

clinician11 = User.new(
  email: 'imartin@gmail.com',
  password: 'test12345',
  title: 'Nurse',
  first_name: 'Isla',
  last_name: 'Martin',
  date_of_birth: '13/05/1988',
  gender_at_birth: 'Woman',
  phone_number: '07283467793',
  nhs_number: '6283928384',
  home_address: '16 Fir Road',
  home_town: 'London',
  home_postcode: 'E3 2JA',
  clinician: true,
  job_title: 'Nurse',
  work_gpname: 'Bow Health Centre',
  work_gpaddress: '17 William Place',
  work_gptown: 'London',
  work_gppostcode: 'E3 5ED',
  practice_doctorname: 'Doctor Joseph Lister',
  practice_name: 'Bow Health Centre',
  practice_address: '17 William Place',
  practice_town: 'London',
  practice_postcode: 'E3 5ED'
)
clinician11.save!

clinician12 = User.new(
  email: 'jkhan@gmail.com',
  password: 'test12345',
  title: 'Doctor',
  first_name: 'Jack',
  last_name: 'Khan',
  date_of_birth: '21/10/1976',
  gender_at_birth: 'Man',
  phone_number: '07283467794',
  nhs_number: '6283928385',
  home_address: '77 Ash Road',
  home_town: 'London',
  home_postcode: 'SW18 4RL',
  clinician: true,
  job_title: 'Doctor',
  work_gpname: 'Southfields Group Practice',
  work_gpaddress: '603 Merton Road',
  work_gptown: 'London',
  work_gppostcode: 'SW18 5JG',
  practice_doctorname: 'Doctor Paul Ehrlich',
  practice_name: 'Southfields Group Practice',
  practice_address: '603 Merton Road',
  practice_town: 'London',
  practice_postcode: 'SW18 5JG'
)
clinician12.save!

clinician13 = User.new(
  email: 'jroberts@gmail.com',
  password: 'test12345',
  title: 'Nurse',
  first_name: 'Jenny',
  last_name: 'Roberts',
  date_of_birth: '18/04/1981',
  gender_at_birth: 'Woman',
  phone_number: '07283467795',
  nhs_number: '6283928386',
  home_address: '44 Willow Road',
  home_town: 'London',
  home_postcode: 'N10 2QU',
  clinician: true,
  job_title: 'Nurse',
  work_gpname: 'Muswell Hill Practice',
  work_gpaddress: '54 Colney Hatch Lane',
  work_gptown: 'London',
  work_gppostcode: 'N10 1DU',
  practice_doctorname: 'Doctor Jonas Salk',
  practice_name: 'Muswell Hill Practice',
  practice_address: '54 Colney Hatch Lane',
  practice_town: 'London',
  practice_postcode: 'N10 1DU'
)
clinician13.save!

clinician14 = User.new(
  email: 'klee@gmail.com',
  password: 'test12345',
  title: 'Doctor',
  first_name: 'Kevin',
  last_name: 'Lee',
  date_of_birth: '17/12/1986',
  gender_at_birth: 'Man',
  phone_number: '07283467796',
  nhs_number: '6283928387',
  home_address: '89 Sycamore Road',
  home_town: 'London',
  home_postcode: 'W5 2TH',
  clinician: true,
  job_title: 'Doctor',
  work_gpname: 'Ealing Broadway Practice',
  work_gpaddress: '20 The Broadway',
  work_gptown: 'London',
  work_gppostcode: 'W5 2NH',
  practice_doctorname: 'Doctor Alexander Fleming',
  practice_name: 'Ealing Broadway Practice',
  practice_address: '20 The Broadway',
  practice_town: 'London',
  practice_postcode: 'W5 2NH'
)
clinician14.save!

clinician15 = User.new(
  email: 'lmiller@gmail.com',
  password: 'test12345',
  title: 'Nurse',
  first_name: 'Laura',
  last_name: 'Miller',
  date_of_birth: '03/02/1974',
  gender_at_birth: 'Woman',
  phone_number: '07283467797',
  nhs_number: '6283928388',
  home_address: '123 Beech Road',
  home_town: 'London',
  home_postcode: 'N1 1TH',
  clinician: true,
  job_title: 'Nurse',
  work_gpname: 'Angel Medical Practice',
  work_gpaddress: '30 Ritchie Street',
  work_gptown: 'London',
  work_gppostcode: 'N1 0DG',
  practice_doctorname: 'Doctor Elizabeth Blackwell',
  practice_name: 'Angel Medical Practice',
  practice_address: '30 Ritchie Street',
  practice_town: 'London',
  practice_postcode: 'N1 0DG'
)
clinician15.save!

clinician16 = User.new(
  email: 'nbrown@gmail.com',
  password: 'test12345',
  title: 'Doctor',
  first_name: 'Nathan',
  last_name: 'Brown',
  date_of_birth: '09/11/1983',
  gender_at_birth: 'Man',
  phone_number: '07283467798',
  nhs_number: '6283928389',
  home_address: '14 Poplar Road',
  home_town: 'London',
  home_postcode: 'E2 7LQ',
  clinician: true,
  job_title: 'Doctor',
  work_gpname: 'Bethnal Green Health Centre',
  work_gpaddress: '1 Wolverley Street',
  work_gptown: 'London',
  work_gppostcode: 'E2 6LP',
  practice_doctorname: 'Doctor Alexander Graham Bell',
  practice_name: 'Bethnal Green Health Centre',
  practice_address: '1 Wolverley Street',
  practice_town: 'London',
  practice_postcode: 'E2 6LP'
)
clinician16.save!

clinician17 = User.new(
  email: 'osmith@gmail.com',
  password: 'test12345',
  title: 'Nurse',
  first_name: 'Olivia',
  last_name: 'Smith',
  date_of_birth: '11/08/1987',
  gender_at_birth: 'Woman',
  phone_number: '07283467799',
  nhs_number: '6283928390',
  home_address: '67 Acacia Road',
  home_town: 'London',
  home_postcode: 'W10 5QY',
  clinician: true,
  job_title: 'Nurse',
  work_gpname: 'Portobello Medical Centre',
  work_gpaddress: '14 Bassett Road',
  work_gptown: 'London',
  work_gppostcode: 'W10 6JJ',
  practice_doctorname: 'Doctor Florence Nightingale',
  practice_name: 'Portobello Medical Centre',
  practice_address: '14 Bassett Road',
  practice_town: 'London',
  practice_postcode: 'W10 6JJ'
)
clinician17.save!

clinician18 = User.new(
  email: 'pwhite@gmail.com',
  password: 'test12345',
  title: 'Doctor',
  first_name: 'Peter',
  last_name: 'White',
  date_of_birth: '22/06/1972',
  gender_at_birth: 'Man',
  phone_number: '07283467800',
  nhs_number: '6283928391',
  home_address: '23 Willow Road',
  home_town: 'London',
  home_postcode: 'E5 8TH',
  clinician: true,
  job_title: 'Doctor',
  work_gpname: 'Hackney Downs Practice',
  work_gpaddress: '31 Amhurst Road',
  work_gptown: 'London',
  work_gppostcode: 'E8 1LL',
  practice_doctorname: 'Doctor Edward Jenner',
  practice_name: 'Hackney Downs Practice',
  practice_address: '31 Amhurst Road',
  practice_town: 'London',
  practice_postcode: 'E8 1LL'
)
clinician18.save!

clinician19 = User.new(
  email: 'rclark@gmail.com',
  password: 'test12345',
  title: 'Nurse',
  first_name: 'Rachel',
  last_name: 'Clark',
  date_of_birth: '28/03/1989',
  gender_at_birth: 'Woman',
  phone_number: '07283467801',
  nhs_number: '6283928392',
  home_address: '45 Pine Street',
  home_town: 'London',
  home_postcode: 'SW4 8BG',
  clinician: true,
  job_title: 'Nurse',
  work_gpname: 'Clapham Family Practice',
  work_gpaddress: '51 Clapham High Street',
  work_gptown: 'London',
  work_gppostcode: 'SW4 7TL',
  practice_doctorname: 'Doctor Paul Ehrlich',
  practice_name: 'Clapham Family Practice',
  practice_address: '51 Clapham High Street',
  practice_town: 'London',
  practice_postcode: 'SW4 7TL'
)
clinician19.save!

clinician20 = User.new(
  email: 'sclarke@gmail.com',
  password: 'test12345',
  title: 'Doctor',
  first_name: 'Samuel',
  last_name: 'Clarke',
  date_of_birth: '19/07/1980',
  gender_at_birth: 'Man',
  phone_number: '07283467802',
  nhs_number: '6283928393',
  home_address: '36 Oak Road',
  home_town: 'London',
  home_postcode: 'NW6 5HD',
  clinician: true,
  job_title: 'Doctor',
  work_gpname: 'Kilburn Park Medical Centre',
  work_gpaddress: '12 Kilburn Park Road',
  work_gptown: 'London',
  work_gppostcode: 'NW6 5UY',
  practice_doctorname: 'Doctor Louis Pasteur',
  practice_name: 'Kilburn Park Medical Centre',
  practice_address: '12 Kilburn Park Road',
  practice_town: 'London',
  practice_postcode: 'NW6 5UY'
)
clinician20.save!

puts "Total number of users created: #{User.count}"


patient1 = User.new(
  email: 'patient@gmail.com',
  password: 'test12345',
  title: 'Mr',
  first_name: 'John',
  last_name: 'Patient',
  date_of_birth: '10/07/1961',
  gender_at_birth: 'Woman',
  phone_number: '07283467783',
  nhs_number: '6283928387',
  home_address: '8 Steen Way',
  home_town: 'London',
  home_postcode: 'SE22 8TH',
  clinician: false,
)
patient.save!


appointment = Appointment.create!(
  patient: patient,
  clinician: clinician,
  appointment_date: Date.current,
  appointment_type: 'dermatology',
  status: 'confirmed',
  severity: 'high'
)
