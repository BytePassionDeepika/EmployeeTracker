<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Employee.model.Task" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Monthly Tasks Chart</title>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {packages: ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {
            var data = google.visualization.arrayToDataTable([
                ['Month', 'Hours'],
                <% 
                    List<List<Task>> monthlyTasks = (List<List<Task>>) request.getAttribute("monthlyTasks");
                    if (monthlyTasks != null) {
                        double[] monthlyHours = new double[12]; // Assuming 12 months
                        for (int month = 0; month < monthlyTasks.size(); month++) {
                            List<Task> tasks = monthlyTasks.get(month);
                            for (Task task : tasks) {
                                monthlyHours[month] += task.getNumHours();
                            }
                        }
                        for (int i = 0; i < 12; i++) {
                            out.print("['Month " + (i + 1) + "', " + monthlyHours[i] + "],");
                        }
                    }
                %>
            ]);

            var options = {
                title: 'Monthly Tasks for the Year',
                chartArea: {width: '50%'},
                hAxis: {
                    title: 'Total Hours',
                    minValue: 0
                },
                vAxis: {
                    title: 'Month'
                }
            };

            var chart = new google.visualization.BarChart(document.getElementById('chart_div'));
            chart.draw(data, options);
        }
    </script>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap');
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Open Sans', sans-serif; }
        body { display: flex; align-items: center; justify-content: center; flex-direction: column; min-height: 100vh; width: 100%; padding: 20px; background: url('https://cdn.papershift.com/20220523200629/employee-time-tracking-the-way-you-want-it-to-work-by-Papershift-min-scaled.jpeg') no-repeat center center fixed; background-size: cover; }
        .container { max-width: 800px; width: 100%; padding: 20px; background: rgba(255, 255, 255, 0.9); border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); margin-bottom: 20px; }
        h1 { color: #000; margin-bottom: 20px; text-align: center; font-size: 1.4em; }
        form { display: flex; justify-content: center; align-items: center; margin-bottom: 20px; }
        label { margin-right: 10px; }
        input[type="number"] { padding: 8px; font-size: 16px; border: 1px solid #ccc; border-radius: 4px; margin-right: 10px; }
        button { padding: 10px 20px; background-color: #007bff; color: #fff; border: none; border-radius: 4px; cursor: pointer; transition: background-color 0.3s; }
        button:hover { background-color: #0056b3; }
        #chart_div { width: 100%; max-width: 800px; height: 500px; margin: 0 auto; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Monthly Tasks Chart</h1>
        <form action="MonthlyTasksChartServlet" method="get">
            <label for="year">Select Year:</label>
            <input type="number" id="year" name="year" min="2000" max="2100" required>
            <button type="submit">Show Chart</button>
        </form>
        <div id="chart_div"></div>
        <% 
            String message = (String) request.getAttribute("message");
            if (message != null) {
                out.println("<p>" + message + "</p>");
            }
        %>
    </div>
</body>
</html>
