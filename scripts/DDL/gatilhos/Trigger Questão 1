CREATE TRIGGER trg_sinistro_reincidente
ON Sinistros
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Atualiza o status_sinistro para 'Reincidente' caso o cliente tenha mais de 1 sinistro no período de 12 meses
    UPDATE s
    SET s.status_sinistro = 'Reincidente'
    FROM Sinistros s
    INNER JOIN INSERTED i ON s.id_sinistro = i.id_sinistro
    INNER JOIN Apolices ap ON s.id_apolice = ap.id_apolice
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
    ) > 1;
END;

