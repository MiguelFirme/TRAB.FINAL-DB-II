<?php
include 'db.php';
$id = $_GET['id'];
$sql = "DELETE FROM planos_seguro WHERE id_plano=?";
sqlsrv_query($conn, $sql, [$id]);
header("Location: index.php");
?>
