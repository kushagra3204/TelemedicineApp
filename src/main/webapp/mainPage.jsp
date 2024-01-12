<%
    if(request.getSession().getAttribute("username")==null){
        response.sendRedirect("signin.jsp");
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Telemedicine App - Chat with expert</title>
</head>
<body>
    <style>
        .dropbtn {
          background-color: transparent;
          color: white;
          border: none;
          cursor: pointer;
        }

        .dropdown-content {
          display: none;
          position: absolute;
          background-color: #f9f9f9;
          min-width: 110px;
          box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
          border-radius: 10px;
          padding: 10px 0 10px 0;
        }

        .show {
          display: block;
        }


        input[type=submit] {
            appearance: none;
            background-color: transparent;
            border: 0.125em solid #1A1A1A;
            border-radius: 0.9375em;
            box-sizing: border-box;
            color: #3B3B3B;
            cursor: pointer;
            display: inline-block;
            font-family: Roobert,-apple-system,BlinkMacSystemFont,"Segoe UI",Helvetica,Arial,sans-serif,"Apple Color Emoji","Segoe UI Emoji","Segoe UI Symbol";
            font-size: 16px;
            font-weight: 600;
            line-height: normal;
            margin: 0;
            min-height: 2em;
            min-width: 0;
            outline: none;
            padding: 0.8em 1.5em;
            text-align: center;
            text-decoration: none;
            transition: all 300ms cubic-bezier(.23, 1, 0.32, 1);
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            will-change: transform;
           }

           input[type=submit]:disabled {
            pointer-events: none;
           }

           input[type=submit]:hover {
            color: #fff;
            background-color: #1A1A1A;
            box-shadow: rgba(0, 0, 0, 0.25) 0 8px 15px;
            transform: translateY(-2px);
           }

           input[type=submit]:active {
            box-shadow: none;
            transform: translateY(0);
           }
    </style>

    <div style="background-color: #eee; border-radius: 20px; padding: 20px; margin: 10px; height: 100%; height:89vh">
        <div style="background-color: #0a2540; border-radius: 15px 15px 0 0; color: white; height: 120px;">
            <div class="dropdown" style="position: absolute; right:0; margin-right:80px; margin-top:40px; " >
              <button onclick="toggleDropdown()" class="dropbtn"><img src="menu.png" height="25px" width="25px"/></button>
              <div id="myDropdown" class="dropdown-content" >

                <a href="index.jsp" style="margin: 20px; text-decoration:none;">Logout</a><br/>
                <hr/>
                <a href="appointment.jsp" style="margin: 20px; text-decoration:none;">Appointment</a><br/>

              </div>
            </div>
            <p style="display:flex; position:absolute; margin:45px 0 0 135px;">Dr. Tushar Mehta<br/>MBBS, MD (General Physician)</p>
            <img src="check.png" height="20px" width="20px" style="position:absolute; margin: 45px 0 0 250px;" />
            <img src="doctorImage.png" height="70px" width="70px" style="border-radius:100%; margin: 25px 0 0 50px;"  />

        </div>
        <div style="display: flex;">
            <textarea  id="textbox-general" style="width: 99.6%; height: 260px; display:inline-block; outline:none; border:none; resize:none; background-color:rgb(250, 240, 227); padding: 20px;" readonly></textarea>
        </div>
        <div class="a">
            <textarea name="textbox-user" id="textbox-user" placeholder="Type any message..." style="padding: 20px; border-radius:0 0 15px 15px; overflow: hidden; height:60px; width: 96.6%; outline:none; resize: none; font-size:21px; font-family:'Gill Sans', 'Gill Sans MT'; background-color:rgb(252, 234, 211); border:none;"></textarea>
            <input value="Send" type="submit" onclick="onclickbutton()" style="position:absolute; right: 60px; margin-top:25px;" />
        </div>
    </div>
    <script>
        function onclickbutton(){
            var doctext = document.getElementById("textbox-user");
            var genText = document.getElementById("textbox-general");
            var user_name = "User";

            var inputText = doctext.value;

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    var response = this.responseText;

                    var message=genText.value+"\n\n"+response+""+doctext.value;
                    genText.value = message;
                    doctext.value="";
                }
            };
            xhttp.open("GET", "userDetails.jsp", true);
            xhttp.send();

            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState === 4 && this.status === 200) {
                    var response = this.responseText;
                    document.getElementById("textbox-general").value = genText.value+response; // Set the output
                }
            };
            xhttp.open("GET", "getDetails.jsp?input=" + inputText, true);
            xhttp.send();
        }

        function toggleDropdown() {
          var dropdownContent = document.getElementById("myDropdown");
          if (dropdownContent.style.display === "block") {
            dropdownContent.style.display = "none";
          } else {
            dropdownContent.style.display = "block";
          }
        }

        window.onclick = function(event) {
          if (!event.target.matches('.dropbtn')) {
            var dropdowns = document.getElementsByClassName("dropdown-content");
            for (var i = 0; i < dropdowns.length; i++) {
              var openDropdown = dropdowns[i];
              if (openDropdown.style.display === "block") {
                openDropdown.style.display = "none";
              }
            }
          }
        }
    </script>
</body>
</html>