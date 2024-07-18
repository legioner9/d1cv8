Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр РегОстаткиПродуктов Приход
	Движения.РегОстаткиПродуктов.Записывать = Истина;
	Для Каждого ТекСтрокаТабчДокПокупкаПродукты Из ТабчДокПокупкаПродукты Цикл
		Движение = Движения.РегОстаткиПродуктов.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
		Движение.Период = Дата;
		Движение.РесРегОстаткиПродуктовПродукт = ТекСтрокаТабчДокПокупкаПродукты.РекТабчДокПокупкаПродуктыПродукт;
		Движение.РесРегОстаткиПродуктовКоличество = ТекСтрокаТабчДокПокупкаПродукты.РекТабчДокПокупкаПродуктыКоличество;
	КонецЦикла;    
	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ    

    // !! Отказ в проведении по количеству записей в табличной части
	
	Если ТабчДокПокупкаПродукты.Количество() = 0 Тогда 
		Отказ = Истина;
	КонецЕсли;   
	 
КонецПроцедуры
