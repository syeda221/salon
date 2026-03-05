<?php
require '../config/connect.php';
$conn = (new Database)->connect();

$id = $_GET['id'];

/* Mark as completed */
$conn->prepare("
UPDATE appointments 
SET status='completed'
WHERE id=?
")->execute([$id]);

/* Get client email */
$stmt = $conn->prepare("
SELECT c.email, c.name
FROM appointments a
JOIN clients c ON a.client_id = c.id
WHERE a.id=?
");
$stmt->execute([$id]);
$client = $stmt->fetch();

$to = $client['email'];
$name = $client['name'];

/* Feedback link */
$link = "http://localhost/salon/feedback.php?id=".$id;

$subject = "We value your feedback!";
$message = "
Hello $name,

Your appointment has been completed.

Please rate our service:
$link

Thank you!
Salon Team
";

$headers = "From: salon@example.com";

mail($to, $subject, $message, $headers);

echo "Appointment completed & feedback email sent.";
?>