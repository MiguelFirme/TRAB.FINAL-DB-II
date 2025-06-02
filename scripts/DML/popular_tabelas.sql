INSERT INTO Enderecos (logradouro, numero, complemento, bairro, cidade, estado, cep) VALUES
('Rua A', '100', 'Apto 1', 'Centro', 'São Paulo', 'SP', '01001000'),
('Rua B', '200', NULL, 'Bela Vista', 'São Paulo', 'SP', '01310000'),
('Rua C', '300', NULL, 'Liberdade', 'São Paulo', 'SP', '01503000'),
('Rua D', '400', 'Casa', 'Mooca', 'São Paulo', 'SP', '03103000'),
('Rua E', '500', NULL, 'Pinheiros', 'São Paulo', 'SP', '05422000'),
('Rua F', '600', NULL, 'Lapa', 'São Paulo', 'SP', '05072000'),
('Rua G', '700', 'Fundos', 'Tatuapé', 'São Paulo', 'SP', '03310000'),
('Rua H', '800', NULL, 'Ipiranga', 'São Paulo', 'SP', '04210000'),
('Rua I', '900', NULL, 'Santana', 'São Paulo', 'SP', '02410000'),
('Rua J', '1000', NULL, 'Vila Mariana', 'São Paulo', 'SP', '04110000');


INSERT INTO Clientes (id_endereco, nome, cpf, email, telefone, data_cadastro) VALUES
(1, 'João Silva', '12345678901', 'joao.silva@gmail.com', '11999990001', GETDATE()),
(2, 'Maria Souza', '23456789012', 'maria.souza@gmail.com', '11999990002', GETDATE()),
(3, 'Pedro Santos', '34567890123', 'pedro.santos@gmail.com', '11999990003', GETDATE()),
(4, 'Ana Costa', '45678901234', 'ana.costa@gmail.com', '11999990004', GETDATE()),
(5, 'Lucas Lima', '56789012345', 'lucas.lima@gmail.com', '11999990005', GETDATE()),
(6, 'Carla Rocha', '67890123456', 'carla.rocha@gmail.com', '11999990006', GETDATE()),
(7, 'Paulo Mendes', '78901234567', 'paulo.mendes@gmail.com', '11999990007', GETDATE()),
(8, 'Juliana Alves', '89012345678', 'juliana.alves@gmail.com', '11999990008', GETDATE()),
(9, 'Fernando Pires', '90123456789', 'fernando.pires@gmail.com', '11999990009', GETDATE()),
(10, 'Larissa Dias', '01234567890', 'larissa.dias@gmail.com', '11999990010', GETDATE());


INSERT INTO Aparelhos (id_cliente, marca, modelo, imei, valor_mercado, ano_fabricacao) VALUES
(1, 'Samsung', 'Galaxy S21', '359881234567890', 3500.00, 2021),
(2, 'Apple', 'iPhone 13', '353456789012345', 5000.00, 2021),
(3, 'Motorola', 'Edge 20', '351234567890123', 2500.00, 2022),
(4, 'Xiaomi', 'Mi 11', '354567890123456', 3000.00, 2021),
(5, 'LG', 'Velvet', '356789012345678', 2200.00, 2020),
(6, 'Asus', 'ROG Phone 5', '358901234567890', 4000.00, 2021),
(7, 'OnePlus', '9 Pro', '352345678901234', 4200.00, 2021),
(8, 'Realme', 'GT Master', '355678901234567', 2000.00, 2022),
(9, 'Nokia', '8.3', '357890123456789', 1800.00, 2020),
(10, 'Sony', 'Xperia 5', '359012345678901', 3500.00, 2021);


INSERT INTO Planos_Seguro (nome_plano, descricao, valor, cobertura_roubo, cobertura_danos, cobertura_perda) VALUES
('Básico', 'Cobertura contra roubo', 29.90, 1, 0, 0),
('Intermediário', 'Roubo e danos acidentais', 49.90, 1, 1, 0),
('Completo', 'Cobertura total', 69.90, 1, 1, 1),
('Roubo+', 'Cobertura extra contra roubo', 39.90, 1, 0, 1),
('Danos+', 'Cobertura extra contra danos', 34.90, 0, 1, 0);


