// Итоговый код с запросом без повторений в реестре

Процедура ОбработкаПроведения(Отказ, Режим)  
	
	// Запрет проведения пустоо документа
	Если ТабчДокПокупкаПродукты.Количество() = 0 Тогда          
		Сообщить("В документе табличная часть продукты нет ни одной строки. Запрет в Процедура ОбработкаПроведения");
		Отказ = Истина;	
	КонецЕсли;  
	
	//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ДокПокупкаТабчДокПокупкаПродукты.РекТабчДокПокупкаПродуктыПродукт КАК РекЗапросПродукт,
		|	СУММА(ДокПокупкаТабчДокПокупкаПродукты.РекТабчДокПокупкаПродуктыКоличество) КАК РекЗапросКоличество,
		|	СУММА(ДокПокупкаТабчДокПокупкаПродукты.РекТабчДокПокупкаПродуктыКоличество * ДокПокупкаТабчДокПокупкаПродукты.РекТабчДокПокупкаПродуктыЦена) КАК РекЗапросСуммаТекПродукт
		|ИЗ
		|	Документ.ДокПокупка.ТабчДокПокупкаПродукты КАК ДокПокупкаТабчДокПокупкаПродукты
		|ГДЕ
		|	ДокПокупкаТабчДокПокупкаПродукты.Ссылка = &Ссылка
		|
		|СГРУППИРОВАТЬ ПО
		|	ДокПокупкаТабчДокПокупкаПродукты.РекТабчДокПокупкаПродуктыПродукт";
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();    
	
	Движения.РегОстаткиПродуктов.Записывать = Истина;
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл     
		// Вставить обработку выборки ВыборкаДетальныеЗаписи      
		Движение 				= Движения.РегОстаткиПродуктов.Добавить();
		Движение.ВидДвижения 	= ВидДвиженияНакопления.Приход;
		Движение.Период 		= Дата;     
		
		Движение.РесРегОстаткиПродуктовПродукт = ВыборкаДетальныеЗаписи.РекЗапросПродукт     ;
		Движение.РесРегОстаткиПродуктовКоличество = ВыборкаДетальныеЗаписи.РекЗапросКоличество       ; 		
		Движение.РесРегОстаткиПродуктовСумма =  ВыборкаДетальныеЗаписи.РекЗапросСуммаТекПродукт          ;

	КонецЦикла;   
	
КонецПроцедуры
