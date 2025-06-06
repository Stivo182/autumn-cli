#Использовать decorator
#Использовать autumn

Перем Рефлектор;

Перем ОписаниеАргументов;

&Пластилин
Перем Поделка;

&Желудь
Процедура ПриСозданииОбъекта()
	Рефлектор = Новый Рефлектор();
	ЗаполнитьОписаниеАргументов();
КонецПроцедуры

Функция СоздатьКомандуПоАннотациямОбъекта(ДанныеЖелудя) Экспорт
	Декоратор = Новый ПостроительДекоратора(ДанныеЖелудя.Желудь);

	ПолеПодкоманд = Новый Поле("ИКС_Подкоманды").Публичное();
	Декоратор.Поле(ПолеПодкоманд);

	ПодготовитьОписаниеКоманды(Декоратор, ДанныеЖелудя);
	ПодготовитьВыполнитьКоманду(Декоратор, ДанныеЖелудя);

	ГотоваяКоманда = Декоратор.Построить();
	ГотоваяКоманда.ИКС_Подкоманды = ПолучитьПодкоманды(ДанныеЖелудя.ОпределениеЖелудя);
	Возврат ГотоваяКоманда;
КонецФункции

Функция ПолучитьПодкоманды(ОпределениеЖелудя)
	Конструктор = ОпределениеЖелудя.Завязь().ДанныеМетода();
	Аннотация = РаботаСАннотациями.НайтиАннотацию(Конструктор.Аннотации, "КомандаПриложения");

	Результат = Новый Массив();

	ИменаПодкоманд = РаботаСАннотациями.ПолучитьЗначенияПараметровАннотации(Аннотация, "Подкоманда");

	Для Каждого ИмяПодкоманды Из ИменаПодкоманд Цикл
		ТаблицаЖелудей = Поделка.НайтиЖелуди(ИмяПодкоманды, Неопределено, "ТаблицаЗначений");
		Для Каждого ДанныеПодкоманды Из ТаблицаЖелудей Цикл
			Результат.Добавить(ПолучитьОписаниеПодкоманды(ДанныеПодкоманды));
		КонецЦикла;
	КонецЦикла;

	Возврат Результат;

КонецФункции

Функция ПолучитьОписаниеПодкоманды(ДанныеЖелудя)
	
	ОписаниеПодкоманды = Новый Структура("Имя, Описание, Объект");

	ОпределениеЖелудя = ДанныеЖелудя.ОпределениеЖелудя;
	Конструктор = ОпределениеЖелудя.Завязь().ДанныеМетода();
	Аннотация = РаботаСАннотациями.НайтиАннотацию(Конструктор.Аннотации, "КомандаПриложения");

	ОписаниеПодкоманды.Имя = РаботаСАннотациями.ПолучитьЗначениеПараметраАннотации(Аннотация, "Имя");
	ОписаниеПодкоманды.Описание = РаботаСАннотациями.ПолучитьЗначениеПараметраАннотации(Аннотация, "Описание", "");
	ОписаниеПодкоманды.Объект = СоздатьКомандуПоАннотациямОбъекта(ДанныеЖелудя);

	Возврат ОписаниеПодкоманды;
КонецФункции

Процедура ПодготовитьОписаниеКоманды(ПостроительДекоратора, ДанныеЖелудя)
	Если ЕстьМетод(ДанныеЖелудя.Желудь, "ОписаниеКоманды") Тогда
		Возврат;
	КонецЕсли;

	ТелоМетода = Новый Массив;
	Свойства = ДанныеЖелудя.ОпределениеЖелудя.Свойства();

	Для Каждого Свойство из Свойства Цикл
		РазвернутьОписаниеАннотацииПолей(ТелоМетода, Свойство, "Опция", "ТекКоманда = КомандаПриложения.Опция(""%1"", """", ""%2"");");	
		РазвернутьОписаниеАннотацииПолей(ТелоМетода, Свойство, "Аргумент", "ТекКоманда = КомандаПриложения.Аргумент(""%1"", """", ""%2"");");
	КонецЦикла;

	ТелоМетода.Добавить(ТекстПодготовкиПодкоманд());

	Метод = Новый Метод("ОписаниеКоманды").Публичный();
	Метод.Параметр(Новый ПараметрМетода("КомандаПриложения").ПоЗначению());
	Метод.ТелоМетода(СтрСоединить(ТелоМетода, Символы.ПС));

	ПостроительДекоратора.Метод(Метод);
КонецПроцедуры

Функция ТекстПодготовкиПодкоманд()
	Возврат 
	"Для Каждого Подкоманда из ИКС_Подкоманды Цикл
	|	КомандаПриложения.ДобавитьКоманду(Подкоманда.Имя, Подкоманда.Описание, Подкоманда.Объект);
	|КонецЦикла";
КонецФункции

