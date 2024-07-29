# API

API реализована при помощи фреймворка Express, код написан на TypeScript. Для хранения данных используется MySql. В качестве ОРМ используется Sequelize

Скрипт базы данных:

```sh
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- База данных: `krista`
--


CREATE TABLE `people` (
  `id_person` int NOT NULL,
  `login` varchar(20) NOT NULL,
  `age` int NOT NULL,
  `email` varchar(319) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `people`
--

INSERT INTO `people` (`id_person`, `login`, `age`, `email`) VALUES
(14, 'Geremy', 17, 'geremy@gmail.com');

--
-- Индексы таблицы `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`id_person`);


--
-- AUTO_INCREMENT для таблицы `people`
--
ALTER TABLE `people`
  MODIFY `id_person` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

```

Для запуска проекта выполните команду:

```sh
npm install
npm run dev
```
