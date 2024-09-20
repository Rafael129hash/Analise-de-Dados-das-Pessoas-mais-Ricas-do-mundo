-- Analise de Dados das Pessoas mais Ricas do mundo

-- A analise foi feita usando a base de dados do www.kaggle.com

-- Perguntas que serão respondidas:
-- 1. Qual é a média de patrimônio líquido dos bilionários por indústria?
-- 2. Quais são os cinco bilionários mais ricos e qual é a empresa deles?
-- 3. Quais são os cinco bilionários mais ricos e qual é a empresa deles?
-- 4. Quais bilionários têm um patrimônio líquido acima de 100 bilhões?
-- 5. Quais empresas têm o maior número de bilionários associados?
-- 6. Quem é o bilionário mais rico do setor de manufatura?


-- Importando a tabela 
SELECT * FROM aula11.top_1000_wealthiest_people;


SELECT Industry, AVG(`Net Worth (in billions)`) AS Average_Net_Worth
FROM aula11.top_1000_wealthiest_people
GROUP BY Industry;

SELECT Name, `Net Worth (in billions)`, Company
FROM aula11.top_1000_wealthiest_people
ORDER BY `Net Worth (in billions)` DESC
LIMIT 10;


SELECT Country, COUNT(*) AS Billionaire_Count
FROM aula11.top_1000_wealthiest_people
GROUP BY Country;

SELECT Name, `Net Worth (in billions)`, Industry
FROM aula11.top_1000_wealthiest_people
WHERE `Net Worth (in billions)` > 100;

SELECT Company, COUNT(*) AS Billionaire_Count
FROM aula11.top_1000_wealthiest_people
GROUP BY Company
ORDER BY Billionaire_Count DESC;

SELECT Name, `Net Worth (in billions)` AS Max_Net_Worth
FROM aula11.top_1000_wealthiest_people
WHERE Industry = 'Manufacturing'
AND `Net Worth (in billions)` = (
    SELECT MAX(`Net Worth (in billions)`)
    FROM aula11.top_1000_wealthiest_people
    WHERE Industry = 'Manufacturing'
);

