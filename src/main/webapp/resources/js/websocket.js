window.onload = function(){
    var ws = new WebSocket("ws://websocketserver-env.ecyh3rdrdc.us-west-2.elasticbeanstalk.com:8080/chat/" + room + "/" + sender);
    var form = document.getElementById('message-form');
    var messageField = document.getElementById('message');
    var messageList = document.getElementById('messages');
    var userList = document.getElementById('participants');
    var closeBtn = document.getElementById('close');
    var socketStatus = document.getElementById('status');

    ws.onopen = function(event) {
        socketStatus.innerHTML = 'Connected to Server';
        socketStatus.className = 'open';
    };

    ws.onmessage = function(event) {
        var msg = JSON.parse(event.data);

        var activeParticipants = msg.activeUsers;

        var userString = "";

        activeParticipants.forEach(function (user) {
            userString += '<li class="received list-group-item  bg-dark text-white">' +
                '<p class="mb-0">' + user + '</p>' + '</li>';
        });

        userList.innerHTML = userString;

        if(msg.sender != sender){
            messageList.innerHTML += '<li class="received list-group-item  bg-dark text-white">' +
                '<blockquote class="blockquote text-left">' +
                '<p class="mb-0">' + msg.sender + ': ' + msg.content + '</p>' +
                '<footer class="blockquote-footer text-right">' + msg.time + '</footer>' +
                '</blockquote>' + '</li>';
        }
        else{
            messageList.innerHTML += '<li class="received list-group-item  bg-dark text-white">' +
                '<blockquote class="blockquote text-right">' +
                '<p class="mb-0">' + msg.sender + ': ' + msg.content + '</p>' +
                '<footer class="blockquote-footer text-left">' + msg.time + '</footer>' +
                '</blockquote>' + '</li>';
        }

    };

    ws.onclose = function() {
        socketStatus.innerHTML = 'Disconnected from server.';
        socketStatus.className = 'closed';
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