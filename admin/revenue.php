<?php


/* ==============================
   TOTAL REVENUE
==============================*/
$totalRevenue = $conn->query("
SELECT IFNULL(SUM(paid_amount),0) 
FROM appointments 
WHERE payment_status='paid'
")->fetchColumn();

/* ==============================
   TOTAL APPOINTMENTS
==============================*/
$totalAppointments = $conn->query("
SELECT COUNT(*) FROM appointments
")->fetchColumn();

/* ==============================
   APPOINTMENT STATUS
==============================*/
$statusData = $conn->query("
SELECT status, COUNT(*) total
FROM appointments
GROUP BY status
")->fetchAll(PDO::FETCH_KEY_PAIR);

/* ==============================
   DAILY REVENUE
==============================*/
$dailyRevenue = $conn->query("
SELECT DATE(paid_at) day, SUM(paid_amount) total
FROM appointments
WHERE payment_status='paid'
GROUP BY day
ORDER BY day
")->fetchAll(PDO::FETCH_ASSOC);

?>
<!DOCTYPE html>
<html>
<head>
<title>Reports Dashboard</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
body{font-family:Arial;padding:20px;background:#f5f6fa;}
.card{
    background:white;
    padding:20px;
    margin:10px;
    display:inline-block;
    width:220px;
    border-radius:10px;
    box-shadow:0 3px 8px rgba(0,0,0,0.1);
}
table{
    width:100%;
    background:white;
    border-collapse:collapse;
    margin-top:20px;
}
th,td{
    padding:12px;
    border-bottom:1px solid #ddd;
}
h2{margin-top:40px;}
</style>
</head>

<body>

<h1>Salon Reports Dashboard</h1>

<div class="card">
<h3>Total Revenue</h3>
<h2>Rs <?= number_format($totalRevenue) ?></h2>
</div>

<div class="card">
<h3>Total Appointments</h3>
<h2><?= $totalAppointments ?></h2>
</div>

<div class="card">
<h3>Confirmed</h3>
<h2><?= $statusData['confirmed'] ?? 0 ?></h2>
</div>

<div class="card">
<h3>Completed</h3>
<h2><?= $statusData['completed'] ?? 0 ?></h2>
</div>

<div class="card">
<h3>Pending</h3>
<h2><?= $statusData['pending'] ?? 0 ?></h2>
</div>


