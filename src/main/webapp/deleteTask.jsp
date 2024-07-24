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
    <title>Delete Task</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap');
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Open Sans', sans-serif; }
        body { display: flex; align-items: center; justify-content: center; min-height: 100vh; width: 100%; padding: 0; background: url('https://cdn.papershift.com/20220523200629/employee-time-tracking-the-way-you-want-it-to-work-by-Papershift-min-scaled.jpeg') no-repeat center center fixed; background-size: cover; }
        .container { max-width: 800px; width: 90%; margin: 0 auto; padding: 20px; background: rgba(255, 255, 255, 0.9); border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        h1 { color: #000; margin-bottom: 20px; text-align: center; font-size: 1.4em; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 5px; }
        table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
        th { background-color: #f0f0f0; }
        .btn-delete { padding: 8px 16px; background-color: #dc3545; color: white; border: none; border-radius: 4px; cursor: pointer; transition: background-color 0.3s; }
        .btn-delete:hover { background-color: #c82333; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Delete Task</h1>
        
        <%-- Retrieve tasks for the logged-in employee --%>
        <% User user = (User) session.getAttribute("user");
           if (user != null) {
               TaskDao taskDao = new TaskDao();
               List<Task> tasks = taskDao.getAllTasksForEmployee(user.getEmpId());
               
               // Check if tasks exist
               if (!tasks.isEmpty()) { %>
                   <table>
                       <tr>
                           <th>Date</th>
                           <th>Start Time</th>
                           <th>End Time</th>
                           <th>Number of Hours</th>
                           <th>Category</th>
                           <th>Project</th>
                           <th>Action</th>
                       </tr>
                       
                       <% for (Task task : tasks) { %>
                           <tr>
                               <td><%= task.getDate() %></td>
                               <td><%= task.getStartTime() %></td>
                               <td><%= task.getEndTime() %></td>
                               <td><%= task.getNumHours() %></td>
                               <td><%= task.getCategory() %></td>
                               <td><%= task.getProject() %></td>
                               <td>
                                   <form action="DeleteTaskServlet" method="POST">
                                       <input type="hidden" name="taskId" value="<%= task.getId() %>">
                                       <button type="submit" class="btn-delete">Delete</button>
                                   </form>
                               </td>
                           </tr>
                       <% } %>
                   </table>
               <% } else { %>
                   <div>No tasks found for the logged-in user.</div>
               <% }
           } else { %>
               <div>User session not found.</div>
           <% } %>
    </div>
</body>
</html>
