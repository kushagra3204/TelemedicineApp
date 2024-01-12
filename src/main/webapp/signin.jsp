<%@page import="java.sql.*" %>
<%@page import="jakarta.servlet.http.*" %>
<%@page import="jakarta.servlet.*" %>

<%
    if(request.getSession().getAttribute("username")!=null){
        response.sendRedirect("mainPage.jsp");
    }
%>

<!DOCTYPE HTML>
<html>
    <head>
        <title>Sign In</title>
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
                margin-left: 30px;
                background-color: white;
                display: inline-block;
                padding: 40px;
                border-radius: 20px;
            }
            .divRow{
                display: inline-grid;
                margin: 5px;
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
                <h2>Sign-In with your account</h2>
                <h3>Sign-in with email</h3>
                <form>
                    <label>Email</label><br/>
                    <input type="email" placeholder="Enter Email-ID" name="email"/><br/><br/>
                    <label>Password</label><br/>
                    <input type="password" placeholder="Enter Password" name="pass"/><br/><br/>
                    <button>Continue</button>
                    <%
                        String email = request.getParameter("email");
                        String password = request.getParameter("pass");
                        if(email!=null && password!=null)
                        {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/TelemedicineApp","root","Kush@2004");
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery("select * from  UserDetails");
                            while(rs.next()){
                                if(rs.getString("email").equals(email) && rs.getString("pass").equals(password)){
                                    String name = rs.getString("fname")+" "+rs.getString("lname");
                                    request.getSession().setAttribute("username",name);
                                    response.sendRedirect("mainPage.jsp");
                                    break;
                                }
                            }
                            out.print("<script>alert('Login Unsuccessful');</script>");
                        }
                    %>
                    <br/><br/>
                    <hr/>
                </form>
                <p style="font-family: 'Georgia'; font-size: 14px;">New member, <a href="signup.jsp">Sign Up</a></p>
                <p style="font-family: 'Georgia'; font-size: 14px;">Doctor, <a href="DoctorSignin.jsp">Sign In</a></p>
            </div>
        </div>
    </body>
</html>