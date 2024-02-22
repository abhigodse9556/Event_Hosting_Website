

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
            // Make an AJAX request to fetch data from the servlet
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    var data = JSON.parse(xhr.responseText);

                    // Update the HTML with fetched data
                    document.getElementById("name").value = data.name;
                    document.getElementById("organization").value = data.organization;
                    document.getElementById("email").value = data.email;
                    document.getElementById("mobileNo").value = data.mobileNo;

                    // Display the organizer profile section
                    document.getElementById("initial-image").style.display = "none";
                    document.getElementById("organizer-profile").style.display = "block";
                    document.getElementById("event-form").style.display = "none";
                    document.getElementById("event-history").style.display = "none";
                    document.getElementById("detailed-event").style.display = "none";
                }
            };
            xhr.open("GET", "Servlet", true);
            xhr.send();
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