
Процедура ПередЗаписью(Отказ)
	
	Если ДополнительныеСвойства.Свойство("НеОбновлятьДанныеПользователяИБ") Тогда
		Возврат;
	КонецЕсли;
	
	ПользовательИБ = Неопределено;
	
	Если Не ЗначениеЗаполнено(ЭтотОбъект.Идентификатор) Тогда
		ПользовательИБ = ПользователиИнформационнойБазы.СоздатьПользователя();
	Иначе
		ПользовательИБ = ПользователиИнформационнойБазы.НайтиПоУникальномуИдентификатору(ЭтотОбъект.Идентификатор);
	КонецЕсли;
	
	ПользовательИБ.Имя = ЭтотОбъект.ИмяДляВхода;
	ПользовательИБ.ПолноеИмя = ЭтотОбъект.Наименование;
	
	Если ДополнительныеСвойства.Свойство("НовыйПароль") Тогда
		ПользовательИБ.Пароль = ДополнительныеСвойства.НовыйПароль;
	КонецЕсли;
	
	Если ДополнительныеСвойства.Свойство("Роли") Тогда
		ПользовательИБ.Роли.Очистить();
		Для Каждого ИмяРоли Из ДополнительныеСвойства.Роли Цикл
			ПользовательИБ.Роли.Добавить(Метаданные.Роли[ИмяРоли]);
		КонецЦикла;
	КонецЕсли;
	
	ПользовательИБ.Записать();
	
	ЭтотОбъект.Идентификатор = ПользовательИБ.УникальныйИдентификатор;
	
КонецПроцедуры

Процедура ПередУдалением(Отказ)
	
	Если ЗначениеЗаполнено(ЭтотОбъект.Идентификатор) Тогда
		
		ПользовательИБ = ПользователиИнформационнойБазы.НайтиПоУникальномуИдентификатору(ЭтотОбъект.Идентификатор);
		ПользовательИБ.Удалить();
		
	КонецЕсли;
	
КонецПроцедуры

