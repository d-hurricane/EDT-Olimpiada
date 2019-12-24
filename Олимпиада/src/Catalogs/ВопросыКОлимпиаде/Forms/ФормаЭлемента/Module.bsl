
#Область ОбработчикиСобытийЭлементовФормы

&НаКлиенте
Процедура ВариантыОтветовПриНачалеРедактирования(Элемент, НоваяСтрока, Копирование)
	
	Если Копирование Тогда
		Элемент.ТекущиеДанные.Корректный = Ложь;
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ВариантыОтветовКорректныйПриИзменении(Элемент)
	
	ТекущаяСтрока = Элементы.ВариантыОтветов.ТекущиеДанные;
	Для Каждого ВариантОтвета Из Объект.ВариантыОтветов Цикл
		Если ВариантОтвета.Корректный И ВариантОтвета <> ТекущаяСтрока Тогда
			ВариантОтвета.Корректный = Ложь;
		КонецЕсли;
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти