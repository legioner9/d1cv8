// При изменении графы Сумма товара

Процедура ТоварыСуммаПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	ТекущиеДанные_ = Элементы.Товары.ТекущиеДанные; 
	Если ТекущиеДанные_.Количество = 0 Тогда  
		ТекущиеДанные_.Цена = 0;     
	Иначе 
		ТекущиеДанные_.Цена = ТекущиеДанные_.Сумма / ТекущиеДанные_.Количество;   
	КонецЕсли;
КонецПроцедуры

