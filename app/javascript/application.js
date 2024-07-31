// // Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
// import "@hotwired/turbo-rails";
// import "controllers";
// import "@popperjs/core";
// import "bootstrap";


// document.addEventListener('DOMContentLoaded', function() {
//   const categoryList = document.getElementById('category-list');
//   const triageQuestions = document.getElementById('triage-questions');
//   const triageTitle = document.getElementById('triage-title');
//   const questionsContainer = document.getElementById('questions-container');
//   const reasonForAppointment = document.getElementById('reason-for-appointment');
//   const appointmentTypeList = document.getElementById('appointment-type-list');
//   const availableClinicians = document.getElementById('available-clinicians');
//   const cliniciansContainer = document.getElementById('clinicians-container');
//   const calendarView = document.getElementById('calendar-view');
//   const calendarContainer = document.getElementById('calendar-container');
//   const availableTimes = document.getElementById('available-times');
//   const closeCalendarButton = document.getElementById('close-calendar');
//   const bookingDetails = document.getElementById('booking-details');
//   const detailsContainer = document.getElementById('details-container');
//   const confirmBookingButton = document.getElementById('confirm-booking');
//   const backButtons = document.querySelectorAll('.back-button');
//   const closeButton = document.querySelector('.close-button');
//   const appointmentPending = document.getElementById('appointment-pending');
//   const submitTriageButton = document.getElementById('submit-triage');

//   let selectedClinician = '';
//   let selectedDate = '';
//   let selectedTime = '';
//   let historyStack = [];

//   const triageData = {
//     'admin': ['Question 1 for Admin?', 'Question 2 for Admin?', 'Question 3 for Admin?', 'Question 4 for Admin?'],
//     'test_results': ['Question 1 for Test Results?', 'Question 2 for Test Results?', 'Question 3 for Test Results?', 'Question 4 for Test Results?'],
//     'muscles_and_joints': ['Question 1 for Muscles and Joints?', 'Question 2 for Muscles and Joints?', 'Question 3 for Muscles and Joints?', 'Question 4 for Muscles and Joints?'],
//     'contraception': ['Question 1 for Contraception?', 'Question 2 for Contraception?', 'Question 3 for Contraception?', 'Question 4 for Contraception?'],
//     'breathing_conditions_and_allergies': ['Question 1 for Breathing conditions & Allergies?', 'Question 2 for Breathing conditions & Allergies?', 'Question 3 for Breathing conditions & Allergies?', 'Question 4 for Breathing conditions & Allergies?'],
//     'mental_health': ['Question 1 for Mental health?', 'Question 2 for Mental health?', 'Question 3 for Mental health?', 'Question 4 for Mental health?'],
//     'prescriptions': ['Question 1 for Prescriptions?', 'Question 2 for Prescriptions?', 'Question 3 for Prescriptions?', 'Question 4 for Prescriptions?'],
//     'diabetes_care': ['Question 1 for Diabetes Care?', 'Question 2 for Diabetes Care?', 'Question 3 for Diabetes Care?', 'Question 4 for Diabetes Care?'],
//     'cold_cough_flu_sore_throat_and_earaches': ['Question 1 for Cold, cough, flu, sore throat & Earaches?', 'Question 2 for Cold, cough, flu, sore throat & Earaches?', 'Question 3 for Cold, cough, flu, sore throat & Earaches?', 'Question 4 for Cold, cough, flu, sore throat & Earaches?'],
//     'skin_issues': ['Question 1 for Skin issues?', 'Question 2 for Skin issues?', 'Question 3 for Skin issues?', 'Question 4 for Skin issues?'],
//     'stomach_problems': ['Question 1 for Stomach problems?', 'Question 2 for Stomach problems?', 'Question 3 for Stomach problems?', 'Question 4 for Stomach problems?'],
//     'urine_problems': ['Question 1 for Urine problems?', 'Question 2 for Urine problems?', 'Question 3 for Urine problems?', 'Question 4 for Urine problems?'],
//     'travel_health': ['Question 1 for Travel health?', 'Question 2 for Travel health?', 'Question 3 for Travel health?', 'Question 4 for Travel health?'],
//     'other': ['Question 1 for Other?', 'Question 2 for Other?', 'Question 3 for Other?', 'Question 4 for Other?']
//   };

//   const cliniciansData = {
//     'phone': [
//       { name: 'Clinician 1', times: ['8:00am', '10:00am', '1:00pm'] },
//       { name: 'Clinician 2', times: ['9:00am', '11:00am', '2:00pm'] },
//     ],
//     'video': [
//       { name: 'Clinician 3', times: ['8:30am', '10:30am', '1:30pm'] },
//       { name: 'Clinician 4', times: ['9:30am', '11:30am', '2:30pm'] },
//     ],
//     'in-person': [
//       { name: 'Clinician 5', times: ['8:45am', '10:45am', '1:45pm'] },
//       { name: 'Clinician 6', times: ['9:45am', '11:45am', '2:45pm'] },
//     ],
//   };

//   categoryList.addEventListener('click', function(event) {
//     const categoryCard = event.target.closest('.category-card');
//     if (categoryCard) {
//       const category = categoryCard.getAttribute('data-category');
//       const questions = triageData[category];

//       triageTitle.textContent = categoryCard.querySelector('h3').textContent;
//       questionsContainer.innerHTML = '';

//       questions.forEach((question, index) => {
//         const questionElement = document.createElement('div');
//         questionElement.className = 'question';
//         questionElement.textContent = question;

//         const buttonsContainer = document.createElement('div');
//         buttonsContainer.className = 'question-buttons';

//         const yesButton = document.createElement('button');
//         yesButton.textContent = 'Yes';
//         yesButton.setAttribute('data-answer', 'yes');

