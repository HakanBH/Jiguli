<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=en>
<head>
<meta charset="UTF-8">
<title>Mobile.bg - Пазарът за автомобили в България.</title>
<meta http-equiv="X-UA-Compatible" content="IE = edge">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width = device-width, initial-scale = 1">

<link href="css/bootstrap.min.css" rel="stylesheet">

</head>

<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>
<script src="http://jqueryvalidation.org/files/dist/additional-methods.min.js"></script>

<%@ include file = "header.jsp" %>

<script src="js/vehicleDynamicSelect.js"></script>
<script src="js/regionDynamicSelect.js"></script>


<form id="publishForm" action="PublishVehicle" method="post" target="_blank">
	<div class="container panel-heading panel-primary" style="border-bottom: 1px solid #ccc; padding-bottom: 25px">
		<div class="panel-heading">
			<h4 class="font">Публикуване на нов автомобил</h4>
		</div>
		<div class="panel-primary" style="padding-top: 20px">
			<div class="col-md-4">
				<div class="search-form">
					<label class="control-label" for="category">Основна категория</label> 
					<select id="category" name="category" class="form-control" required 
						oninput="setCustomValidity('')" oninvalid="setCustomValidity('Моля изберете категория')">
					</select>
				</div>
				<div class="row search-form">
					<div class="col-md-6">
						<label class="control-label" for="brand">Марка</label> 
						<select id="brand" name="brand" class="form-control" required 
							oninput = "setCustomValidity('')" oninvalid="setCustomValidity('Моля задайте марка.')">
						</select>
					</div>
					<div class="col-md-6">
						<label class="control-label" for="model">Модел</label> 
						<select id="model" name="model" class="form-control" required 
							oninput = "setCustomValidity('')" oninvalid="setCustomValidity('Моля задайте модел.')">
						</select>
					</div>
				</div>

				<div class="search-form">
					<label class="control-label" for="engine">Двигател</label> 
					<select id="engine" name="engine" class="form-control" 
						required oninput="setCustomValidity('')"
						oninvalid="setCustomValidity('Моля изберете тип двигател.')">
						<option value=""></option>
						<option value="petrol">Бензинов</option>
						<option value="diesel">Дизелов</option>
						<option value="electric">Електрически</option>
						<option value="hybrid">Хибриден</option>
					</select>
				</div>
				<div class="search-form">
					<label class="control-label" for="gearbox" >Скоростна кутия</label>
					<select id="gearbox" name="gearbox" class="form-control"  
						required oninput="setCustomValidity('')" 
						oninvalid="setCustomValidity('Моля изберете тип скоростна кутия.')">
						<option value=""></option>
						<option value="auto">Автоматична</option>
						<option value="semiauto">Полуавтоматична</option>
						<option value="manual">Ръчна</option>
					</select>
				</div>
				<div class="row search-form2">
					<div class="col-md-7">
						<label class="control-label" for="price">Цена</label> 
						<input id="price" name="price" type="number" min="0" placeholder="Цена" 
							class="form-control input-md" required oninput = "setCustomValidity('')" 
							oninvalid="setCustomValidity('Моля въведете валидна цена.')">
					</div>
					<div class="col-md-5">
						<label class="control-label" for="currency">Валута</label> 
						<select id="currency" name="currency" class="form-control">
							<option value="lv">лв.</option>
							<option value="usd">USD</option>
							<option value="euro">EUR</option>
						</select>
					</div>
				</div>
			</div>

			<div class="col-md-4" style="margin-top: 25px">
				<div class="coll-md-12" >
					<label class="control-label" for="condition">Състояние: </label> 
					<label class="radio-inline" for="new"> 
						<input type="radio" name="condition" id="new" value="new">Нов
					</label> 
					<label class="radio-inline" for="used"> 
						<input type="radio" name="condition" id="used" value="used" checked>Употребяван
					</label> 
					<label class="radio-inline" for="parts">
						<input type="radio" name="condition" id="parts" value="parts"> На части
					</label>
				</div>

				<div class="row">
					<div class="col-md-12">
						<label class="control-label search-form2" for="power">Мощност
						</label> в конски сили <input id="power" name="power" type="text"
							placeholder="Мощност" class="form-control input-md">
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="control-label search-form2" for="mileage">Пробег </label> в километри 
						<input id="mileage" name="mileage" type="number" min="0" placeholder="Пробег" required
							class="form-control input-md" oninput="setCustomValidity('') "
							oninvalid="setCustomValidity('Моля въведете пробег(число по-голямо от 0)')">
					</div>
				</div>
				<label class="control-label search-form2" for="month">Дата на производство</label>
				<div class="row">
					<div class="col-md-6">
						<select id="month" name="month" class="form-control" required 
							oninvalid="setCustomValidity('Моля въведете месец.')" oninput="setCustomValidity('')">
							<option value="" disabled selected>месец</option>
							<option value="janury">Януари</option>
							<option value="february">Февруари</option>
							<option value="march">Март</option>
							<option value="april">Април</option>
							<option value="may">Май</option>
							<option value="june">Юни</option>
							<option value="july">Юли</option>
							<option value="august">Август</option>
							<option value="september">Септември</option>
							<option value="october">Октомври</option>
							<option value="november">Ноември</option>
							<option value="december">Декември</option>
						</select>
					</div>
					
					<div class="col-md-6">
						<input id="year" name="year" type="number" min="1950" max="2016" placeholder="Година"
							value="2016" class="form-control input-md" required oninput = "setCustomValidity('')" 
							oninvalid="setCustomValidity('Моля въведете валидна година.')">
					</div>
				</div>

				<label class="control-label search-form2" for="color">Цвят</label> 
				<select id="color" name="color" class="form-control">
					<option value="">всички цветове</option>
					<option value="Tъмно син">Tъмно син</option>
					<option value="Банан">Банан</option>
					<option value="Беата">Беата</option>
					<option value="Бежов">Бежов</option>
					<option value="Бордо">Бордо</option>
					<option value="Бронз">Бронз</option>
					<option value="Бял">Бял</option>
					<option value="Винен">Винен</option>
					<option value="Виолетов">Виолетов</option>
					<option value="Вишнев">Вишнев</option>
					<option value="Графит">Графит</option>
					<option value="Жълт">Жълт</option>
					<option value="Зелен">Зелен</option>
					<option value="Златист">Златист</option>
					<option value="Кафяв">Кафяв</option>
					<option value="Керемиден">Керемиден</option>
					<option value="Кремав">Кремав</option>
					<option value="Лилав">Лилав</option>
					<option value="Металик">Металик</option>
					<option value="Оранжев">Оранжев</option>
					<option value="Охра">Охра</option>
					<option value="Пепеляв">Пепеляв</option>
					<option value="Перла">Перла</option>
					<option value="Пясъчен">Пясъчен</option>
					<option value="Резидав">Резидав</option>
					<option value="Розов">Розов</option>
					<option value="Сахара">Сахара</option>
					<option value="Светло сив">Светло сив</option>
					<option value="Светло син">Светло син</option>
					<option value="Сив">Сив</option>
					<option value="Син">Син</option>
					<option value="Слонова кост">Слонова кост</option>
					<option value="Сребърен">Сребърен</option>
					<option value="Т.зелен">Т.зелен</option>
					<option value="Тъмно сив">Тъмно сив</option>
					<option value="Тъмно син мет.">Тъмно син мет.</option>
					<option value="Тъмно червен">Тъмно червен</option>
					<option value="Тютюн">Тютюн</option>
					<option value="Хамелеон">Хамелеон</option>
					<option value="Червен">Червен</option>
					<option value="Черен">Черен</option>
				</select>
			</div>
			<div class="col-md-4" style="margin-top: 20px">
				<div class="search-form">
					<label class="control-label" for="subcategory">Категория</label> 
					<select	id="subcategory" name="subcategory" class="form-control"
						required oninput = "setCustomValidity('')" oninvalid="setCustomValidity('Моля задайте категория.')">
					</select>
				</div>
				<div class="row search-form">
					<div class="col-md-6">
						<label class="control-label" for="region">Регион</label> 
						<select id="region" name="region" class="form-control" required
							oninvalid="setCustomValidity('Моля изберете регион.')" oninput="setCustomValidity('')">
						</select>
					</div>
					<div class="col-md-6">
						<label class="control-label" for="location">Населено място</label>
						<select id="location" name="location" class="form-control" required
							oninvalid="setCustomValidity('Моля изберете населено място.')" oninput="setCustomValidity('')">
						</select>
					</div>
				</div>
				
				<div class="row search-form">
					<div class="col-md-12">
						<label class="control-label" for="validity">Валидност на обявата</label> 
						<select id="validity" name="validity" class="form-control">
							<option value="30">30</option>
							<option value="60">60</option>
							<option value="90">90</option>
						</select>
					</div>
				</div>

				<div class="search-form2">
					<input type="submit" class="btn btn-info btn-block"	form="publishForm"
					style="height: 50px;"  value="Публикувай обявата">
				</div>
			</div>
		</div>
	</div>
	<div class="container extras"
		style="border-bottom: 1px solid #ccc; padding-bottom: 25px">
		<div class="row">
			<div class="col-md-4">
				<label class="control-label" for="safety">Безопасност</label> 
				<label class="checkbox" for="safety1"> 
					<input type="checkbox" name="safety" id="safety1" value="safety1">
						GPS система за проследяване
				</label> <label class="checkbox" for="safety2"> <input
					type="checkbox" name="safety" id="safety2" value="safety2">Автоматичен
					контрол на стабилността
				</label> <label class="checkbox" for="safety3"> <input
					type="checkbox" name="safety" id="safety3" value="safety3">Адаптивни
					предни светлини
				</label> <label class="checkbox" for="safety4"> <input
					type="checkbox" name="safety" id="safety4" value="safety4">Антиблокираща
					система
				</label> <label class="checkbox" for="safety5"> <input
					type="checkbox" name="safety" id="safety5" value="safety5">Въздушни
					възглавници - Задни
				</label> <label class="checkbox" for="safety6"> <input
					type="checkbox" name="safety" id="safety6" value="safety6">Въздушни
					възглавници - Предни
				</label> <label class="checkbox" for="safety7"> <input
					type="checkbox" name="safety" id="safety7" value="safety7">Въздушни
					възглавници - Странични
				</label> <label class="checkbox" for="safety8"> <input
					type="checkbox" name="safety" id="safety8" value="safety8">
					Ел. разпределяне на спирачното усилие
				</label> <label class="checkbox" for="safety9"> <input
					type="checkbox" name="safety" id="safety9" value="safety9">Електронна
					програма за стабилизиране
				</label> <label class="checkbox" for="safety10"> <input
					type="checkbox" name="safety" id="safety10" value="safety10">Контрол
					на налягането на гумите
				</label> <label class="checkbox" for="safety11"> <input
					type="checkbox" name="safety" id="safety11" value="safety11">
					Парктроник
				</label> <label class="checkbox" for="safety12"> <input
					type="checkbox" name="safety" id="safety12" value="safety12">Система
					за динамична устойчивост
				</label> <label class="checkbox" for="safety13"> <input
					type="checkbox" name="safety" id="safety13" value="safety13">Система
					за защита от пробуксуване
				</label> <label class="checkbox" for="safety14"> <input
					type="checkbox" name="safety" id="safety14" value="safety14">Система
					за изсушаване на накладките
				</label> <label class="checkbox" for="safety15"> <input
					type="checkbox" name="safety" id="safety15" value="safety15">Система
					за контрол на дистанцията
				</label> <label class="checkbox" for="safety16"> <input
					type="checkbox" name="safety" id="safety16" value="safety16">Система
					за подпомагане на спирането
				</label>
			</div>
			<div class="col-md-3">
				<label class="control-label" for="comfort">Комфорт</label> <label
					class="checkbox" for="comfort1"> <input type="checkbox"
					name="comfort" id="comfort1" value="comfort1">Auto Start
					Stop function
				</label> <label class="checkbox" for="comfort2"> <input
					type="checkbox" name="comfort" id="comfort2" value="comfort2">Bluetooth
					\ handsfree система
				</label> <label class="checkbox" for="comfort3"> <input
					type="checkbox" name="comfort" id="comfort3" value="comfort3">DVD,
					TV
				</label> <label class="checkbox" for="comfort4"> <input
					type="checkbox" name="comfort" id="comfort4" value="comfort4">Steptronic,
					Tiptronic
				</label> <label class="checkbox" for="comfort5"> <input
					type="checkbox" name="comfort" id="comfort5" value="comfort5">
					USB, audio\video, IN\AUX изводи
				</label> <label class="checkbox" for="comfort6"> <input
					type="checkbox" name="comfort" id="comfort6" value="comfort6">Адаптивно
					въздушно окачване
				</label> <label class="checkbox" for="comfort7"> <input
					type="checkbox" name="comfort" id="comfort7" value="comfort7">Безключово
					палене
				</label> <label class="checkbox" for="comfort8"> <input
					type="checkbox" name="comfort" id="comfort8" value="comfort8">Блокаж
					на диференциала
				</label> <label class="checkbox" for="comfort9"> <input
					type="checkbox" name="comfort" id="comfort9" value="comfort9">Бордкомпютър
				</label> <label class="checkbox" for="comfort10"> <input
					type="checkbox" name="comfort" id="comfort10" value="comfort10">Датчик
					за светлина
				</label> <label class="checkbox" for="comfort11"> <input
					type="checkbox" name="comfort" id="comfort11" value="comfort11">
					Ел. Огледала
				</label> <label class="checkbox" for="comfort12"> <input
					type="checkbox" name="comfort" id="comfort12" value="comfort12">Ел.
					Стъкла
				</label> <label class="checkbox" for="comfort13"> <input
					type="checkbox" name="comfort" id="comfort13" value="comfort13">Ел.
					регулиране на окачването
				</label> <label class="checkbox" for="comfort14"> <input
					type="checkbox" name="comfort" id="comfort14" value="comfort14">Ел.
					регулиране на седалките
				</label> <label class="checkbox" for="comfort15"> <input
					type="checkbox" name="comfort" id="comfort15" value="comfort15">Ел.
					усилвател на волана
				</label> <label class="checkbox" for="comfort16"> <input
					type="checkbox" name="comfort" id="comfort16" value="comfort16">Климатик
				</label> <label class="checkbox" for="comfort17"> <input
					type="checkbox" name="comfort" id="comfort17" value="comfort17">
					Климатроник
				</label> <label class="checkbox" for="comfort18"> <input
					type="checkbox" name="comfort" id="comfort18" value="comfort18">
					Мултифункционален волан
				</label> <label class="checkbox" for="comfort19"> <input
					type="checkbox" name="comfort" id="comfort19" value="comfort19">
					Навигация
				</label> <label class="checkbox" for="comfort20"> <input
					type="checkbox" name="comfort" id="comfort20" value="comfort20">Отопление
					на волана
				</label> <label class="checkbox" for="comfort21"> <input
					type="checkbox" name="comfort" id="comfort21" value="comfort21">Печка
				</label> <label class="checkbox" for="comfort22"> <input
					type="checkbox" name="comfort" id="comfort22" value="comfort22">Подгряване
					на предното стъкло
				</label> <label class="checkbox" for="comfort23"> <input
					type="checkbox" name="comfort" id="comfort23" value="comfort23">Подгряване
					на седалките
				</label> <label class="checkbox" for="comfort24"> <input
					type="checkbox" name="comfort" id="comfort24" value="comfort24">Регулиране
					на волана
				</label> <label class="checkbox" for="comfort25"> <input
					type="checkbox" name="comfort" id="comfort25" value="comfort25">Сензор
					за дъжд
				</label> <label class="checkbox" for="comfort26"> <input
					type="checkbox" name="comfort" id="comfort26" value="comfort26">Серво
					усилвател на волана
				</label> <label class="checkbox" for="comfort27"> <input
					type="checkbox" name="comfort" id="comfort27" value="comfort27">Система
					за измиване на фаровете
				</label> <label class="checkbox" for="comfort28"> <input
					type="checkbox" name="comfort" id="comfort28" value="comfort28">Система
					за контрол на скоростта(автопилот)
				</label> <label class="checkbox" for="comfort29"> <input
					type="checkbox" name="comfort" id="comfort29" value="comfort29">Стерео
					уредба
				</label> <label class="checkbox" for="comfort30"> <input
					type="checkbox" name="comfort" id="comfort30" value="comfort30">Филтър
					за твърди частици
				</label> <label class="checkbox" for="comfort31"> <input
					type="checkbox" name="comfort" id="comfort31" value="comfort31">Хладилна
					жабка
				</label>
			</div>
			<div class="col-md-2">
				<label class="control-label" for="other"> Други </label> <label
					class="checkbox" for="other1"> <input type="checkbox"
					name="other1" id="other1" value="other1">4x4
				</label> <label class="checkbox" for="other2"> <input
					type="checkbox" name="other" id="other2" value="other2">7
					места
				</label> <label class="checkbox" for="other3"> <input
					type="checkbox" name="other" id="other3" value="other3">Buy
					back
				</label> <label class="checkbox" for="other4"> <input
					type="checkbox" name="other" id="other4" value="other4">Бартер
				</label> <label class="checkbox" for="other5"> <input
					type="checkbox" name="other" id="other5" value="other5">Газова
					уредба
				</label> <label class="checkbox" for="other6"> <input
					type="checkbox" name="other" id="other6" value="other6">Капариран\Продаден
				</label> <label class="checkbox" for="other7"> <input
					type="checkbox" name="other" id="other7" value="other7">Катастрофирал
				</label> <label class="checkbox" for="other8"> <input
					type="checkbox" name="other" id="other8" value="other8">Лизинг
				</label> <label class="checkbox" for="other9"> <input
					type="checkbox" name="other" id="other9" value="other9">Метанова
					уредба
				</label> <label class="checkbox" for="other10"> <input
					type="checkbox" name="other" id="other10" value="other10">На
					части
				</label> <label class="checkbox" for="other11"> <input
					type="checkbox" name="other" id="other11" value="other11">Напълно
					обслужен
				</label> <label class="checkbox" for="other12"> <input
					type="checkbox" name="other" id="other12" value="other12">Нов
					внос
				</label> <label class="checkbox" for="other13"> <input
					type="checkbox" name="other" id="other13" value="other13">С
					право на дан.к-т
				</label> <label class="checkbox" for="other14"> <input
					type="checkbox" name="other" id="other14" value="other14">С
					регистрация
				</label> <label class="checkbox" for="other15"> <input
					type="checkbox" name="other" id="other15" value="other15">Сервизна
					книжка
				</label> <label class="checkbox" for="other16"> <input
					type="checkbox" name="other" id="other16" value="other16">Тунинг
				</label> <label class="control-label" for="exterior">Екстериор</label> <label
					class="checkbox" for="exterior1"> <input type="checkbox"
					name="exterior" id="exterior1" value="exterior1">2(3) Врати
				</label> <label class="checkbox" for="exterior2"> <input
					type="checkbox" name="exterior" id="exterior2" value="exterior2">4(5)
					Врати
				</label> <label class="checkbox" for="exterior3"> <input
					type="checkbox" name="exterior" id="exterior3" value="exterior3">LED
					фарове
				</label> <label class="checkbox" for="exterior4"> <input
					type="checkbox" name="exterior" id="exterior4" value="exterior4">Ксенонови
					фарове
				</label> <label class="checkbox" for="exterior5"> <input
					type="checkbox" name="exterior" id="exterior5" value="exterior5">Лети
					джанти
				</label> <label class="checkbox" for="exterior6"> <input
					type="checkbox" name="exterior" id="exterior6" value="exterior6">Металик
				</label> <label class="checkbox" for="exterior7"> <input
					type="checkbox" name="exterior" id="exterior7" value="exterior7">Отопляеми
					чистачки
				</label> <label class="checkbox" for="exterior8"> <input
					type="checkbox" name="exterior" id="exterior8" value="exterior8">Панорамен
					люк
				</label> <label class="checkbox" for="exterior9"> <input
					type="checkbox" name="exterior" id="exterior9" value="exterior9">Спойлери
				</label> <label class="checkbox" for="exterior10"> <input
					type="checkbox" name="exterior" id="exterior10" value="exterior10">Теглич
				</label> <label class="checkbox" for="exterior11"> <input
					type="checkbox" name="exterior" id="exterior11" value="exterior11">Халогенни
					фарове
				</label> <label class="checkbox" for="exterior12"> <input
					type="checkbox" name="exterior" id="exterior12" value="exterior12">Шибедах
				</label>
			</div>
			<div class="col-md-3">
				<label class="control-label" for="security">Защита</label> <label
					class="checkbox" for="security1"> <input type="checkbox"
					name="security" id="security1" value="security1">Аларма
				</label> <label class="checkbox" for="security2"> <input
					type="checkbox" name="security" id="security2" value="security2">Брониран
				</label> <label class="checkbox" for="security3"> <input
					type="checkbox" name="security" id="security3" value="security3">Имобилайзер
				</label> <label class="checkbox" for="security3"> <input
					type="checkbox" name="security" id="security3" value="security3">Каско
				</label> <label class="checkbox" for="security3"> <input
					type="checkbox" name="security" id="security3" value="security3">Централно
					заключване
				</label> <label class="control-label" for="interior">Интериор</label> <label
					class="checkbox" for="interior1"> <input type="checkbox"
					name="interior" id="interior1" value="interior1">Велурен
					салон
				</label> <label class="checkbox" for="interior2"> <input
					type="checkbox" name="interior" id="interior2" value="interior2">Десен
					волан
				</label> <label class="checkbox" for="interior3"> <input
					type="checkbox" name="interior" id="interior3" value="interior3">Кожен
					салон
				</label> <label class="control-label" for="special">Специализирани</label> <label
					class="checkbox" for="special1"> <input type="checkbox"
					name="special" id="special1" value="special1">TAXI
				</label> <label class="checkbox" for="special2"> <input
					type="checkbox" name="special" id="special2" value="special2">За
					хора с увреждания
				</label> <label class="checkbox" for="special3"> <input
					type="checkbox" name="special" id="special3" value="special3">Катафалка
				</label> <label class="checkbox" for="special4"> <input
					type="checkbox" name="special" id="special4" value="special4">Линейка
				</label> <label class="checkbox" for="special5"> <input
					type="checkbox" name="special" id="special5" value="special5">Учебен
				</label> <label class="checkbox" for="special6"> <input
					type="checkbox" name="special" id="special6" value="special6">Хладилен
				</label>
			</div>
		</div>
	</div>

	<div class="container" style="margin-bottom: 20px">
		<div class="row" style="margin-top: -20px;">
			<div class="col-md-5">
				<label class="control-label" for="info">Допълнителна
					информация</label>
				<textarea rows="10" class="form-control" name="info" id="info"></textarea>
			</div>
			<div class="col-md-7">
				<h4 style="margin-top: 0px">Данни за обратна връзка</h4>
				<label class="control-label" for="number">Tелефон: </label> 
					<input id="number" name="number" type="text" class="form-control input-md" required required
						oninvalid="setCustomValidity('Моля въведете номер.')" oninput="setCustomValidity('')">	
				<label class="control-label" for="email">Email: </label> 
					<input id="email" name="email" type="email" class="form-control input-md" required
						oninvalid="setCustomValidity('Моля изберете регион.')" oninput="setCustomValidity('')">
				<label class="control-label" for="website">Website: </label> 
					<input id="website" name="website" type="text" class="form-control input-md">
			</div>
		</div>
	</div>
</form>
	
	<%@include file="footer.jsp" %>

</body>
</html>