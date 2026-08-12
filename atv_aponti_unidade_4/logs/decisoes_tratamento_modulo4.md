# Decisões de Tratamento - Módulo 4

**Data de geração:** 2026-08-12 10:30
**Projeto:** PRF Acidentes 2025
**Responsável:** Seu Nome

---

## 📌 Principais Decisões de Tratamento

### 1. Padronização de Colunas
- Nomes convertidos para **minúsculas**
- Remoção de **acentos**
- Substituição de espaços e caracteres especiais por **underline** (`_`)
- Compatibilização de grafias (ex: condicao_meteorologica → condicao_metereologica)

### 2. Conversão de Tipos
- Colunas numéricas (BR, KM, pessoas, mortos, feridos) convertidas com `pd.to_numeric(errors='coerce')`
- Datas convertidas com `pd.to_datetime(errors='coerce')`
- Horários extraídos com formato `%H:%M:%S` e fallback para `%H:%M`

### 3. Tratamento de Valores Ausentes (Nulos)
- **Categorias importantes:** preenchidas com `"IGNORADO"` (uf, municipio, causa_acidente, etc.)
- **Contagens de vítimas:** preenchidas com `0` (mortos, feridos, feridos_leves, etc.)
- **Campos textuais:** strings vazias e variações de nulo substituídas por `pd.NA`

### 4. Remoção de Duplicidades
- Linhas duplicadas exatas foram **removidas** da base
- Número de duplicatas removidas: 0 (se houver, ajustar)

### 5. Criação de Variáveis Derivadas

#### Variáveis Temporais (extraídas de data_inversa)
- `ano`, `mes`, `trimestre`
- `dia_semana_num` (0=segunda a 6=domingo)
- `fim_de_semana` (1 se sábado/domingo)

#### Variáveis de Horário (extraídas de horario)
- `hora` (0-23)
- `turno` (MADRUGADA, MANHA, TARDE, NOITE, IGNORADO)
- `faixa_horaria` (blocos de 3 horas)

#### Indicadores de Gravidade
- `total_vitimas` = mortos + feridos_leves + feridos_graves
- `acidente_grave` = 1 se mortos >= 1 ou feridos_graves >= 1
- `indice_gravidade` = mortos*3 + feridos_graves*2 + feridos_leves*1

#### Variável-Alvo
- `acidente_fatal` = 1 quando `mortos >= 1`; 0 quando `mortos = 0`

#### Identificadores
- `br_formatada` = BR padronizada no formato `BR-000`
- `chave_localidade` = UF + municipio + BR formatada

### 6. Padronização de Textos
- Todas as colunas textuais convertidas para **maiúsculas**
- Remoção de espaços extras no início e fim
- Substituição de valores vazios por `pd.NA`

### 7. Base Modelável (Prevenção de Data Leakage)
- **Variáveis excluídas:** mortos, feridos, feridos_leves, feridos_graves, total_vitimas, indice_gravidade, acidente_grave, classificacao_acidente
- **Variáveis mantidas:** apenas explicativas (causa, tipo, local, tempo, condições, etc.) + alvo
- **Nulos tratados:** categóricas = "IGNORADO", numéricas = -1

---

## 📁 Arquivos Gerados

| Arquivo | Descrição |
|---------|-----------|
| `base_analitica_prf_2025.csv` | Base completa para EDA e Power BI |
| `base_modelavel_prf_2025.csv` | Base para modelagem (sem data leakage) |
| `dicionario_variaveis_modulo4.csv` | Dicionário das variáveis criadas |
| `decisoes_tratamento_modulo4.md` | Este arquivo |

---

## 📊 Estatísticas Finais

| Item | Valor |
|------|-------|
| Linhas na base analítica | 72,529 |
| Colunas na base analítica | 44 |
| Linhas na base modelável | 72,529 |
| Colunas na base modelável | 19 |
| Taxa de fatalidade | 7.18% |
| Total de acidentes fatais | 5,210 |

---

## ✅ Critérios de Qualidade Atendidos

- ✅ Notebook executa do início ao fim sem erros
- ✅ Bases exportadas corretamente
- ✅ README criado
- ✅ Decisões de tratamento registradas
- ✅ Data leakage verificado e ausente
- ✅ Dicionário de variáveis documentado

---

*Documento gerado automaticamente pelo Módulo 4 - Preparação de Dados*
