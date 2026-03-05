<?php
include '../config/connect.php';
include '../classes/pay.php';

$db = (new database)->connection();
$payment = new Payment($db);

$appointment_id = $_GET['id'];
$total = $payment->getTotalAmount($appointment_id);
?>
<h2>Payment</h2>

<p>Total Amount: <b>Rs <?= $total ?></b></p>

<form method="post">
    <select name="method">
        <option value="cash">Cash</option>
        <option value="card">Card</option>
        <!-- <option value="online">Online</option> -->
    </select>

    <button type="submit" name="pay">Pay Now</button>
</form>

<?php
if(isset($_POST['pay'])){
    $amount = $payment->makePayment($appointment_id,$_POST['method']);

    echo "<script>
        alert('Payment successful');
        window.location='invoice.php?id=$appointment_id';
    </script>";
}
?>
     <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; ELegent Salon 2025</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
>

    <!-- Bootstrap core JavaScript-->
    <script src="../asset/dashboard/vendor/jquery/jquery.min.js"></script>
    <script src="../asset/dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="../asset/dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="../asset/dashboard/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="../asset/dashboard/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="../asset/dashboard/js/demo/chart-area-demo.js"></script>
    <script src="../asset/dashboard/js/demo/chart-pie-demo.js"></script>

</body>

</html>