-- 1. Supondo que a coluna 'Destino' seja do tipo TEXT
-- Altere o tipo de dados para VARCHAR com um comprimento máximo adequado
ALTER TABLE bd_real_comecial_e_executiva
MODIFY Destino VARCHAR(255); -- Altere para o comprimento desejado

-- 2. Verificação de Dados (certifique-se de que não há valores nulos na coluna 'Destino')
SELECT *
FROM bd_real_comecial_e_executiva
WHERE Destino IS NULL;

-- 3. Supondo que a coluna 'País' seja do tipo TEXT
-- Altere o tipo de dados para VARCHAR com um comprimento máximo adequado
ALTER TABLE bd_aumentado_comercial_exec
MODIFY Destino VARCHAR(255); -- Altere para o comprimento desejado

-- 4. Verificação de Dados (certifique-se de que não há valores nulos na coluna 'País' em 'BD_País_e_CiaAerea')
SELECT *
FROM bd_aumentado_comercial_exec
WHERE Destino IS NULL;

-- 5. Agora, adicione o índice à coluna 'País' em 'BD_País_e_CiaAerea'
CREATE INDEX idx_destino_exec ON bd_aumentado_comercial_exec(Destino);

-- 6. Verifique novamente se não há valores nulos na coluna 'País' em 'BD_País_e_CiaAerea'
SELECT *
FROM bd_aumentado_comercial_exec
WHERE Destino IS NULL;

-- 7. Certifique-se de que todos os valores em Destino já existem em País
SELECT DISTINCT Destino
FROM bd_real_comecial_e_executiva
WHERE Destino NOT IN (SELECT Destino FROM BD_aumentado_comercial);

-- 8. Desative temporariamente as verificações de chave estrangeira
SET foreign_key_checks = 0;

-- 9. Se o resultado for vazio, todos os valores já existem, então você pode adicionar a chave estrangeira
ALTER TABLE bd_real_comecial_e_executiva
ADD CONSTRAINT fk_destino_destino_exec
FOREIGN KEY (Destino) REFERENCES bd_aumentado_comercial_exec(Destino);