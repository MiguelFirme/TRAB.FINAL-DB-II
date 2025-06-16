<?php
include 'db.php';
$id = $_GET['id'];
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $sql = "UPDATE Planos_Seguro SET nome_plano=?, descricao=?, valor=?, cobertura_roubo=?, cobertura_danos=?, cobertura_reposicao=?, cobertura_internacional=? WHERE id_plano=?";
    $params = [
        $_POST['nome_plano'],
        $_POST['descricao'],
        $_POST['valor'],
        isset($_POST['cobertura_roubo']) ? 1 : 0,
        isset($_POST['cobertura_danos']) ? 1 : 0,
        isset($_POST['cobertura_reposicao']) ? 1 : 0,
        isset($_POST['cobertura_internacional']) ? 1 : 0,
        $id
    ];
    sqlsrv_query($conn, $sql, $params);
    header("Location: index.php");
}
$sql = "SELECT * FROM Planos_Seguro WHERE id_plano=?";
$stmt = sqlsrv_query($conn, $sql, [$id]);
$row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC);
?>
<form method="post">
    Nome: <input name="nome_plano" value="<?= $row['nome_plano'] ?>"><br>
    Descrição: <input name="descricao" value="<?= $row['descricao'] ?>"><br>
    Valor: <input name="valor" type="number" step="0.01" value="<?= $row['valor'] ?>"><br>
    Cobertura Roubo: <input type="checkbox" name="cobertura_roubo" <?= $row['cobertura_roubo'] ? 'checked' : '' ?>><br>
    Cobertura Danos: <input type="checkbox" name="cobertura_danos" <?= $row['cobertura_danos'] ? 'checked' : '' ?>><br>
    Cobertura Reposição: <input type="checkbox" name="cobertura_reposicao" <?= $row['cobertura_reposicao'] ? 'checked' : '' ?>><br>
    Cobertura Internacional: <input type="checkbox" name="cobertura_internacional" <?= $row['cobertura_internacional'] ? 'checked' : '' ?>><br>
    <button type="submit">Salvar</button>
</form>