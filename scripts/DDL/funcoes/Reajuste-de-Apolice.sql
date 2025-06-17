CREATE FUNCTION dbo.AjusteApolice
(
    @id_aparelho INT,
    @valor_base DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @valor_final DECIMAL(10,2);
    DECLARE @media_intervalo INT;

    ;WITH SinistrosOrdenados AS (
        SELECT 
            s.id_sinistro,
            s.data_ocorrencia,
            LAG(s.data_ocorrencia) OVER (ORDER BY s.data_ocorrencia) AS data_anterior
        FROM Sinistros s
        JOIN Apolices ap ON ap.id_apolice = s.id_apolice
        WHERE ap.id_aparelho = @id_aparelho
    )
    SELECT @media_intervalo = AVG(DATEDIFF(DAY, data_anterior, data_ocorrencia))
    FROM SinistrosOrdenados
    WHERE data_anterior IS NOT NULL;

    IF @media_intervalo IS NOT NULL AND @media_intervalo < 30
        SET @valor_final = @valor_base * 1.2;  -- +20%
    ELSE IF @media_intervalo < 60
        SET @valor_final = @valor_base * 1.1;  -- +10%
    ELSE IF @media_intervalo > 180
        SET @valor_final = @valor_base * 0.9;  -- -10%
    ELSE
        SET @valor_final = @valor_base;

    RETURN @valor_final;
END;
