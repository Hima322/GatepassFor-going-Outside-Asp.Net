<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication2.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | Login</title>
    <link rel="stylesheet" href="css/libs/bootstrap.min.css">
    <link rel="stylesheet" href="css/libs/font-awesome.min.css">
    <script src="js/libs/bootstrap.bundle.min.js"></script>
    <script src="js/libs/jquery.min.js"></script>
    <link rel="stylesheet" href="css/libs/toastify.min.css">
    <script src="js/libs/toastify-js.js"></script>
    <style>
        body {
            background: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            width: 100%;
            max-width: 400px;
            padding: 2rem;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="login-container text-center">
                    <img src="image/logo.png" alt="Logo" class="mb-3" height="45">
                    <h3 class="mb-3">Admin Login</h3>
                    <form id="loginForm">
                        <div class="mb-3">
                           
                            <input type="text" id="username" class="form-control" placeholder="Enter username">
                        </div>
                        <div class="mb-3">
                            <input type="password" id="password" class="form-control" placeholder="Enter password">
                        </div>
                        <button type="button" class="btn btn-primary w-100" onclick="AdminLogin()">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        function AdminLogin() {
            let username = $("#username").val();
            let password = $("#password").val();
            if (username === "") {
                showToast("Username is required.");
                return;
            }
            if (password === "") {
                showToast("Password is required.");
                return;
            }
            $.ajax({
                type: "POST",
                url: "login.aspx/LoginMe",
                data: JSON.stringify({ username, password }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (res) {
                    if (res.d) {
                        localStorage.setItem("admin", username);
                        location.href = "index.aspx";
                    } else {
                        showToast("Invalid credentials");
                    }
                },
                error: function () {
                    showToast("Something went wrong. Try again.");
                }
            });
        }

        function showToast(message) {
            Toastify({
                text: message,
                duration: 3000,
                gravity: "bottom",
                position: "right",
                style: { background: "gray" }
            }).showToast();
        }

        if (localStorage.getItem("admin")) {
            location.href = "index.aspx";
        }
    </script>
</body>
</html>
