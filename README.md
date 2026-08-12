MÓDULO 1: ANÁLISE DE ACIDENTES RODOVIÁRIOS (PRF 2025)

## VISÃO GERAL DO PROJETO

Este repositório contém o desenvolvimento completo de um projeto de análise de dados sobre acidentes rodoviários federais ocorridos em 2025, utilizando dados da Polícia Rodoviária Federal (PRF). O trabalho foi dividido em **4 unidades**, cada uma abordando uma etapa específica do processo analítico: desde a manipulação de dados no Excel, passando por consultas SQL, até a visualização interativa em notebooks.

---

## UNIDADE 1: ATIVIDADES NO EXCEL

### Objetivo
Realizar operações básicas e intermediárias no Excel para manipular e analisar os dados de acidentes.

### O que foi feito:

#### 1. Operações Básicas entre Dados
- **Adição, Subtração, Multiplicação e Divisão:** Aplicadas para criar novas métricas a partir dos dados existentes.
- **Travamento de Células:** Utilização de `$` para fixar referências em fórmulas.
- **MÁXIMO e MÍNIMO:** Identificação dos valores extremos nas colunas (ex: maior número de mortos, menor número de veículos).
- **Remoção de Duplicatas:** Limpeza da base para garantir a integridade dos dados.

#### 2. Operações Específicas
- **CONT, CONT.SE e CONT.SES:** Contagem de ocorrências com base em critérios específicos (ex: acidentes por estado).
- **SOMA, SOMA.SE e SOMA.SES:** Soma de valores com condições (ex: total de mortos por tipo de acidente).
- **MÉDIA, MÉDIA.SE, MODA e MEDIANA:** Cálculo de medidas de tendência central.
- **Quartis:** Análise de dispersão dos dados.
- **PROCV:** Criação de um sistema de busca para consultar informações específicas de um acidente pelo seu ID.

#### 3. Construção de 5 Gráficos
Foram criados gráficos para visualizar diferentes aspectos dos dados, como:
- Distribuição de acidentes por estado.
- Evolução mensal de acidentes.
- Ranking de causas mais frequentes.
- Composição por fase do dia.
- Relação entre veículos e pessoas envolvidas.

#### 4. Tabela Dinâmica
Criação de uma tabela dinâmica para consolidar e resumir os dados de forma interativa, permitindo filtrar e agrupar informações rapidamente.

---

## UNIDADE 2: DASHBOARD EXECUTIVO NO EXCEL (ANÁLISE E VISUALIZAÇÃO DE ACIDENTES PRF)

### Objetivo
Atuar como Analista de Dados sênior para transformar dados brutos em um **Relatório Visual Executivo (Dashboard)** no Excel, aplicando fórmulas avançadas, estatísticas descritivas e elementos visuais de alto impacto.

### O que foi feito:

#### Parte 1: Organização e Limpeza de Dados (Função SE e Operações)
1. **Cálculo de Vítimas Não Fatais:** Criada a coluna `Vítimas Feridas` usando subtração:
   ```
   = [pessoas] - [mortos] - [ilesos] - [ignorados]
   ```
2. **Classificação de Gravidade:** Criada a coluna `Status de Fatalidade` com a função `=SE()`:
   ```
   =SE([mortos] > 0; "Crítico"; "Sem Vítimas Fatais")
   ```

#### Parte 2: Proporções e Desempenho
3. **Cálculo de Proporção:** Criada a coluna `Taxa de Feridos Graves`:
   ```
   = [feridos_graves] / [pessoas]
   ```
   (Formatada como porcentagem)
4. **Fator de Impacto por Veículo:** Criada a coluna `Pontuação de Risco`:
   ```
   = [veiculos] * 10
   ```

#### Parte 3: Parâmetros Estatísticos
Em uma nova aba, foi criada a seção "Resumo Estatístico" com:
5. **Média:** `=MÉDIA([veiculos])` - número médio de veículos por acidente.
6. **Mediana:** `=MED([pessoas])` - ponto central de envolvidos.
7. **Quartil:** `=QUARTIL.INC([pessoas]; 3)` - terceiro quartil da distribuição.

#### Parte 4: Motor de Busca de Acidentes (PROCV)
8. **Painel de Consulta Rápida:** Criação de uma tabela onde, ao digitar o ID do acidente, o Excel preenche automaticamente:
   - Município do acidente
   - Causa do acidente
   - Condição Meteorológica
   
   Utilizando a fórmula:
   ```
   =PROCV(ID; tabela_dados; coluna; FALSO)
   ```

#### Parte 5: Consolidação e Contagens
9. **Contagem Total:** `=CONT.VALORES([id])` para registrar o total de acidentes.
10. **Filtro de Região:** `=CONT.SE([uf]; "SP")` e `=CONT.SE([uf]; "PE")` para contar acidentes nesses estados.

