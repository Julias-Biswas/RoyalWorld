<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" />

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

        <link rel="stylesheet" href="css/style.css" />

    </head>
    <body>
        <div>
            <jsp:scriptlet>
                String success_message = (String) request.getAttribute("success_message");
            </jsp:scriptlet>
            <div class="alert_success">
                <span class="closebtn_success" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                <strong style="margin-left: 35%;"> SUCCESS : </strong> <jsp:expression>success_message</jsp:expression>
            </div>
        </div>
    </body>
</html>
