// V_0 мод Бух Операция 
// содержание : заполение периода проводки из даты документа
// исправлено : 
// исправить : 
// ошибки : 


Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	// Вставить содержимое обработчика.
	
	Для Каждого Проводка Из Движения.РегистрБухУчет Цикл 
		
		Проводка.Период = Дата;
		
	КонецЦикла;	 
	
КонецПроцедуры