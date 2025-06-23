# 📱 Seguro para Celulares — Projeto de Banco de Dados
Este repositório contém o projeto final da disciplina de Banco de Dados, desenvolvido com base em metodologias ativas de aprendizagem. O projeto tem como tema “Seguro para Celulares” e envolve a construção completa de um sistema que simula a gestão de contratos de seguro, clientes, dispositivos móveis e operações associadas.

## 🧠 Objetivo
Criar um banco de dados relacional e um sistema funcional para o gerenciamento de seguros de celulares, aplicando práticas de modelagem, normalização, desenvolvimento de scripts SQL e integração com um CRUD em linguagem de programação.

## 🔧 Tecnologias Utilizadas
Banco de Dados: SQL Server
Linguagem para CRUD: PHP

- XAMPP: [ Baixar XAMPP ](https://www.apachefriends.org/pt_br/download.html)
- SQL Server Express: [ Baixar SQL Server Express (Escolha a versão "Express") ](https://www.microsoft.com/pt-br/download/details.aspx?id=101064&msockid=3c0062b270376da23cfd74a671cc6c88)
- Microsoft SQL Server Management Studio (SSMS): [ Baixar SSMS ](https://learn.microsoft.com/pt-pt/ssms/install/install)
- Microsoft Drivers for PHP for SQL Server: [(Procure por SQLSRV_82_TS.zip (Thread Safe) ou SQLSRV_82_NTS.zip (Non-Thread Safe))](https://learn.microsoft.com/en-us/sql/connect/php/download-drivers-php-sql-server?view=sql-server-ver17)

## 👥 Integrantes
- Ana Julia Vieira Lidorio — anajulidorio
- Ana Laura Vicenzi Dordete — anaavicenzi
- João Gustavo Rodovanski Vitali - gutinjao22
- Lara da Rosa Dondossola — laradondossola
- Lorenzo Viero Sartori — loren1z9o
- Miguel Antônio Gregório Firme — miguelfirme

## Modelo Físico
Utilizamos a ferramenta de modelagem de dados [dbdiagram.io](https://dbdiagram.io/) para a criação do nosso modelo físico do projeto e exportamos os scripts DDL a partir dele. 
Arquivo fonte: [Modelo Físico](https://dbdiagram.io/d/683508c16980ade2eb84272b) 

![Modelo Físico](https://github.com/MiguelFirme/TRAB.FINAL-DB-II/blob/main/modelo_fisico/Modelo%20F%C3%ADsico.png)

## Dicionário de Dados
As informações sobre as tabelas e índices, como nomes das colunas, tipos de dados, entre outras características, foram documentados na planilha: [Dicionário de Dados](https://github.com/MiguelFirme/TRAB.FINAL-DB-II/blob/main/Dicionario_dados/Dicionario%20de%20Dados.xlsx)

## Scripts SQL
Para o desenvolvimento deste projeto, utilizamos o banco de dados [Azure SQL](https://azure.microsoft.com/pt-br/products/azure-sql/database)

Abaixo, temos todos os scripts que foram usados no projeto:

### DDL
- [Script de Criação das Tabelas](https://github.com/MiguelFirme/TRAB.FINAL-DB-II/tree/main/scripts/DDL/tabelas)
- [Script de Criação dos Índices](https://github.com/MiguelFirme/TRAB.FINAL-DB-II/tree/main/scripts/DDL/indices)
- [Script de Criação dos Gatilhos](https://github.com/MiguelFirme/TRAB.FINAL-DB-II/tree/main/scripts/DDL/gatilhos)
- [Script de Criação dos Procedimentos Armazenados](https://github.com/MiguelFirme/TRAB.FINAL-DB-II/tree/main/scripts/DDL/procedimentos-armazenados)
- [Script de Criação das Funções](https://github.com/MiguelFirme/TRAB.FINAL-DB-II/tree/main/scripts/DDL/funcoes)

### DML 
- [Inserção de dados nas tabelas](https://github.com/MiguelFirme/TRAB.FINAL-DB-II/tree/main/scripts/DML)

### DQL
- [Script das consultas para as perguntas de negócio](https://github.com/MiguelFirme/TRAB.FINAL-DB-II/tree/main/scripts/DQL)

## Código Fonte de CRUD
- Linguagem de Programação PHP

## Passos para execução do CRUD
# Configure os drivers PHP para SQL Server
- Baixe os drivers adequados para sua versão do PHP
- Extraia os arquivos php_pdo_sqlsrv.dll e php_sqlsrv.dll para a pasta ext do seu PHP (ex: C:\xampp\php\ext).
- Edite o arquivo php.ini (localizado em C:\xampp\php\php.ini) e adicione as seguintes linhas:
extension=php_pdo_sqlsrv.dll extension=php_sqlsrv.dll

# Reinicie o Apache pelo painel de controle do XAMPP

# Inicialização do Banco de Dados
- Abra o SSMS e conecte-se ao servidor local.
-  Crie um novo banco de dados com o nome desejado.
- Execute os scripts SQL fornecidos em [Script de Criação das Tabelas](https://github.com/MiguelFirme/TRAB.FINAL-DB-II/tree/main/scripts/DDL/tabelas) e [Inserção de dados nas tabelas](https://github.com/MiguelFirme/TRAB.FINAL-DB-II/tree/main/scripts/DML) deste repositório para criar as tabelas e popular os dados iniciais.

# Inicialização da aplicação
- Clone este repositório dentro da pasta htdocs do XAMPP (exemplo: C:\xampp\htdocs\crud)
- Configure as variáveis de conexão com o banco de dados no arquivo de configuração da aplicação
- Inicie o Apache no painel de controle do XAMPP
- Acesse o localhost na porta configurada no Apache para visualizar a aplicação rodando

## Relatório Final
O relatório final pode ser acessado no arquivo: [Relatório Final](https://github.com/MiguelFirme/TRAB.FINAL-DB-II/blob/main/relat%C3%B3rio_final/relat%C3%B3rio%20final.pdf)
