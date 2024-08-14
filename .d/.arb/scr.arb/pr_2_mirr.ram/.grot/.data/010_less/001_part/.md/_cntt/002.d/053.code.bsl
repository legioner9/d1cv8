// 1. Вставка ЗАПР_3 БЕЗ рефакторинга
// 2.Заменим Заглушку ВремяЗапроса на МоментВремени() - дата документа


Процедура ОбработкаПроведения(Отказ, Режим) 
	// -------------------------------------------------------Начало нового кода 
	 	//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ДокПотреблениеТабчДокПотреблениеПродукты.РекТабчДокПотреблениеПродуктыПродукт КАК РекТабчДокПотреблениеПродуктыПродукт,
		|	СУММА(ДокПотреблениеТабчДокПотреблениеПродукты.РекТабчДокПотреблениеПродуктыКоличество) КАК РекТабчДокПотреблениеПродуктыКоличество
		|ПОМЕСТИТЬ втДокПотребления
		|ИЗ
		|	Документ.ДокПотребление.ТабчДокПотреблениеПродукты КАК ДокПотреблениеТабчДокПотреблениеПродукты
		|ГДЕ
		|	ДокПотреблениеТабчДокПотреблениеПродукты.Ссылка = &Ссылка
		|
		|СГРУППИРОВАТЬ ПО
		|	ДокПотреблениеТабчДокПотреблениеПродукты.РекТабчДокПотреблениеПродуктыПродукт
		|;
		|
		|////////////////////////////////////////////////////////////////////////////////
		|ВЫБРАТЬ
		|	втДокПотребления.РекТабчДокПотреблениеПродуктыПродукт КАК РекТабчДокПотреблениеПродуктыПродукт,
		|	втДокПотребления.РекТабчДокПотреблениеПродуктыКоличество КАК РекТабчДокПотреблениеПродуктыКоличество,
		|	ВЫБОР
		|		КОГДА ЕСТЬNULL(РегОстаткиПродуктовОстатки.РесРегОстаткиПродуктовКоличествоОстаток, 0) >= РегОстаткиПродуктовОстатки.РесРегОстаткиПродуктовКоличествоОстаток
		|			ТОГДА ИСТИНА
		|		ИНАЧЕ ЛОЖЬ
		|	КОНЕЦ КАК РекЗапрДостаточноОстатков,
		|	ВЫБОР
		|		КОГДА втДокПотребления.РекТабчДокПотреблениеПродуктыКоличество = ЕСТЬNULL(РегОстаткиПродуктовОстатки.РесРегОстаткиПродуктовКоличествоОстаток, 0)
		|			ТОГДА ЕСТЬNULL(РегОстаткиПродуктовОстатки.РесРегОстаткиПродуктовСуммаОстаток, 0)
		|		ИНАЧЕ ВЫБОР
		|				КОГДА ЕСТЬNULL(РегОстаткиПродуктовОстатки.РесРегОстаткиПродуктовКоличествоОстаток, 0) = 0
		|					ТОГДА 0
		|				ИНАЧЕ ЕСТЬNULL(РегОстаткиПродуктовОстатки.РесРегОстаткиПродуктовСуммаОстаток, 0) / ЕСТЬNULL(РегОстаткиПродуктовОстатки.РесРегОстаткиПродуктовКоличествоОстаток, 0) * втДокПотребления.РекТабчДокПотреблениеПродуктыКоличество
		|			КОНЕЦ
		|	КОНЕЦ КАК СтоимостьПотребленияПродукта
		|ИЗ
		|	втДокПотребления КАК втДокПотребления
		|		ЛЕВОЕ СОЕДИНЕНИЕ РегистрНакопления.РегОстаткиПродуктов.Остатки(
		|				&ВремяЗапроса,
		|				ИзмРегОстаткиПродуктовПродукт В
		|					(ВЫБРАТЬ
		|						втДокПотребления.РекТабчДокПотреблениеПродуктыПродукт КАК РекТабчДокПотреблениеПродуктыПродукт
		|					ИЗ
		|						втДокПотребления КАК втДокПотребления)) КАК РегОстаткиПродуктовОстатки
		|		ПО втДокПотребления.РекТабчДокПотреблениеПродуктыПродукт = РегОстаткиПродуктовОстатки.ИзмРегОстаткиПродуктовПродукт";
	
	// Заменим Заглушку ВремяЗапроса на МоментВремени() - дата документа
	Запрос.УстановитьПараметр("ВремяЗапроса", МоментВремени());
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		// Вставить обработку выборки ВыборкаДетальныеЗаписи
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА

	
	// -------------------------------------------------------Конец нового кода

    //{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ДокПотреблениеТабчДокПотреблениеПродукты.РекТабчДокПотреблениеПродуктыПродукт КАК РекТабчДокПотреблениеПродуктыПродукт,
		|	СУММА(ДокПотреблениеТабчДокПотреблениеПродукты.РекТабчДокПотреблениеПродуктыКоличество) КАК РекТабчДокПотреблениеПродуктыКоличество
		|ИЗ
		|	Документ.ДокПотребление.ТабчДокПотреблениеПродукты КАК ДокПотреблениеТабчДокПотреблениеПродукты
		|ГДЕ
		|	ДокПотреблениеТабчДокПотреблениеПродукты.Ссылка = &Ссылка
		|
		|СГРУППИРОВАТЬ ПО
		|	ДокПотреблениеТабчДокПотреблениеПродукты.РекТабчДокПотреблениеПродуктыПродукт";
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаЗапросаПотребление = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаЗапросаПотребление.Следующий() Цикл
			// Вставить обработку выборки ВыборкаЗапросаПотребление        
		Движения.РегОстаткиПродуктов.Записывать = Истина;
		       
		
		// обнуляем среднюю цену
		СредняяЦена = 0; 
		
		Запрос = Новый Запрос;
		Запрос.Текст = 
			"ВЫБРАТЬ
			|	РегОстаткиПродуктовОстатки.ИзмРегОстаткиПродуктовПродукт КАК РекЗапрПродукт,
			|	РегОстаткиПродуктовОстатки.РесРегОстаткиПродуктовКоличествоОстаток КАК РекЗапрКоличествоОстаток,
			|	РегОстаткиПродуктовОстатки.РесРегОстаткиПродуктовСуммаОстаток КАК РекЗапрСуммаОстаток
			|ИЗ
			|	РегистрНакопления.РегОстаткиПродуктов.Остатки(&ПарамДатаЗапроса, ИзмРегОстаткиПродуктовПродукт = &ПарамПродукт) КАК РегОстаткиПродуктовОстатки";
		
		Запрос.УстановитьПараметр("ПарамДатаЗапроса", МоментВремени());
		Запрос.УстановитьПараметр("ПарамПродукт", ВыборкаЗапросаПотребление.РекТабчДокПотреблениеПродуктыПродукт);
		
		РезультатЗапроса = Запрос.Выполнить();
		
		ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
		
		Пока ВыборкаДетальныеЗаписи.Следующий() Цикл      
			// получаем среднюю цену только если количество НЕ НОЛЬ (а сумма тогда зависшая)     
			Если ВыборкаДетальныеЗаписи.РекЗапрКоличествоОстаток > 0 Тогда 
				СредняяЦена = ВыборкаДетальныеЗаписи.РекЗапрСуммаОстаток / ВыборкаДетальныеЗаписи.РекЗапрКоличествоОстаток;    
			КонецЕсли;
			Сообщить(СредняяЦена);
			// Вставить обработку выборки ВыборкаДетальныеЗаписи
		КонецЦикла;
				
			Движение = Движения.РегОстаткиПродуктов.Добавить();
			Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
			Движение.Период = Дата;
			Движение.ИзмРегОстаткиПродуктовПродукт = ВыборкаЗапросаПотребление.РекТабчДокПотреблениеПродуктыПродукт;
			Движение.РесРегОстаткиПродуктовКоличество = ВыборкаЗапросаПотребление.РекТабчДокПотреблениеПродуктыКоличество;    
			// используем среднюю цену
			Движение.РесРегОстаткиПродуктовСумма = ВыборкаЗапросаПотребление.РекТабчДокПотреблениеПродуктыКоличество * СредняяЦена;
		  

		КонецЦикла;  
		
КонецПроцедуры