﻿#language: ru

@tree

Функционал: Проверка отчета Продажи

Как Тестировщик я хочу
Проверить отчет Продажи
чтобы отчет правильно формировался

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Загрузка документов для отчета
	Когда Загрузка данных по возвратам
	И я выполняю код встроенного языка на сервере
	|'Документы.SalesReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение)'|

Сценарий: Проверка правильности формирования отчета
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
	Тогда открылось окно 'D2001 Продажи'
	И в табличном документе 'Result' я перехожу к ячейке "R1C1"
	И я нажимаю на кнопку с именем 'FormGenerate'
	И я жду когда в табличном документе 'Result' заполнится ячейка 'R11C4' в течение 20 секунд
	Дано табличный документ 'Result' содержит строки из макета '02_MaketOtchetaPoVozvratam' по шаблону
	И я закрываю все окна клиентского приложения