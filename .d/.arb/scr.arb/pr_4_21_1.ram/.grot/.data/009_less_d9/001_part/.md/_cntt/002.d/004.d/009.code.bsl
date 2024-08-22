// При изменении графы Количество товара

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	ТекущиеДанные_ = Элементы.Товары.ТекущиеДанные;
	ТекущиеДанные_.Сумма = ТекущиеДанные_.Количество * ТекущиеДанные_.Цена; 
КонецПроцедуры

// При изменении графы Цена товара

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	// Вставить содержимое обработчика. 
	ТекущиеДанные_ = Элементы.Товары.ТекущиеДанные;
	ТекущиеДанные_.Сумма = ТекущиеДанные_.Количество * ТекущиеДанные_.Цена; 
КонецПроцедуры
