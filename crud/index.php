<?php
include 'db.php';
$sql = "SELECT * FROM Planos_Seguro";
$stmt = sqlsrv_query($conn, $sql);
?>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Planos de Seguro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="style.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h1 class="mb-4"><i class="bi bi-shield-lock"></i> Planos de Seguro para Celular</h1>
    <a href="create.php" class="btn btn-success mb-3">Novo Plano</a>
    <div class="table-responsive">
        <table class="table table-hover align-middle text-center">
            <thead>
                <tr>
                    <th>ID</th><th>Nome</th><th>Descrição</th><th>Valor</th><th>Roubo</th><th>Danos</th><th>Reposição</th><th>Internacional</th><th>Ações</th>
                </tr>
            </thead>
            <tbody>
            <?php while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)): ?>
                <tr>
                    <td><?= $row['id_plano'] ?></td>
                    <td><?= $row['nome_plano'] ?></td>
                    <td><?= $row['descricao'] ?></td>
                    <td>R$ <?= number_format($row['valor'], 2, ',', '.') ?></td>
                    <td><?= $row['cobertura_roubo'] ? '<span class="badge bg-success">Sim</span>' : '<span class="badge bg-danger">Não</span>' ?></td>
                    <td><?= $row['cobertura_danos'] ? '<span class="badge bg-success">Sim</span>' : '<span class="badge bg-danger">Não</span>' ?></td>
                    <td><?= $row['cobertura_reposicao'] ? '<span class="badge bg-success">Sim</span>' : '<span class="badge bg-danger">Não</span>' ?></td>
                    <td><?= $row['cobertura_internacional'] ? '<span class="badge bg-success">Sim</span>' : '<span class="badge bg-danger">Não</span>' ?></td>
                    <td>
                        <a href="edit.php?id=<?= $row['id_plano'] ?>" class="btn btn-primary btn-sm" title="Editar"><i class="bi bi-pencil-square"></i></a>
                        <a href="delete.php?id=<?= $row['id_plano'] ?>" class="btn btn-danger btn-sm" onclick="return confirm('Tem certeza?')" title="Deletar"><i class="bi bi-trash"></i></a>
                    </td>
                </tr>
            <?php endwhile; ?>
            </tbody>
        </table>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>