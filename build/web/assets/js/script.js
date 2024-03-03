

function autofillUsername() {
    // Get the value of the email field
    var emailInput = document.getElementById('email');
    var emailValue = emailInput.value;

    // Extract the part before the '@' symbol
    var username = emailValue.split('@')[0];

    // Autofill the registerUsername field
    var usernameInput = document.getElementById('registerUsername');
    usernameInput.value = username;
}

document.addEventListener("DOMContentLoaded", function() {
            // Hide all sections on page load except for the initial image
            document.getElementById("organizer-profile").style.display = "none";
            document.getElementById("event-form").style.display = "none";
            document.getElementById("event-history").style.display = "none";
            document.getElementById("detailed-event").style.display = "none";
        });

function showOrganizerProfile() {
    document.getElementById("initial-image").style.display = "none";
    document.getElementById("organizer-profile").style.display = "block";
    document.getElementById("event-form").style.display = "none";
    document.getElementById("event-history").style.display = "none";
    document.getElementById("detailed-event").style.display = "none";
}

function showEventForm() {
    document.getElementById("initial-image").style.display = "none";
    document.getElementById("organizer-profile").style.display = "none";
    document.getElementById("event-form").style.display = "block";
    document.getElementById("event-history").style.display = "none";
    document.getElementById("detailed-event").style.display = "none";
}

function showEventHistory() {
    document.getElementById("initial-image").style.display = "none";
    document.getElementById("organizer-profile").style.display = "none";
    document.getElementById("event-form").style.display = "none";
    document.getElementById("event-history").style.display = "block";
    document.getElementById("detailed-event").style.display = "none";
}

function showDetailedEvent(eventId) {
    document.getElementById("initial-image").style.display = "none";
    document.getElementById("organizer-profile").style.display = "none";
    document.getElementById("event-form").style.display = "none";
    document.getElementById("event-history").style.display = "none";
    document.getElementById("detailed-event").style.display = "block";
            // Use the eventId to fetch and display detailed event information
}