<%@page import="java.sql.*" %>
<!DOCTYPE HTML>
<html>
    <head>
        <title>Sign Up</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Ubuntu&display=swap" rel="stylesheet">
    </head>
    <body>
        <style>
            body{
                margin: 0px;
                background-image: url("https://www.healthtap.com/member/images/jpg/memberBg2-2x.jpg");
                background-size: contain;
                font-family: 'Noto Sans', sans-serif;
            }
            .navbar{
                background-color:#143566;
                position: fixed;
                width: 100%;
                margin: 0px;
                border: 0px;
                display:inline-block;
            }
            h1{
                color:white;
                margin: 0px;
                border: 0px;
                font-family: 'Ubuntu', sans-serif;
                display: block;
                padding: 20px;
            }
            .signupcontainer{
                margin-top: 88px;
                margin-left: 20px;
                background-color: white;
                display: inline-block;
                padding: 20px 40px 20px 40px;
                border-radius: 20px;
            }
            .divRow{
                display: inline-grid;
                margin: 5px 20px 5px 5px;
            }
            input{
                color: #333333;
                font-family: 'Georgia';
                background-color: #f0f0f0;
                border-radius: 10px;
                border-color: none;
                border: none;
                padding: 6px;
                width: 100%;
                margin-top: 5px;
            }
            button:hover{
                font-family: 'Georgia';
                background-color: #000000;
                color: white;
                font-size: 16px;
                padding: 8px;
                width: 100%;
                border-radius: 20px;
                border: none;
                cursor: pointer;
            }
            button{
                font-family: 'Georgia';
                background-color: #0a2540;
                color: white;
                font-size: 16px;
                padding: 8px;
                width: 100%;
                border-radius: 20px;
                border: none;
                cursor: pointer;
            }
            label{
                font-size: 15px;
            }
        </style>
        <div class="navbar">
            <a href="index.jsp" style="text-decoration:none;" ><h1>Telemedicine App</h1></a>

        </div>
        <div>
            <div class="signupcontainer">
                <h2>Create a secure account (Doctor)</h2>
                <h3>Signup with email (Doctor)</h3>
                <form>
                    <div class="divRow">
                        <label>First Name</label>
                        <input type="text" placeholder="Enter First Name" name="fname"/>
                    </div>
                    <div class="divRow">
                        <label>Last Name</label>
                        <input type="text" placeholder="Enter Last Name" name="lname"/>
                    </div>
                    <br/>
                    <div class="divRow">
                        <label>Email</label>
                        <input type="email" placeholder="Enter Email-ID" name="email"/>
                    </div>
                    <div class="divRow">
                        <label>Specialization</label>
                        <input type="text" placeholder="Enter Specialization" name="specialization"/>
                    </div>
                    <br/>
                    <div class="divRow">
                        <label>Password</label>
                        <input type="password" placeholder="Enter Password" name="pass"/>
                    </div>
                    <div class="divRow">
                        <label>Re-enter Password</label>
                        <input type="password" placeholder="Enter Password Again" name="repass"/>
                    </div>
                    <br/><br/>
                    <button>Continue</button>

                    <%
                        String fname = request.getParameter("fname");
                        String lname = request.getParameter("lname");
                        String email = request.getParameter("email");
                        String password = request.getParameter("pass");
                        String repass = request.getParameter("repass");
                        String specialization = request.getParameter("specialization");
                        if(email!=null && password!=null && repass!=null && !email.equals("") && !password.equals("") && !repass.equals("") && !fname.equals("") && !lname.equals(""))
                        {
                            if(password.equals(repass))
                            {
                                Class.forName("com.mysql.cj.jdbc.Driver");
                                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TelemedicineApp","root","Kush@2004");
                                Statement stmt = con.createStatement();
                                try{
                                    stmt.executeUpdate("insert into DoctorDetails values('"+fname+"','"+lname+"','"+email+"','"+password+"','"+specialization+"')");
                                    response.sendRedirect("signin.jsp");
                                }
                                catch(Exception e)
                                {
                                    out.print("<script>alert('Already registered by this email-ID, Try another.');</script>");
                                }
                            }
                            else
                            {
                                out.print("<script>alert('Password does not match');</script>");
                            }
                        }
                    %>
                    <br/><br/>
                    <hr/>
                </form>
                <p style="font-family: 'Georgia'; font-size: 16px;">Already a member, <a href="DoctorSignin.jsp">Sign In</a></p>
            </div>
        </div>
    </body>
</html>