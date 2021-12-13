--DROP TABLE Demonstracoes_Contabeis;
CREATE TABLE Demonstracoes_Contabeis (
	data_demonstracao date,
	reg_ans numeric,
	cd_conta_contabil numeric,
	descricao varchar(200),
	vl_saldo_final varchar(100)
);

SELECT * FROM Demonstracoes_Contabeis;

-- 1T2020
COPY Demonstracoes_Contabeis FROM 'C:\Users\Public\Documents\csvs\1T2020_utf8.csv' DELIMITER ';' CSV HEADER;
-- 2T2020
COPY Demonstracoes_Contabeis FROM 'C:\Users\Public\Documents\csvs\2T2020_utf8.csv' DELIMITER ';' CSV HEADER;
-- 3T2020
COPY Demonstracoes_Contabeis FROM 'C:\Users\Public\Documents\csvs\3T2020_utf8.csv' DELIMITER ';' CSV HEADER;
-- 4T2020
COPY Demonstracoes_Contabeis FROM 'C:\Users\Public\Documents\csvs\4T2020_utf8.csv' DELIMITER ';' CSV HEADER;
-- 1T2021
COPY Demonstracoes_Contabeis FROM 'C:\Users\Public\Documents\csvs\1T2021_utf8.csv' DELIMITER ';' CSV HEADER;
-- 2T2021
COPY Demonstracoes_Contabeis FROM 'C:\Users\Public\Documents\csvs\2T2021_utf8.csv' DELIMITER ';' CSV HEADER;
-- 3T2021
COPY Demonstracoes_Contabeis FROM 'C:\Users\Public\Documents\csvs\3T2021_utf8.csv' DELIMITER ';' CSV HEADER;

-- Comando para trocar as vírgulas(,) por ponto(.) do campo <vl_saldo_final>
UPDATE 
   Demonstracoes_Contabeis
SET 
   vl_saldo_final = REPLACE (
  	vl_saldo_final,
	',',
	'.'
   );
   
--após alterar por (.), é possível alterar o tipo do campo <vl_saldo_final> para numeric
ALTER TABLE Demonstracoes_Contabeis ALTER COLUMN vl_saldo_final TYPE numeric USING(vl_saldo_final::numeric);

-- Quais as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último trimestre?
SELECT SUM(vl_saldo_final),reg_ans FROM Demonstracoes_Contabeis 
	WHERE data_demonstracao = '2021-07-01' 
	AND descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
	GROUP BY reg_ans
	ORDER BY SUM(vl_saldo_final) DESC LIMIT 10;
	
-- Quais as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último ano?
SELECT SUM(vl_saldo_final) AS "Despesas",reg_ans AS "Operadora" FROM Demonstracoes_Contabeis 
	WHERE data_demonstracao >= '2020-10-01' 
	AND descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR '
	GROUP BY reg_ans
	ORDER BY SUM(vl_saldo_final) DESC LIMIT 10;
