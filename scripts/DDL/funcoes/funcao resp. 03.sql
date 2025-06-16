-- Função de resposta a Pergunta 03

CREATE FUNCTION fn_TempoReparoSinistro (@id_sinistro INT)
RETURNS INT
AS
BEGIN
    DECLARE @dias INT

    SELECT @dias = 
        CASE 
            WHEN s.data_ocorrencia IS NOT NULL 
                 AND r.data_conclusao IS NOT NULL THEN 
                DATEDIFF(DAY, s.data_ocorrencia, r.data_conclusao)
            ELSE NULL
        END
    FROM Sinistros s
    JOIN Reparos r ON r.id_sinistro = s.id_sinistro
    WHERE s.id_sinistro = @id_sinistro

    RETURN @dias
END
