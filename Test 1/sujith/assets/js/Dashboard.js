if (!localStorage.getItem("token")) {
    location.href = "./login.html";
}

$("#success-button").hover(function(){
    $(this).css("background-color", "green");
    }, function(){
        $(this).css("background-color", "#06C24E");
      } );

function logout() {
    localStorage.clear();
    location.href = "./dashboard.html";
}

var currentUserID;
$.ajax({
    url: "./api/getUser.php",
    method: "POST",
    data: {
        token: localStorage.getItem("token"),
    },
    success: function (response) {
        response = JSON.parse(response);
        $("#name").text(response.data.user.name);
        currentUserID=response.data.user.id;
    },
    error: function (response) {
        let data = JSON.parse(response.responseText);
        localStorage.removeItem("token");
        location.href = "./login.html?error=" + data.message;
    },
});

$.ajax({
    url: "./api/getAllMessages.php",
    method: "GET",
    success: function (response) {
        response = JSON.parse(response);
        let t='';
        for(let i=0;i<response.data.messages.length;i++){
            if(currentUserID==response.data.messages[i].id){
                t+=`<tr>
                <td>
                  <div class="float-end d-flex">
                    <div class="bg-primary p-2 m-2 rounded rounded-3 shadow">
                      <p class="fw-bold text-white p-0 m-0">${response.data.messages[i].name}</p>
                      <p class="text-white p-0 m-0">${response.data.messages[i].message}</p>
                    </div>
                    <i class="bi bi-person-circle mt-4"></i>
                  </div>
                </td>
              </tr>`;
            }
            else{
                t+=`
                <tr >
                    <td>
                      <div class="float-start d-flex">
                        <i class="bi bi-person-circle mt-4"></i>
                        <div class="bg-light p-2 m-2 rounded rounded-3 shadow">
                          <p class="fw-bold fw-semibold p-0 m-0">${response.data.messages[i].name}</p>
                          <p class="p-0 m-0">${response.data.messages[i].message}</p>
                        </div>
                      </div>
                    </td>
                  </tr>
                `;
            }
        }
        $("#displayChat").html(t);
    },
    error: function (response) {
        let data = JSON.parse(response.responseText);
        localStorage.removeItem("token");
        location.href = "./login.html?error=" + data.message;
    },
});

function addMessage(){
    let message =$("#message").val();
    $.ajax({
        url: "./api/addMessage.php",
        method: "POST",
        data: {
            user_id :currentUserID,
            message
        },
        success: function (response) {
            response = JSON.parse(response);
            console.log(response.message);
            window.location.reload();
        },
        error: function (response) {
            let data = JSON.parse(response.responseText);
            localStorage.removeItem("token");
            location.href = "./login.html?error=" + data.message;
        },
    });
    window.location.reload();
}