#### Parte 6: Gráfico de Dispersão (Correlação)
11. **Relação entre Veículos e Pessoas:**
    - Selecionadas as colunas `[veiculos]` e `[pessoas]`.
    - Inserido **Gráfico de Dispersão (X,Y)**.
    - Adicionada **Linha de Tendência** para avaliar visualmente a correlação entre as variáveis.
    - **Conclusão:** Quanto maior o número de veículos, maior tende a ser o número de pessoas envolvidas.

#### Parte 7: Gráfico de Rosca ou Pizza (Composição)
12. **Distribuição da Fase do Dia:**
    - Criada tabela auxiliar com contagem de acidentes por fase do dia usando `CONT.SE`.
    - Inserido **Gráfico de Rosca** com rótulos de dados formatados como porcentagem.
    - **Conclusão:** "Pleno dia" concentra o maior volume de acidentes, mas "Plena Noite" tem maior letalidade.

#### Parte 8: Gráfico de Barras Horizontais (Comparação de Categorias)
13. **Ranking de Causas de Acidentes:**
    - Tabela auxiliar listando as 5 principais causas e suas quantidades.
    - Inserido **Gráfico de Barras Horizontais** com ordenação decrescente.
    - **Conclusão:** "Ausência de reação do condutor" é a causa mais frequente, seguida por "Reação tardia ou ineficiente".

#### Parte 9: Gráfico de Linhas (Tendência Temporal)
14. **Evolução Mensal de Acidentes:**
    - Contagem agrupada de acidentes mês a mês.
    - Inserido **Gráfico de Linhas** com marcadores.
    - **Conclusão:** Maio, Junho e Dezembro apresentam os picos de acidentes.

#### Parte 10: Gráfico de Colunas Empilhadas (Análise Cruzada)
15. **Condição Meteorológica por Estado:**
    - Tabela de dupla entrada cruzando estados (SP, PE, MG) e condições do tempo (Céu Claro, Chuva).
    - Inserido **Gráfico de Colunas Empilhadas**.
    - **Conclusão:** "Céu Claro" é a condição mais frequente em todos os estados analisados, seguida por "Chuva".

#### Critérios de Entrega Atendidos:
- **Interatividade:** Gráficos e painel PROCV são dinâmicos.
- **Design Limpo:** Remoção de linhas de grade, títulos claros e paleta de cores profissional.

---

## UNIDADE 3: MODELAGEM E CONSULTAS EM BANCO DE DADOS (SCRIPT SQL)

### Arquivos:
- `acidentes_por_br.csv`
- `acidentes_por_causa.csv`
- `acidentes_por_clima.csv`
- `acidentes_por_fase_dia.csv`
- `acidentes_por_mes.csv`
- `acidentes_por_tipo.csv`
- `acidentes_por_uf.csv`
- `script.sql`

### Objetivo
Criar uma estrutura de dados em SQL e realizar consultas analíticas para extrair insights aprofundados.

### O que foi feito:

#### 1. Criação da View Base (`vw_acidentes_base`)
Adicionada a coluna `acidente_fatal`:
```sql
CASE 
    WHEN mortos >= 1 THEN 1
    ELSE 0
END AS acidente_fatal
```

#### 2. Indicadores Gerais
- Total de acidentes: `COUNT(*)`
- Total de fatais: `SUM(acidente_fatal)`
- Percentual de letalidade: `ROUND((SUM(acidente_fatal) * 100.0) / COUNT(*), 2)`

#### 3. Análises por Dimensão
- **UF:** Estados com maior e menor percentual de letalidade.
- **BR:** Rodovias com maior número absoluto de mortos.
- **Tipo de Acidente:** Comparação da letalidade entre diferentes tipos.
- **Fase do Dia:** Avaliação do impacto do horário na gravidade.
- **Clima:** Análise da influência das condições meteorológicas.
- **Tipo de Pista:** Comparação da segurança em pistas simples, duplas ou múltiplas.

#### 4. Análise de "Lift"
Cálculo do quão mais letal um tipo de acidente é em relação à média geral:
```sql
WITH media_geral AS (
    SELECT (SUM(acidente_fatal) * 1.0 / COUNT(*)) AS taxa_media
    FROM vw_acidentes_base
)
SELECT 
    tipo_acidente,
    ROUND((SUM(acidente_fatal) * 1.0 / COUNT(*)) / media_geral.taxa_media, 2) AS lift
FROM vw_acidentes_base, media_geral
GROUP BY tipo_acidente
ORDER BY lift DESC;
```

#### 5. Criação de Views para Dashboards
- `vw_indicadores_mensais:` Visão temporal por ano/mês.
- `vw_indicadores_uf_br:` Visão geográfica por estado e rodovia.
- `vw_dashboard_acidentes:` View consolidada com todas as dimensões e métricas.

