var apiURL = 'https://broomes.net/chatapi/api';

function onConnectClick(room){
    var ws = new WebSocket("wss://websocket.broomes.net:443/chat/" + room + "/" + sender);
    var form = document.getElementById('message-form');
    var messageField = document.getElementById('message');
    var messageList = document.getElementById('messages');
    var userList = document.getElementById('participants');
    var closeBtn = document.getElementById('close');
    var socketStatus = document.getElementById('status');
    var time = new Date();
    var hours = time.getHours();
    var mins = time.getMinutes();

    ws.onopen = function(event) {
        socketStatus.innerHTML = 'Connected to: ' + room;
        socketStatus.className = 'open';
    };

    ws.onmessage = function(event) {
        var msg = JSON.parse(event.data);
        var activeParticipants = msg.activeUsers;
        var userString = "";
        var hours = time.getHours();
        var mins = time.getMinutes();

        activeParticipants.forEach(function (user) {
            userString += '<li class="received" style="padding-top: 2%">' +

                '<table><tbody><tr>' +

                '<td style="width:40%; padding:.5rem;"><div class="avatar_container d-none d-md-block">' +
                '<img alt="user picture" class="avatar_img" src=' + apiURL + '/profile/' + user + ' >' +
                '</div></td>' +

                '<td class="text-left">' +
                '<span class="mb-0">' + user + '</span>' +
                '</td>' +

                '</tr></tbody></table>' +
                 '</li>';
        });

        userList.innerHTML = userString;

        switch (msg.sender) {
            case 'Chatroom Admin':
                messageList.innerHTML = '<li style="padding-top: 2%"><div class="row w-100 remove-all-margin"><div class="col-2 text-center d-none d-md-block">' +
                    '<div class="avatar_container d-none d-md-block w-20">' +
                    '<img alt="user picture" class="avatar_img" src=' + admin_avatar + ' >' +
                    '</div></div>'+
                    '<div class="col-10 text-center">' +
                    '<div class="box2 chatBubble2 w-80">' +
                    msg.content +
                    '</div>'+

                    '<p class="text-muted">' + msg.sender + ' ' + hours + ':' + mins + '</p>' +

                    '</div></div></li>' +
                    messageList.innerHTML;
                break;

            case sender:
                messageList.innerHTML = '<li style="padding-top: 2%"><div class="row w-100 remove-all-margin">' +
                    '<div class="col-10 text-center">' +
                    '<div class="box1 chatBubble1 w-80">' +
                    msg.content +
                    '</div>'+
                    '<p class="text-muted">You</p>' +
                    '</div>' +
                    '<div class="col-2 text-center d-none d-md-block">' +
                    '<div class="avatar_container d-none d-md-block w-20">' +
                    '<img alt="user picture" class="avatar_img" src=' + apiURL + '/profile/' + sender + ' >' +
                    '</div>' +
                    '</div>' +

                    '</div>' +
                    '</li>' +
                    messageList.innerHTML;
                break;

            default:
                messageList.innerHTML = '<li style="padding-top: 2%"><div class="row w-100 remove-all-margin"><div class="col-2 text-center d-none d-md-block">' +
                    '<div class="avatar_container d-none d-md-block w-20">' +
                    '<img alt="user picture" class="avatar_img" src=' + apiURL + '/profile/' + msg.sender + ' >' +
                    '</div></div>'+
                    '<div class="col-10 text-center">' +
                    '<div class="box2 chatBubble2 w-80">' +
                    msg.content +
                    '</div>'+

                    '<p class="text-muted">' + msg.sender + ' ' + hours + ':' + mins + '</p>' +

                    '</div></div></li>' +
                    messageList.innerHTML;
        }
    };

    ws.onclose = function() {
        socketStatus.innerHTML = 'Disconnected from server.';
        socketStatus.className = 'closed text-danger';
        messageList.innerHTML = '';
    };

    ws.onerror = function (error) {
        console.log('Error: ' + error);
    }


    form.onsubmit = function(e) {

        e.preventDefault();

        var message = messageField.value;
        var msg = {
            sender: sender,
            content: message
        };
        ws.send(JSON.stringify(msg));

        messageField.value = '';

        return false;
    }

    closeBtn.onclick = function (e) {
        e.preventDefault();
        ws.close();
        return false;
    }
};