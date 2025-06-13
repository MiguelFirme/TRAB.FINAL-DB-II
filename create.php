<?php
include 'db.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $sql = "INSERT INTO planos_seguro (nome_plano, descricao, valor_mensal, cobertura_roubo, cobertura_danos, cobertura_perda, franquia)
            VALUES (?, ?, ?, ?, ?, ?, ?)";
    $params = [
        $_POST['nome_plano'],
        $_POST['descricao'],
        $_POST['valor_mensal'],
        isset($_POST['cobertura_roubo']) ? 1 : 0,
        isset($_POST['cobertura_danos']) ? 1 : 0,
        isset($_POST['cobertura_perda']) ? 1 : 0,
        $_POST['franquia']
    ];
    sqlsrv_query($conn, $sql, $params);
    header("Location: index.php");
}
?>
<form method="post">
    Nome: <input name="nome_plano"><br>
    Descrição: <input name="descricao"><br>
    Valor Mensal: <input name="valor_mensal" type="number" step="0.01"><br>
    Cobertura Roubo: <input type="checkbox" name="cobertura_roubo"><br>
    Cobertura Danos: <input type="checkbox" name="cobertura_danos"><br>
    Cobertura Perda: <input type="checkbox" name="cobertura_perda"><br>
    Franquia: <input name="franquia" type="number" step="0.01"><br>
    <button type="submit">Salvar</button>
</form>
