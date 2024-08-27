// Рассмотрим только процедуру проведения Реализации Товаров


Процедура ОбработкаПроведения(Отказ, Режим)

	// регистр ОстаткиТоваров Расход
	Движения.ОстаткиТоваров.Записывать = Истина;
	Для Каждого ТекСтрокаТовары Из Товары Цикл
		Движение = Движения.ОстаткиТоваров.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.Номенклатура = ТекСтрокаТовары.Номенклатура;
		Движение.Количество = ТекСтрокаТовары.Количество;
	КонецЦикла;   
	
	// Делаем создаем переменные движений в памяти НО НЕ В РЕГИСТР
	Движения.Записать();   
	
	// записывам переменные в регистр
	// Движения.ОстаткиТоваров.Записывать = Истина;        
	
	// делаем запрос к регистру на предмет отрицательноых остатков
	
КонецПроцедуры


