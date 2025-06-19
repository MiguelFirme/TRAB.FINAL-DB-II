INSERT INTO Enderecos (logradouro, numero, complemento, bairro, cidade, estado, cep) VALUES
('Rua das Flores', '100', 'Apto 1', 'Centro', 'Curitiba', 'PR', '80010000'),
('Av. Paulista', '2000', NULL, 'Bela Vista', 'São Paulo', 'SP', '01310000'),
('Rua da Aurora', '300', NULL, 'Boa Vista', 'Recife', 'PE', '50050000'),
('Rua Goiás', '400', 'Casa', 'Savassi', 'Belo Horizonte', 'MG', '30140000'),
('Av. Sete de Setembro', '500', NULL, 'Campo Grande', 'Salvador', 'BA', '40060000'),
('Rua João Pessoa', '600', NULL, 'Centro', 'Porto Alegre', 'RS', '90010000'),
('Rua 24 de Outubro', '700', 'Fundos', 'Vila Isabel', 'Rio de Janeiro', 'RJ', '20560000'),
('Rua das Acácias', '800', NULL, 'Meireles', 'Fortaleza', 'CE', '60160000'),
('Rua Afonso Pena', '900', NULL, 'Centro', 'Campo Grande', 'MS', '79002000'),
('Rua Pará', '1100', NULL, 'Marco', 'Belém', 'PA', '66093000'),
('Av. Frei Serafim', '1200', 'Sala 202', 'Centro', 'Teresina', 'PI', '64001020'),
('Rua XV de Novembro', '1500', 'Fundos', 'Centro', 'Florianópolis', 'SC', '88010000');

INSERT INTO Clientes (id_endereco, nome, cpf, email, telefone, data_cadastro) VALUES
(1, 'João Silva', '12345678901', 'joao.silva@gmail.com', '41999990001', GETDATE()),
(2, 'Maria Souza', '23456789012', 'maria.souza@gmail.com', '11999990002', GETDATE()),
(3, 'Pedro Santos', '34567890123', 'pedro.santos@gmail.com', '81999990003', GETDATE()),
(4, 'Ana Costa', '45678901234', 'ana.costa@gmail.com', '31999990004', GETDATE()),
(5, 'Lucas Lima', '56789012345', 'lucas.lima@gmail.com', '71999990005', GETDATE()),
(6, 'Carla Rocha', '67890123456', 'carla.rocha@gmail.com', '51999990006', GETDATE()),
(7, 'Paulo Mendes', '78901234567', 'paulo.mendes@gmail.com', '21999990007', GETDATE()),
(8, 'Juliana Alves', '89012345678', 'juliana.alves@gmail.com', '85999990008', GETDATE()),
(9, 'Fernando Pires', '90123456789', 'fernando.pires@gmail.com', '67999990009', GETDATE()),
(10, 'Rafael Cardoso', '11223344556', 'rafael.cardoso@gmail.com', '91999990011', GETDATE()),
(11, 'Camila Nascimento', '22334455667', 'camila.nascimento@gmail.com', '86999990012', GETDATE()),
(12, 'Marcos Pereira', '55667788990', 'marcos.pereira@gmail.com', '48999990015', GETDATE());

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
(10, 'Sony', 'Xperia 5', '359012345678901', 3500.00, 2021),
(11, 'Samsung', 'Galaxy A54', '351234567891011', 1800.00, 2023),
(12, 'Apple', 'iPhone 12', '353456789013012', 4000.00, 2020);

INSERT INTO Planos_Seguro (nome_plano, descricao, valor, cobertura_roubo, cobertura_danos, cobertura_reposicao, cobertura_internacional)
VALUES
('Bronze', 'Quebra acidental e roubo/furto mediante arrombamento', 29.90, 1, 1, 0 , 0),
('Prata', 'Bronze + furto simples, danos elétricos e bloqueio remoto', 49.90, 1, 1, 0, 0),
('Ouro', 'Prata + reposição emergencial', 69.90, 1, 1, 1 , 0),
('Diamante', 'Ouro + cobertura internacional', 89.90, 1, 1, 1, 1);

