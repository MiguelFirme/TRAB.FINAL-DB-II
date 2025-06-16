CREATE PROCEDURE sp_info_cliente_completa
    @id_cliente INT
AS
BEGIN
    SELECT
        -- Dados cadastrais
        c.nome,
        c.cpf,
        c.email,
        c.telefone,
        c.data_cadastro,
        e.logradouro,
        e.numero,
        e.complemento,
        e.bairro,
        e.cidade,
        e.estado,
        e.cep,

        -- Totais e somatórios
        COUNT(DISTINCT ap.id_apolice) AS total_apolices,
        COUNT(DISTINCT s.id_sinistro) AS total_sinistros,
        ISNULL(SUM(DISTINCT pg.valor_pago), 0) AS valor_total_pago,
        ISNULL(SUM(DISTINCT r.custo_reparo), 0) AS valor_total_reparos

    FROM Clientes c
    LEFT JOIN Enderecos e ON c.id_endereco = e.id_endereco
    LEFT JOIN Aparelhos a ON c.id_cliente = a.id_cliente
    LEFT JOIN Apolices ap ON a.id_aparelho = ap.id_aparelho
    LEFT JOIN Pagamentos pg ON ap.id_apolice = pg.id_apolice
    LEFT JOIN Sinistros s ON ap.id_apolice = s.id_apolice
    LEFT JOIN Reparos r ON s.id_sinistro = r.id_sinistro

    WHERE c.id_cliente = @id_cliente

    GROUP BY
        c.nome, c.cpf, c.email, c.telefone, c.data_cadastro,
        e.logradouro, e.numero, e.complemento, e.bairro,
        e.cidade, e.estado, e.cep
END

EXEC sp_info_cliente_completa @id_cliente = (Num);
