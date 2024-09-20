# Análise de Dados das Pessoas Mais Ricas do Mundo

Este projeto realiza uma análise dos bilionários mais ricos do mundo utilizando uma base de dados disponível no [Kaggle](https://www.kaggle.com). A análise responde a várias perguntas sobre a distribuição de riqueza entre diferentes indústrias e bilionários.

## 📊 Perguntas Respondidas:

1. **Qual é a média de patrimônio líquido dos bilionários por indústria?**
2. **Quais são os cinco bilionários mais ricos e qual é a empresa deles?**
3. **Quais bilionários têm um patrimônio líquido acima de 100 bilhões?**
4. **Quais empresas têm o maior número de bilionários associados?**
5. **Quem é o bilionário mais rico do setor de manufatura?**

## 📁 Dados Utilizados

A base de dados contém as seguintes colunas:

- **Name**: Nome do bilionário.
- **Country**: País de origem.
- **Industry**: Indústria na qual o bilionário atua.
- **Net Worth (in billions)**: Patrimônio líquido em bilhões de dólares.
- **Company**: Empresa associada ao bilionário.

### Amostra de Dados

| Name            | Country | Industry      | Net Worth (in billions) | Company             |
|-----------------|---------|---------------|-------------------------|---------------------|
| Rob Walton      | Mexico  | Finance       | 8.5                     | Walmart             |
| Sergey Brin     | USA     | Automotive    | 44.76                   | Google              |
| Steve Ballmer   | USA     | Manufacturing | 13.43                   | Koch Industries     |
| Mukesh Ambani   | USA     | Technology    | 120.44                  | Google              |
| Jim Walton      | USA     | Fashion       | 122.39                  | Walmart             |

## 🧮 Consultas SQL Usadas

### 1. Qual é a média de patrimônio líquido dos bilionários por indústria?

| Industry          | Média de Patrimônio Líquido (em bilhões) |
|-------------------|-----------------------------------------|
| Finance           | 102.17                                  |
| Automotive        | 97.63                                   |
| Manufacturing     | 105.73                                  |
| Technology        | 101.64                                  |
| Fashion           | 88.41                                   |
| Cosmetics         | 92.32                                   |
| Retail            | 107.62                                  |
| Media             | 100.58                                  |
| Petrochemicals    | 100.84                                  |
| Telecommunications| 113.27                                  |


### 2. Quais são os Dez bilionários mais ricos e qual é a empresa deles?

| Name            | Net Worth (in billions) | Company        |
|-----------------|-------------------------|----------------|
| Steve Ballmer   | 199.24                  | Facebook       |
| Larry Ellison   | 199.21                  | Grupo Carso    |
| Amancio Ortega   | 199.20                  | L'Oreal        |
| Alice Walton    | 199.10                  | Microsoft      |
| Larry Ellison   | 199.00                  | Walmart        |
| Mukesh Ambani   | 198.77                  | Microsoft      |
| Bernard Arnault | 198.34                  | Oracle         |
| Sergey Brin     | 198.05                  | Walmart        |
| Carlos Slim     | 198.05                  | Microsoft      |
| Jeff Bezos      | 197.60                  | Walmart        |


### 3. Quais bilionários têm um patrimônio líquido acima de 100 bilhões?

| Name            | Net Worth (in billions) | Company        |
|-----------------|-------------------------|----------------|
| Steve Ballmer   | 199.24                  | Facebook       |
| Larry Ellison   | 199.21                  | Grupo Carso    |
| Amancio Ortega   | 199.20                  | L'Oreal        |
| Alice Walton    | 199.10                  | Microsoft      |
| Larry Ellison   | 199.00                  | Walmart        |
| Mukesh Ambani   | 198.77                  | Microsoft      |
| Bernard Arnault | 198.34                  | Oracle         |
| Sergey Brin     | 198.05                  | Walmart        |
| Carlos Slim     | 198.05                  | Microsoft      |
| Jeff Bezos      | 197.60                  | Walmart        |


### 4. Quais empresas têm o maior número de bilionários associados?

| Company                  | Número de Bilionários |
|-------------------------|-----------------------|
| Walmart                 | 160                   |
| Google                  | 101                   |
| Microsoft               | 101                   |
| Koch Industries         | 99                    |
| LVMH                    | 57                    |
| Reliance Industries     | 56                    |
| L'Oreal                 | 54                    |
| Zara                    | 51                    |
| Grupo Carso             | 49                    |
| Facebook                | 49                    |
| Berkshire Hathaway      | 47                    |
| Oracle                  | 47                    |
| Tesla                   | 46                    |
| Amazon                  | 43                    |
| Bloomberg LP            | 40                    |

### 5. Quem é o bilionário mais rico do setor de manufatura?

| Name            | Net Worth (in billions) | Company          |
|-----------------|-------------------------|------------------|
| Larry Ellison   | 199                     |                   |


```sql
-- 1. Qual é a média de patrimônio líquido dos bilionários por indústria?
SELECT Industry, AVG(`Net Worth (in billions)`) AS Average_Net_Worth
FROM aula11.top_1000_wealthiest_people
GROUP BY Industry;

-- 2. Quais são os dez bilionários mais ricos e qual é a empresa deles?
SELECT Name, `Net Worth (in billions)`, Company
FROM aula11.top_1000_wealthiest_people
ORDER BY `Net Worth (in billions)` DESC
LIMIT 5;

-- 3. Quais bilionários têm um patrimônio líquido acima de 100 bilhões?
SELECT Name, `Net Worth (in billions)`, Industry
FROM aula11.top_1000_wealthiest_people
WHERE `Net Worth (in billions)` > 100;

-- 4. Quais empresas têm o maior número de bilionários associados?
SELECT Company, COUNT(*) AS Billionaire_Count
FROM aula11.top_1000_wealthiest_people
GROUP BY Company
ORDER BY Billionaire_Count DESC;

-- 5. Quem é o bilionário mais rico do setor de manufatura?
SELECT Name, `Net Worth (in billions)` AS Max_Net_Worth
FROM aula11.top_1000_wealthiest_people
WHERE Industry = 'Manufacturing'
AND `Net Worth (in billions)` = (
    SELECT MAX(`Net Worth (in billions)`)
    FROM aula11.top_1000_wealthiest_people
    WHERE Industry = 'Manufacturing'
);
