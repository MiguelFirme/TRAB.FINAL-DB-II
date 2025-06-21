CREATE OR ALTER TRIGGER trg_sinistro_reincidente
ON Sinistros
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Atualiza o status da apólice para 'Cliente Reincidente' se o cliente tiver mais de 1 sinistro nos últimos 12 meses
    UPDATE ap
    SET ap.status_apolice = 'Cliente Reincidente'
    FROM Apolices ap
    INNER JOIN inserted i ON ap.id_apolice = i.id_apolice
    INNER JOIN Aparelhos a ON ap.id_aparelho = a.id_aparelho
    INNER JOIN Clientes c ON a.id_cliente = c.id_cliente
    WHERE (
        SELECT COUNT(s2.id_sinistro)
        FROM Sinistros s2
        INNER JOIN Apolices ap2 ON s2.id_apolice = ap2.id_apolice
        INNER JOIN Aparelhos a2 ON ap2.id_aparelho = a2.id_aparelho
        WHERE 
            a2.id_cliente = c.id_cliente
            AND s2.data_ocorrencia >= DATEADD(MONTH, -12, GETDATE())
    ) > 1
    AND ap.status_apolice = 'Ativa';
END;
