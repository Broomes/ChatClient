var apiURL = 'https://broomes.net/chatapi/api';
var rooms = document.getElementById('rooms');
var roomCreatedResponse = document.getElementById('roomCreatedResponse');
var serverMessage = document.getElementById('serverMessage');

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
    getRooms();
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
        url: apiURL + '/room',
        data: data,
        statusCode: {
            400: function() {
                roomCreatedResponse.innerHTML = '<div class="alert alert-danger" role="alert">' +
                    'Room already exists' +
                    '</div>';
            },

            200: function() {
                serverMessage.innerHTML = '<div class="alert alert-success" role="alert">' +
                    'Room: ' + roomName + ' created' +
                    '</div>';
                getRooms();
                $('#createRoomModal').modal('hide');
                document.getElementById("createRoomForm").reset();
            }

        }
    })
});

//get and display list of rooms
function getRooms() {
    var allRoomCards = '<li class="list-inline-item">' +
        '<div class="col-md-6 col-lg-4 col-xl-3\">' +
        '<div class="card text-white bg-primary mb-3" style="width: 20rem">' +
        '<div class="card-header">Main</div>' +
        '<a onclick="onConnectClick(&quot;Main&quot;)" data-toggle="modal" data-target="#chatRoomModal">' +
        '<div class="card-body">' +
        '<p class="card-text">Main meeting room that is always open.</p>' +
        '</div></a></div></div></li>';

    $.ajax({
        type: 'GET',
        url: apiURL + '/rooms',
        dataType: 'json',
        success: function (response) {
            response.forEach(function (room) {
                allRoomCards += '<li class="list-inline-item">' +
                    '<div class="col-md-6 col-lg-4 col-xl-3\">' +
                    '<div class="card text-white bg-primary mb-3" style="width: 20rem">' +
                    '<div class="card-header">' + room.roomName +

                    '<button type="button" class="close" id="delete" onclick="deleteRoom(&quot;' + room.roomName + '&quot;)">' +
                    '<span aria-hidden="true">&times;</span>' +
                    '</button>' +

                    '</div>' +
                    '<a onclick="onConnectClick(&quot;' + room.roomName + '&quot;)" data-toggle="modal" data-target="#chatRoomModal">' +
                    '<div class="card-body">' +
                    '<p class="card-text">' + room.roomDesc + '</p>' +
                    '</div></a></div></div></li>';
            });
            rooms.innerHTML = allRoomCards;
        }
    });
}


//Pram is a string, function deletes room with that name
function deleteRoom(room) {

    var data = '{' +
        '"roomName" : \"' + room + '\"' +
        '}';

    $.ajax({
        type: 'DELETE',
        contentType: "application/json",
        dataType: "json",
        url: apiURL + '/room',
        data: data,
        statusCode: {
            400: function() {
                console.log("Something did not work properly");
            },

            200: function() {
                serverMessage.innerHTML = '<div class="alert alert-success" role="alert">' +
                    'Room: ' + room + ' deleted' +
                    '</div>';
                getRooms();
            }
        }
    })
}