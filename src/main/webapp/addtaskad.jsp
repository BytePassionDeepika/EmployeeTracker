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
        .container { max-width: 600px; width: 90%; margin: 0 auto; padding: 20px; background: rgba(255, 255, 255, 0.9); border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        h1 { color: #000; margin-bottom: 20px; text-align: center; font-size: 1.4em; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 5px; }
        input[type="text"], input[type="date"], input[type="time"], input[type="number"] { width: 100%; padding: 8px; font-size: 16px; border: 1px solid #ccc; border-radius: 4px; }
        .btn { display: inline-block; padding: 10px 20px; border-radius: 4px; color: white; background-color: #007bff; text-decoration: none; cursor: pointer; transition: background-color 0.3s; }
        .btn:hover { background-color: #0056b3; }
        .alert { padding: 10px; background-color: #f44336; color: white; margin-bottom: 15px; border-radius: 4px; }
    </style>
    <script>
        function calculateHours() {
            const startTime = document.getElementById('startTime').value;
            const endTime = document.getElementById('endTime').value;

            if (startTime && endTime) {
                const start = new Date('1970-01-01T' + startTime + 'Z');
                const end = new Date('1970-01-01T' + endTime + 'Z');
                const diff = end - start;

                if (diff < 0) {
                    alert('End time must be after start time.');
                    return;
                }

                const hours = diff / (1000 * 60 * 60);
                document.getElementById('numHours').value = hours.toFixed(1);
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Add Task</h1>
        <div class="form-group">
            <% String errorMessage = (String) request.getAttribute("errorMessage");
               if (errorMessage != null && !errorMessage.isEmpty()) { %>
               <div class="alert">
                   <%= errorMessage %>
               </div>
            <% } %>
        </div>
        <form action="AdminAddTaskServlet" method="post">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-group">
                <label for="date">Date:</label>
                <input type="date" id="date" name="date" required>
            </div>

            <div class="form-group">
                <label for="startTime">Start Time:</label>
                <input type="time" id="startTime" name="startTime" step="1" onchange="calculateHours()" required>
            </div>

            <div class="form-group">
                <label for="endTime">End Time:</label>
                <input type="time" id="endTime" name="endTime" step="1" onchange="calculateHours()" required>
            </div>

            <div class="form-group">
                <label for="numHours">Number of Hours:</label>
                <input type="number" id="numHours" name="numHours" step="0.1" readonly required>
            </div>

            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" id="category" name="category" required>
            </div>

            <div class="form-group">
                <label for="project">Project:</label>
                <input type="text" id="project" name="project" required>
            </div>

            <input type="submit" value="Add Task" class="btn">
        </form>
    </div>
</body>
</html>
