<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.Employee.dao.TaskDao" %>
<%@ page import="com.Employee.model.Task" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Tasks</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap');
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Open Sans', sans-serif; }
        body { display: flex; align-items: center; justify-content: center; min-height: 100vh; width: 100%; padding: 0; background: url('https://cdn.papershift.com/20220523200629/employee-time-tracking-the-way-you-want-it-to-work-by-Papershift-min-scaled.jpeg') no-repeat center center fixed; background-size: cover; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; background: rgba(255, 255, 255, 0.9); border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        h1 { color: #000; margin-bottom: 20px; text-align: center; }
        .card { background-color: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); margin-bottom: 20px; padding: 20px; }
        .card h2 { color: #000; margin-top: 0; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        table, th, td { border: 1px solid #ddd; }
        th, td { padding: 10px; text-align: left; color: #000; }
        th { background-color: #f2f2f2; }
        .actions a { color: #007bff; text-decoration: none; margin-right: 10px; }
        .actions a:hover { text-decoration: underline; }
        .btn { display: inline-block; padding: 10px 20px; border-radius: 3px; color: white; background-color: #007bff; text-decoration: none; cursor: pointer; transition: background-color 0.3s; }
        .btn:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <h1>View Tasks</h1>
        <div class="card">
            <h2>Tasks List</h2>
            <table>
                <tr>
                    <th>ID</th>
                    <th>Username</th>
                    <th>Date</th>
                    <th>Start Time</th>
                    <th>End Time</th>
                    <th>Hours</th>
                    <th>Category</th>
                    <th>Project</th>
                    <th>Actions</th>
                </tr>
                <%
                    TaskDao taskDao = new TaskDao();
                    List<Task> tasks = taskDao.getAllTasks();
                    for (Task task : tasks) {
                %>
                <tr>
                    <td><%= task.getId() %></td>
                    <td><%= task.getUsername() %></td>
                    <td><%= task.getDate() %></td>
                    <td><%= task.getStartTime() %></td>
                    <td><%= task.getEndTime() %></td>
                    <td><%= task.getNumHours() %></td>
                    <td><%= task.getCategory() %></td>
                    <td><%= task.getProject() %></td>
                    <td class="actions">
                        <a href="adminEditTask.jsp?taskId=<%= task.getId() %>">Edit</a>
                        <form action="AdminDeleteTaskServlet" method="post" style="display:inline;">
                            <input type="hidden" name="taskId" value="<%= task.getId() %>">
                            <input type="submit" value="Delete">
                        </form>
                    </td>
                </tr>
                <% } %>
            </table>
        </div>
    </div>
</body>
</html>
