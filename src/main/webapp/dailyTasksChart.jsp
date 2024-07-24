<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Employee.model.Task" %>
<%@ page import="com.Employee.model.User" %>
<%@ page import="com.Employee.dao.TaskDao" %>
<%@ page import="java.sql.Date" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Daily Tasks Chart</title>
    <!-- Load Google Charts API -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            // Fetch data from the servlet
            var tasksData = [
                ['Category', 'Hours']
                <% 
                    if (request.getAttribute("tasks") != null) {
                        List<Task> tasks = (List<Task>) request.getAttribute("tasks");
                        for (Task task : tasks) {
                %>
                ,['<%= task.getCategory() %>', <%= task.getNumHours() %>]
                <%       }
                    }
                %>
            ];

            var data = google.visualization.arrayToDataTable(tasksData);

            var options = {
                title: 'Daily Tasks Distribution',
                is3D: true,
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap');
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Open Sans', sans-serif; }
        body { display: flex; align-items: center; justify-content: center; flex-direction: column; min-height: 100vh; width: 100%; padding: 20px; background: url('https://cdn.papershift.com/20220523200629/employee-time-tracking-the-way-you-want-it-to-work-by-Papershift-min-scaled.jpeg') no-repeat center center fixed; background-size: cover; }
        .container { max-width: 800px; width: 100%; padding: 20px; background: rgba(255, 255, 255, 0.9); border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); margin-bottom: 20px; }
        h1, h2 { color: #000; margin-bottom: 20px; text-align: center; font-size: 1.4em; }
        form { display: flex; justify-content: center; align-items: center; margin-bottom: 20px; }
        label { margin-right: 10px; }
        input[type="date"] { padding: 8px; font-size: 16px; border: 1px solid #ccc; border-radius: 4px; margin-right: 10px; }
        input[type="submit"] { padding: 10px 20px; background-color: #007bff; color: #fff; border: none; border-radius: 4px; cursor: pointer; transition: background-color 0.3s; }
        input[type="submit"]:hover { background-color: #0056b3; }
        ul { list-style: none; padding: 0; }
        li { padding: 8px; background: #f9f9f9; border-bottom: 1px solid #ddd; }
        #piechart { width: 100%; max-width: 800px; height: 500px; margin: 0 auto; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Daily Tasks Chart</h1>
        <form method="get" action="DailyTasksChartServlet">
            <label for="date">Select Date:</label>
            <input type="date" id="date" name="date" required>
            <input type="submit" value="Generate Chart">
        </form>
        <div id="piechart"></div>

        <% 
            if (request.getAttribute("tasks") != null) {
                List<Task> tasks = (List<Task>) request.getAttribute("tasks");
        %>
        <div class="container">
            <h2>Tasks for <%= request.getParameter("date") %></h2>
            <ul>
                <% if (tasks.isEmpty()) { %>
                    <li>No tasks found for <%= request.getParameter("date") %>.</li>
                <% } else { %>
                    <% for (Task task : tasks) { %>
                        <li><%= task.getId() %> - <%= task.getCategory() %> - <%= task.getNumHours() %> hours</li>
                    <% } %>
                <% } %>
            </ul>
        </div>
        <% } %>
    </div>
</body>
</html>
