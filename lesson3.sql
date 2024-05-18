-- Создание базы данных
CREATE DATABASE titanic_db;

commit;

-- Создание пользователя
CREATE USER admin_igor WITH PASSWORD 'igor_password';

-- Предоставление прав пользователю на базу данных
GRANT ALL PRIVILEGES ON DATABASE titanic_db TO admin_igor;

-- Cоздание схемв
CREATE SCHEMA titanic_test;

-- Предоставление прав на все таблицы в базе данных
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO admin_igor;

-- Предоставление прав на все таблицы в базе данных
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA titanic_test TO admin_igor;

-- Предоставление прав на последовательности
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA titanic_test TO admin_igor;

-- Предоставление прав на будущие таблицы и последовательности
ALTER DEFAULT PRIVILEGES FOR ROLE admin_igor IN SCHEMA public
GRANT ALL PRIVILEGES ON TABLES TO admin_igor;
ALTER DEFAULT PRIVILEGES FOR ROLE admin_igor IN SCHEMA public
GRANT ALL PRIVILEGES ON SEQUENCES TO admin_igor;

-- public.titanic определение

-- Drop table

-- DROP TABLE public.titanic;

CREATE TABLE public.titanic (
	"PassengerId" int4 NULL,
	"Survived" int4 NULL,
	"Pclass" int4 NULL,
	"Name" varchar NULL,
	"Sex" varchar NULL,
	"Age" int4 NULL,
	"SibSp" int4 NULL,
	"Parch" int4 NULL,
	"Ticket" varchar NULL,
	"Fare" float4 NULL,
	"Cabin" varchar NULL,
	"Embarked" varchar NULL
);

-- Permissions

ALTER TABLE public.titanic OWNER TO admin_igor;
GRANT ALL ON TABLE public.titanic TO admin_igor;



-- Скачать csv файл с kaggle
https://www.kaggle.com/datasets/heptapod/titanic

-- Подключиться к серверу Базы Данных
psql -d titanic_db -U admin_igor

-- Залить в таблицу данные из csv файла
\copy public.titanic ("PassengerId",	"Survived",	"Pclass","Name","Sex","Age","SibSp","Parch","Ticket","Fare","Cabin","Embarked") FROM 'C:\Users\user\Documents\titanic.csv' DELIMITER ',' CSV HEADER;

-- Проверить сохраненные в таблице данные
select * from public.titanic;

-- Напишите SQL-запросы, использующие агрегатные функции  (SUM, AVG, COUNT) для выполнения расчетов по данным таблицы.
SELECT SUM(Fare) AS total_fare
FROM public.titanic;

SELECT AVG(Fare) AS avg_fare
FROM public.titanic;

SELECT COUNT(*) AS count_passengers
FROM public.titanic;

SELECT
    Pclass,
    COUNT(*) AS total_fare,
    AVG(Fare) AS avg_fare,
    SUM(Fare) AS count_passengers
FROM public.titanic;
GROUP BY Pclass;

SELECT
    Pclass,
    COUNT(*) AS total_passengers_above_30
FROM public.titanic;
WHERE Age > 30
GROUP BY Pclass;




