// V_2 ДОК: НачислениеОклада
// содержание : 
// исправлено : проинудительно до окончания процедуры Записать Движения
// исправить : внести расчет рабочих дней
// - создадим запрос - 
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
	Движение.ПериодДействияНачало = НачалоМесяца(Дата);
	Движение.ПериодДействияКонец = КонецМесяца(Дата);
	Движение.ПериодРегистрации = Дата;
	Движение.Сотрудник = Сотрудник;   
	
	Движение.РасчетныеДанные = ДневнойТариф;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ  
	
	// принудительная запись в рег до окончания проц
	Движения.Записать(); 
	
	// создадим запрос -
	
	
КонецПроцедуры





