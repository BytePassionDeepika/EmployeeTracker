<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
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
        input[type="text"], input[type="date"], input[type="time"], input[type="number"], select { width: 100%; padding: 8px; font-size: 16px; border: 1px solid #ccc; border-radius: 4px; }
        button { padding: 10px 20px; background-color: #007bff; color: #fff; border: none; border-radius: 4px; cursor: pointer; transition: background-color 0.3s; }
        button:hover { background-color: #0056b3; }
        .alert { padding: 10px; background-color: #f44336; color: white; margin-bottom: 15px; border-radius: 4px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Task</h1>
        
        <% 
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null && !errorMessage.isEmpty()) {
        %>
        <div class="alert alert-danger" role="alert">
            <%= errorMessage %>
        </div>
        <% } %>
        
        <form action="AddTaskServlet" method="post">
            <div class="form-group">
                <label for="date">Date</label>
                <input type="date" id="date" name="date" required>
            </div>
            <div class="form-group">
                <label for="startTime">Start Time</label>
                <input type="time" step="1" id="startTime" name="startTime" required>
            </div>
            <div class="form-group">
                <label for="endTime">End Time</label>
                <input type="time" step="1" id="endTime" name="endTime" required>
            </div>
            <div class="form-group">
                <label for="numHours">Number of Hours</label>
                <input type="text" id="numHours" name="numHours" readonly>
            </div>
            <div class="form-group">
                <label for="category">Category</label>
                <input type="text" id="category" name="category" required>
            </div>
            <div class="form-group">
                <label for="project">Project</label>
                <input type="text" id="project" name="project" required>
            </div>
            <button type="submit">Add Task</button>
        </form>
    </div>

    <!-- Script to calculate and display num_hours -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const startTimeInput = document.getElementById('startTime');
            const endTimeInput = document.getElementById('endTime');
            const numHoursInput = document.getElementById('numHours');

            startTimeInput.addEventListener('change', calculateNumHours);
            endTimeInput.addEventListener('change', calculateNumHours);

            function calculateNumHours() {
                const startTime = startTimeInput.value;
                const endTime = endTimeInput.value;

                if (startTime && endTime) {
                    const startParts = startTime.split(':');
                    const endParts = endTime.split(':');

                    const startHour = parseInt(startParts[0], 10);
                    const startMinute = parseInt(startParts[1], 10);
                    const startSecond = parseInt(startParts[2], 10);

                    const endHour = parseInt(endParts[0], 10);
                    const endMinute = parseInt(endParts[1], 10);
                    const endSecond = parseInt(endParts[2], 10);

                    const startDate = new Date(0, 0, 0, startHour, startMinute, startSecond);
                    const endDate = new Date(0, 0, 0, endHour, endMinute, endSecond);

                    let diff = (endDate.getTime() - startDate.getTime()) / 1000 / 60 / 60;
                    if (diff < 0) {
                        diff += 24;
                    }

                    numHoursInput.value = diff.toFixed(2);
                } else {
                    numHoursInput.value = '';
                }
            }
        });
    </script>
</body>
</html>
