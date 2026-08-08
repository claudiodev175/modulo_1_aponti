🚗 Análise de Acidentes PRF 2025 - Módulo 4

📌 Sobre o Projeto

Este projeto faz parte do Módulo 4 – Preparação de Dados do curso de Ciência de Dados. O objetivo é preparar os dados públicos de acidentes rodoviários da Polícia Rodoviária Federal (PRF) para análises futuras, incluindo:

Análise Exploratória de Dados (EDA)

Dashboards interativos no Power BI

Modelagem preditiva com Árvore de Decisão

🎯 Objetivo

Transformar os dados brutos do DATATRAN/PRF em duas bases limpas e organizadas:

Base	Finalidade	Variáveis
Base Analítica	EDA e Power BI	Todas as variáveis + indicadores derivados (mortos, feridos, total_vitimas, indice_gravidade)
Base Modelável	Árvore de Decisão	Apenas variáveis explicativas + alvo acidente_fatal (exclui mortos, feridos e derivados para evitar data leakage)

📊 Variável-Alvo

Valor	Significado
1	Acidente fatal (pelo menos 1 morte)
0	Acidente não fatal (nenhuma morte)
🛠️ Tecnologias Utilizadas
Ferramenta	Versão	Finalidade
Python	3.9+	Linguagem principal
pandas	2.0+	Manipulação de dados
numpy	1.24+	Operações numéricas
matplotlib	3.7+	Visualizações rápidas
Jupyter Notebook	1.0+	Ambiente interativo
VS Code	-	IDE de desenvolvimento

📁 Estrutura do Projeto

prf-acidentes-2025/
│
├── dados_brutos/                    # Dados originais (NÃO versionados no GitHub)
│   └── dados_abertos_prf-datatran2025.csv
│
├── dados_tratados/                  # Dados processados (NÃO versionados no GitHub)
│   ├── base_analitica_prf_2025.csv
│   ├── base_modelavel_prf_2025.csv
│   └── dicionario_variaveis_modulo4.csv
│
├── notebooks/                       # Jupyter Notebooks
│   └── modulo4_preparacao_dados.ipynb
│
├── logs/                            # Logs e decisões de tratamento
│   └── decisoes_tratamento_modulo4.md
│
├── .gitignore                       # Arquivos ignorados pelo Git
├── README.md                        # Este arquivo
└── requirements.txt                 # Dependências do projeto

🔧 Como Executar o Projeto

1. Clonar o repositório
bash
git clone https://github.com/claudiodev175/prf-acidentes-2025.git
cd prf-acidentes-2025

2. Criar ambiente virtual (recomendado)
bash
# Windows
python -m venv venv
venv\Scripts\activate

# Mac/Linux
python3 -m venv venv
source venv/bin/activate

3. Instalar dependências
bash
pip install -r requirements.txt

4. Colocar o arquivo de dados
Baixe o arquivo dados_abertos_prf-datatran2025.csv e coloque na pasta dados_brutos/

5. Abrir o notebook
bash
jupyter notebook notebooks/modulo4_preparacao_dados.ipynb
Ou, se estiver usando VS Code, abra a pasta e execute o notebook diretamente.

6. Executar as células em ordem
Execute todas as células do notebook sequencialmente para reproduzir o processo de preparação dos dados.

📋 Principais Etapas do Notebook

Etapa	Descrição
1	Importação de bibliotecas e configuração do ambiente
2	Criação da estrutura de pastas
3	Leitura do CSV com fallback de encoding
4	Padronização de nomes de colunas
5	Diagnóstico de qualidade (nulos, tipos, duplicados, cardinalidade)
6	Transformações: conversão de tipos, datas e horários
7	Criação de variáveis derivadas (turno, faixa_horaria, etc.)
8	Criação da variável-alvo acidente_fatal
9	Criação de indicadores de gravidade
10	Construção das bases analítica e modelável
11	Prevenção de data leakage
12	Exportação dos arquivos e documentação

📊 Estatísticas Finais

Item	Valor
Linhas - Base Analítica	Inserir valor
Colunas - Base Analítica	Inserir valor
Linhas - Base Modelável	Inserir valor
Colunas - Base Modelável	Inserir valor
Taxa de Fatalidade	Inserir valor %
Total de Acidentes Fatais	Inserir valor
Total de Vítimas	Inserir valor
Total de Mortos	Inserir valor

📝 Decisões Metodológicas

Decisão	Justificativa
Nomes de colunas padronizados	Minúsculas, sem acentos, com underline para facilitar manipulação
Categorias ausentes = "IGNORADO"	Preserva informação de que o dado está ausente, não perde linhas
Contagens ausentes = 0	Hipótese operacional: se não foi registrado, provavelmente é zero
Datas convertidas com pd.to_datetime	Permite extração de variáveis temporais (ano, mês, trimestre, etc.)
Base modelável exclui mortos/feridos	Evita data leakage na modelagem preditiva
Tratamento de nulos modeláveis	Categóricas = "IGNORADO", Numéricas = -1

✅ Verificação de Qualidade

O notebook inclui várias verificações para garantir a qualidade dos dados:

✅ Leitura robusta com fallback de encoding

✅ Padronização de nomes de colunas

✅ Diagnóstico de valores ausentes

✅ Remoção de duplicidades

✅ Cardinalidade de categorias

✅ Validação lógica da variável-alvo

✅ Verificação de data leakage na base modelável

✅ Validação pós-exportação

✅ Checklist final de qualidade

📚 Conexão com os Próximos Módulos

Módulo	O que será feito	Base utilizada
Módulo 5	Análise Exploratória (EDA)	Base Analítica
Módulo 6	Dashboards no Power BI	Base Analítica
Módulo 7	Árvore de Decisão	Base Modelável

📋 Checklist de Conclusão

✅ Notebook executa sem erro

✅ Base analítica em dados_tratados/

✅ Base modelável em dados_tratados/

✅ Dicionário em dados_tratados/

✅ README criado

✅ Decisões registradas em logs/

✅ Data leakage ausente

✅ Variável-alvo criada

✅ Nulos tratados

✅ Reprodutível (paths relativos)

👤 Autor
Cláudio Vinícius Coelho Barros

📝 Agradecimentos
Polícia Rodoviária Federal (PRF) – pela disponibilização dos dados públicos

Equipe do curso – pelo suporte e orientação

