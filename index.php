<?php
include 'db.php';
$sql = "SELECT * FROM planos_seguro";
$stmt = sqlsrv_query($conn, $sql);
?>
<h1>Planos de Seguro</h1>
<a href="create.php">Novo Plano</a>
<table border="1">
    <tr>
        <th>ID</th><th>Nome</th><th>Valor Mensal</th><th>Ações</th>
    </tr>
    <?php while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)): ?>
    <tr>
        <td><?= $row['id_plano'] ?></td>
        <td><?= $row['nome_plano'] ?></td>
        <td><?= $row['valor_mensal'] ?></td>
        <td>
            <a href="edit.php?id=<?= $row['id_plano'] ?>">Editar</a>
            <a href="delete.php?id=<?= $row['id_plano'] ?>" onclick="return confirm('Tem certeza?')">Deletar</a>
        </td>
    </tr>
    <?php endwhile; ?>
</table>