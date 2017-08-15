<%@page contentType="text/html" pageEncoding="UTF-8"%><html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Case Study C3.1</title>
        <meta charset="utf-8">
        <jsp:include page="header.jsp" />
        <link href="css/simple-sidebar.css" rel="stylesheet" type="text/css"/>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="css/main.css" rel="stylesheet">
        <script src="js/main.js"></script>
    </head>
    <body>  
        <!-- Main Form starts from here !-->
        <style>
           body, html {
                background-image: url(background.jpg);
                height: 100%; 
                background-position: center;
                background-repeat: no-repeat;
                background-size: cover;
            }
        </style>

        <div class="container">
            <div class="card card-container">

                <img id="profile-img" class="profile-img-rounded center-block" src="logo.png" min-width=35% height=15%/>
                <p id="profile-name" class="profile-name-card"></p>
                <form class="form-signin" action="Login" method="post" >
                    <span id="reauth-email" class="reauth-email"></span>
                    <input type="text" name="username" id="inputEmail" class="form-control" placeholder="Username" required autofocus>
                    <input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
                    <div id="remember" class="checkbox">
                        <label>
                            <input type="checkbox" value="remember-me"> Remember me
                        </label>
                    </div> 
                    <input type="hidden" name="verify" value="1">
                    <button class="btn  btn-primary " type="submit">Sign in</button>
                    <button class="btn btn-danger" type="reset">Reset</button>
                </form>
            </div>
        </div>
        <!--Invalid Login !-->
        <%
            String s = (String) request.getAttribute("clar");
            String a = "0";
            if (a == s) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Ivalid Credentials');");
                out.println("</script>");
            }
        %>
        <script type="text/javascript">
            function ready() {
                var json = [{"User_Name": "John Doe", "score": "10", "team": "1"}, {"User_Name": "Jane Smith", "score": "15", "team": "2"}, {"User_Name": "Chuck Berry", "score": "12", "team": "2"}];
                const table = document.getElementsByTagName('table')[1];
                json.forEach((obj) => {
                    const row = table.insertRow(-1)
                    row.innerHTML = `
    <td>${obj.User_Name}</td>
    <td>${obj.score}</td>
    <td>${obj.team}</td>
    `;
                });
            }
            ;</script>
    </body>
</html>