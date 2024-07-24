<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Employee.model.Task" %>
<%@ page import="com.Employee.model.User" %>
<%@ page import="com.Employee.dao.TaskDao" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Dashboard</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap');
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Open Sans', sans-serif; }
        body { display: flex; align-items: center; justify-content: center; min-height: 100vh; width: 100%; padding: 0; background: url('https://cdn.papershift.com/20220523200629/employee-time-tracking-the-way-you-want-it-to-work-by-Papershift-min-scaled.jpeg') no-repeat center center fixed; background-size: cover; }
        .container { max-width: 800px; width: 90%; margin: 0 auto; padding: 20px; background: rgba(255, 255, 255, 0.9); border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        h1 { color: #000; margin-bottom: 20px; text-align: center; font-size: 1.4em; }
        .links { text-align: center; margin-bottom: 20px; }
        .links a {
            text-decoration: none;
            padding: 10px 20px;
            margin: 0 10px;
            background-color: #007bff;
            color: #fff;
            border-radius: 4px;
            font-size: 0.85em;
            transition: background-color 0.3s;
        }
        .links a:hover { background-color: #0056b3; }
        .task-list { margin-top: 20px; width: 100%; border-collapse: collapse; }
        .task-list th, .task-list td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: left;
        }
        .task-list th {
            background-color: #007bff;
            color: #fff;
            font-size: 0.85em;
        }
        .task-list td { background-color: #f9f9f9; font-size: 0.85em; }
        .chart { margin-top: 20px; text-align: center; }
        .chart h2 { font-size: 1.2em; margin-bottom: 10px; }
        .chart a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border-radius: 4px;
            text-decoration: none;
            font-size: 0.85em;
            transition: background-color 0.3s;
        }
        .chart a:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome <%= ((User) session.getAttribute("user")).getUsername() %></h1>

        <!-- Links to Add, Edit, Delete tasks -->
        <div class="links">
            <a href="addTask.jsp">Add Task</a>
            <a href="editTask.jsp">Edit Task</a>
            <a href="deleteTask.jsp">Delete Task</a>
        </div>

        <!-- Display Existing Tasks as Table -->
        <div class="task-list">
            <h2>Existing Tasks</h2>
            <table>
                <thead>
                    <tr>
                        <th>Task ID</th> <!-- New column for Task ID -->
                        <th>Date</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                        <th>Hours</th>
                        <th>Category</th>
                        <th>Project</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        TaskDao taskDao = new TaskDao();
                        List<Task> tasks = taskDao.getAllTasksForEmployee(((User) session.getAttribute("user")).getEmpId());
                        for (Task task : tasks) {
                    %>
                    <tr>
                        <td><%= task.getId() %></td> <!-- Display Task ID -->
                        <td><%= task.getDate() %></td>
                        <td><%= task.getStartTime() %></td>
                        <td><%= task.getEndTime() %></td>
                        <td><%= task.getNumHours() %></td>
                        <td><%= task.getCategory() %></td>
                        <td><%= task.getProject() %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>

        <!-- Display Charts -->
        <div class="chart">
            <h2>Daily Tasks/Hours (Pie Chart)</h2>
            <a href="dailyTasksChart.jsp">Daily Task</a>

            <h2>Weekly Tasks (Bar Chart)</h2>
            <a href="weeklyTasksChart.jsp">Weekly Task</a>

            <h2>Monthly Tasks (Bar Chart)</h2>
            <a href="monthlyTasksChart.jsp">Monthly Task</a>
        </div>
    </div>
</body>
</html>