Процедура ПодготовитьВыполнитьКоманду(ПостроительДекоратора, ДанныеЖелудя)
	Если ЕстьМетод(ДанныеЖелудя.Желудь, "ВыполнитьКоманду") Тогда
		Возврат;
	КонецЕсли;

	ТелоМетода = Новый Массив;
	Свойства = ДанныеЖелудя.ОпределениеЖелудя.Свойства();

	Для Каждого Свойство из Свойства Цикл
		РазвернутьЗначениеАннотацийПолей(ТелоМетода, Свойство, "Опция", "%1 = КомандаПриложения.ЗначениеОпции(""%2"");");	
		РазвернутьЗначениеАннотацийПолей(ТелоМетода, Свойство, "Аргумент", "%1 = КомандаПриложения.ЗначениеАргумента(""%2"");");
	КонецЦикла;

	МетодыВыполненияКоманды = РаботаСАннотациями.НайтиМетодыСАннотацией(
													ДанныеЖелудя.ОпределениеЖелудя.Методы(), 
													"ВыполнениеКоманды");

	Для каждого МетодВыполненияКоманды Из МетодыВыполненияКоманды Цикл
		ТелоМетода.Добавить(МетодВыполненияКоманды.Имя + "();");
	КонецЦикла;

	Метод = Новый Метод("ВыполнитьКоманду").Публичный();
	Метод.Параметр(Новый ПараметрМетода("КомандаПриложения").ПоЗначению());
	Метод.ТелоМетода(СтрСоединить(ТелоМетода, Символы.ПС));

	ПостроительДекоратора.Метод(Метод);

КонецПроцедуры

Процедура РазвернутьОписаниеАннотацииПолей(ТелоМетода, Свойство, ИмяАннотации, Шаблон)
	Аннотация = РаботаСАннотациями.ПолучитьАннотацию(Свойство, ИмяАннотации);
	Если Аннотация = Неопределено Тогда
		Возврат;
	КонецЕсли;

	Имя      = РаботаСАннотациями.ПолучитьЗначениеПараметраАннотации(Аннотация, "Имя");
	Описание = РаботаСАннотациями.ПолучитьЗначениеПараметраАннотации(Аннотация, "Описание");

	Если СтрЧислоСтрок(Описание) > 1 Тогда
		Описание = СтрЗаменить(Описание, Символы.ПС, Символы.ПС + "|");
	КонецЕсли;

	ТелоМетода.Добавить(
		СтрШаблон(
			Шаблон,
			Имя,
			Описание
		)
	);

	ДополнитьОписаниеОпции(ТелоМетода, Свойство);
КонецПроцедуры

Процедура РазвернутьЗначениеАннотацийПолей(ТелоМетода, Свойство, ИмяАннотации, Шаблон)
	Аннотация = РаботаСАннотациями.ПолучитьАннотацию(Свойство, ИмяАннотации);
	Если Аннотация = Неопределено Тогда
		Возврат;
	КонецЕсли;

	ИмяОпции = СтрРазделить(РаботаСАннотациями.ПолучитьЗначениеПараметраАннотации(Аннотация, "Имя"), " ")[0];

	ТелоМетода.Добавить(СтрШаблон(Шаблон, 
						Свойство.Имя,
						ИмяОпции));
КонецПроцедуры

Процедура ДополнитьОписаниеОпции(ТелоМетода, Свойство)

	Для каждого ТекущийАргумент Из ОписаниеАргументов Цикл

		Аннотации = РаботаСАннотациями.ПолучитьАннотации(Свойство, ТекущийАргумент.Имя);

		Для Каждого Аннотация Из Аннотации Цикл

			СтрокаОписанияАргумента = ПолучитьСтрокуОписаниеАргумента("ТекКоманда.%1(%2);", Аннотация, ТекущийАргумент);
			ТелоМетода.Добавить(СтрокаОписанияАргумента);

		КонецЦикла;

	КонецЦикла;

КонецПроцедуры

Функция ПолучитьСтрокуОписаниеАргумента(Шаблон, Аннотация, ОписаниеАргумента)

	Возврат СтрШаблон(Шаблон, ОписаниеАргумента.Имя, СформироватьПараметрыМетодаАргумента(Аннотация, ОписаниеАргумента));
	
КонецФункции

Функция СформироватьПараметрыМетодаАргумента(Аннотация, ОписаниеАргумента)
	
	Если ОписаниеАргумента.ЕстьПараметры = Ложь Тогда
		Возврат "";
	КонецЕсли;

	Если ОписаниеАргумента.Параметры = Неопределено 
		ИЛИ ОписаниеАргумента.Параметры.Количество() = 1 Тогда

		Возврат ЗначениеЕдинственногоПараметраАннотации(Аннотация);

	КонецЕсли;

	Если ОписаниеАргумента.Параметры.Количество() > 1 Тогда
		Параметры = Новый Массив();
		Для Каждого ТекПараметр из ОписаниеАргумента.Параметры Цикл
			ЗначениеПараметра = РаботаСАннотациями.ПолучитьЗначениеПараметраАннотации(Аннотация, ТекПараметр, , Истина);
			Если ЗначениеПараметра = Неопределено Тогда
				Параметры.Добавить("");
			Иначе
				Параметры.Добавить(ПолучитьПредставлениеПараметраКоманды(ЗначениеПараметра));
			КонецЕсли;
		КонецЦикла;
		Возврат СтрСоединить(Параметры, ",");
	КонецЕсли;

