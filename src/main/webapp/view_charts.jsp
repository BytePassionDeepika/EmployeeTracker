<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Charts</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Open+Sans:wght@200;300;400;500;600;700&display=swap');
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Open Sans', sans-serif; }
        body { display: flex; align-items: center; justify-content: center; min-height: 100vh; width: 100%; padding: 0; background: url('https://cdn.papershift.com/20220523200629/employee-time-tracking-the-way-you-want-it-to-work-by-Papershift-min-scaled.jpeg') no-repeat center center fixed; background-size: cover; }
        .container { max-width: 1200px; margin: 0 auto; padding: 20px; background: rgba(255, 255, 255, 0.9); border-radius: 8px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); }
        h1 { color: #000; margin-bottom: 20px; text-align: center; }
        .card { background-color: #fff; border-radius: 5px; box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); margin-bottom: 20px; padding: 20px; }
        .card h2 { color: #000; margin-top: 0; }
        .charts { display: flex; justify-content: space-around; flex-wrap: wrap; }
        .chart { flex: 1; min-width: 300px; margin: 20px; }
        .chart h3 { color: #000; }
        .btn { display: inline-block; padding: 10px 20px; border-radius: 3px; color: white; background-color: #007bff; text-decoration: none; cursor: pointer; transition: background-color 0.3s; }
        .btn:hover { background-color: #0056b3; }
    </style>
</head>
<body>
    <div class="container">
        <h1>View Charts</h1>
        <div class="card">
            <h2>Charts</h2>
            <div class="charts">
                <div class="chart">
                    <h3>Project - Daily</h3>
                    <a href="selectProjectChart.jsp" class="btn">Select Date and View Chart</a>
                </div>
                <div class="chart">
                    <h3>Employee - Monthly</h3>
                    <a href="selectEmployeeChart.jsp" class="btn">Select Date and View Chart</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
