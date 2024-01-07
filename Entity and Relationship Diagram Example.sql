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
