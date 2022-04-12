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
        <jsp:scriptlet>
            String error_message = (String) request.getAttribute("error_message");
        </jsp:scriptlet>
        <div>
            <div class="alert_error">
                <span class="closebtn_error" onclick="this.parentElement.style.display = 'none';">&times;</span> 
                <center> <strong> ERROR :  </strong> <jsp:expression>error_message</jsp:expression> </center>
            </div>
        </div>
    </body>
</html>
