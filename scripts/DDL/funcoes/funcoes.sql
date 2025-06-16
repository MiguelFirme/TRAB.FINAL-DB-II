-- 5-Quais clientes geraram mais despesas (reparos + reembolsos) para a seguradora?

CREATE FUNCTION CustoPorCliente (@id_cliente INT)
RETURNS DECIMAL(18,2)
AS
BEGIN
    DECLARE @total DECIMAL(18,2)

    SELECT @total = 
        ISNULL(SUM(r.custo_reparo), 0) + ISNULL(SUM(p.valor_pago), 0)
    FROM Aparelhos a
    JOIN Apolices ap ON ap.id_aparelho = a.id_aparelho
    LEFT JOIN Sinistros s ON s.id_apolice = ap.id_apolice
    LEFT JOIN Reparos r ON r.id_sinistro = s.id_sinistro
    LEFT JOIN Pagamentos p ON p.id_apolice = ap.id_apolice
    WHERE a.id_cliente = @id_cliente

    RETURN @total
END

