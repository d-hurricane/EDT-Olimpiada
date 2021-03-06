
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	УстановитьОтборСпискаВопросов(ЭтотОбъект);
	
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовФормы

&НаКлиенте
Процедура ДеревоПриАктивизацииСтроки(Элемент)
	
	УстановитьОтборСпискаВопросов(ЭтотОбъект);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиентеНаСервереБезКонтекста
Процедура УстановитьОтборСпискаВопросов(Форма)
	
	ИскомоеПоле = Новый ПолеКомпоновкиДанных("Родитель");
	ОтборПоРодителю = Неопределено;
	
	КоллекцияЭлементовОтбора = Форма.Список.Отбор.Элементы;
	Для Каждого ЭлементОтбора Из КоллекцияЭлементовОтбора Цикл
		
		Если ЭлементОтбора.ЛевоеЗначение = ИскомоеПоле Тогда
			ОтборПоРодителю = ЭлементОтбора;
			Прервать;
		КонецЕсли;
		
	КонецЦикла;
	
	Если ОтборПоРодителю = Неопределено Тогда
		ОтборПоРодителю = КоллекцияЭлементовОтбора.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
		ОтборПоРодителю.ЛевоеЗначение = ИскомоеПоле;
	КонецЕсли;
	
	ОтборПоРодителю.ВидСравнения = ВидСравненияКомпоновкиДанных.Равно;
	ОтборПоРодителю.ПравоеЗначение = Форма.Элементы.Дерево.ТекущаяСтрока;
	ОтборПоРодителю.Использование = Истина;
	
КонецПроцедуры

#КонецОбласти