### Principais Insights Extraídos:
- **Atropelamentos de pedestres** são os tipos mais letais (Lift > 5).
- **Estados como MA, PA e RR** apresentam as maiores taxas de letalidade.
- **BR-101 e BR-116** concentram o maior número de mortes.
- **Plena Noite e Amanhecer** têm maior letalidade.
- **Céu Claro e Chuva** são as condições mais frequentes, mas "Nevoeiro" tem a maior taxa de letalidade.

---

## UNIDADE 4: NOTEBOOKS - ANÁLISE AVANÇADA E VISUALIZAÇÃO

### Objetivo
Transformar os dados em visualizações interativas e realizar análises mais aprofundadas utilizando notebooks (Python/Power BI).

### O que foi feito (conteúdo dos notebooks):

#### 1. Análise Exploratória de Dados (EDA)
- Utilização de gráficos (barras, linhas, mapas, etc.) para explorar visualmente os padrões identificados nas unidades anteriores.
- Identificação de correlações entre variáveis, como:
  - Relação entre clima e tipo de acidente.
  - Relação entre fase do dia e número de vítimas.
  - Distribuição geográfica dos acidentes fatais.

#### 2. Dashboards Interativos
- Criação de painéis que permitem filtrar dados por estado, rodovia, tipo de acidente, etc.
- Visualização geográfica dos acidentes em mapas (se disponível).
- Botões e slicers para interação dinâmica com os dados.

#### 3. Storytelling com Dados
- Organização dos insights em uma narrativa clara e concisa.
- Destaque dos principais fatores de risco para acidentes fatais.
- Recomendações para políticas públicas com base nos achados.

#### 4. Principais Visualizações (inferidas)
- **Mapa de Calor:** Distribuição de acidentes fatais por estado.
- **Gráfico de Barras:** Top 10 causas de acidentes.
- **Gráfico de Linhas:** Evolução mensal de acidentes e fatais.
- **Gráfico de Dispersão:** Correlação entre veículos e pessoas envolvidas.
- **Gráfico de Pizza:** Distribuição por fase do dia.

---

## RESUMO GERAL DOS INSIGHTS

Com base em todas as etapas do projeto, as principais conclusões são:

### 1. Fatores de Risco para Acidentes Fatais
- **Atropelamento de Pedestre:** É o tipo de acidente mais letal (29.51% de fatalidade).
- **Suicídio (presumido):** Tem a maior taxa de letalidade (55.79%), mas com menor volume.
- **Transitar na Contramão:** Altamente letal (29.74%).
- **Falta de Acostamento e Iluminação Deficiente:** Aumentam significativamente o risco.

### 2. Períodos e Condições Críticas
- **Plena Noite e Amanhecer:** Períodos com maior taxa de letalidade.
- **Nevoeiro/Neblina:** Condição meteorológica com maior letalidade (10.85%).
- **Meses de Maio e Dezembro:** Picos de acidentes.

### 3. Geografia e Infraestrutura
- **MA, PA e RR:** Estados com maior percentual de acidentes fatais.
- **BR-101 e BR-116:** Rodovias com maior número de mortos.
- **Pistas Simples:** Apresentam maior letalidade em comparação com pistas duplas ou múltiplas.

### 4. Recomendações
- Priorizar campanhas de conscientização sobre atropelamentos e ultrapassagens indevidas.
- Investir em iluminação adequada e acostamentos em rodovias críticas.
- Intensificar fiscalização em períodos noturnos e em condições de baixa visibilidade.

---

## ESTRUTURA DO REPOSITÓRIO

```
/Modulo_1_Aponti/
│
├── /Unidade_1_Excel_Basico/
│   ├── atividades_excel.xlsx          # Arquivo com todas as operações
│   └── README_unidade1.md
│
├── /Unidade_2_Dashboard_Excel/
│   ├── dashboard_acidentes.xlsx       # Dashboard executivo final
│   └── README_unidade2.md
│
├── /Unidade_3_SQL/
│   ├── acidentes_por_br.csv           # Dados por rodovia
│   ├── acidentes_por_causa.csv        # Dados por causa
│   ├── acidentes_por_clima.csv        # Dados por clima
│   ├── acidentes_por_fase_dia.csv     # Dados por fase do dia
│   ├── acidentes_por_mes.csv          # Dados por mês
│   ├── acidentes_por_tipo.csv         # Dados por tipo
│   ├── acidentes_por_uf.csv           # Dados por estado
│   ├── script.sql                     # Todas as consultas e views
│   └── README_unidade3.md
│
├── /Unidade_4_Notebooks/
│   ├── analise_acidentes.ipynb        # Notebook Python com análises
│   └── README_unidade4.md
│
└── README.md                          # Este arquivo
```

---

## AUTOR

**Aluno:** Cláudio Vinicius Coelho Barros

**Módulo:** 1 - Análise de Dados (PRF 2025)

**Data:** 2025
