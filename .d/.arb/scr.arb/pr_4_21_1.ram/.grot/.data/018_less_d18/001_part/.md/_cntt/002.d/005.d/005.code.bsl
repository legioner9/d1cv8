// V_0 ДОК: НачислениеОклада
// содержание : сырая выдача конструктора
// исправлено : 
// исправить : даты НачалоМесяца и тд
// ошибки : 


Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр РегистрНачисленияЗарплаты
	Движения.РегистрНачисленияЗарплаты.Записывать = Истина;
	Движение = Движения.РегистрНачисленияЗарплаты.Добавить();
	Движение.Сторно = Ложь;
	Движение.ВидРасчета = 1;
	Движение.ПериодДействияНачало = Дата;
	Движение.ПериодДействияКонец = Дата;
	Движение.ПериодРегистрации = Дата;
	Движение.Сотрудник = Сотрудник;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры

