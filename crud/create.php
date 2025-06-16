<?php
include 'db.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $sql = "INSERT INTO Planos_Seguro (nome_plano, descricao, valor, cobertura_roubo, cobertura_danos, cobertura_reposicao, cobertura_internacional)
            VALUES (?, ?, ?, ?, ?, ?, ?)";
    $params = [
        $_POST['nome_plano'],
        $_POST['descricao'],
        $_POST['valor'],
        isset($_POST['cobertura_roubo']) ? 1 : 0,
        isset($_POST['cobertura_danos']) ? 1 : 0,
        isset($_POST['cobertura_reposicao']) ? 1 : 0,
        isset($_POST['cobertura_internacional']) ? 1 : 0
    ];
    sqlsrv_query($conn, $sql, $params);
    header("Location: index.php");
}
?>
<form method="post">
    Nome: <input name="nome_plano"><br>
    Descrição: <input name="descricao"><br>
    Valor: <input name="valor" type="number" step="0.01"><br>
    Cobertura Roubo: <input type="checkbox" name="cobertura_roubo"><br>
    Cobertura Danos: <input type="checkbox" name="cobertura_danos"><br>
    Cobertura Reposição: <input type="checkbox" name="cobertura_reposicao"><br>
    Cobertura Internacional: <input type="checkbox" name="cobertura_internacional"><br>
    <button type="submit">Salvar</button>
</form>
