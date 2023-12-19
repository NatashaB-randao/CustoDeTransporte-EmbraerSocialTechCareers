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


