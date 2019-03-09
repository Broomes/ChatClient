var apiURL = 'https://broomes.net/chatapi/api';
var registrationAlertMessage = document.getElementById('registrationAlertMessage');

$('#userRegistrationForm').submit(function(e){
    e.preventDefault();

    var registrationForm = document.getElementById("userRegistrationForm");
    var data = new FormData(registrationForm);

    if(document.getElementById("avatar").value === "") {
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
