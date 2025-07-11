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
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Plano de Seguro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
    <style>
        body { background: linear-gradient(120deg, #0f2027, #2c5364); min-height: 100vh; color: #fff; }
        .container { background: rgba(255,255,255,0.05); border-radius: 16px; padding: 2rem; margin-top: 2rem; box-shadow: 0 8px 32px 0 rgba(31,38,135,0.37); }
        h2 { font-weight: 700; letter-spacing: 1px; }
        label { font-weight: 500; }
        .form-check-label { color: #fff; }
        .btn-primary { background: #1e90ff; border: none; }
        .btn { margin-top: 1rem; }
    </style>
</head>
<body>
<div class="container">
    <h2 class="mb-4"><i class="bi bi-shield-check"></i> Editar Plano de Seguro</h2>
    <form method="post">
        <div class="mb-3">
            <label for="nome_plano" class="form-label">Nome</label>
            <input name="nome_plano" id="nome_plano" class="form-control" value="<?= $row['nome_plano'] ?>" required>
        </div>
        <div class="mb-3">
            <label for="descricao" class="form-label">Descrição</label>
            <input name="descricao" id="descricao" class="form-control" value="<?= $row['descricao'] ?>" required>
        </div>
        <div class="mb-3">
            <label for="valor" class="form-label">Valor</label>
            <input name="valor" id="valor" type="number" step="0.01" class="form-control" value="<?= $row['valor'] ?>" required>
        </div>
        <div class="form-check form-switch mb-2">
            <input class="form-check-input" type="checkbox" id="cobertura_roubo" name="cobertura_roubo" <?= $row['cobertura_roubo'] ? 'checked' : '' ?>>
            <label class="form-check-label" for="cobertura_roubo">Cobertura Roubo</label>
        </div>
        <div class="form-check form-switch mb-2">
            <input class="form-check-input" type="checkbox" id="cobertura_danos" name="cobertura_danos" <?= $row['cobertura_danos'] ? 'checked' : '' ?>>
            <label class="form-check-label" for="cobertura_danos">Cobertura Danos</label>
        </div>
        <div class="form-check form-switch mb-2">
            <input class="form-check-input" type="checkbox" id="cobertura_reposicao" name="cobertura_reposicao" <?= $row['cobertura_reposicao'] ? 'checked' : '' ?>>
            <label class="form-check-label" for="cobertura_reposicao">Cobertura Reposição</label>
        </div>
        <div class="form-check form-switch mb-4">
            <input class="form-check-input" type="checkbox" id="cobertura_internacional" name="cobertura_internacional" <?= $row['cobertura_internacional'] ? 'checked' : '' ?>>
            <label class="form-check-label" for="cobertura_internacional">Cobertura Internacional</label>
        </div>
        <button type="submit" class="btn btn-primary w-100">Salvar</button>
        <a href="index.php" class="btn btn-secondary w-100 mt-2">Voltar</a>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>