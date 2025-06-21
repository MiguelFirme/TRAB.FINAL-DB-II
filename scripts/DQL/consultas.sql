---1-Quais clientes, que possuem apólices de plano Prata ou superior, tiveram mais de um sinistro do tipo 'Roubo' ou 'Dano', com status diferente de 'Negado', ocorridos nos últimos 12 meses?
SELECT 
    Clientes.nome AS NomeCliente,
    COUNT(Sinistros.id_sinistro) AS QuantidadeSinistros
FROM Clientes
INNER JOIN Apolices ON Clientes.id_cliente = Apolices.id_cliente
INNER JOIN Planos_Seguro ON Apolices.id_plano = Planos_Seguro.id_plano
INNER JOIN Sinistros ON Apolices.id_apolice = Sinistros.id_apolice
WHERE 
    Planos_Seguro.nome_plano IN ('Prata', 'Ouro', 'Diamante')
    AND Sinistros.tipo_ocorrencia IN ('Roubo', 'Dano')
    AND Sinistros.status_sinistro <> 'Negado'
    AND Sinistros.data_ocorrencia >= DATEADD(MONTH, -12, GETDATE())
GROUP BY Clientes.nome
HAVING COUNT(Sinistros.id_sinistro) > 1
ORDER BY QuantidadeSinistros DESC;

--2-Quais os 5 modelos de aparelhos possuem o maior custo médio de reparo acima de 2000.00 e qual a posição de cada um no ranking?
WITH CTE AS ( 
    SELECT  
        Aparelhos.modelo, 
        AVG(Reparos.custo_reparo) AS custo_medio 
    FROM Aparelhos 
    INNER JOIN Apolices ON Aparelhos.id_aparelho = Apolices.id_aparelho
    INNER JOIN Sinistros ON Apolices.id_apolice = Sinistros.id_apolice
    INNER JOIN Reparos ON Sinistros.id_sinistro = Reparos.id_sinistro
    GROUP BY Aparelhos.modelo
),
CTE_RANK AS ( 
    SELECT 
        modelo, 
        custo_medio, 
        RANK() OVER (ORDER BY custo_medio DESC) AS posicao 
    FROM CTE
    WHERE custo_medio > 2000  
)
SELECT * 
FROM CTE_RANK
WHERE posicao <= 5;

--3-Qual a média de tempo (em dias) entre a ocorrência do sinistro e a conclusão do reparo, segmentada por modelo do aparelho e plano de seguro contratado?
WITH TempoReparo AS (
    SELECT 
        Aparelhos.modelo, 
        Planos_Seguro.nome_plano, 
        DATEDIFF(DAY, Sinistros.data_ocorrencia, Reparos.data_conclusao) AS dias_para_reparo 
    FROM Sinistros 
    INNER JOIN Reparos ON Sinistros.id_sinistro = Reparos.id_sinistro 
    INNER JOIN Apolices ON Sinistros.id_apolice = Apolices.id_apolice 
    INNER JOIN Aparelhos ON Apolices.id_aparelho = Aparelhos.id_aparelho 
    INNER JOIN Planos_Seguro ON Apolices.id_plano = Planos_Seguro.id_plano 
    WHERE Reparos.data_conclusao IS NOT NULL
    AND Reparos.data_conclusao >= Sinistros.data_ocorrencia 
)
SELECT 
    modelo, 
    nome_plano, 
    CAST(AVG(dias_para_reparo) AS DECIMAL(5,2)) AS media_dias_reparo
FROM TempoReparo
GROUP BY modelo, nome_plano
ORDER BY media_dias_reparo DESC;

--4-Qual o plano de seguro com maior índice de sinistros por apólices ativas? Trate dos casos de planos que não tenham apólices ativas.
SELECT 
    Planos_Seguro.nome_plano, 
    COALESCE(CAST(COALESCE(COUNT(DISTINCT Sinistros.id_sinistro), 0) * 1.0 / NULLIF(COUNT(DISTINCT Apolices.id_apolice), 0) AS DECIMAL(5,2)), 0) AS indice_sinistros 
FROM Planos_Seguro 
LEFT JOIN Apolices ON Planos_Seguro.id_plano = Apolices.id_plano AND Apolices.status_apolice = 'Ativa' 
LEFT JOIN Sinistros ON Apolices.id_apolice = Sinistros.id_apolice 
GROUP BY Planos_Seguro.id_plano, Planos_Seguro.nome_plano 
ORDER BY indice_sinistros DESC;

--5-Quais clientes, com apólices ativas, que tiveram sinistros concluídos nos últimos 6 meses e cujo tipo de ocorrência foi 'Roubo' ou 'Dano', geraram mais despesas para a seguradora, considerando apenas os custos de reparos?
SELECT 
    Clientes.nome AS NomeCliente,
    SUM(ISNULL(Reparos.custo_reparo, 0)) AS TotalDespesas
FROM Clientes
INNER JOIN Apolices ON Clientes.id_cliente = Apolices.id_cliente
INNER JOIN Sinistros ON Apolices.id_apolice = Sinistros.id_apolice
LEFT JOIN Reparos ON Sinistros.id_sinistro = Reparos.id_sinistro
WHERE 
    Apolices.status_apolice = 'Ativa'
    AND Sinistros.status_sinistro = 'Concluído'
    AND Sinistros.data_ocorrencia >= DATEADD(MONTH, -6, GETDATE())
    AND Sinistros.tipo_ocorrencia IN ('Roubo', 'Dano')
GROUP BY Clientes.nome
ORDER BY TotalDespesas DESC;

--6-Faça um consulta por ID de um cliente e retorne: Dados cadastrais, Total de apólices, Total de sinistros, Valor total pago, Valor total de reparos. Ou seja, a ficha de um cliente.
CREATE OR ALTER PROCEDURE sp_resumo_cliente @id_cliente INT AS
BEGIN
    DECLARE @total_apolices INT,
            @total_sinistros INT,
            @total_pago DECIMAL(10,2),
            @total_reparos DECIMAL(10,2);

    SELECT @total_apolices = COUNT(*) 
    FROM Apolices 
    WHERE id_cliente = @id_cliente;

    SELECT @total_sinistros = COUNT(*) 
    FROM Apolices
    INNER JOIN Sinistros ON Apolices.id_apolice = Sinistros.id_apolice
    WHERE Apolices.id_cliente = @id_cliente;

    SELECT @total_pago = SUM(valor_pago)
    FROM Apolices
    INNER JOIN Pagamentos ON Apolices.id_apolice = Pagamentos.id_apolice
    WHERE Apolices.id_cliente = @id_cliente AND Pagamentos.status_pagamento = 'Pago';

    SELECT @total_reparos = SUM(Reparos.custo_reparo)
    FROM Apolices
    INNER JOIN Sinistros ON Apolices.id_apolice = Sinistros.id_apolice
    INNER JOIN Reparos ON Sinistros.id_sinistro = Reparos.id_sinistro
    WHERE Apolices.id_cliente = @id_cliente;

    SELECT 
        Clientes.*, 
        @total_apolices AS total_apolices,
        @total_sinistros AS total_sinistros,
        @total_pago AS total_pago,
        @total_reparos AS total_reparos
    FROM Clientes
    WHERE id_cliente = @id_cliente;
END;

EXEC sp_resumo_cliente @id_cliente = 1;