КонецФункции

Функция ЗначениеЕдинственногоПараметраАннотации(Аннотация)

	Если Аннотация.Параметры.Количество() = 0 Тогда
		Возврат "";
	Иначе
		Возврат ПолучитьПредставлениеПараметраКоманды(Аннотация.Параметры[0].Значение);
	КонецЕсли; 
	
КонецФункции

Функция ПолучитьПредставлениеПараметраКоманды(ПараметрКоманды)

	Если ПараметрКоманды = Неопределено Тогда
		Возврат "Неопределено";

	ИначеЕсли ТипЗнч(ПараметрКоманды) = Тип("Строка") Тогда
		Возврат """" + ПараметрКоманды + """";
	
	ИначеЕсли ТипЗнч(ПараметрКоманды) = Тип("Булево") Тогда
		Возврат ?(ПараметрКоманды = Истина, "Истина", "Ложь");

	Иначе 
		Возврат Строка(ПараметрКоманды);
	КонецЕсли;  

КонецФункции

Функция ЕстьМетод(Команда, ИмяМетода)
	Возврат Рефлектор.МетодСуществует(Команда, ИмяМетода);
КонецФункции

Процедура ЗаполнитьОписаниеАргументов()

	ОписаниеАргументов = Новый ТаблицаЗначений();
	ОписаниеАргументов.Колонки.Добавить("Имя");
	ОписаниеАргументов.Колонки.Добавить("ЕстьПараметры");
	ОписаниеАргументов.Колонки.Добавить("Параметры");

	ВОкружении = ОписаниеАргументов.Добавить();
	ВОкружении.Имя = "ВОкружении";
	ВОкружении.ЕстьПараметры = Истина;

	Флаговый = ОписаниеАргументов.Добавить();
	Флаговый.Имя = "Флаговый";

	Флаг = ОписаниеАргументов.Добавить();
	Флаг.Имя = "Флаг";

	СкрытьВСправке = ОписаниеАргументов.Добавить();
	СкрытьВСправке.Имя = "СкрытьВСправке";

	ПоУмолчанию = ОписаниеАргументов.Добавить();
	ПоУмолчанию.Имя = "ПоУмолчанию";
	ПоУмолчанию.ЕстьПараметры = Истина;

	ТБулево = ОписаниеАргументов.Добавить();
	ТБулево.Имя = "ТБулево";

	ТДата = ОписаниеАргументов.Добавить();
	ТДата.Имя = "ТДата";
	ТДата.ЕстьПараметры = Истина;

	ТЧисло = ОписаниеАргументов.Добавить();
	ТЧисло.Имя = "ТЧисло";

	ТСтрока = ОписаниеАргументов.Добавить();
	ТСтрока.Имя = "ТСтрока";

	ТМассивДат = ОписаниеАргументов.Добавить();
	ТМассивДат.Имя = "ТМассивДат";
	ТМассивДат.ЕстьПараметры = Истина;
	ТМассивДат.Параметры = СтрРазделить("ФорматДаты;ВходящийРазделительМассива", ";");

	ТМассивЧисел = ОписаниеАргументов.Добавить();
	ТМассивЧисел.Имя = "ТМассивЧисел";
	ТМассивЧисел.ЕстьПараметры = Истина;
	
	ТМассивСтрок = ОписаниеАргументов.Добавить();
	ТМассивСтрок.Имя = "ТМассивСтрок";
	ТМассивСтрок.ЕстьПараметры = Истина;

	ТПеречисление = ОписаниеАргументов.Добавить();
	ТПеречисление.Имя = "ТПеречисление";

	Перечисление = ОписаниеАргументов.Добавить();
	Перечисление.Имя = "Перечисление";
	Перечисление.ЕстьПараметры = Истина;
	Перечисление.Параметры = СтрРазделить("Имя;Значение;Описание", ";");
	
	Псевдоним = ОписаниеАргументов.Добавить();
	Псевдоним.Имя = "Псевдоним";
	Псевдоним.ЕстьПараметры = Истина;

	Описание = ОписаниеАргументов.Добавить();
	Описание.Имя = "Описание";
	Описание.ЕстьПараметры = Истина;

	Обязательный = ОписаниеАргументов.Добавить();
	Обязательный.Имя = "Обязательный";
	Обязательный.ЕстьПараметры = Истина;

	ПодробноеОписание = ОписаниеАргументов.Добавить();
	ПодробноеОписание.Имя = "ПодробноеОписание";
	ПодробноеОписание.ЕстьПараметры = Истина;

	// TODO: Дотащить остальные текучие методы.

	// ПроизвольныйТип


КонецПроцедуры
