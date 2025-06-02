--1-Quais clientes tiveram mais de um sinistro nos últimos 12 meses?
SELECT Clientes.id_cliente, Clientes.nome, COUNT(*) AS qtde_sinistros
FROM Clientes 
JOIN Aparelhos ON Clientes.id_cliente = Aparelhos .id_cliente
JOIN Apolices ON Aparelhos.id_aparelho = Apolices .id_aparelho
JOIN Sinistros ON Apolices .id_apolice = Sinistros.id_apolice
WHERE Sinistros .data_ocorrencia >= DATEADD(MONTH, -12, GETDATE())
GROUP BY Clientes.id_cliente, Clientes.nome
HAVING COUNT(*) > 1;
