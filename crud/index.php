<?php
include 'db.php';
$sql = "SELECT * FROM Planos_Seguro";
$stmt = sqlsrv_query($conn, $sql);

?>
<h1>Planos de Seguro</h1>
<a href="create.php">Novo Plano</a>
<table border="1">
    <tr>
        <th>ID</th><th>Nome</th><th>Descrição</th><th>Valor</th><th>Roubo</th><th>Danos</th><th>Reposição</th><th>Internacional</th><th>Ações</th>
    </tr>
    <?php while($row = sqlsrv_fetch_array($stmt, SQLSRV_FETCH_ASSOC)): ?>
    <tr>
        <td><?= $row['id_plano'] ?></td>
        <td><?= $row['nome_plano'] ?></td>
        <td><?= $row['descricao'] ?></td>
        <td><?= $row['valor'] ?></td>
        <td><?= $row['cobertura_roubo'] ? 'Sim' : 'Não' ?></td>
        <td><?= $row['cobertura_danos'] ? 'Sim' : 'Não' ?></td>
        <td><?= $row['cobertura_reposicao'] ? 'Sim' : 'Não' ?></td>
        <td><?= $row['cobertura_internacional'] ? 'Sim' : 'Não' ?></td>
        <td>
            <a href="edit.php?id=<?= $row['id_plano'] ?>">Editar</a>
            <a href="delete.php?id=<?= $row['id_plano'] ?>" onclick="return confirm('Tem certeza?')">Deletar</a>
        </td>
    </tr>
    <?php endwhile; ?>
</table>