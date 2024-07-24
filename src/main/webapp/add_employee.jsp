<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap');
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Open Sans', sans-serif; }
        body { display: flex; align-items: center; justify-content: center; min-height: 100vh; width: 100%; padding: 0; background: url('https://cdn.papershift.com/20220523200629/employee-time-tracking-the-way-you-want-it-to-work-by-Papershift-min-scaled.jpeg') no-repeat center center fixed; background-size: cover; }
        .container { max-width: 600px; width: 90%; margin: 0 auto; padding: 20px; background: rgba(255, 255, 255, 0.9); border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        h1 { color: #000; margin-bottom: 20px; text-align: center; font-size: 1.5em; }
        .card { background-color: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); margin: 0 auto; padding: 20px; width: 100%; max-width: 500px; }
        .card h2 { color: #000; margin-top: 0; font-size: 1.2em; }
        form { display: flex; flex-direction: column; gap: 15px; }
        label { color: #000; font-size: 0.9em; }
        input[type="text"], input[type="password"], input[type="submit"] { padding: 12px; border-radius: 5px; border: 1px solid #ddd; font-size: 0.9em; }
        input[type="text"], input[type="password"], input[type="submit"] { width: 100%; }
        input[type="submit"] { color: white; background-color: #007bff; cursor: pointer; transition: background-color 0.3s; width: 100%; }
        input[type="submit"]:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Employee</h1>
        <div class="card">
            <h2>New Employee</h2>
            <form action="AddEmployeeServlet" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
                <label for="role">Role:</label>
                <input type="text" id="role" name="role" value="employee" readonly>
                <input type="submit" value="Add Employee">
            </form>
        </div>
    </div>
</body>
</html>
