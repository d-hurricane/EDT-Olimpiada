
Процедура УстановкаПараметровСеанса(ТребуемыеПараметры)
	
	Если ТребуемыеПараметры = Неопределено Тогда

		ПользовательИБ = ПользователиИнформационнойБазы.ТекущийПользователь();
		ПараметрыСеанса.ТекущийПользователь = Справочники.Пользователи.НайтиСоздатьПользователя(ПользовательИБ);
			
	КонецЕсли;
	
КонецПроцедуры
