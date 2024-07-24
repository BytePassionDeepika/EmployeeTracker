<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Task</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap');
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Open Sans', sans-serif; }
        body { display: flex; align-items: center; justify-content: center; min-height: 100vh; width: 100%; padding: 0; background: url('https://cdn.papershift.com/20220523200629/employee-time-tracking-the-way-you-want-it-to-work-by-Papershift-min-scaled.jpeg') no-repeat center center fixed; background-size: cover; }
        .container { max-width: 500px; width: 90%; margin: 0 auto; padding: 20px; background: rgba(255, 255, 255, 0.9); border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        h1 { color: #000; margin-bottom: 20px; text-align: center; font-size: 1.4em; }
        .card { background-color: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); margin: 0 auto; padding: 15px; width: 100%; }
        .card h2 { color: #000; margin-top: 0; font-size: 1.1em; }
        form { display: flex; flex-direction: column; gap: 12px; }
        label { color: #000; font-size: 0.85em; }
        input[type="text"], input[type="date"], input[type="time"], input[type="number"], input[type="submit"] { padding: 10px; border-radius: 3px; border: 1px solid #ddd; font-size: 0.85em; }
        input[type="submit"] { color: white; background-color: #007bff; cursor: pointer; transition: background-color 0.3s; }
        input[type="submit"]:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Task</h1>
        <div class="card">
            <h2>New Task</h2>
            <form action="AdminAddTaskServlet" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>
                <label for="startTime">Start Time:</label>
                <input type="time" id="startTime" name="startTime" step="1" onchange="calculateHours()" required>
                <label for="endTime">End Time:</label>
                <input type="time" id="endTime" name="endTime" step="1" onchange="calculateHours()" required>
                <label for="numHours">Number of Hours:</label>
                <input type="number" id="numHours" name="numHours" step="0.1" readonly required>
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" required>
                <label for="project">Project:</label>
                <input type="text" id="project" name="project" required>
                <input type="submit" value="Add Task">
            </form>
        </div>
    </div>
    <script>
        function calculateHours() {
            var startTime = document.getElementById('startTime').value;
            var endTime = document.getElementById('endTime').value;

            if (startTime && endTime) {
                var start = new Date('1970-01-01T' + startTime + 'Z');
                var end = new Date('1970-01-01T' + endTime + 'Z');
                var hours = (end - start) / 1000 / 60 / 60;
                document.getElementById('numHours').value = hours.toFixed(1);
            }
        }
    </script>
</body>
</html>
