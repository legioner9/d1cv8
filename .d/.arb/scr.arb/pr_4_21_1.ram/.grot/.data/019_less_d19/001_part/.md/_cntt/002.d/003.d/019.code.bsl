// V_N ДОК: НачислениеОклада
// содержание : Код После Втавки движения по ЗадолженностьПередСотрудниками
// исправлено : корректные данные из контекста - Сотрудник и Сумма
// исправить :  
// ошибки : 
// примечания : устранено Движение -> Движение1 для устранения конфликта имен в разных движениях 
// результат работы : +


Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	
	// регистр РегистрНачисленияЗарплаты
	Движения.РегистрНачисленияЗарплаты.Записывать = Истина;
	Движение = Движения.РегистрНачисленияЗарплаты.Добавить();
	Движение.Сторно = Ложь;
	Движение.ВидРасчета = ПланыВидовРасчета.Начисления.ОкладПоТарифу;
	Движение.ПериодДействияНачало = НачалоМесяца(Дата);
	Движение.ПериодДействияКонец = КонецМесяца(Дата);
	Движение.ПериодРегистрации = Дата;
	Движение.Сотрудник = Сотрудник;   
	
	Движение.РасчетныеДанные = ДневнойТариф;
	
	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ  
	
	// принудительная запись в рег до окончания проц
	Движения.Записать(); 
	
	// создадим запрос -
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
	"ВЫБРАТЬ
	|	РегистрНачисленияЗарплатыДанныеГрафика.РасчетныеДанные КАК РасчетныеДанные,
	|	РегистрНачисленияЗарплатыДанныеГрафика.РабочийДеньПериодДействия КАК План,
	|	РегистрНачисленияЗарплатыДанныеГрафика.РабочийДеньФактическийПериодДействия КАК Факт
	|ИЗ
	|	РегистрРасчета.РегистрНачисленияЗарплаты.ДанныеГрафика(Регистратор = &Ссылка) КАК РегистрНачисленияЗарплатыДанныеГрафика";
	
	Запрос.УстановитьПараметр("Ссылка", Ссылка);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	Если ВыборкаДетальныеЗаписи.Следующий() Тогда 
		// Вставить обработку выборки ВыборкаДетальныеЗаписи
		// ВыборкаДетальныеЗаписи.РасчетныеДанные - дневной тариф
		// ВыборкаДетальныеЗаписи.Факт - количество реально отработаных дней
		Движение.Результат = ВыборкаДетальныеЗаписи.РасчетныеДанные * ВыборкаДетальныеЗаписи.Факт;  	
		// ДвижениеРезультат = Движение.Результат;
	КонецЕсли;
	// Принудительная запись 
	Движения.РегистрНачисленияЗарплаты.Записать();    
	
	// регистр ЗадолженностьПередСотрудниками Приход
	// !!! Данное движение можно переиспользовать !!!
	// Если Записывать = Истина Записи сразу попадут в регистр
	Движения.ЗадолженностьПередСотрудниками.Записывать = Истина;
	// Цикл по таб части не нужен Данные из рекв док и предыдущего кода
	// Для Каждого ТекСтрокаСотрудники Из Сотрудники Цикл
	Движение1 = Движения.ЗадолженностьПередСотрудниками.Добавить();
	Движение1.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение1.Период = Дата;
	// Сотрудник здесь не в таб части а в реквизите значит просто виден в контексте
	// ТекСтрокаСотрудники -> Сотрудник
	// Движение.Сотрудник = ТекСтрокаСотрудники.Сотрудник;
	Движение1.Сотрудник = Сотрудник;
	// Движение.Результат - это и есть начисленный Оклад - в Долг его и запишем
	Движение1.Долг = Движение.Результат;
	// КонецЦикла;
	
КонецПроцедуры

