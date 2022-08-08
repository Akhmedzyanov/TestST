﻿#language: ru

@tree

Функционал: Создание ПТиУ

Как МенеджерПрЗакупкам я хочу
Создать ПТиУ 
чтобы Отражение поступления

Контекст: 
Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Создание ПТиУ
// создание докумекнта
И я закрываю все окна клиентского приложения
* Открытие формы документа ПТиУ
	И В командном интерфейсе я выбираю 'Закупки' 'Поступления товаров'
	Тогда открылось окно 'Поступления товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Поступление товара (создание)'
* Заполнение Шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "Все для дома"'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Строящийся склад'
	Тогда элемент формы с именем "Склад" стал равен 'Строящийся склад'
	И из выпадающего списка с именем "Валюта" я выбираю точное значение 'Рубли'
	И из выпадающего списка с именем "Поставщик" я выбираю по строке 'мага'
* Заполнение Табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" из выпадающего списка с именем "ТоварыТовар" я выбираю точное значение 'Veko345MO'
	И я перехожу к следующему реквизиту
	И я перехожу к следующему реквизиту
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2,00'
	И я перехожу к следующему реквизиту
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я добавляю строку
	И в таблице "Товары" я активизирую поле с именем "ТоварыТовар"
	И в таблице "Товары" я отменяю редактирование строки
* Проверка рассчета суммы
	Тогда таблица "Товары" содержит строки:
		| 'Товар'     | 'Количество' | 'Сумма'     |
		| '*' 		  | '2,00'       | '20 000,09' |
* Запись документа
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Запоминание номера
	И я запоминаю значение поля "Номер" как "$Номер$"	
* Проведение документа
	И я нажимаю на кнопку с именем 'ФормаПровестиИЗакрыть'
	И я жду закрытия окна 'Поступление товара (создание) *' в течение 20 секунд
* Проверка создания документа
	И таблица "Список" содержит строки:
		| 'Номер'   |
		| '$Номер$' |

Сценарий: Проверка существования элемента справочника товары
И В командном интерфейсе я выбираю 'Продажи' 'Товары'
Тогда открылось окно 'Товары'
И я нажимаю на кнопку с именем 'ФормаСписок'
И Таблица "Список" содержит строки:
	| 'Наименование' |
	| 'Торт'         |
