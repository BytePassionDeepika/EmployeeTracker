<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select Employee Chart</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap');
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Open Sans', sans-serif;
        }
        body {
            background: url('https://cdn.papershift.com/20220523200629/employee-time-tracking-the-way-you-want-it-to-work-by-Papershift-min-scaled.jpeg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }
        .container {
            max-width: 600px;
            width: 100%;
            margin: 20px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            backdrop-filter: blur(10px);
        }
        h1 {
            color: #333;
            margin-bottom: 20px;
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
        }
        label {
            margin-bottom: 5px;
        }
        input[type="text"], input[type="date"], select {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            background-color: #f9f9f9;
            font-size: 16px;
        }
        .btn {
            padding: 10px 20px;
            border-radius: 5px;
            color: white;
            background-color: #007bff;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s;
            border: none;
            font-size: 16px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .hidden {
            display: none;
        }
    </style>
    <script>
        function showInputFields() {
            var type = document.getElementById("type").value;
            document.getElementById("dailyInputs").classList.add("hidden");
            document.getElementById("weeklyInputs").classList.add("hidden");
            document.getElementById("monthlyInputs").classList.add("hidden");
            
            document.getElementById("dailyDate").required = false;
            document.getElementById("weekMonth").required = false;
            document.getElementById("weekYear").required = false;
            document.getElementById("monthYear").required = false;
            
            if (type === "daily") {
                document.getElementById("dailyInputs").classList.remove("hidden");
                document.getElementById("dailyDate").required = true;
            } else if (type === "weekly") {
                document.getElementById("weeklyInputs").classList.remove("hidden");
                document.getElementById("weekMonth").required = true;
                document.getElementById("weekYear").required = true;
            } else if (type === "monthly") {
                document.getElementById("monthlyInputs").classList.remove("hidden");
                document.getElementById("monthYear").required = true;
            }
        }
    </script>
</head>
<body>
    <div class="container">
        <h1>Select Employee Chart</h1>
        <form action="GenerateEmployeeChartServlet" method="post">
            <label for="type">Select Chart Type:</label>
            <select id="type" name="type" onchange="showInputFields()" required>
                <option value="" disabled selected>Select a chart type</option>
                <option value="daily">Daily</option>
                <option value="weekly">Weekly</option>
                <option value="monthly">Monthly</option>
            </select>

            <div id="dailyInputs" class="hidden">
                <h2>Daily Chart (Pie Chart)</h2>
                <label for="dailyDate">Date:</label>
                <input type="date" id="dailyDate" name="dailyDate">
            </div>

            <div id="weeklyInputs" class="hidden">
                <h2>Weekly Chart (Bar Chart)</h2>
                <label for="weekMonth">Month:</label>
                <input type="text" id="weekMonth" name="weekMonth" placeholder="MM">
                
                <label for="weekYear">Year:</label>
                <input type="text" id="weekYear" name="weekYear" placeholder="YYYY">
            </div>

            <div id="monthlyInputs" class="hidden">
                <h2>Monthly Chart (Bar Chart)</h2>
                <label for="monthYear">Year:</label>
                <input type="text" id="monthYear" name="monthYear" placeholder="YYYY">
            </div>

            <input type="submit" value="Generate Chart" class="btn">
        </form>
    </div>
</body>
</html>
