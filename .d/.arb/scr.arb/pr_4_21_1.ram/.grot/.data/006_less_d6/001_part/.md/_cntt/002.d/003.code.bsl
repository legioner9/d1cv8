// Работа с BSL

Для Сч=2 по 4 Цикл
	Сообщить(Сч);	
КонецЦикла;	

Кор = 1;  
Пока (Кор + 1)*(Кор + 1) < 30000   Цикл	
	Кор = Кор + 1;	
	Если Кор = 10 Тогда 
		Прервать;
	КонецЕсли;    
	Продолжить;
КонецЦикла; 

Сообщить(Кор);

ДвухзначноеЧисло = 20;
Степень = 4;
Рез = 1;    

// Если Инд > Степень nj jib,rb yt ,eltn 
	Для Инд = 1 по Степень Цикл  
		Рез = Рез * ДвухзначноеЧисло;	
	КонецЦикла;


Сообщить(Рез); 
Сообщить(Pow(ДвухзначноеЧисло, Степень));

Если Рез > 10000 Тогда 	
	Сообщить("Превышает 10000");	
КонецЕсли;


	

	
	