INSERT INTO Apolices (id_aparelho, id_plano, data_inicio_vigencia, data_fim_vigencia, valor_cobertura, valor_franquia, status_apolice) VALUES
(1, 1, GETDATE(), DATEADD(year, 1, GETDATE()), 3000.00, 300.00, 'Ativa'),
(2, 2, GETDATE(), DATEADD(year, 1, GETDATE()), 4500.00, 400.00, 'Ativa'),
(3, 3, GETDATE(), DATEADD(year, 1, GETDATE()), 2500.00, 250.00, 'Ativa'),
(4, 4, GETDATE(), DATEADD(year, 1, GETDATE()), 2800.00, 280.00, 'Ativa'),
(5, 5, GETDATE(), DATEADD(year, 1, GETDATE()), 2000.00, 200.00, 'Ativa'),
(6, 1, GETDATE(), DATEADD(year, 1, GETDATE()), 3500.00, 350.00, 'Ativa'),
(7, 2, GETDATE(), DATEADD(year, 1, GETDATE()), 4000.00, 400.00, 'Ativa'),
(8, 3, GETDATE(), DATEADD(year, 1, GETDATE()), 2000.00, 200.00, 'Ativa'),
(9, 4, GETDATE(), DATEADD(year, 1, GETDATE()), 1800.00, 180.00, 'Ativa'),
(10, 5, GETDATE(), DATEADD(year, 1, GETDATE()), 3500.00, 350.00, 'Ativa');


INSERT INTO Sinistros (id_apolice, data_ocorrencia, descricao, tipo_ocorrencia, status_sinistro) VALUES
(1, '2025-01-15', 'Roubo em via pública', 'Roubo', 'Em análise'),
(2, '2025-02-20', 'Queda do aparelho', 'Dano', 'Concluído'),
(3, '2025-03-05', 'Perda do aparelho', 'Perda', 'Em análise'),
(4, '2025-03-15', 'Roubo na residência', 'Roubo', 'Concluído'),
(5, '2025-04-10', 'Dano na tela', 'Dano', 'Em reparo'),
(6, '2025-04-20', 'Perda em viagem', 'Perda', 'Negado'),
(7, '2025-04-25', 'Roubo em transporte público', 'Roubo', 'Em análise'),
(8, '2025-05-01', 'Dano por água', 'Dano', 'Em análise'),
(9, '2025-05-10', 'Perda no shopping', 'Perda', 'Em análise'),
(10, '2025-05-15', 'Roubo na saída do trabalho', 'Roubo', 'Concluído');


INSERT INTO Reparos (id_sinistro, data_envio, data_conclusao, custo_reparo) VALUES
(2, '2025-02-21', '2025-03-01', 500.00),
(4, '2025-03-16', '2025-03-25', 700.00),
(5, '2025-04-11', '2025-04-20', 400.00),
(8, '2025-05-02', '2025-05-12', 600.00),
(10, '2025-05-16', '2025-05-25', 750.00);


INSERT INTO Pagamentos (id_apolice, data_pagamento, valor_pago, forma_pagamento, status_pagamento) VALUES
(1, GETDATE(), 29.90, 'Cartão', 'Pago'),
(2, GETDATE(), 49.90, 'Boleto', 'Pago'),
(3, GETDATE(), 69.90, 'Pix', 'Pago'),
(4, GETDATE(), 39.90, 'Cartão', 'Pago'),
(5, GETDATE(), 34.90, 'Boleto', 'Pendente'),
(6, GETDATE(), 29.90, 'Cartão', 'Pago'),
(7, GETDATE(), 49.90, 'Pix', 'Pago'),
(8, GETDATE(), 69.90, 'Cartão', 'Pago'),
(9, GETDATE(), 39.90, 'Boleto', 'Pendente'),
(10, GETDATE(), 34.90, 'Pix', 'Pago');
