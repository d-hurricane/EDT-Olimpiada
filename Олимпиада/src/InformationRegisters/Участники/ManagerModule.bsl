
Функция НовыйПароль() Экспорт
	
	Результат = Строка(Новый УникальныйИдентификатор());
	Результат= Лев(СтрЗаменить(Результат, "-", ""), 6);
	
	Возврат Результат;
	
КонецФункции