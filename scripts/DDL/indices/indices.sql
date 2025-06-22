-- Consulta 1, 5 e 6: otimiza agregações e joins por cliente
CREATE NONCLUSTERED INDEX idx_clientes_id ON Clientes (id_cliente)
INCLUDE (nome);

-- Consulta 2, 3, 5 e 6: otimiza joins por cliente e agrupamentos por modelo
CREATE NONCLUSTERED INDEX idx_aparelhos_cliente ON Aparelhos (id_cliente)
INCLUDE (modelo);

-- Consulta 2 e 3: melhora agrupamento e ordenação por modelo
CREATE NONCLUSTERED INDEX idx_aparelhos_modelo ON Aparelhos (modelo);

-- Consulta 3 e 4: otimiza joins e agrupamentos por plano
CREATE NONCLUSTERED INDEX idx_planos_id ON Planos_Seguro (id_plano)
INCLUDE (nome_plano);

-- Consulta 1 (NOVO): Para filtrar e juntar planos de seguro por nome
CREATE NONCLUSTERED INDEX idx_planos_nome_id ON Planos_Seguro (nome_plano)
INCLUDE (id_plano);

-- Consulta 3, 4, 5 e 6: melhora joins entre Aparelhos e Apólices
CREATE NONCLUSTERED INDEX idx_apolices_aparelho ON Apolices (id_aparelho)
INCLUDE (id_plano, status_apolice);

-- Consulta 4: otimiza filtro por status_apolice
CREATE NONCLUSTERED INDEX idx_apolices_status ON Apolices (status_apolice)
INCLUDE (id_plano, id_apolice);

-- Consulta 1, 3, 5 e 6: melhora filtro por data e joins com Apólices
CREATE NONCLUSTERED INDEX idx_sinistros_apolice ON Sinistros (id_apolice)
INCLUDE (data_ocorrencia, tipo_ocorrencia, status_sinistro);

-- Consulta 1 e 3: melhora filtragem por data (Pode ser coberto por idx_sinistros_apolice para estas consultas)
CREATE NONCLUSTERED INDEX idx_sinistros_data ON Sinistros (data_ocorrencia)
INCLUDE (id_apolice, tipo_ocorrencia);

-- Consulta 3, 5 e 6: melhora cálculo de tempo e custo de reparos
CREATE NONCLUSTERED INDEX idx_reparos_sinistro ON Reparos (id_sinistro)
INCLUDE (data_envio, data_conclusao, custo_reparo);

-- Consulta 5 e 6: melhora agregações financeiras por apólice
CREATE NONCLUSTERED INDEX idx_pagamentos_apolice ON Pagamentos (id_apolice)
INCLUDE (valor_pago, status_pagamento);

-- Consulta 5: melhora filtro por pagamentos pagos (Não diretamente usado nesta consulta, mas bom para outras)
CREATE NONCLUSTERED INDEX idx_pagamentos_status ON Pagamentos (status_pagamento)
INCLUDE (valor_pago, data_pagamento);

-- Consulta 6:
CREATE NONCLUSTERED INDEX idx_clientes_id_endereco ON Clientes (id_endereco);
