var apiURL = 'https://broomes.net/chatapi/api';
var registrationAlertMessage = document.getElementById('registrationAlertMessage');
var registrationFormContainer = document.getElementById("registrationFormContainer");
var registrationForm = document.getElementById('userRegistrationForm');
var loadingAnimation = document.getElementById("loadingAnimation");

$('#userRegistrationForm').submit(function(e){
    e.preventDefault();

    // Loading animation
    registrationFormContainer.style.display="none";
    loadingAnimation.style.display="block";

    var data = new FormData(registrationForm);

    if(document.getElementById("avatar").files.length === 0) {
        data.set("avatar", null);
    }

    $.ajax({
        type: 'POST',
        url: apiURL + '/register',
        cache: false,
        processData: false,
        contentType: false,
        data: data,
        statusCode: {
            400: function(response) {
                loadingAnimation.style.display="none";
                registrationFormContainer.style.display="block";
                registrationAlertMessage.innerHTML = '<div class="alert alert-danger" role="alert">' +
                    response.responseText +
                    '</div>';
            },

            200: function() {
                loadingAnimation.style.display="none";
                registrationFormContainer.style.display="block";
                registrationAlertMessage.innerHTML = '<div class="alert alert-success" role="alert">' +
                    'Registration Complete' +
                    '</div>';
            }
        }
    })
});


$("#avatar").change(function() {
    readURL(this);
});


function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            $('#imagePreview').css('background-image', 'url('+e.target.result +')');
            $('#imagePreview').hide();
            $('#imagePreview').fadeIn(650);
        }
        reader.readAsDataURL(input.files[0]);
    }
}
