﻿#language: ru

@tree

Функционал: Проверка рассчета суммы заказа

Как МенеджерПоПродажам я хочу
Рассчитать сумму заказа 
чтобы Правильно сформировать документ

Контекст:
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Создание документа заказ
* Создание документа
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Добавление строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '12,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '100'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
* Проверка расчета суммы
	Тогда таблица "Товары" стала равной:
		| 'Сумма'    |
		| '1 200,00' |
	
		
