--Aluno: Cláudio Vinicius Coelho Barros

--Visualizar a tabela
SELECT * FROM acidentes_prf_2025;

-- Conta o número total de registros (linhas) na tabela de acidentes
SELECT COUNT(*) AS total_ocorrencias
FROM acidentes_prf_2025;

-- Remove a view caso ela já exista no banco, evitando erro ao recriar
DROP VIEW IF EXISTS vw_acidentes_base;

-- Cria uma view baseada na tabela original
-- Adiciona uma nova coluna chamada 'acidente_fatal'
-- Regra: se mortos >= 1 → 1 (fatal), senão → 0 (não fatal)
CREATE VIEW vw_acidentes_base AS
SELECT 
    *,
    CASE 
        WHEN mortos >= 1 THEN 1
        ELSE 0
    END AS acidente_fatal
FROM acidentes_prf_2025;

-- Calcula indicadores gerais da base:
-- total de acidentes, total de acidentes fatais
-- e percentual de letalidade
SELECT 
    COUNT(*) AS total_acidentes, -- total de registros
    SUM(acidente_fatal) AS total_fatais, -- soma dos acidentes com morte
    ROUND( (SUM(acidente_fatal) * 100.0) / COUNT(*), 2 ) AS perc_letalidade -- % de acidentes fatais
FROM vw_acidentes_base;

-- Agrupa os dados por estado (UF)
-- Calcula total de acidentes, total de mortos e % de acidentes fatais
-- Filtra apenas estados com pelo menos 100 ocorrências
SELECT 
    uf, -- estado
    COUNT(*) AS total_acidentes, -- total de acidentes no estado
    SUM(mortos) AS total_mortos, -- total de mortos no estado
    ROUND( (SUM(acidente_fatal) * 100.0) / COUNT(*), 2 ) AS perc_fatais -- % de acidentes fatais
FROM vw_acidentes_base
GROUP BY uf
HAVING COUNT(*) >= 100 -- filtra estados com >= 100 registros
ORDER BY perc_fatais DESC; -- ordena do mais letal para o menos

-- Lista as rodovias (BRs) com maior número total de mortos
-- Ordena do maior para o menor e limita aos 30 primeiros
SELECT 
    br, -- rodovia
    SUM(mortos) AS total_mortos -- total de mortos por rodovia
FROM vw_acidentes_base
GROUP BY br
ORDER BY total_mortos DESC
LIMIT 30;

-- Extrai ano e mês da coluna de data
-- Agrupa os acidentes ao longo do tempo (visão temporal)
SELECT 
    strftime('%Y', data_inversa) AS ano, -- extrai o ano
    strftime('%m', data_inversa) AS mes, -- extrai o mês
    COUNT(*) AS total_acidentes -- total por período
FROM vw_acidentes_base
GROUP BY ano, mes
ORDER BY ano, mes;

-- Analisa cada tipo de acidente
-- Calcula total de ocorrências e percentual de acidentes fatais
SELECT 
    tipo_acidente, -- tipo de acidente
    COUNT(*) AS total_acidentes, -- total por tipo
    SUM(acidente_fatal) AS total_fatais, -- total fatais por tipo
    ROUND((SUM(acidente_fatal) * 100.0) / COUNT(*), 2) AS perc_fatais -- % de fatalidade
FROM vw_acidentes_base
GROUP BY tipo_acidente
ORDER BY perc_fatais DESC;

-- Compara a gravidade dos acidentes conforme a fase do dia
SELECT 
    fase_dia, -- ex: noite, dia, amanhecer
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS total_fatais,
    ROUND((SUM(acidente_fatal) * 100.0) / COUNT(*), 2) AS perc_fatais
FROM vw_acidentes_base
GROUP BY fase_dia
ORDER BY perc_fatais DESC;

-- Avalia como o clima impacta a letalidade dos acidentes
SELECT 
    condicao_metereo, -- ex: chuva, céu claro
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS total_fatais,
    ROUND((SUM(acidente_fatal) * 100.0) / COUNT(*), 2) AS perc_fatais
FROM vw_acidentes_base
GROUP BY condicao_metereo
ORDER BY perc_fatais DESC;

