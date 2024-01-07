-- "Destino" em BD_aumentado_comercial é referência para o País em BD_País_e_CiaAerea.
-- Pode-se criar a chave estrangeira da seguinte forma:

-- 1. Supondo que a coluna 'Destino' seja do tipo TEXT
-- Altere o tipo de dados para VARCHAR com um comprimento máximo adequado
ALTER TABLE BD_aumentado_comercial
MODIFY Destino VARCHAR(255); -- Altere para o comprimento desejado

-- 2. Verificação de Dados (certifique-se de que não há valores nulos na coluna 'Destino')
SELECT *
FROM BD_aumentado_comercial
WHERE Destino IS NULL;

-- 3. Supondo que a coluna 'País' seja do tipo TEXT
-- Altere o tipo de dados para VARCHAR com um comprimento máximo adequado
ALTER TABLE BD_País_e_CiaAerea
MODIFY País VARCHAR(255); -- Altere para o comprimento desejado

-- 4. Verificação de Dados (certifique-se de que não há valores nulos na coluna 'País' em 'BD_País_e_CiaAerea')
SELECT *
FROM BD_País_e_CiaAerea
WHERE País IS NULL;

-- 5. Agora, adicione o índice à coluna 'País' em 'BD_País_e_CiaAerea'
CREATE INDEX idx_pais ON BD_País_e_CiaAerea(País);

-- 6. Verifique novamente se não há valores nulos na coluna 'País' em 'BD_País_e_CiaAerea'
SELECT *
FROM BD_País_e_CiaAerea
WHERE País IS NULL;

-- 7. Certifique-se de que todos os valores em Destino já existem em País
SELECT DISTINCT Destino
FROM BD_aumentado_comercial
WHERE Destino NOT IN (SELECT País FROM BD_País_e_CiaAerea);

-- 8. Desative temporariamente as verificações de chave estrangeira
SET foreign_key_checks = 0;

-- 9. Se o resultado for vazio, todos os valores já existem, então você pode adicionar a chave estrangeira
ALTER TABLE BD_aumentado_comercial
ADD CONSTRAINT fk_destino_pais
FOREIGN KEY (Destino) REFERENCES BD_País_e_CiaAerea(País);

-- Esse código SQL está adicionando uma restrição de chave estrangeira (FOREIGN KEY) à tabela BD_aumentado_comercial:

-- ALTER TABLE BD_aumentado_comercial: Indica que deseja fazer uma alteração na estrutura da tabela chamada BD_aumentado_comercial.
-- ADD CONSTRAINT fk_destino_pais: Está adicionando uma nova restrição (constraint) à tabela, e essa restrição é chamada de fk_destino_pais. O nome fk_destino_pais é uma convenção comum que sugere que essa restrição é uma chave estrangeira relacionada ao destino e país.
-- FOREIGN KEY (Destino): Define a coluna Destino na tabela BD_aumentado_comercial como a chave estrangeira.
-- REFERENCES BD_País_e_CiaAerea(País): Indica que a chave estrangeira Destino na tabela BD_aumentado_comercial faz referência à coluna País na tabela BD_País_e_CiaAerea. Isso estabelece um vínculo entre as duas tabelas, onde os valores na coluna Destino devem corresponder aos valores na coluna País da tabela referenciada.

-- Em resumo, essa instrução está criando uma relação entre as tabelas BD_aumentado_comercial e BD_País_e_CiaAerea, 
-- onde a coluna Destino em BD_aumentado_comercial funciona como uma chave estrangeira que faz referência à coluna País em BD_País_e_CiaAerea. 