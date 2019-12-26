
&НаКлиенте
Процедура ОбработкаКоманды(ПараметрКоманды, ПараметрыВыполненияКоманды)
	
	ЗаполнитьСписокУчастников();
	
	ОповеститьОбИзменении(Тип("РегистрСведенийКлючЗаписи.Участники"));
	
	ПоказатьОповещениеПользователя(
		"Участники обновлены", 
		"e1cib/list/РегистрСведений.Участники", 
		"Открыть список");	
	
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьСписокУчастников()
	
	// Подготовка участников
	
	НаборЗаписей = РегистрыСведений.Участники.СоздатьНаборЗаписей();
	РольУчастника = Метаданные.Роли.Участник;
	
	Для Каждого Пользователь Из	ПользователиИнформационнойБазы.ПолучитьПользователей() Цикл
		
		Если Не Пользователь.Роли.Содержит(РольУчастника) Тогда
			Продолжить;
		КонецЕсли;
		
		Запись = НаборЗаписей.Добавить();
		Запись.ИдентификаторПользователя = Пользователь.УникальныйИдентификатор;
		Запись.ИмяПользователя = Пользователь.Имя;
		Запись.СостояниеТестирования = Перечисления.СостоянияТестирования.ВПодгототвке;
		
	КонецЦикла;
	
	НаборЗаписей.Записать(Истина);
	
	// Очистка предыдущих результатов
	
	НаборЗаписей = РегистрыСведений.Результаты.СоздатьНаборЗаписей();
	НаборЗаписей.Записать(Истина);
	
КонецПроцедуры