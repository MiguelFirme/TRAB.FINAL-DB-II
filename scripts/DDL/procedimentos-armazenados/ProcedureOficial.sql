--A procedure lista os 5 modelos de aparelhos com maior custo médio de reparo (acima de R$ 2.000), filtrando por data e quantidade mínima de reparos.
Ela ranqueia os modelos com base nesse custo médio.
CREATE PROCEDURE RankingCustoAparelhos
    @data_inicio DATE = NULL,
    @data_fim DATE = NULL,
    @min_reparos INT = 1
AS
BEGIN
    SET NOCOUNT ON;

    WITH RankingCTE AS (
    SELECT 
        a.modelo,
        COUNT(r.id_reparo) AS qtd_reparos,
        AVG(r.custo_reparo) AS custo_medio_reparo,
        RANK() OVER (ORDER BY AVG(r.custo_reparo) DESC) AS posicao_ranking
    FROM Aparelhos a
    JOIN Apolices ap ON ap.id_aparelho = a.id_aparelho
    JOIN Sinistros s ON s.id_apolice = ap.id_apolice
    JOIN Reparos r ON r.id_sinistro = s.id_sinistro
    WHERE 
        (@data_inicio IS NULL OR r.data_conclusao >= @data_inicio)
        AND (@data_fim IS NULL OR r.data_conclusao <= @data_fim)
    GROUP BY a.modelo
    HAVING COUNT(r.id_reparo) >= @min_reparos)
        
    SELECT TOP 5
        modelo,
        qtd_reparos,
        custo_medio_reparo,
        posicao_ranking
    FROM RankingCTE
    WHERE custo_medio_reparo > 2000.00
    ORDER BY posicao_ranking;

END;
