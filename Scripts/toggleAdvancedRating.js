document.addEventListener("DOMContentLoaded", function () {
    var checkbox = document.getElementById('<%= advancedRatingCheckbox.ClientID %>');
    var advancedSection = document.getElementById('<%= advancedRating.ClientID %>');

    if (checkbox && advancedSection) {
        checkbox.addEventListener("change", function () {
            if (checkbox.checked) {
                advancedSection.style.display = "block";
            } else {
                advancedSection.style.display = "none";
            }
        });
    }
});
