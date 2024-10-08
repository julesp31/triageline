import "@hotwired/turbo-rails"
import 'controllers'
import "@popperjs/core"
import "bootstrap"
import "@rails/actioncable"

document.addEventListener('DOMContentLoaded', function() {
  const categoryList = document.getElementById('category-list');
  const triageQuestions = document.getElementById('triage-questions');
  const triageTitle = document.getElementById('triage-title');
  const questionsContainer = document.getElementById('questions-container');
  const reasonForAppointment = document.getElementById('reason-for-appointment');
  const appointmentTypeList = document.getElementById('appointment-type-list');
  const availableClinicians = document.getElementById('available-clinicians');
  const cliniciansContainer = document.getElementById('clinicians-container');
  const calendarView = document.getElementById('calendar-view');
  const calendarContainer = document.getElementById('calendar-container');
  const availableTimes = document.getElementById('available-times');
  const bookingDetails = document.getElementById('booking-details');
  const detailsContainer = document.getElementById('details-container');
  const confirmBookingButton = document.getElementById('confirm-booking');
  const backButton = document.querySelector('.back-button');
  const closeButton = document.querySelector('.close-button');
  const appointmentPending = document.getElementById('appointment-pending');
  const submitTriageButton = document.getElementById('submit-triage');
  const appointmentReason = document.getElementById('appointment-reason');
  const charCounter = document.getElementById('char-counter');

  let selectedClinician = '';
  let selectedAppointmentType = '';
  let selectedDate = '';
  let selectedTime = '';
  let historyStack = [];
  let severity = 'Low'; // Default severity

  const testButton = document.querySelector('#test-button');
  const appointmentType = document.getElementById('appointment_appointment_type');
  const appointmentStatus = document.getElementById('appointment_status');

  // Appointment Type
  let appointmentFormType = document.getElementById('appointment_appointment_type');
  let appointmentTypes = document.querySelectorAll('.appointment-type-card')

  appointmentTypes.forEach((type) => {
    type.addEventListener('click', () => {
      appointmentFormType.value = type.querySelector('span').innerHTML
    })
  });

  const triageData = {
    'admin': [
        'Do you need assistance with scheduling or rescheduling appointments?',
        'Is there a need to update insurance or payment information?',
        'Have you reviewed and confirmed your personal details for accuracy?',
        'Would you like to provide feedback on your recent visit?',
        'Do you require a summary of your recent visits?',
        'Are there any questions about office policies or procedures?'
    ],
    'test_results': [
        'Do you have sudden or severe symptoms related to the test results (e.g., sudden pain, difficulty breathing)?',
        'Are there any abnormal test results that require quick follow-up?',
        'Do you need clarification on any aspects of your test results?',
        'Have you received and reviewed your test results and understand the next steps?',
        'Are there any follow-up tests or actions you need to schedule based on your results?',
        'Would you like to review the normal ranges for your test results?'
    ],
    'muscles_and_joints': [
        'Are you experiencing sudden or severe joint swelling or pain?',
        'Do you have symptoms of a severe injury or trauma (e.g., loss of function, severe bleeding)?',
        'Do you need information on exercises or stretches for muscle or joint pain?',
        'Are you seeking advice on ongoing management of chronic joint or muscle conditions?',
        'Are you experiencing moderate pain or discomfort in your muscles or joints?',
        'Do you have stiffness or limited range of motion that is affecting your daily life?'
    ],
    'contraception': [
        'Are you experiencing severe side effects or allergic reactions to a contraceptive method?',
        'Have you had a contraceptive failure with immediate health concerns (e.g. unplanned pregnancy)?',
        'Are you considering a change in your contraceptive method and need more information?',
        'Would you like a follow-up to review the effectiveness and satisfaction with your current contraception?',
        'Are you experiencing moderate side effects from your contraceptive method that need attention?',
        'Do you need information on potential interactions with other medications?'
    ],
    'breathing_conditions_and_allergies': [
        'Are you experiencing severe difficulty breathing or shortness of breath?',
        'Do you have symptoms of a severe allergic reaction, such as swelling of the throat or difficulty swallowing?',
        'Are you looking for information on managing chronic allergies or asthma?',
        'Would you like to discuss a long-term management plan for your allergies or asthma?',
        'Are you experiencing persistent symptoms that are impacting your daily activities?',
        'Do you need advice on medication adjustments or managing symptoms while awaiting a follow-up?'
    ],
    'mental_health': [
        'Are you having thoughts of self-harm or harming others?',
        'Are you experiencing severe mental distress that is affecting your ability to function?',
        'Are you seeking advice on improving your mental well-being or managing mild symptoms?',
        'Would you like to schedule a routine check-up with a mental health professional?',
        'Do you need information on support resources or mental health strategies?',
        'Do you need guidance on maintaining mental health or addressing ongoing issues?'
    ],
    'prescriptions': [
        'Are you experiencing a severe reaction or side effects from a medication that requires immediate attention?',
        'Are you running out of a medication that is crucial for managing a serious health condition?',
        'Do you need to request a refill or renewal of a prescription?',
        'Would you like to review your current prescriptions and their effectiveness?',
        'Are you looking for information on how to take or manage your medications effectively?',
        'Do you need guidance on potential side effects or interactions with your current medications?'
    ],
    'diabetes_care': [
        'Are you experiencing severe symptoms of high or low blood sugar, such as confusion, loss of consciousness, or severe dehydration?',
        'Do you have symptoms of a diabetic complication that require prompt management?',
        'Are you seeking advice on routine diabetes management and care?',
        'Would you like to discuss your ongoing diabetes management and treatment plan?',
        'Do you need guidance on dietary adjustments or lifestyle changes for diabetes control?',
        'Are you looking for information on long-term diabetes management and preventive care?'
    ],
    'cold_cough_flu_sore_throat_and_earaches': [
        'Are you experiencing severe difficulty breathing or high fever with dehydration?',
        'Do you have symptoms of a serious infection or severe complications (e.g., difficulty swallowing, chest pain)?',
        'Are you looking for advice on managing mild symptoms of cold, cough, or sore throat?',
        'Would you like to discuss long-term management strategies for recurrent cold or flu symptoms?',
        'Do you need information on over-the-counter treatments or home remedies?',
        'Are you seeking guidance on preventive measures or routine care for these symptoms?'
    ],
    'skin_issues': [
        'Are you experiencing severe symptoms such as widespread infection, significant swelling, or open wounds that are not healing?',
        'Do you have symptoms of a serious allergic reaction or severe skin condition?',
        'Are you looking for advice on managing mild skin conditions or symptoms at home?',
        'Would you like to review long-term management strategies for chronic skin conditions?',
        'Do you need information on over-the-counter treatments for common skin issues?',
        'Are you seeking guidance on preventive care for skin health?'
    ],
    'stomach_problems': [
        'Are you experiencing severe abdominal pain, persistent vomiting, or signs of significant bleeding?',
        'Do you have symptoms of a severe gastrointestinal emergency, such as acute appendicitis or severe dehydration?',
        'Are you seeking advice on managing mild or chronic stomach issues at home?',
        'Would you like to review long-term management strategies for chronic stomach conditions?',
        'Do you need information on dietary adjustments or over-the-counter treatments for stomach problems?',
        'Are you looking for guidance on maintaining digestive health and preventing issues?'
    ],
    'urine_problems': [
        'Are you experiencing severe symptoms like significant bleeding in urine, severe pain, or symptoms of kidney failure?',
        'Do you have signs of a severe infection or life-threatening urinary condition?',
        'Are you seeking advice on managing mild urinary symptoms or preventive care?',
        'Would you like to review long-term management strategies for chronic urinary conditions?',
        'Do you need information on over-the-counter treatments or lifestyle adjustments for urinary health?',
        'Are you looking for guidance on maintaining urinary health and preventing issues?'
    ],
    'travel_health': [
        'Are you experiencing severe symptoms or complications related to travel, such as a serious infection or severe allergic reaction?',
        'Do you have urgent health concerns that require immediate attention before or after travel?',
        'Are you seeking information on routine travel health precautions or preventive measures?',
        'Would you like to review travel health recommendations and preventive measures for upcoming trips?',
        'Do you need advice on managing mild health issues related to travel or planning?',
        'Are you looking for guidance on vaccinations, health recommendations, or preventive care for travel?'
    ],
    'other': [
        'Are you experiencing symptoms that could indicate a serious or life-threatening condition?',
        'Do you have urgent health concerns that need immediate intervention?',
        'Are you seeking advice on managing mild health concerns or preventive care?',
        'Would you like to review long-term management strategies for chronic health conditions?',
        'Do you need information on over-the-counter treatments or lifestyle adjustments for health issues?',
        'Are you looking for guidance on maintaining health and preventing future problems?'
    ]
  };

    const cliniciansData = {
      'phone': [
          { name: 'Doctor Marie Cure', image: 'https://res.cloudinary.com/djkohlole/image/upload/v1725403884/marie_vzvgyh.jpg', email: 'clinician@gmail.com', times: ['2:30pm', '4:00pm', '7:30pm'], favorite: true },
          { name: 'Doctor Albert Johnson', image: 'https://res.cloudinary.com/djkohlole/image/upload/v1725403903/albert_iakaul.jpg', email: 'ajohnson@gmail.com', times: ['3:00pm', '5:30pm', '8:00pm'], favorite: false },
          { name: 'Senior Nurse Jane Doe', image: 'https://res.cloudinary.com/djkohlole/image/upload/v1725403854/jane_eyh6od.jpg', email: 'jdoe@gmail.com', times: ['2:15pm', '6:00pm', '8:45pm'], favorite: true },
          { name: 'Physician Carol Smith', image: 'https://res.cloudinary.com/djkohlole/image/upload/v1725403827/carol_mbm5ns.jpg', email: 'csmith@gmail.com', times: ['3:45pm', '5:00pm', '7:00pm'], favorite: false }
      ],
      'video': [
          { name: 'Doctor Liam Sanders', image: 'https://res.cloudinary.com/djkohlole/image/upload/v1725403866/liam_fxxlav.jpg', email: 'lsanders@gmail.com', times: ['2:00pm', '4:30pm', '6:15pm'], favorite: true },
          { name: 'Doctor Alice Newton', image: 'https://res.cloudinary.com/djkohlole/image/upload/v1725403913/alice_qozrvi.jpg', email: 'anewton@gmail.com', times: ['3:15pm', '5:45pm', '7:30pm'], favorite: true },
          { name: 'Physician Carol Smith', image: 'https://res.cloudinary.com/djkohlole/image/upload/v1725403827/carol_mbm5ns.jpg', email: 'csmith@gmail.com', times: ['3:45pm', '5:00pm', '7:00pm'], favorite: false },
          { name: 'Senior Nurse Jane Doe', image: 'https://res.cloudinary.com/djkohlole/image/upload/v1725403854/jane_eyh6od.jpg', email: 'jdoe@gmail.com', times: ['2:30pm', '4:00pm', '8:00pm'], favorite: false }
      ],
      'in-person': [
          { name: 'Doctor Alice Newton', image: 'https://res.cloudinary.com/djkohlole/image/upload/v1725403913/alice_qozrvi.jpg', email: 'anewton@gmail.com', times: ['2:15pm', '3:45pm', '5:30pm'], favorite: false },
          { name: 'Doctor Marie Cure', image: 'https://res.cloudinary.com/djkohlole/image/upload/v1725403884/marie_vzvgyh.jpg', email: 'clinician@gmail.com', times: ['2:30pm', '4:30pm', '5:15pm'], favorite: false },
          { name: 'Doctor Albert Johnson', image: 'https://res.cloudinary.com/djkohlole/image/upload/v1725403903/albert_iakaul.jpg', email: 'ajohnson@gmail.com', times: ['3:00pm', '4:15pm', '5:45pm'], favorite: true },
          { name: 'Doctor Liam Sanders', image: 'https://res.cloudinary.com/djkohlole/image/upload/v1725403866/liam_fxxlav.jpg', email: 'lsanders@gmail.com', times: ['2:00pm', '4:30pm', '6:15pm'], favorite: true }
      ],
  };

  function showForm(form, appointmentType=null, selectedClinician=null) {
    const forms = [categoryList, triageQuestions, reasonForAppointment, appointmentTypeList, availableClinicians, calendarView, bookingDetails, appointmentPending];
    forms.forEach(f => f.style.display = 'none');
    form.style.display = 'flex';

    if (historyStack.length === 0 || historyStack[historyStack.length - 1] !== form) {
      historyStack.push(form);
    }

    if (historyStack.length >= 1) {
      backButton.style.display = 'inline-block';
    } else {
      backButton.style.display = 'none';
    }

    // Initialize the calendar when the calendar view is shown
    if (form === calendarView) {
      initializeCalendar(selectedClinician, appointmentType);
    }
  }

  function initializeCalendar(selectedClinician, appointmentType) {
    flatpickr(calendarContainer, {
      inline: true,
      onChange: function(selectedDates, dateStr, instance) {
        const availableTimesData = getAvailableTimesForClinicianOnDate(selectedClinician, dateStr);
        displayAvailableTimes(availableTimesData, selectedClinician, dateStr, appointmentType);
      }
    });
  }

  function handleBackButtonClick() {
    const homePath = document.querySelector('.custom-navbar').dataset.homePath;
    if (historyStack.length > 1) {
      historyStack.pop(); // Remove current form
      const previousForm = historyStack[historyStack.length - 1];
      showForm(previousForm);
    } else {
      // Redirect to the home page or close the tab
      window.location.href = homePath; // Use the URL from the data attribute
      // or use window.close(); to close the tab
    }
  }

  function handleCategoryCardClick(event) {
    const categoryCard = event.target.closest('.category-card');
    if (categoryCard) {
      const category = categoryCard.getAttribute('data-category');
      const questions = triageData[category];

      triageTitle.textContent = categoryCard.querySelector('h3').textContent;
      questionsContainer.innerHTML = '';

      questions.forEach((question, index) => {
        const questionElement = document.createElement('div');
        questionElement.className = 'question-card';

        const questionText = document.createElement('p');
        questionText.textContent = question;
        questionElement.appendChild(questionText);

        const buttonsContainer = document.createElement('div');
        buttonsContainer.className = 'question-buttons';

        const yesButton = document.createElement('button');
        yesButton.textContent = 'Yes';
        yesButton.setAttribute('data-answer', 'yes');
        yesButton.classList.add('btn', 'btn-outline-primary', 'mr-2');

        const noButton = document.createElement('button');
        noButton.textContent = 'No';
        noButton.setAttribute('data-answer', 'no');
        noButton.classList.add('btn', 'btn-outline-secondary');

        yesButton.addEventListener('click', () => {
          questionElement.setAttribute('data-answered', 'true');
          yesButton.classList.add('selected');
          noButton.classList.remove('selected');
        });

        noButton.addEventListener('click', () => {
          questionElement.setAttribute('data-answered', 'true');
          noButton.classList.add('selected');
          yesButton.classList.remove('selected');
        });

        buttonsContainer.appendChild(yesButton);
        buttonsContainer.appendChild(noButton);

        questionElement.appendChild(buttonsContainer);
        questionsContainer.appendChild(questionElement);
      });

      showForm(triageQuestions);
    }
  }

  function handleSubmitTriage() {
    const allAnswered = [...questionsContainer.querySelectorAll('.question-card')].every(question => question.getAttribute('data-answered') === 'true');
    const firstFourYes = [...questionsContainer.querySelectorAll('.question-card')].slice(0, 3).some(question => {
      const yesButton = question.querySelector('button[data-answer="yes"]');
      return yesButton && yesButton.classList.contains('selected');
    });

    if (allAnswered) {
      let appointmentSeverity = document.getElementById('appointment_severity');
      severity = firstFourYes ? 'High' : 'Low';
      appointmentSeverity.value = severity
      showForm(reasonForAppointment);
    } else {
      alert('Please answer all triage questions before proceeding.');
    }
  }

  function handleSubmitReason() {
    const appointmentReason = document.getElementById('appointment-reason').value.trim();
    if (appointmentReason) {
      showForm(appointmentTypeList);
    } else {
      alert('Please provide a reason for your appointment.');
    }
  }

  function handleAppointmentTypeCardClick(event) {
    const appointmentTypeCard = event.target.closest('.appointment-type-card');
    if (appointmentTypeCard) {
        const appointmentType = appointmentTypeCard.getAttribute('data-appointment-type');
        const clinicians = cliniciansData[appointmentType];

        cliniciansContainer.innerHTML = '';

        clinicians.forEach(clinician => {
            const clinicianCard = document.createElement('div');
            clinicianCard.className = 'clinician-card card';

            // Heart icon in the top right corner
            const heartIcon = document.createElement('i');
            heartIcon.className = 'fa fa-sharp fa-thin fa-heart heart-icon';

            // Toggle heart icon if the clinician is marked as a favorite
            if (clinician.favorite) {
                heartIcon.classList.add('toggled');
            }

            heartIcon.addEventListener('click', () => {
                heartIcon.classList.toggle('toggled');
            });
            clinicianCard.appendChild(heartIcon);

            // Clinician image and name container
            const clinicianDetails = document.createElement('div');
            clinicianDetails.className = 'clinician-details';

            // Clinician image
            const clinicianImage = document.createElement('img');
            clinicianImage.src = clinician.image; // Placeholder image URL or actual clinician image URL
            clinicianImage.alt = `${clinician.name}'s photo`;
            clinicianImage.className = 'clinician-image';
            clinicianDetails.appendChild(clinicianImage);

            // Clinician name
            const clinicianName = document.createElement('div');
            clinicianName.textContent = clinician.name;
            clinicianName.className = 'clinician-name';
            clinicianDetails.appendChild(clinicianName);

            // Add clinician details to the card
            clinicianCard.appendChild(clinicianDetails);

            // Add label for available times
            const timesLabel = document.createElement('div');
            timesLabel.className = 'times-label';
            timesLabel.textContent = "Today's Available Times";
            clinicianCard.appendChild(timesLabel);

            // Time slots
            const times = document.createElement('div');
            times.className = 'card-body';

            const tomorrow = new Date();
            tomorrow.setDate(tomorrow.getDate() + 1);
            const formattedTomorrow = tomorrow.toISOString().split('T')[0];

            clinician.times.forEach(time => {
                const timeSlot = document.createElement('div');
                timeSlot.textContent = time;
                timeSlot.className = 'time-slot';
                timeSlot.addEventListener('click', () => {
                    showBookingDetails(clinician.name, appointmentType, formattedTomorrow, time);
                });
                times.appendChild(timeSlot);
            });

            const moreButton = document.createElement('div');
            moreButton.addEventListener('click', () => {
                showCalendarView(clinician.name, appointmentType);
            });
            moreButton.textContent = 'More';
            moreButton.className = 'more-button';
            times.appendChild(moreButton);

            clinicianCard.appendChild(times);
            cliniciansContainer.appendChild(clinicianCard);
        });

        showForm(availableClinicians);
    }
}

  function showCalendarView(clinicianName, appointmentType) {
    flatpickr(calendarContainer, {
      onChange: function(selectedDates, dateStr, instance) {
        const availableTimesData = getAvailableTimesForClinicianOnDate(clinicianName, dateStr);
        displayAvailableTimes(availableTimesData, clinicianName,dateStr, appointmentType);
      }
    });

    showForm(calendarView, appointmentType, clinicianName);
  }

  function displayAvailableTimes(times, clinicianName, dateStr, appointmentType) {
    availableTimes.innerHTML = '';
    times.forEach(time => {
      const timeSlot = document.createElement('div');
      timeSlot.textContent = time;
      timeSlot.className = 'time-slot';
      timeSlot.addEventListener('click', () => {
        showBookingDetails(clinicianName, appointmentType, dateStr, time);
      });
      availableTimes.appendChild(timeSlot);
    });
  }

  function getAvailableTimesForClinicianOnDate(clinicianName, dateStr) {
    // Mock data, replace with actual fetch from server
    return ['8:00am', '10:00am', '1:00pm', '3:00pm'];
  }

  function showBookingDetails(clinicianName, appointmentType, dateStr, time) {
    let appointmentFormDate = document.getElementById('appointment_date');
    let appointmentClinicianEmail = document.getElementById('clinician_email');

    // Format the date
    function formatDateString(dateStr) {
        const date = new Date(dateStr);
        let day = date.getDate();
        let month = date.getMonth() + 1; // Months are zero-based
        let year = date.getFullYear();

        // Pad day and month with leading zeros if needed
        day = day < 10 ? '0' + day : day;
        month = month < 10 ? '0' + month : month;

        return `${day}-${month}-${year}`;
    }

    // Format the date
    const formattedDate = dateStr ? formatDateString(dateStr) : 'Not selected';

    // Update form fields
    selectedDate = dateStr;
    selectedTime = time;
    appointmentFormDate.value = `${formattedDate} ${time}`;

    // Find clinician email
    console.log(cliniciansData[appointmentType]);
    const clinicianEmail = cliniciansData[appointmentType]
        .find(clinician => clinician.name === clinicianName)
        .email;
    appointmentClinicianEmail.value = clinicianEmail;

    // Update details container
    detailsContainer.innerHTML = `
      <p><strong>Clinician:</strong> ${clinicianName}</p>
      <p><strong>Date:</strong> ${formattedDate || 'Not selected'}</p>
      <p><strong>Time:</strong> ${time}</p>
      <p style="display: none;"><strong>Severity:</strong> ${severity}</p>
    `;

    showForm(bookingDetails);
}


  function handleConfirmBooking() {
    document.querySelector('#new_appointment').submit();
  }

  function updateCharCounter() {
    const currentLength = appointmentReason.value.length;
    charCounter.textContent = `${currentLength}/500 characters`;
  }

  if (appointmentReason) {

    appointmentReason.addEventListener('input', updateCharCounter);

    categoryList.addEventListener('click', handleCategoryCardClick);
    submitTriageButton.addEventListener('click', handleSubmitTriage);
    document.getElementById('submit-reason').addEventListener('click', handleSubmitReason);
    appointmentTypeList.addEventListener('click', handleAppointmentTypeCardClick);
    confirmBookingButton.addEventListener('click', handleConfirmBooking);
    backButton.addEventListener('click', handleBackButtonClick);

    // Add the event listener for the close button to redirect to the home page
    closeButton.addEventListener('click', () => {
      const homePath = document.querySelector('.custom-navbar').dataset.homePath;
      window.location.href = homePath;
    });

    showForm(categoryList); // Display the category list form by default
  }

  // Nav item click event listener
  document.addEventListener('DOMContentLoaded', function () {
    const navItems = document.querySelectorAll('.nav-item');

    // Load the focused nav item from localStorage if it exists
    const savedActiveNav = localStorage.getItem('activeNav');
    if (savedActiveNav) {
      const activeNavItem = document.querySelector(`[data-name="${savedActiveNav}"]`);
      if (activeNavItem) {
        activateNavItem(activeNavItem, true); // Highlight the saved nav item with .focus
      }
    } else {
      // Set a default focus to the Home button if no saved state exists
      const defaultNavItem = document.querySelector('[data-name="Home"]');
      if (defaultNavItem) {
        activateNavItem(defaultNavItem, true); // Default highlight with .focus
      }
    }

    navItems.forEach(item => {
      item.addEventListener('click', function (event) {
        event.preventDefault(); // Prevent default action to manage class highlight manually

        const navName = item.getAttribute('data-name');

        // Remove focus and active classes from all items
        deactivateAllNavItems();

        if (navName === 'Home' || navName === 'Appointments') {
          // For "Home" and "Appointments", use .focus class and navigate
          activateNavItem(item, true); // Add .focus to the clicked item
          localStorage.setItem('activeNav', navName); // Save to localStorage

          // Navigate to the href of the clicked item
          const href = item.getAttribute('href');
          if (href) {
            window.location.href = href;
          }
        } else {
          // For "Messages" and "Profile", use .active class without navigation
          activateNavItem(item, false); // Add .active to the clicked item
          localStorage.setItem('activeNav', navName); // Save to localStorage
        }
      });
    });

    function deactivateAllNavItems() {
      navItems.forEach(i => {
        i.classList.remove('focus', 'active');
      });
    }

    function activateNavItem(navItem, isFocus) {
      if (isFocus) {
        navItem.classList.add('focus');
      } else {
        navItem.classList.add('active');
      }
    }
  });
});
