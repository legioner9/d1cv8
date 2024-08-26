// V_2 правлено Название в передаче параметра запроса ДокументПроведения - в контексте название Ссылка
// исправить : контроль только за оперативно проведенными документами

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
	//{{КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ОстаткиТоваровОстатки.Номенклатура КАК Номенклатура,
		|	ОстаткиТоваровОстатки.КоличествоОстаток КАК Количество
		|ИЗ
		|	РегистрНакопления.ОстаткиТоваров.Остатки(
		|			,
		|			Номенклатура В
		|				(ВЫБРАТЬ
		|					РеализацияТоваровТовары.Номенклатура КАК Номенклатура
		|				ИЗ
		|					Документ.РеализацияТоваров.Товары КАК РеализацияТоваровТовары
		|				ГДЕ
		|					РеализацияТоваровТовары.Ссылка = &ДокументПроведения)) КАК ОстаткиТоваровОстатки
		|ГДЕ
		|	ОстаткиТоваровОстатки.КоличествоОстаток < 0";
	
	Запрос.УстановитьПараметр("ДокументПроведения", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
		// Вставить обработку выборки ВыборкаДетальныеЗаписи
	КонецЦикла;
	
	//}}КОНСТРУКТОР_ЗАПРОСА_С_ОБРАБОТКОЙ_РЕЗУЛЬТАТА


КонецПроцедуры