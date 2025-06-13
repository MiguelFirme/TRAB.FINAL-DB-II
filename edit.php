<?php
include 'db.php';
$id = $_GET['id'];
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $sql = "UPDATE planos_seguro SET nome_plano=?, descricao=?, valor_mensal=?, cobertura_roubo=?, cobertura_danos=?, cobertura_perda=?, franquia=? WHERE id_plano=?";
    $params = [
        $_POST['nome_plano'],
        $_POST['descricao'],
        $_POST['valor_mensal'],
        isset($_POST['cobertura_roubo']) ? 1 : 0,
        isset($_POST['cobertura_danos']) ? 1 : 0,
        isset($_POST['cobertura_perda']) ? 1 : 0,
        $_POST['franquia'],
        $id
    ];
    sqlsrv_query($conn, $sql, $params);
    header("Location: index.php");
}
$sql = "SELECT * FROM planos_seguro WHERE id_plano=?";
$stmt = sqlsrv_query($conn, $sql, [$id]);
$row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC);
?>
<form method="post">
    Nome: <input name="nome_plano" value="<?= $row['nome_plano'] ?>"><br>
    Descrição: <input name="descricao" value="<?= $row['descricao'] ?>"><br>
    Valor Mensal: <input name="valor_mensal" type="number" step="0.01" value="<?= $row['valor_mensal'] ?>"><br>
    Cobertura Roubo: <input type="checkbox" name="cobertura_roubo" <?= $row['cobertura_roubo'] ? 'checked' : '' ?>><br>
    Cobertura Danos: <input type="checkbox" name="cobertura_danos" <?= $row['cobertura_danos'] ? 'checked' : '' ?>><br>
    Cobertura Perda: <input type="checkbox" name="cobertura_perda" <?= $row['cobertura_perda'] ? 'checked' : '' ?>><br>
    Franquia: <input name="franquia" type="number" step="0.01" value="<?= $row['franquia'] ?>"><br>
    <button type="submit">Salvar</button>
</form>