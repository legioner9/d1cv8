// При графы количество товара

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	// Вставить содержимое обработчика.
	ТекущиеДанные_ = Элементы.Товары.ТекущиеДанные;
	ТекущиеДанные_.Сумма = ТекущиеДанные_.Количество * ТекущиеДанные_.Цена; 
КонецПроцедуры
 