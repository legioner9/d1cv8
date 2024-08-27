// V_6 Док Реализация Товара
// исправлено : Вычислим Сумму для списания в регистре остатки 
// исправить :
// ошибка : 


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
	
	Если Режим = РежимПроведенияДокумента.Оперативный Тогда 
		
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
		
		Если НЕ РезультатЗапроса.Пустой() Тогда 
			
			Отказ = Истина;
			//Движения.ОстаткиТоваров.Записывать = Ложь;
			
			ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать(); 
			
			Сообщить("в документе: " + Ссылка + " образовались отрицательные остатки");
			
			Пока ВыборкаДетальныеЗаписи.Следующий() Цикл
				// Вставить обработку выборки ВыборкаДетальныеЗаписи   
				Сообщить("По номенклатуре: "+ВыборкаДетальныеЗаписи.Номенклатура+" остаток "+ВыборкаДетальныеЗаписи.Количество);
			КонецЦикла;    
			
		КонецЕсли;	
		
	КонецЕсли;  
	
	Если Отказ Тогда 
		Возврат;	
	КонецЕсли; 
	
	// Начало запроса поднимем ОстаткиТоваров.Остатки по товарам Док Реализация
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	ОстаткиТоваровОстатки.Номенклатура КАК Номенклатура,
	|	ОстаткиТоваровОстатки.КоличествоОстаток КАК Количество,
	|	ОстаткиТоваровОстатки.СуммаОстаток КАК Сумма
	|ИЗ
	|	РегистрНакопления.ОстаткиТоваров.Остатки(
	|			&МоментВремени,
	|			Номенклатура В
	|				(ВЫБРАТЬ
	|					РеализацияТоваровТовары.Номенклатура КАК Номенклатура
	|				ИЗ
	|					Документ.РеализацияТоваров.Товары КАК РеализацияТоваровТовары
	|				ГДЕ
	|					РеализацияТоваровТовары.Ссылка = &Ссылка)) КАК ОстаткиТоваровОстатки";
	
	Запрос.УстановитьПараметр("МоментВремени", МоментВремени());
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи2 = РезультатЗапроса.Выбрать();
	
	Пока ВыборкаДетальныеЗаписи2.Следующий() Цикл
		// Вставить обработку выборки ВыборкаДетальныеЗаписи 
		Для каждого Движение Из Движения.ОстаткиТоваров Цикл
			Если Движение.Номенклатура = ВыборкаДетальныеЗаписи2.Номенклатура Тогда   
				
				//Сообщить("Движение.Номенклатура : "+Движение.Номенклатура);				
				//Сообщить("Движение.Количество : "+Движение.Количество);
				//Сообщить("Движение.Сумма : "+Движение.Сумма);
				//
				//Сообщить("ВыборкаДетальныеЗаписи.Номенклатура : "+ВыборкаДетальныеЗаписи2.Номенклатура);
				//Сообщить("ВыборкаДетальныеЗаписи.Количество : "+ВыборкаДетальныеЗаписи2.Количество);
				//Сообщить("ВыборкаДетальныеЗаписи.Сумма : "+ВыборкаДетальныеЗаписи2.Сумма);
				//Сообщить("________________");
				
				Движения.ОстаткиТоваров.Записывать = Истина;   
				
				Если ВыборкаДетальныеЗаписи2.Количество = 0 Тогда 
					Движение.Сумма = 0	
				Иначе 	
					Движение.Сумма = ВыборкаДетальныеЗаписи2.Сумма / ВыборкаДетальныеЗаписи2.Количество * Движение.Количество 
				КонецЕсли;
				
			КонецЕсли;	
		КонецЦикла;
	КонецЦикла;	
		
КонецПроцедуры	