-- Compara o nível de gravidade conforme o tipo de pista
SELECT 
    tipo_pista, -- simples, dupla, múltipla
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS total_fatais,
    ROUND((SUM(acidente_fatal) * 100.0) / COUNT(*), 2) AS perc_fatais
FROM vw_acidentes_base
GROUP BY tipo_pista
ORDER BY perc_fatais DESC;

-- Analisa a combinação entre tipo de pista e fase do dia
-- Calcula o total de acidentes e a representatividade (%) no total geral
SELECT 
    tipo_pista,
    fase_dia,
    COUNT(*) AS total_acidentes, -- total por combinação
    ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM vw_acidentes_base), 2) AS perc_cobertura -- % sobre o total
FROM vw_acidentes_base
GROUP BY tipo_pista, fase_dia
ORDER BY total_acidentes DESC;

-- Calcula o "Lift", ou seja:
-- quão mais letal um tipo de acidente é em relação à média geral
WITH media_geral AS (
    -- Calcula a taxa média geral de letalidade
    SELECT 
        (SUM(acidente_fatal) * 1.0 / COUNT(*)) AS taxa_media
    FROM vw_acidentes_base
)

SELECT 
    tipo_acidente,
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS total_fatais,
    
    -- taxa de letalidade do tipo
    (SUM(acidente_fatal) * 1.0 / COUNT(*)) AS taxa_tipo,
    
    -- lift = taxa do tipo / taxa média geral
    ROUND(
        (SUM(acidente_fatal) * 1.0 / COUNT(*)) / media_geral.taxa_media,
        2
    ) AS lift
FROM vw_acidentes_base, media_geral
GROUP BY tipo_acidente
ORDER BY lift DESC;

-- Cria uma view para análises temporais (ano/mês)
-- Facilita uso em dashboards e relatórios
DROP VIEW IF EXISTS vw_indicadores_mensais;

CREATE VIEW vw_indicadores_mensais AS
SELECT 
    strftime('%Y', data_inversa) AS ano,
    strftime('%m', data_inversa) AS mes,
    
    COUNT(*) AS total_acidentes,
    SUM(acidente_fatal) AS total_fatais,
    
    ROUND((SUM(acidente_fatal) * 100.0) / COUNT(*), 2) AS perc_letalidade
FROM vw_acidentes_base
GROUP BY ano, mes;

-- Cria uma view consolidada por estado e rodovia
-- Ideal para dashboards geográficos
DROP VIEW IF EXISTS vw_indicadores_uf_br;

CREATE VIEW vw_indicadores_uf_br AS
SELECT 
    uf,
    br,
    
    COUNT(*) AS total_acidentes,
    SUM(mortos) AS total_mortos,
    SUM(acidente_fatal) AS total_fatais,
    
    ROUND((SUM(acidente_fatal) * 100.0) / COUNT(*), 2) AS perc_letalidade
FROM vw_acidentes_base
GROUP BY uf, br;


--Visualizar Causas dos acidentes
SELECT 
    causa_acidente,
    COUNT(*) AS total_acidentes,
    ROUND((SUM(acidente_fatal) * 100.0) / COUNT(*), 2) AS perc_fatais
FROM vw_acidentes_base
GROUP BY causa_acidente;

-- View consolidada para dashboard (visão agregada completa)
-- Junta dimensões principais + métricas de negócio

DROP VIEW IF EXISTS vw_dashboard_acidentes;

CREATE VIEW vw_dashboard_acidentes AS
SELECT 
    -- dimensões (eixos de análise)
    strftime('%Y', data_inversa) AS ano,
    strftime('%m', data_inversa) AS mes,
    uf,
    br,
    tipo_acidente,
    causa_acidente,
    tipo_pista,
    fase_dia,
    condicao_metereo,
    
    -- métricas
    COUNT(*) AS total_acidentes,
    SUM(mortos) AS total_mortos,
    SUM(acidente_fatal) AS total_fatais,
    
    -- indicador principal
    ROUND((SUM(acidente_fatal) * 100.0) / COUNT(*), 2) AS perc_letalidade

FROM vw_acidentes_base
GROUP BY 
    ano, mes,
    uf, br,
    tipo_acidente,
    causa_acidente,
    tipo_pista,
    fase_dia,
    condicao_metereo;
    
    SELECT * FROM vw_indicadores_mensais;