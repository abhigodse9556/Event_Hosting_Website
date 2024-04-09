

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

function showSelectedCategory() {
            var selectedCategory = document.getElementById("event_type").value;
            var all_events = document.getElementById("all_events");
            var sport_events = document.getElementById("sport_events");
            var dj_events = document.getElementById("dj_events");
            var trekk_events = document.getElementById("trekk_events");
            var cultural_events = document.getElementById("cultural_events");
            var business_events = document.getElementById("business_events");
            var edu_events = document.getElementById("edu_events");
            var promo_events = document.getElementById("promo_events");
            

            // Show the selected event category
            if (selectedCategory === "All Events") {
                all_events.style.display = "flex";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            } else if (selectedCategory === "Sports") {
                all_events.style.display = "none";
                sport_events.style.display = "flex";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Musical / DJ") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "flex";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Business") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "flex";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Trekking / Adventures") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "flex";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Cultural") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "flex";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Educational") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "flex";
                promo_events.style.display = "none";
            }else if (selectedCategory === "Promos / Expos") {
                all_events.style.display = "none";
                sport_events.style.display = "none";
                dj_events.style.display = "none";
                trekk_events.style.display = "none";
                cultural_events.style.display = "none";
                business_events.style.display = "none";
                edu_events.style.display = "none";
                promo_events.style.display = "flex";
            }
            // Show other event category elements based on selected option
        }