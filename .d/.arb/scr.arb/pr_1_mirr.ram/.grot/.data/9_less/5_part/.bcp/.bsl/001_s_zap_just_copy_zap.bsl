
Процедура ОбработкаПроведения(Отказ, Режим)   
	
	//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ДокПотребТабчДокПотреб.РекТабчДокПотребПродукт КАК РекЗапрГрупПродукт,
		|	СУММА(ДокПотребТабчДокПотреб.РекТабчДокПотребКоличество) КАК РекЗапрГрупКоличество
		|ИЗ
		|	Документ.ДокПотреб.ТабчДокПотреб КАК ДокПотребТабчДокПотреб
		|
		|СГРУППИРОВАТЬ ПО
		|	ДокПотребТабчДокПотреб.РекТабчДокПотребПродукт";
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		// Вставить обработку выборки ВыборкаДетальныеЗаписи
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

		
	// регистр РегНакПродукты Расход
	Движения.РегНакПродукты.Записывать = Истина;
	Для Каждого ТекСтрокаТабчДокПокупка Из ТабчДокПотреб Цикл    
		СредЦенаПродукт = 0;
		Запрос = Новый Запрос;
		Запрос.Текст = 
			"ВЫБРАТЬ
			|	РегНакПродуктыОстатки.РегНакПродуктыИзмПродукт КАК РегНакПродуктыИзмПродукт,
			|	РегНакПродуктыОстатки.РегНакПродуктыРесКоличествоОстаток КАК РегНакПродуктыРесКоличествоОстаток,
			|	РегНакПродуктыОстатки.РегНакПродуктыРесСуммаОстаток КАК РегНакПродуктыРесСуммаОстаток
			|ИЗ
			|	РегистрНакопления.РегНакПродукты.Остатки(&ДатаЗапроса, РегНакПродуктыИзмПродукт = &УсловЗапросаПоПродукту) КАК РегНакПродуктыОстатки";
		
		Запрос.УстановитьПараметр("ДатаЗапроса", МоментВремени());
		Запрос.УстановитьПараметр("УсловЗапросаПоПродукту", ТекСтрокаТабчДокПокупка.РекТабчДокПотребПродукт);
		
		РезультатЗапроса = Запрос.Выполнить();
		
		ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
		
		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
			// Вставить обработку выборки ВыборкаДетальныеЗаписи 
			Если ВыборкаДетальныеЗаписи.РегНакПродуктыРесКоличествоОстаток > 0 Тогда
				
				СредЦенаПродукт = ВыборкаДетальныеЗаписи.РегНакПродуктыРесСуммаОстаток / ВыборкаДетальныеЗаписи.РегНакПродуктыРесКоличествоОстаток;
				Сообщить("СредЦенаПродукт");
				Сообщить(Строка(СредЦенаПродукт));

			КонецЕсли;
		КонецЦикла;

		
		Движение = Движения.РегНакПродукты.Добавить();
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		Движение.Период = Дата;
		Движение.РегНакПродуктыИзмПродукт = ТекСтрокаТабчДокПокупка.РекТабчДокПотребПродукт;
		Движение.РегНакПродуктыРесКоличество = ТекСтрокаТабчДокПокупка.РекТабчДокПотребКоличество;
		Движение.РегНакПродуктыРесСумма = ТекСтрокаТабчДокПокупка.РекТабчДокПотребКоличество * СредЦенаПродукт;  
		
	КонецЦикла;

КонецПроцедуры
