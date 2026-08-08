# Projeto PRF 2025 - Preparação dos Dados

## 🎯 Objetivo
Preparar os dados de acidentes da PRF 2025 para análise exploratória, Power BI e árvore de decisão explicável.

## 📊 Variável-Alvo
`acidente_fatal = 1` quando `mortos >= 1`; caso contrário, `acidente_fatal = 0`.

## 📁 Bases Geradas

### Base Analítica
- **Arquivo:** `base_analitica_prf_2025.csv`
- **Finalidade:** EDA e Power BI
- **Contém:** Todas as variáveis + indicadores derivados (mortos, feridos, total_vitimas, indice_gravidade, etc.)

### Base Modelável
- **Arquivo:** `base_modelavel_prf_2025.csv`
- **Finalidade:** Modelagem preditiva (Árvore de Decisão)
- **Contém:** Apenas variáveis explicativas + alvo `acidente_fatal`
- **Exclui:** mortos, feridos, total_vitimas, indice_gravidade, classificacao_acidente

## 📊 Estatísticas Finais
- **Linhas na base analítica:** 72,529
- **Colunas na base analítica:** 44
- **Linhas na base modelável:** 72,529
- **Colunas na base modelável:** 19
- **Taxa de fatalidade:** 7.18%

## ⚠️ Observação Metodológica
A base modelável **exclui** variáveis derivadas do desfecho para evitar **data leakage**:
- mortos, feridos, feridos_leves, feridos_graves
- total_vitimas, indice_gravidade, acidente_grave
- classificacao_acidente

## 🛠️ Tecnologias Utilizadas
- Python 3.9+
- pandas, numpy, matplotlib
- Jupyter Notebook

## 📂 Estrutura do Projeto
projeto_prf_2025/
├── dados_brutos/ # Dados originais (NÃO versionados)
├── dados_tratados/ # Dados processados
│ ├── base_analitica_prf_2025.csv
│ ├── base_modelavel_prf_2025.csv
│ └── dicionario_variaveis_modulo4.csv
├── notebooks/ # Notebooks
├── logs/ # Decisões de tratamento
└── README.md # Este arquivo

## 📝 Como Executar
1. Instale as dependências: `pip install -r requirements.txt`
2. Abra o notebook: `notebooks/modulo4_preparacao_dados.ipynb`
3. Execute todas as células em ordem

## 📚 Próximos Módulos
- **Módulo 5:** Análise Exploratória (EDA) - usa base analítica
- **Módulo 6:** Power BI - usa base analítica
- **Módulo 7:** Árvore de Decisão - usa base modelável

---

*Gerado em: 2026-08-08 13:21*