INSERT INTO Apolices (id_aparelho, id_plano, data_inicio_vigencia, data_fim_vigencia, valor_cobertura, valor_franquia, status_apolice) VALUES
(1, 1, GETDATE(), DATEADD(year, 1, GETDATE()), 3000.00, 300.00, 'Ativa'),
(2, 2, GETDATE(), DATEADD(year, 1, GETDATE()), 4500.00, 400.00, 'Ativa'),
(3, 3, GETDATE(), DATEADD(year, 1, GETDATE()), 2500.00, 250.00, 'Ativa'),
(4, 4, GETDATE(), DATEADD(year, 1, GETDATE()), 2800.00, 280.00, 'Ativa'),
(5, 1, GETDATE(), DATEADD(year, 1, GETDATE()), 2000.00, 200.00, 'Ativa'),
(6, 2, GETDATE(), DATEADD(year, 1, GETDATE()), 3500.00, 300.00, 'Ativa'),
(7, 3, GETDATE(), DATEADD(year, 1, GETDATE()), 4000.00, 400.00, 'Ativa'),
(8, 4, GETDATE(), DATEADD(year, 1, GETDATE()), 2000.00, 200.00, 'Ativa'),
(9, 3, GETDATE(), DATEADD(year, 1, GETDATE()), 1800.00, 180.00, 'Ativa'),
(10, 2, GETDATE(), DATEADD(year, 1, GETDATE()), 3500.00, 350.00, 'Ativa'),
(11, 2, GETDATE(), DATEADD(YEAR, 1, GETDATE()), 1600.00, 160.00, 'Ativa'),
(12, 3, GETDATE(), DATEADD(YEAR, 1, GETDATE()), 3500.00, 350.00, 'Ativa');

INSERT INTO Sinistros (id_apolice, data_ocorrencia, descricao, tipo_ocorrencia, status_sinistro) VALUES
(1, '2024-01-15', 'Roubo em via pública', 'Roubo', 'Em análise'),
(2, '2025-02-20', 'Queda do aparelho', 'Dano', 'Concluído'),
(3, '2025-03-05', 'Perda do aparelho', 'Perda', 'Em análise'),
(4, '2024-02-27', 'Roubo na residência', 'Roubo', 'Concluído'),
(4, '2025-03-08', 'Perda em viagem internacional', 'Perda', 'Em análise'),
(4, '2023-12-15', 'Dano por água', 'Dano', 'Concluído'),
(5, '2025-04-10', 'Dano na tela', 'Dano', 'Em reparo'),
(5, '2024-06-25', 'Roubo na saída da escola', 'Roubo', 'Em análise'),
(6, '2024-04-20', 'Perda em viagem', 'Perda', 'Negado'),
(7, '2025-04-25', 'Roubo em transporte público', 'Roubo', 'Em análise'),
(8, '2023-05-01', 'Dano por água', 'Dano', 'Em análise'),
(8, '2024-10-12', 'Roubo no ônibus', 'Roubo', 'Concluído'),
(9, '2025-05-10', 'Perda no shopping', 'Perda', 'Em análise'),
(10, '2023-05-15', 'Roubo na saída do trabalho', 'Roubo', 'Concluído');

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
(4, GETDATE(), 89.90, 'Cartão', 'Pago'),
(5, GETDATE(), 29.90, 'Boleto', 'Pendente'),
(6, GETDATE(), 49.90, 'Cartão', 'Pago'),
(7, GETDATE(), 69.90, 'Pix', 'Pago'),
(8, GETDATE(), 89.90, 'Cartão', 'Pago'),
(9, GETDATE(), 29.90, 'Boleto', 'Pendente'),
(10, GETDATE(), 49.90, 'Pix', 'Pago'),
(11, GETDATE(), 49.90, 'Pix', 'Pago'),
(12, GETDATE(), 69.90, 'Cartão', 'Pago');

--Novos inserts para contemplar as perguntas 1 e 2

INSERT INTO Sinistros (id_apolice, data_ocorrencia, descricao, tipo_ocorrencia, status_sinistro)
VALUES (2, '2025-04-15', 'Queda novamente', 'Dano', 'Em análise'),
(3, '2025-05-10', 'Tentativa de roubo', 'Roubo', 'Concluído'),
(4, '2025-06-01', 'Dano acidental em viagem', 'Dano', 'Em análise'),
(6, '2025-05-18', 'Dano elétrico', 'Dano', 'Concluído'),
(11, '2025-06-10', 'Queda grave', 'Dano', 'Concluído'),
(12, '2025-06-12', 'Tela destruída', 'Dano', 'Concluído'),
(6, '2025-06-14', 'Bateria inchada', 'Dano', 'Concluído');

INSERT INTO Reparos (id_sinistro, data_envio, data_conclusao, custo_reparo) VALUES
(4, '2025-06-11', '2025-06-15', 30000.00),
(5, '2025-06-13', '2025-06-18', 40000.00),
(6, '2025-06-15', '2025-06-20', 35000.00);


