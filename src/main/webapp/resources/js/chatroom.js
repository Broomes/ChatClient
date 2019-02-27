var rooms = document.getElementById('rooms');
var roomCreatedResponse = document.getElementById('roomCreatedResponse');

$(document).ready(function(){
    $('#characterLeft').text('500 characters left');
    $('#message').keyup(function () {
        var max = 500;
        var len = $(this).val().length;
        if (len >= max) {
            $('#characterLeft').text('You have reached the limit');
            $('#characterLeft').addClass('red');
            $('#btnSubmit').addClass('disabled');
        }
        else {
            var ch = max - len;
            $('#characterLeft').text(ch + ' characters left');
            $('#btnSubmit').removeClass('disabled');
            $('#characterLeft').removeClass('red');
        }
    });
});

$(document).ready(function() {
    $.ajax({
        type: 'GET',
        url: 'https://broomes.net/chatapi/api/rooms',
        dataType: 'json',
        success: function (response) {
            response.forEach(function (room) {
                rooms.innerHTML += '<li class="list-inline-item">' +
                                    '<div class="col-md-6 col-lg-4 col-xl-3\">' +
                                    '<a onclick="onConnectClick(&quot;' + room.roomName + '&quot;)" data-toggle="modal" data-target="#chatRoomModal">' +
                                    '<div class="card text-white bg-primary mb-3" style="width: 20rem">' +
                                    '<div class="card-header">' + room.roomName + '</div>' +
                                    '<div class="card-body">' +
                                    '<p class="card-text">' + room.roomDesc + '</p>' +
                                    '</div></div></a></div></li>';
            })
        }
    });
});

//Create room form
$('#createRoomForm').submit(function(e){
    e.preventDefault();

    var roomName = $("#roomName").val();
    var roomDesc = $("#roomDesc").val();

    var data = '{' +
        '"roomName" : \"' + roomName + '\",' +
        '"roomDesc" : \"' + roomDesc + '\"' +
        '}';

    $.ajax({
        type: 'PUT',
        contentType: "application/json",
        dataType: "json",
        url: 'http://localhost:8080/ChatAPI_war_exploded/api/room',
        data: data,
        statusCode: {
            400: function() {
                console.log("400");
                roomCreatedResponse.innerHTML = '<div class="alert alert-danger" role="alert">' +
                    'Room already exists' +
                    '</div>';
            },

            200: function() {
                console.log("200");
                roomCreatedResponse.innerHTML = '<div class="alert alert-success" role="alert">' +
                    'Room created successfully' +
                    '</div>';
            }

        }
    })
});