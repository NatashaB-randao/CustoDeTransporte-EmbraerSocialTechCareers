-- "Destino" em BD_aumentado_comercial é referência para o País em BD_País_e_CiaAerea.
-- Pode-se criar a chave estrangeira da seguinte forma:

-- Adicionando chave estrangeira na tabela BD_aumentado_comercial
ALTER TABLE BD_aumentado_comercial
ADD CONSTRAINT fk_destino_pais
FOREIGN KEY (Destino) REFERENCES BD_País_e_CiaAerea(País);

-- Esta instrução ALTER TABLE cria uma chave estrangeira chamada fk_destino_pais na tabela BD_aumentado_comercial,
-- que faz referência à coluna País na tabela BD_País_e_CiaAerea.