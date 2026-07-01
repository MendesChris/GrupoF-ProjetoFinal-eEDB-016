
#  Padrão de Acesso 1 – Cadastro de Usuário 

aws dynamodb put-item \
    --table-name Marketplace \
    --item '{
        "PK":{"S":"USER#USR006"},
        "SK":{"S":"PROFILE"},
        "Nome":{"S":"João Silva"},
        "Email":{"S":"joao@email.com"},
        "Telefone":{"S":"11999998888"},
        "Endereco":{"S":"São Paulo-SP"},
        "DataCadastro":{"S":"2026-07-01"}
    }'




# Padrão de Acesso 2 – Buscar Produtos

aws dynamodb get-item \
    --table-name Marketplace \
    --key '{
        "PK":{"S":"PRODUCT#PROD001"},
        "SK":{"S":"DETAIL"}
    }'


# 2.2 Buscar todos os produtos

aws dynamodb scan \
    --table-name Marketplace \
    --filter-expression "begins_with(PK,:pk)" \
    --expression-attribute-values '{
        ":pk":{"S":"PRODUCT#"}
    }'


# 2.3 Buscar produtos por categoria (GSI)

aws dynamodb query \
    --table-name Marketplace \
    --index-name CategoriaIndex \
    --key-condition-expression "categoria = :c" \
    --expression-attribute-values '{
        ":c":{"S":"Canecas"}
    }'


# Padrão de Acesso 3 – Adicionar Produto ao Carrinho

aws dynamodb put-item \
    --table-name Marketplace \
    --item '{
        "PK":{"S":"USER#USR001"},
        "SK":{"S":"CART#PROD001"},
        "ProductID":{"S":"PROD001"},
        "NomeProduto":{"S":"Quadro Premium"},
        "Quantidade":{"N":"2"},
        "Preco":{"N":"448.00"}
    }'


# Padrão de Acesso 4 – Visualizar Carrinho

aws dynamodb query \
    --table-name Marketplace \
    --key-condition-expression "PK = :pk AND begins_with(SK,:sk)" \
    --expression-attribute-values '{
        ":pk":{"S":"USER#USR001"},
        ":sk":{"S":"CART#"}
    }'


# Padrão de Acesso 5 – Carregar Produto

aws dynamodb get-item \
    --table-name Marketplace \
    --key '{
        "PK":{"S":"PRODUCT#PROD001"},
        "SK":{"S":"DETAIL"}
    }'






###########################################################################################################
###########################################################################################################





# Alterar o status de um pedido

aws dynamodb update-item \
    --table-name Marketplace \
    --key '{
        "PK":{"S":"USER#USR001"},
        "SK":{"S":"ORDER#ORD001"}
    }' \
    --update-expression "SET #status = :status" \
    --expression-attribute-names '{
        "#status":"Status"
    }' \
    --expression-attribute-values '{
        ":status":{"S":"Enviado"}
    }'


# Alterar o estoque de um produto

aws dynamodb update-item \
    --table-name Marketplace \
    --key '{
        "PK":{"S":"PRODUCT#PROD001"},
        "SK":{"S":"DETAIL"}
    }' \
    --update-expression "SET Estoque = :estoque" \
    --expression-attribute-values '{
        ":estoque":{"N":"35"}
    }'


# Alterar telefone e endereço simultaneamente

aws dynamodb update-item \
    --table-name Marketplace \
    --key '{
        "PK":{"S":"USER#USR001"},
        "SK":{"S":"PROFILE"}
    }' \
    --update-expression "SET Telefone = :tel, Endereco = :end" \
    --expression-attribute-values '{
        ":tel":{"S":"11988887777"},
        ":end":{"S":"Campinas-SP"}
    }'

