// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";
import "@popperjs/core";
import "bootstrap";
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.css";

// Initialize flatpickr for the calendar container
document.addEventListener('DOMContentLoaded', function() {
  flatpickr("#calendar-container", {
    onChange: function(selectedDates, dateStr, instance) {
      const availableTimesData = getAvailableTimesForClinicianOnDate(selectedDates);
      displayAvailableTimes(availableTimesData, dateStr);
    }
  });
});

function getAvailableTimesForClinicianOnDate(selectedDates) {
  // Mock data, replace with actual fetch from server
  return ['8:00am', '10:00am', '1:00pm', '3:00pm'];
}

function displayAvailableTimes(times, dateStr) {
  const availableTimes = document.getElementById('available-times');
  availableTimes.innerHTML = '';
  times.forEach(time => {
    const timeSlot = document.createElement('div');
    timeSlot.textContent = time;
    timeSlot.className = 'time-slot';
    timeSlot.addEventListener('click', () => {
      showBookingDetails(dateStr, time);
    });
    availableTimes.appendChild(timeSlot);
  });
}

function showBookingDetails(dateStr, time) {
  const detailsContainer = document.getElementById('details-container');
  detailsContainer.innerHTML = `
    <p><strong>Date:</strong> ${dateStr || 'Not selected'}</p>
    <p><strong>Time:</strong> ${time}</p>
  `;

  document.getElementById('available-clinicians').style.display = 'none';
  document.getElementById('calendar-view').style.display = 'none';
  document.getElementById('booking-details').style.display = 'block';
}
