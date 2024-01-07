use projetoEmbraer;
select * from BD_aumentado_comercial;


-- Confirmando Registros da Coluna `Ano de Fabricação`
SELECT DISTINCT `Ano de Fabricação` FROM BD_aumentado_comercial;

-- Filtrar por Segmento e Ano de Fabricação:
SELECT * FROM BD_aumentado_comercial WHERE `Segmento` = 'Aviação Comercial' AND `Ano de fabricação` = 2022;

-- Filtrando por Ano de Fabricação:
SELECT * FROM BD_aumentado_comercial WHERE `Ano de Fabricação` = 2018;

-- Filtrando por Produtos com Quantidade Entregue Maior que um Valor:
SELECT * FROM BD_aumentado_comercial WHERE `Quantidade entregue` > 10;

-- Filtrar por Origem e Destino:
SELECT * FROM BD_aumentado_comercial WHERE `Origem` = 'São José dos Campos' AND `Destino` = 'Egito' LIMIT 0, 1000;

-- Filtrar por Produtos com Pedidos Firmes em Carteira:
SELECT * FROM BD_aumentado_comercial WHERE `Pedidos Firmes em Carteira` > 0;

--

-- BD_aumentado_comercial_exec
select * from BD_aumentado_comercial_exec;


-- Confirmando Registros da Coluna `Ano de Fabricação`
SELECT DISTINCT `Ano de Fabricação` FROM BD_aumentado_comercial_exec;

-- Filtrar por Segmento e Ano de Fabricação:
SELECT * FROM BD_aumentado_comercial_exec WHERE `Segmento` = 'Aviação Comercial' AND `Ano de fabricação` = 2022;

-- Filtrando por Ano de Fabricação:
SELECT * FROM BD_aumentado_comercial_exec WHERE `Ano de Fabricação` = 2018;

-- Filtrando por Produtos com Quantidade Entregue Maior que um Valor:
SELECT * FROM BD_aumentado_comercial_exec WHERE `Quantidade entregue` > 10;

-- Filtrar por Origem e Destino:
SELECT * FROM BD_aumentado_comercial_exec WHERE `Origem` = 'São José dos Campos' AND `Destino` = 'Egito' LIMIT 0, 1000;

-- Filtrar por Produtos com Pedidos Firmes em Carteira:
SELECT * FROM BD_aumentado_comercial_exec WHERE `Pedidos Firmes em Carteira` > 0;

--

-- BD_real_comecial_e_executiva

select * from BD_real_comecial_e_executiva;


-- Confirmando Registros da Coluna `Ano de Fabricação`
SELECT DISTINCT `Ano de Fabricação` FROM BD_real_comecial_e_executiva;

-- Filtrar por Segmento e Ano de Fabricação:
SELECT * FROM BD_real_comecial_e_executiva WHERE `Segmento` = 'Aviação Comercial' AND `Ano de fabricação` = 2022;

-- Filtrando por Ano de Fabricação:
SELECT * FROM BD_real_comecial_e_executiva WHERE `Ano de Fabricação` = 2018;

-- Filtrando por Produtos com Quantidade Entregue Maior que um Valor:
SELECT * FROM BD_real_comecial_e_executiva WHERE `Quantidade entregue` > 10;

-- Filtrar por Origem e Destino:
SELECT * FROM BD_real_comecial_e_executiva WHERE `Origem` = 'São José dos Campos' AND `Destino` = 'Egito' LIMIT 0, 1000;

-- Filtrar por Produtos com Pedidos Firmes em Carteira:
SELECT * FROM BD_real_comecial_e_executiva WHERE `Pedidos Firmes em Carteira` > 0;


--

-- BD_real_comercial

select * from BD_real_comercial;


-- Confirmando Registros da Coluna `Ano de Fabricação`
SELECT DISTINCT `Ano de Fabricação` FROM BD_real_comercial;

-- Filtrar por Segmento e Ano de Fabricação:
SELECT * FROM BD_real_comercial WHERE `Segmento` = 'Aviação Comercial' AND `Ano de fabricação` = 2022;

-- Filtrando por Ano de Fabricação:
SELECT * FROM BD_real_comercial WHERE `Ano de Fabricação` = 2018;

-- Filtrando por Produtos com Quantidade Entregue Maior que um Valor:
SELECT * FROM BD_real_comercial WHERE `Quantidade entregue` > 10;

-- Filtrar por Origem e Destino:
SELECT * FROM BD_real_comercial WHERE `Origem` = 'São José dos Campos' AND `Destino` = 'Egito' LIMIT 0, 1000;

-- Filtrar por Produtos com Pedidos Firmes em Carteira:
SELECT * FROM BD_real_comercial WHERE `Pedidos Firmes em Carteira` > 0;


--

-- BD_País_e_CiaAerea

select * from BD_País_e_CiaAerea;

-- Filtrar por País:
SELECT * FROM BD_País_e_CiaAerea WHERE País = 'Brasil';

SELECT * FROM BD_País_e_CiaAerea WHERE País IN ('Brasil', 'Espanha');

-- Filtrar por Cia Aérea:
SELECT * FROM BD_País_e_CiaAerea WHERE `Cia Aérea` = 'Overland Airways';

SELECT * FROM BD_País_e_CiaAerea WHERE `Cia Aérea` IN ('Overland Airways', 'Aurigny');

-- Filtrar por País e Cia Aérea:
SELECT * FROM BD_País_e_CiaAerea WHERE País = 'Brasil' AND `Cia Aérea` = 'Placar Linhas Aéreas';


-- 1. Supondo que a coluna 'Destino' seja do tipo TEXT ou BLOB
-- Altere o tipo de dados para VARCHAR com um comprimento máximo adequado
ALTER TABLE BD_aumentado_comercial
MODIFY Destino VARCHAR(255); -- Altere para o comprimento desejado

-- 2. Verificação de Dados (certifique-se de que não há valores nulos na coluna 'Destino')
SELECT *
FROM BD_aumentado_comercial
WHERE Destino IS NULL;

-- 3. Supondo que a coluna 'País' seja do tipo BLOB ou TEXT
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
