// V_N ДОК: НачислениеПремий
// содержание : 
// исправлено : 
// исправить : Заглушки даты
// ошибки : 


Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр РегистрНачисленияЗарплаты
	Движения.РегистрНачисленияЗарплаты.Записывать = Истина;
	Для Каждого ТекСтрокаСотрудники Из Сотрудники Цикл
		Движение = Движения.РегистрНачисленияЗарплаты.Добавить();
		Движение.Сторно = Ложь;
		Движение.ВидРасчета = ПланыВидовРасчета.Начисления.ПремияСуммой;
		Движение.ПериодДействияНачало = Дата;
		Движение.ПериодДействияКонец = Дата;
		Движение.ПериодРегистрации = Дата;
		Движение.Сотрудник = ТекСтрокаСотрудники.Сотрудник;
		Движение.Результат = ТекСтрокаСотрудники.СуммаПремии;
	КонецЦикла;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры


