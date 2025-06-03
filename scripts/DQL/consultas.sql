--1-Quais clientes tiveram mais de um sinistro nos últimos 12 meses?
SELECT Clientes.id_cliente, Clientes.nome, COUNT(Sinistros.id_sinistro) AS qtde_sinistros 
FROM Clientes 
INNER JOIN Aparelhos ON Clientes.id_cliente = Aparelhos .id_cliente 
INNER JOIN Apolices ON Aparelhos.id_aparelho = Apolices .id_aparelho 
INNER JOIN Sinistros ON Apolices .id_apolice = Sinistros.id_apolice 
WHERE Sinistros .data_ocorrencia >= DATEADD(MONTH, -12, GETDATE())
GROUP BY Clientes.id_cliente, Clientes.nome
HAVING COUNT(Sinistros.id_sinistro) > 1;

--2-Quais os 5 modelos de aparelhos possuem o maior custo médio de reparo e qual a posição de cada um no ranking?
WITH CTE AS ( 
    SELECT  modelo, AVG(Reparos.custo_reparo) AS custo_medio 
    FROM Aparelhos 
    INNER JOIN Apolices ON Aparelhos.id_aparelho = Apolices.id_aparelho
    INNER JOIN Sinistros ON Apolices.id_apolice = Sinistros.id_apolice
    INNER JOIN Reparos ON Sinistros.id_sinistro = Reparos.id_sinistro
    GROUP BY modelo
),
CTE_RANK AS ( 
    SELECT modelo, custo_medio, RANK() OVER(ORDER BY custo_medio DESC) AS posicao 
    FROM CTE
)
SELECT * 
FROM CTE_RANK 
WHERE posicao <= 5;

--3-Qual a média de tempo (em dias) entre a ocorrência do sinistro e a conclusão do reparo, segmentada por modelo do aparelho e plano de seguro contratado?
WITH TempoReparo AS (
    SELECT Aparelhos.modelo, Planos_Seguro.nome_plano, DATEDIFF(DAY, Sinistros.data_ocorrencia,  Reparos.data_conclusao) AS dias_para_reparo 
    FROM Sinistros 
    INNER JOIN Reparos ON Sinistros.id_sinistro =  Reparos.id_sinistro 
    INNER JOIN Apolices ON Sinistros.id_apolice = Apolices.id_apolice 
    INNER JOIN Aparelhos ON Apolices.id_aparelho = Aparelhos.id_aparelho 
    INNER JOIN Planos_Seguro ON Apolices.id_plano = Planos_Seguro.id_plano 
    WHERE Reparos.data_conclusao IS NOT NULL
    AND Reparos.data_conclusao >= Sinistros.data_ocorrencia 
)
SELECT modelo, nome_plano, CAST(AVG(dias_para_reparo) AS DECIMAL(5,2)) AS media_dias_reparo
FROM  TempoReparo
GROUP BY modelo, nome_plano
ORDER BY media_dias_reparo DESC;

--4-Qual o plano de seguro com maior índice de sinistros por apólices ativas? Trate dos casos de planos que não tenham apólices ativas.
SELECT Planos_Seguro.nome_plano, COALESCE(CAST(COALESCE(COUNT(DISTINCT Sinistros.id_sinistro), 0) * 1.0 / NULLIF(COUNT(DISTINCT Apolices.id_apolice), 0) AS DECIMAL(5,2)), 0) AS indice_sinistros 
FROM  Planos_Seguro 
LEFT JOIN  Apolices ON Planos_Seguro.id_plano = Apolices.id_plano AND Apolices.status_apolice = 'Ativa' 
LEFT JOIN  Sinistros ON Apolices.id_apolice = Sinistros.id_apolice 
GROUP BY  Planos_Seguro.id_plano, Planos_Seguro.nome_plano 
ORDER BY indice_sinistros DESC; 

--5-Quais clientes geraram mais despesas (reparos + reembolsos) para a seguradora?
SELECT Clientes.id_cliente, Clientes.nome,
    SUM(COALESCE(Reparos.custo_reparo, 0)) AS total_reparos,
    SUM(COALESCE(Pagamentos.valor_pago, 0)) AS total_pagamentos,
    SUM(COALESCE(Reparos.custo_reparo, 0) + COALESCE(Pagamentos.valor_pago, 0)) AS total_despesas,
    RANK() OVER (ORDER BY SUM(COALESCE(Reparos.custo_reparo, 0) + COALESCE(Pagamentos.valor_pago, 0)) DESC) AS posicao
FROM Clientes
INNER JOIN Aparelhos ON Clientes.id_cliente = Aparelhos.id_cliente
INNER JOIN Apolices ON Aparelhos.id_aparelho = Apolices.id_aparelho
LEFT JOIN Sinistros ON Apolices.id_apolice = Sinistros.id_apolice
LEFT JOIN Reparos ON Sinistros.id_sinistro = Reparos.id_sinistro
LEFT JOIN Pagamentos ON Apolices.id_apolice = Pagamentos.id_apolice AND Pagamentos.status_pagamento = 'Pago'
GROUP BY Clientes.id_cliente, Clientes.nome
ORDER BY posicao;

--6-Crie uma procedure que receba um ID de cliente e retorne: Dados cadastrais, Total de apólices, Total de sinistros, Valor total pago, Valor total de reparos
CREATE PROCEDURE sp_resumo_cliente @id_cliente INT AS
BEGIN
    DECLARE @total_apolices INT,
            @total_sinistros INT,
            @total_pago DECIMAL(10,2),
            @total_reparos DECIMAL(10,2);

    SELECT @total_apolices = COUNT(Apolices.id_apolice) 
    FROM Aparelhos
    INNER JOIN Apolices ON Aparelhos.id_aparelho = Apolices.id_aparelho
    WHERE Aparelhos.id_cliente = @id_cliente;

    SELECT @total_sinistros = COUNT(Sinistros.id_sinistro)
    FROM Aparelhos
    INNER JOIN Apolices ON Aparelhos.id_aparelho = Apolices.id_aparelho
    INNER JOIN Sinistros ON Apolices.id_apolice = Sinistros.id_apolice
    WHERE Aparelhos.id_cliente = @id_cliente;

    SELECT @total_pago = SUM(Pagamentos.valor_pago)
    FROM Aparelhos
    INNER JOIN Apolices ON Aparelhos.id_aparelho = Apolices.id_aparelho
    INNER JOIN Pagamentos ON Apolices.id_apolice = Pagamentos.id_apolice
    WHERE Aparelhos.id_cliente = @id_cliente;

    SELECT @total_reparos = SUM(Reparos.custo_reparo)
    FROM Aparelhos
    INNER JOIN Apolices ON Aparelhos.id_aparelho = Apolices.id_aparelho
    INNER JOIN Sinistros ON Apolices.id_apolice = Sinistros.id_apolice
    INNER JOIN Reparos ON Sinistros.id_sinistro = Reparos.id_sinistro
    WHERE Aparelhos.id_cliente = @id_cliente;

    SELECT Clientes.*, 
           @total_apolices AS total_apolices,
           @total_sinistros AS total_sinistros,
           @total_pago AS total_pago,
           @total_reparos AS total_reparos
    FROM Clientes
    WHERE Clientes.id_cliente = @id_cliente;
END;

EXEC sp_resumo_cliente @id_cliente = 3;
