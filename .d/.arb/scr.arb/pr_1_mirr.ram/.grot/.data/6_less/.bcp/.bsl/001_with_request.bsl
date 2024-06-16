Процедура ОбработкаПроведения(Отказ, Режим)
	
	ЭтотОбъект_ = ЭтотОбъект;
	ТабчДокПокупка_	= ЭтотОбъект.ТабчДокПокупка; //ДокументТабличнаяЧасть.ДокПокупка.ТабчДокПокупка 
	Дата_ = ЭтотОбъект.Дата; 	
	Движения_ =	ЭтотОбъект.Движения ; // КоллекцияДвижений 	
	ДополнительныеСвойства_ = ЭтотОбъект.ДополнительныеСвойства; // Структура
	Номер_ = ЭтотОбъект.Номер; // 00000000004
	ПометкаУдаления_ = ЭтотОбъект.ПометкаУдаления; // Ложь    
	РекДокПокупкаМагазин_ =	ЭтотОбъект.РекДокПокупкаМагазин;   // Пятеречка
	РекДокПокупкаСуммаДокумента_ =	ЭтотОбъект.РекДокПокупкаСуммаДокумента; // 260
	Ссылка_	= ЭтотОбъект.Ссылка; // ЭтотОбъект
	
	
		//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ДокПокупкаТабчДокПокупка.РекТабчДокПокупкаПродукт КАК РекЗапрРекТабчДокПокупкаПродукт,
		|	СУММА(ДокПокупкаТабчДокПокупка.РекТабчДокПокупкаКоличество) КАК РекЗапрРекТабчДокПокупкаКоличество,
		|	СУММА(ДокПокупкаТабчДокПокупка.РекТабчДокПокупкаКоличество * ДокПокупкаТабчДокПокупка.РекТабчДокПокупкаЦена) КАК РекЗапрСумма
		|ИЗ
		|	Документ.ДокПокупка.ТабчДокПокупка КАК ДокПокупкаТабчДокПокупка
		|ГДЕ
		|	ДокПокупкаТабчДокПокупка.Ссылка = &Ссылка
		|
		|СГРУППИРОВАТЬ ПО
		|	ДокПокупкаТабчДокПокупка.РекТабчДокПокупкаПродукт";
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		// Вставить обработку выборки ВыборкаДетальныеЗаписи
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

	
	
	Если ТабчДокПокупка.Количество() = 0 Тогда  
		
		 Сообщить("ТабчДокПокупка.Количество() = 0");  
		 Отказ = Истина;    
		 Возврат;  
		 
	 КонецЕсли;	    
	 
	// Получение ссылки на ОбъРегНакПродукты	 
	ОбъРегНакПродукты =	Движения.РегНакПродукты; 
	
	// Заполнение поля Записывать объ ОбъРегНакПродукты для дальнейшего доступа
	ОбъРегНакПродукты.Записывать = Истина;    
  	
	Для Каждого ТекСтрокаТабчДокПокупка Из ТабчДокПокупка Цикл  
		
		// DPR: Движение = ОбъРегНакПродукты.Добавить(); 
		// Получение ссылки на Новую Строку Регистра Накопления Продукты   
		
		ОбъНовСтрокаРегНакПродукты = ОбъРегНакПродукты.Добавить();
		
		// Заполнение Строки регистра с использованием ячеек (Реквизитов Табличной части Док Покупка)
		// Пока простое присвоение одного другому без обработки 
		// ВидДвижения -> ВидДвиженияНакопления.Приход (мб расход)
		ОбъНовСтрокаРегНакПродукты.ВидДвижения 						= ВидДвиженияНакопления.Приход; 
		// Период -> Дата 
		ОбъНовСтрокаРегНакПродукты.Период 							= Дата;
		// Простое присвоение без обработки с сохранением названия Продукта и Количества как в строке Покупка
		ОбъНовСтрокаРегНакПродукты.РегНакПродуктыИзмПродукт 		= ТекСтрокаТабчДокПокупка.РекТабчДокПокупкаПродукт;
		ОбъНовСтрокаРегНакПродукты.РегНакПродуктыРесКоличество 		= ТекСтрокаТабчДокПокупка.РекТабчДокПокупкаКоличество; 
		
	КонецЦикла;      	

КонецПроцедуры
