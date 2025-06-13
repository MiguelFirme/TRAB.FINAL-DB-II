<?php
$serverName = "DESKTOP-G0CPIMV\SQLEXPRESS"; // ou "localhost\SQLEXPRESS" se for o nome da instância
$connectionOptions = [
    "Database" => "master",
    "Uid" => "sa",
    "PWD" => "teste123"
];

$conn = sqlsrv_connect($serverName, $connectionOptions);

if ($conn) {
    echo "✅ Conexão com SQL Server realizada com sucesso!";
} else {
    echo "❌ Erro de conexão:";
    print_r(sqlsrv_errors());
}