//         const noButton = document.createElement('button');
//         noButton.textContent = 'No';
//         noButton.setAttribute('data-answer', 'no');

//         yesButton.addEventListener('click', () => {
//           questionElement.setAttribute('data-answered', 'true');
//           yesButton.classList.add('selected');
//           noButton.classList.remove('selected');
//         });

//         noButton.addEventListener('click', () => {
//           questionElement.setAttribute('data-answered', 'true');
//           noButton.classList.add('selected');
//           yesButton.classList.remove('selected');
//         });

//         buttonsContainer.appendChild(yesButton);
//         buttonsContainer.appendChild(noButton);

//         questionElement.appendChild(buttonsContainer);
//         questionsContainer.appendChild(questionElement);
//       });

//       showForm(triageQuestions);
//     }
//   });

//   submitTriageButton.addEventListener('click', function() {
//     const allAnswered = [...questionsContainer.querySelectorAll('.question')].every(question => question.getAttribute('data-answered') === 'true');

//     if (allAnswered) {
//       showForm(reasonForAppointment);
//     } else {
//       alert('Please answer all triage questions before proceeding.');
//     }
//   });

//   document.getElementById('submit-reason').addEventListener('click', function() {
//     const appointmentReason = document.getElementById('appointment-reason').value.trim();
//     if (appointmentReason) {
//       showForm(appointmentTypeList);
//     } else {
//       alert('Please provide a reason for your appointment.');
//     }
//   });

//   appointmentTypeList.addEventListener('click', function(event) {
//     const appointmentTypeCard = event.target.closest('.appointment-type-card');
//     if (appointmentTypeCard) {
//       const appointmentType = appointmentTypeCard.getAttribute('data-appointment-type');
//       const clinicians = cliniciansData[appointmentType];

//       cliniciansContainer.innerHTML = '';

//       clinicians.forEach(clinician => {
//         const clinicianCard = document.createElement('div');
//         clinicianCard.className = 'clinician-card';

//         const clinicianName = document.createElement('div');
//         clinicianName.textContent = clinician.name;
//         clinicianCard.appendChild(clinicianName);

//         const times = document.createElement('div');
//         times.className = 'times';
//         clinician.times.forEach(time => {
//           const timeSlot = document.createElement('div');
//           timeSlot.textContent = time;
//           timeSlot.className = 'time-slot';
//           timeSlot.addEventListener('click', () => {
//             showBookingDetails(clinician.name, '', time);
//           });
//           times.appendChild(timeSlot);
//         });

//         const moreButton = document.createElement('div');
//         moreButton.textContent = 'More';
//         moreButton.className = 'more-button';
//         moreButton.addEventListener('click', () => {
//           showCalendarView(clinician.name);
//         });
//         times.appendChild(moreButton);

//         clinicianCard.appendChild(times);
//         cliniciansContainer.appendChild(clinicianCard);
//       });

//       showForm(availableClinicians);
//     }
//   });

//   function showForm(form) {
//     const forms = [categoryList, triageQuestions, reasonForAppointment, appointmentTypeList, availableClinicians, calendarView, bookingDetails, appointmentPending];
//     forms.forEach(f => f.style.display = 'none');
//     form.style.display = 'flex';

//     if (historyStack.length === 0 || historyStack[historyStack.length - 1] !== form) {
//       historyStack.push(form);
//     }

//     if (historyStack.length > 1) {
//       backButtons.forEach(btn => btn.style.display = 'inline-block');
//     } else {
//       backButtons.forEach(btn => btn.style.display = 'none');
//     }
//   }

//   backButtons.forEach(btn => {
//     btn.addEventListener('click', function() {
//       if (historyStack.length > 1) {
//         historyStack.pop(); // Remove current form
//         const previousForm = historyStack[historyStack.length - 1];
//         showForm(previousForm);
//       }
//     });
//   });

//   function showCalendarView(clinicianName) {
//     flatpickr(calendarContainer, {
//       onChange: function(selectedDates, dateStr, instance) {
//         const availableTimesData = getAvailableTimesForClinicianOnDate(clinicianName, dateStr);
//         displayAvailableTimes(availableTimesData, clinicianName, dateStr);
//       }
//     });

//     showForm(calendarView);
//   }

//   function displayAvailableTimes(times, clinicianName, dateStr) {
//     availableTimes.innerHTML = '';
//     times.forEach(time => {
//       const timeSlot = document.createElement('div');
//       timeSlot.textContent = time;
//       timeSlot.className = 'time-slot';
//       timeSlot.addEventListener('click', () => {
//         showBookingDetails(clinicianName, dateStr, time);
//       });
//       availableTimes.appendChild(timeSlot);
//     });
//   }

//   function getAvailableTimesForClinicianOnDate(clinicianName, dateStr) {
//     // Mock data, replace with actual fetch from server
//     return ['8:00am', '10:00am', '1:00pm', '3:00pm'];
//   }

//   function showBookingDetails(clinicianName, dateStr, time) {
//     selectedClinician = clinicianName;
//     selectedDate = dateStr;
//     selectedTime = time;

//     detailsContainer.innerHTML = `
//       <p><strong>Clinician:</strong> ${clinicianName}</p>
//       <p><strong>Date:</strong> ${dateStr || 'Not selected'}</p>
//       <p><strong>Time:</strong> ${time}</p>
//     `;

//     showForm(bookingDetails);
//   }

//   closeCalendarButton.addEventListener('click', function() {
//     showForm(availableClinicians);
//   });

//   confirmBookingButton.addEventListener('click', function() {
//     alert(`Booking confirmed with ${selectedClinician} on ${selectedDate} at ${selectedTime}`);
//     // Handle the booking confirmation logic here
//     showForm(appointmentPending);
//   });

//   showForm(categoryList); // Display the category list form by default
// });
