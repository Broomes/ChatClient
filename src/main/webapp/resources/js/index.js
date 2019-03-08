var apiURL = 'http://localhost:8080/ChatAPI_war_exploded/api';
var registrationAlertMessage = document.getElementById('registrationAlertMessage');

$('#userRegistrationForm').submit(function(e){
    e.preventDefault();

    var registrationForm = document.getElementById("userRegistrationForm");
    var data = new FormData(registrationForm);

    $.ajax({
        type: 'POST',
        url: apiURL + '/register',
        cache: false,
        processData: false,
        contentType: false,
        data: data,
        statusCode: {
            208: function () {
                registrationAlertMessage.innerHTML = '<div class="alert alert-danger" role="alert">' +
                    'Username have already been taken' +
                    '</div>';
            },

            200: function () {
                registrationAlertMessage.innerHTML = '<div class="alert alert-success" role="alert">' +
                    'Registration Complete' +
                    '</div>';
            }
        }
    })
});
