<%
    if(request.getSession().getAttribute("username")==null){
        response.sendRedirect("signin.jsp");
    }
%>
<%@page import="java.sql.*" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Book Appointment - Telemedicine App</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Ubuntu&display=swap" rel="stylesheet">
</head>
<body>
    <style>
        .navbar{
            background-color:#143566;
            position: fixed;
            width: 100%;
            margin: 0px;
            border: 0px;
        }
        h1{
            color:white;
            margin: 0px;
            border: 0px;
            font-family: 'Ubuntu', sans-serif;
            display: inline-block;
            padding: 20px;
        }
    </style>
    <div class="navbar">
        <h1>Telemedicine App</h1>
        <a href="mainPage.jsp" style="text-decoration:none;" ><h1 style="right:0;position: absolute; margin-top:10px; margin-right:80px; font-size:16px;">TELEMEDBOT</h1></a>
        <a href="index.jsp" style="text-decoration:none;" ><h1 style="right:0;position: absolute; margin-top:10px; font-size:16px;">Logout</h1></a>
    </div>
    <div class="formbold-main-wrapper">
      <div class="formbold-form-wrapper">
        <form>
          <div class="formbold-mb-5" style="margin-top:50px">
            <label for="name" class="formbold-form-label"> Full Name </label>
            <input
              type="text"
              name="name"
              id="name"
              placeholder="Full Name"
              class="formbold-form-input"
            />
          </div>
          <div class="formbold-mb-5">
            <label for="phone" class="formbold-form-label"> Phone Number </label>
            <input
              type="text"
              name="phone"
              id="phone"
              placeholder="Enter your phone number"
              class="formbold-form-input"
            />
          </div>
          <div class="formbold-mb-5">
            <label for="email" class="formbold-form-label"> Email Address </label>
            <input
              type="email"
              name="email"
              id="email"
              placeholder="Enter your email"
              class="formbold-form-input"
            />
          </div>
          <div class="flex flex-wrap formbold--mx-3">
            <div class="w-full sm:w-half formbold-px-3">
              <div class="formbold-mb-5 w-full">
                <label for="date" class="formbold-form-label"> Date </label>
                <input
                  type="date"
                  name="date"
                  id="date"
                  class="formbold-form-input"
                />
              </div>
            </div>
            <div class="w-full sm:w-half formbold-px-3">
              <div class="formbold-mb-5">
                <label for="time" class="formbold-form-label"> Time </label>
                <input
                  type="time"
                  name="time"
                  id="time"
                  class="formbold-form-input"
                />
              </div>
            </div>
          </div>

          <div class="formbold-mb-5 formbold-pt-3">
            <label class="formbold-form-label formbold-form-label-2">
              Address Details
            </label>
            <div class="flex flex-wrap formbold--mx-3">
              <div class="w-full sm:w-half formbold-px-3">
                <div class="formbold-mb-5">
                  <input
                    type="text"
                    name="area"
                    id="area"
                    placeholder="Enter area"
                    class="formbold-form-input"
                  />
                </div>
              </div>
              <div class="w-full sm:w-half formbold-px-3">
                <div class="formbold-mb-5">
                  <input
                    type="text"
                    name="city"
                    id="city"
                    placeholder="Enter city"
                    class="formbold-form-input"
                  />
                </div>
              </div>
              <div class="w-full sm:w-half formbold-px-3">
                <div class="formbold-mb-5">
                  <input
                    type="text"
                    name="state"
                    id="state"
                    placeholder="Enter state"
                    class="formbold-form-input"
                  />
                </div>
              </div>
              <div class="w-full sm:w-half formbold-px-3">
                <div class="formbold-mb-5">
                  <input
                    type="text"
                    name="post-code"
                    id="post-code"
                    placeholder="Post Code"
                    class="formbold-form-input"
                  />
                </div>
              </div>
            </div>
          </div>
          <div class="w-full sm:w-half formbold-px-3">
            <div class="formbold-mb-5">
              <label for="time" class="formbold-form-label"> Doctor </label>
              <%
                out.print("<select name='doctor' id='doctor' style='padding: 10px; width: 250px;' >");
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/TelemedicineApp","root","Kush@2004");
                Statement stmt1 = con1.createStatement();
                ResultSet rs1 = stmt1.executeQuery("select * from  DoctorDetails");
                out.println("<option 'padding: 10px;' value='Select'>Select</option>");
                while(rs1.next()){
                    out.println("<option style='padding: 10px; width' value='Dr. "+rs1.getString("fname")+"'>Dr. "+rs1.getString("fname")+"</option>");
                }
                out.print("</select>");

              %>
            </div>
          </div>
          <div>
            <input class="formbold-btn" value="Book Appointment" type="submit" />
          </div>
        </form>
      </div>
    </div>
    <%
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String area = request.getParameter("area");
        String city = request.getParameter("city");
        String state = request.getParameter("state");
        String post_code = request.getParameter("post-code");
        String doctor = request.getParameter("doctor");

        if(email!=null && !email.equals(""))
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TelemedicineApp","root","Kush@2004");
            Statement stmt = con.createStatement();
            stmt.executeUpdate("insert into Appointment values('"+name+"','"+phone+"','"+email+"','"+date+"','"+time+"','"+area+"','"+city+"','"+state+"','"+post_code+"','"+doctor+"')");
            out.println("<center><h3>Appointment Done Successfully.</h3></center><br/>");
            out.println("<center><h3 style='margin-bottom: 30px;'>You can check our TELEMEDBOT for instant solutions @<a href='mainPage.jsp' >TELEMEDBOT:</a></h3></center>");
        }
    %>
    <style>
      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }
      body {
        font-family: "Inter", Arial, Helvetica, sans-serif;
      }
      .formbold-mb-5 {
        margin-bottom: 20px;
      }
      .formbold-pt-3 {
        padding-top: 12px;
      }
      .formbold-main-wrapper {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 48px;
      }

      .formbold-form-wrapper {
        margin: 0 auto;
        max-width: 550px;
        width: 100%;
        background: white;
      }
      .formbold-form-label {
        display: block;
        font-weight: 500;
        font-size: 16px;
        color: #07074d;
        margin-bottom: 12px;
      }
      .formbold-form-label-2 {
        font-weight: 600;
        font-size: 20px;
        margin-bottom: 20px;
      }

      .formbold-form-input {
        width: 100%;
        padding: 12px 24px;
        border-radius: 6px;
        border: 1px solid #e0e0e0;
        background: white;
        font-weight: 500;
        font-size: 16px;
        color: #6b7280;
        outline: none;
        resize: none;
      }
      .formbold-form-input:focus {
        border-color: #6a64f1;
        box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
      }

      .formbold-btn {
        text-align: center;
        font-size: 16px;
        border-radius: 6px;
        padding: 14px 32px;
        border: none;
        font-weight: 600;
        background-color: #6a64f1;
        color: white;
        width: 100%;
        cursor: pointer;
      }
      .formbold-btn:hover {
        box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
      }

      .formbold--mx-3 {
        margin-left: -12px;
        margin-right: -12px;
      }
      .formbold-px-3 {
        padding-left: 12px;
        padding-right: 12px;
      }
      .flex {
        display: flex;
      }
      .flex-wrap {
        flex-wrap: wrap;
      }
      .w-full {
        width: 100%;
      }
      @media (min-width: 540px) {
        .sm\:w-half {
          width: 50%;
        }
      }
    </style>
</body>
</html>