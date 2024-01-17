use projetoembraer;
-- 1. Supondo que a coluna 'Destino' seja do tipo TEXT
-- Altere o tipo de dados para VARCHAR com um comprimento máximo adequado
ALTER TABLE BD_aumentado_comercial
MODIFY Destino VARCHAR(255); -- Altere para o comprimento desejado

-- 2. Verificação de Dados (certifique-se de que não há valores nulos na coluna 'Destino')
SELECT *
FROM BD_aumentado_comercial
WHERE Destino IS NULL;

-- 3. Supondo que a coluna 'Destino' seja do tipo TEXT
-- Altere o tipo de dados para VARCHAR com um comprimento máximo adequado
ALTER TABLE BD_aumentado_comercial_exec
MODIFY Destino VARCHAR(255); -- Altere para o comprimento desejado

-- 4. Verificação de Dados (certifique-se de que não há valores nulos na coluna 'Destino' em 'BD_aumentado_comercial_exec')
SELECT *
FROM BD_aumentado_comercial_exec
WHERE Destino IS NULL;

-- 5. Agora, adicione o índice à coluna 'Destino' em 'BD_aumentado_comercial_exec'
CREATE INDEX idx_destino_aumentado ON BD_aumentado_comercial_exec(Destino);

-- 6. Verifique novamente se não há valores nulos na coluna 'Destino' em 'BD_aumentado_comercial'
SELECT *
FROM BD_aumentado_comercial
WHERE Destino IS NULL;

-- 7. Certifique-se de que todos os valores em Destino já existem em Destino
SELECT DISTINCT Destino
FROM BD_aumentado_comercial
WHERE Destino NOT IN (SELECT Destino FROM BD_aumentado_comercial_exec);

-- 8. Desative temporariamente as verificações de chave estrangeira
SET foreign_key_checks = 0;

-- 9. Se o resultado for vazio, todos os valores já existem, então você pode adicionar a chave estrangeira
ALTER TABLE bd_aumentado_comercial
ADD CONSTRAINT fk_destino_aumentado
FOREIGN KEY (Destino) REFERENCES BD_aumentado_comercial_exec(Destino);