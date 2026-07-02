# GrupoF-ProjetoFinal-eEDB-016 ---


# Marketplace utilizando Amazon DynamoDB

Projeto desenvolvido para a disciplina **Repositórios de Dados e NoSQL (eEDB-016)** do Curso de Especialização em Big Data da Escola Politécnica da USP.

## Objetivo

O objetivo deste projeto é demonstrar a modelagem de um marketplace utilizando o **Amazon DynamoDB**, aplicando os conceitos de **Query-First Design** e **Single Table Design** para construir uma solução NoSQL voltada para aplicações transacionais com alta escalabilidade.

O sistema simula um marketplace composto por diversos vendedores e um catálogo de produtos distribuídos em diferentes categorias. O foco da modelagem foi otimizar os principais padrões de acesso da aplicação, reduzindo a necessidade de múltiplas consultas e eliminando operações de JOIN, típicas de bancos relacionais.

---

# Justificativa da escolha do DynamoDB

O Amazon DynamoDB foi escolhido por atender às principais características do domínio da aplicação:

- baixa latência para leitura e escrita;
- escalabilidade horizontal automática;
- modelo de dados chave-valor/documento;
- armazenamento de documentos JSON;
- excelente desempenho para consultas orientadas por chave;
- suporte à abordagem Query-First Design;
- facilidade de implementação utilizando Single Table Design.

Como a maior parte das operações do marketplace consiste em consultas rápidas de usuários, produtos, carrinhos e pedidos, o DynamoDB mostrou-se adequado para esse cenário.

---

# Arquitetura da Modelagem

O projeto utiliza a abordagem **Single Table Design**, onde todas as entidades são armazenadas em uma única tabela denominada **Marketplace**.

Cada registro é identificado pelas chaves:

- **PK (Partition Key)**
- **SK (Sort Key)**

Essa estratégia permite armazenar diferentes tipos de registros na mesma tabela, mantendo os agregados organizados e permitindo consultas eficientes.

Exemplos de registros armazenados:

- Usuários
- Produtos
- Pedidos
- Itens de Pedido
- Recomendações

---

# Estrutura do Repositório

```text
.
├── Create-table-Marketplace-DynamoDB.sh
├── DDL-Marketplace-table-DynamoDB.json
├── eEDB016-TrabalhoFinal-Inserts-DynamoDB.json
├── Consultas-tabela-Marketplace.sh
└── README.md
```

## Descrição dos arquivos

### DDL-Marketplace-table-DynamoDB.json

Contém a definição da tabela DynamoDB, incluindo PK, SK e configurações de criação.

### Create-table-Marketplace-DynamoDB.sh

Script responsável por criar a tabela Marketplace utilizando a AWS CLI.

### eEDB016-TrabalhoFinal-Inserts-DynamoDB.json

Arquivo contendo os dados fictícios utilizados para popular a tabela através do comando `batch-write-item`.

### Consultas-tabela-Marketplace.sh

Script contendo as consultas e operações de validação da Proof of Concept (PoC), incluindo inserções, consultas, atualizações e verificações dos padrões de acesso.

---

# Padrões de Acesso Implementados

- **PA1** – Cadastro de Usuário
- **PA2** – Buscar Produtos
- **PA3** – Adicionar Produto ao Carrinho
- **PA4** – Visualizar Carrinho
- **PA5** – Carregar Produto

---

# Fluxo de Execução

1. Criar a tabela:
   ```bash
   sh Create-table-Marketplace-DynamoDB.sh
   ```

2. Popular o banco:
   ```bash
   aws dynamodb batch-write-item \
   --request-items file://eEDB016-TrabalhoFinal-Inserts-DynamoDB.json
   ```

3. Executar as consultas:
   ```bash
   sh Consultas-tabela-Marketplace.sh
   ```

---

# Tecnologias Utilizadas

- Amazon DynamoDB
- AWS CLI
- AWS Cloud9
- JSON
- Shell Script (Bash)

---

# Resultados

A implementação demonstrou a viabilidade da modelagem utilizando **Single Table Design**, permitindo consultas eficientes e alinhadas aos padrões definidos pelo **Query-First Design**.

---

# Autores

Projeto desenvolvido para a disciplina **Repositórios de Dados e NoSQL (eEDB-016)** do Curso de Especialização em Big Data da Escola Politécnica da USP.
